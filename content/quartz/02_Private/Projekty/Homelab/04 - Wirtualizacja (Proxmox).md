# 📄 04. Wirtualizacja (Proxmox)

> [!INFO] Mózg Operacji (Proxmox VE Cluster)
> Środowisko wirtualizacji składa się z **dwóch węzłów (Nodes)** połączonych w klaster zarządzający.
> Pozwala to na centralne zarządzanie (jeden interfejs GUI), ale **nie zapewnia** automatycznej wysokiej dostępności (HA) ze względu na brak trzeciego głosu (Quorum Device).

---

## 1. 🏗️ Architektura Klastra

| Węzeł (Node) | Hostname | IP | Sprzęt | Rola |
| :--- | :--- | :--- | :--- | :--- |
| **Node 1** | `pve1` | `192.168.20.100` | **SOYO M4PLUS** (Intel N150, 16GB) | **Primary / Management**<br>Hostuje kluczowe usługi "Core" (Traefik, Auth, Pihole). |
| **Node 2** | `pve2` | `192.168.20.101` | **Firebat AM02** (Intel N100, 16GB) | **Worker**<br>Hostuje usługi "Heavy" i eksperymentalne (Automation, Tools). |
| *Brak* | *QDevice* | *-* | *Brak* | *(Wymagane do automatycznego Failover)* |

## 2. 🔌 Konfiguracja Sieciowa (Bridge)

Każdy węzeł posiada ustandaryzowaną konfigurację mostków sieciowych (Linux Bridge) mapowanych na VLAN-y ze switcha.

- **vmbr0:** Główny mostek (VLAN-aware).
    - Obsługuje ruch wszystkich maszyn wirtualnych.
    - Tagowanie VLAN (np. `tag=30` dla VM IoT) odbywa się w konfiguracji konkretnej VM.

## 3. 📦 Konteneryzacja (LXC vs VM)

Strategia homelaba opiera się na **Dockerze** uruchomionym wewnątrz maszyn wirtualnych (lub LXC), podzielonych logicznie:

### A. Docker Host "Core" (`pve1` / Soyo)
*Adresacja: "Current" w Dockge*
- **Zadania:** Reverse Proxy (Traefik), Uwierzytelnianie (Authentik), DNS (Pi-hole), Dashboard (Homepage).
- **Priorytet:** Krytyczny. Musi wstać pierwszy.

### B. Docker Host "Worker" (`pve2` / Firebat)
*Adresacja: `192.168.20.101`*
- **Zadania:** Automatyzacja (Home Assistant - jeśli zmigrowany), Narzędzia, Analityka.
- **Zasoby:** Często utylizuje CPU do zadań w tle.

### C. Docker Host "Storage/Media" (NAS / `20.10`)
*Adresacja: `192.168.20.10`*
- **UWAGA:** Uruchomione bezpośrednio na TrueNAS Scale (lub VM na NAS).
- **Zadania:** Nextcloud, Immich, *arr Stack (Pobieranie/Media).
- **Cel:** Bliskość danych (brak narzutu sieciowego NFS dla ciężkich operacji I/O).

---

## 4. 🚨 Kwestia Quorum (2-Node Cluster)

> [!WARNING] Ryzyko Split-Brain
> Posiadanie tylko 2 węzłów oznacza, że awaria jednego powoduje utratę kworum (50% głosów).
> **Skutek:** Klaster przechodzi w tryb *Read-only* (nie można startować/zatrzymywać VM), chyba że ręcznie w wymusi się kworum (`pvecm expected 1`).

**Rekomendacja:** Dodać instancję *QDevice* (Proxmox QDevice Net) na Raspberry Pi lub NAS, aby uzyskać 3 głosy.