# 📄 03. Magazyn (TrueNAS)

> [!INFO] Rola: Centralny Spichlerz
> TrueNAS służy tutaj wyłącznie jako **niezawodny magazyn danych (NAS)**. Nie uruchamia aplikacji (Dockerów) – te działają na "Docker Host" w Proxmoxie, montując zasoby sieciowo.

---

## 1. ⚙️ Konfiguracja Sprzętowa

| Komponent | Model / Specyfikacja |
| :--- | :--- |
| **Host** | AOOSTAR R1 N150 |
| **RAM** | 32GB (Dla ZFS Cache) |
| **System** | TrueNAS Scale (na dedykowanym dysku 512GB) |
| **Dyski Danych** | **2x 8TB Seagate IronWolf** (`ST8000VN004` / `ST8000VN002`) |

## 2. 🗄️ Pula Danych (`tank`)

Wszystkie dane znajdują się na jednej głównej puli ZFS.

- **Nazwa puli:** `tank`
- **Układ (Topology):** **Mirror (RAID 1)**
- **Pojemność:** ~7.2 TiB użytecznej przestrzeni.
- **Odporność:** Awaria **jednego** dowolnego dysku nie powoduje utraty danych.

---

## 3. 📂 Struktura Danych i Udziały

Dane są podzielone na dwa główne zbiory udostępniane przez sieć.

### Udostępnione Zasoby (Shares)

| Ścieżka (Path) | Protokół | Nazwa Udziału | Przeznaczenie |
| :--- | :--- | :--- | :--- |
| `/mnt/tank/data` | **SMB** | `data` | Mapowanie w Windows, główny magazyn plików. |
| `/mnt/tank/data` | **NFS** | `Dane` | Montowane przez **Docker Host** (Proxmox). |
| `/mnt/tank/proxmox` | **NFS** | *(Brak aliasu)* | Magazyn na dyski maszyn wirtualnych (VM/LXC/ISO). |

### Struktura folderów w `/mnt/tank/data` (Widziana przez Docker Host)

Katalogi te są montowane w kontenerach Docker do obsługi konkretnych usług:

- `backups/` - Kopie zapasowe.
- `configs/`, `config_worker/` - Konfiguracje kontenerów (persistent volumes).
- `documents/` - Pliki prywatne (Paperless itp.).
- `downloads/`, `torrents/`, `usenet/` - Strefa pobierania (*arr, qBittorrent, SABnzbd).
- `media/` - Biblioteka filmów i seriali (Jellyfin/Plex).
- `photos/` - Biblioteka zdjęć (Immich).

---

## 4. 🚨 Zadania Konserwacyjne (Maintenance Tasks)

> [!CRITICAL] BRAK KONFIGURACJI AUTOMATYZACJI
> Obecnie system **nie posiada** skonfigurowanych kluczowych zadań ochrony danych.
> **Ryzyko:** Cicha korupcja danych (bit rot) oraz brak możliwości odzyskania plików po przypadkowym usunięciu.

### 🛠️ Zadania do wykonania (TODO)

Należy niezwłocznie skonfigurować w *Data Protection*:

1.  **Scrub Tasks (Czyszczenie danych):**
    *   *Zalecenie:* Raz na miesiąc (np. 1. dzień miesiąca o 02:00).
    *   *Cel:* Weryfikacja spójności ZFS i naprawa uszkodzonych bloków z kopii lustrzanej.
2.  **Regular Snapshots (Migawki):**
    *   *Zalecenie:*
        *   `backups/documents/photos`: Co godzinę (trzymaj 2 dni), Codziennie (trzymaj 2 tygodnie).
        *   `downloads/media`: Codziennie (trzymaj 1 tydzień).
    *   *Cel:* Ochrona przed ransomware i "o kurczę, skasowałem nie ten plik".
3.  **S.M.A.R.T. Tests:**
    *   *Short Test:* Raz w tygodniu.
    *   *Long Test:* Raz w miesiącu.

---

## 5. 🔌 Sieć

- **Adres IP:** `192.168.20.10`
- **VLAN:** 20 (Serwery)