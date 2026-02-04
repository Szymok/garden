# 📄 01. Architektura Fizyczna i Zasilanie

> [!INFO] Cel Dokumentu
> Ten dokument opisuje fizyczny spis sprzętu (Inventory), jego rozmieszczenie oraz strategię zasilania. Stanowi punkt odniesienia dla ubezpieczenia oraz planowania rozbudowy.

---

## 1. 📋 Spis Sprzętu (Hardware Inventory)

| Rola | Urządzenie | Model / Specyfikacja | Lokalizacja | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Router** | Mini PC (OPNsense) | **CWWK N150**<br>CPU: N150<br>RAM: 8GB<br>SSD: 128GB | Szafka IKEA (Góra) | ✅ Aktywny |
| **Switch** | Switch 2.5G | **KeepLiNK 8+1**<br>8x 2.5GbE + 1x 10G SFP+<br>*(Zarządzalny)* | Szafka IKEA (Góra) | ✅ Aktywny |
| **Klaster 1** | Mini PC (Proxmox) | **Firebat AM02**<br>CPU: Intel N100<br>RAM: 16GB<br>SSD: 512GB | Szafka IKEA (Dół) | ✅ Aktywny |
| **Klaster 2** | Mini PC (Proxmox) | **SOYO M4PLUS**<br>CPU: Intel N150<br>RAM: 16GB<br>SSD: 1TB | Szafka IKEA (Dół) | ✅ Aktywny |
| **NAS** | Mini PC NAS | **AOOSTAR R1**<br>CPU: N100/N150<br>RAM: 32GB<br>Sys: 512GB SSD<br>HDD: 2x 8TB IronWolf | Szafka IKEA (Dół) | ✅ Aktywny |
| **ISP** | ONT/Modem | **Orange Funbox**<br>*(Tryb Bridge/DMZ)* | Szafka IKEA (Góra) | ✅ Aktywny |
| **UPS** | Zasilacz Awaryjny | *Do zakupu* | Podłoga | 📅 Planowany |

---

## 2. 🗺️ Układ Fizyczny (Rack IKEA)

Infrastruktura jest skonsolidowana w jednej szafce, podzielona na strefy termiczne i logiczne.

### Półka GÓRNA (Network Core)
Lżejsze urządzenia sieciowe, generujące mniej ciepła.
- **Switch KeepLiNK:** Centralny punkt dystrybucji.
- **Router OPNsense (CWWK):** Pierwsza linia obrony.
- **Orange Funbox:** Punkt styku z ISP.

### Półka DOLNA (Compute & Storage)
Cięższy sprzęt wymagający stabilności.
- **AOOSTAR NAS:** Fundament danych.
- **Proxmox Cluster (Firebat + SOYO):** Zasoby obliczeniowe.

---

## 3. ⚡ Zasilanie i UPS (Stan Obecny i Plany)

> [!WARNING] Brak UPS
> Obecnie system **nie posiada** podtrzymania bateryjnego. Awaria prądu skutkuje natychmiastowym wyłączeniem wszystkich serwerów (ryzyko dla ZFS w TrueNAS).

### Plan Docelowy (Wymagany)
- **Cel:** Podtrzymanie "Safe Shutdown" dla całego klastra i NASa (min. 10-15 minut).
- **Szacowane obciążenie:**
    - Router (~10W) + Switch (~10W) + NAS (~30W) + 2x Node (~30W) = **~80W - 100W** (Idle/Avg).
- **Rekomendacja:** UPS min. 600VA / 360W ze złączem USB (kompatybilny z NUT - Network UPS Tools).
    - *Kandydaci: CyberPower, APC BR Series.*

### Okablowanie
- Wykorzystanie listwy z filtrem przeciwprzepięciowym jako tymczasowe zabezpieczenie.