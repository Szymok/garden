# 📄 00. Dashboard (Homelab Index)

> [!INFO] Centrum Dowodzenia
> Ten plik to **Spis Treści** Twojej dokumentacji.
> Stan infrastruktury na dzień: **Luty 2026**.

---

## 📚 Moduły Dokumentacji

| Plik | Opis zawartości | Status |
| :--- | :--- | :--- |
| [[01 - Architektura Fizyczna i Zasilanie]] | Spis sprzętu, Rack Layout, Zasilanie. | ✅ Aktualny |
| [[02 - Sieć (OPNsense)]] | VLAN (1, 20, 30, 40), DMZ, WiFi. | ✅ Aktualny |
| [[03 - Magazyn (TrueNAS)]] | Pula `tank` (ZFS Mirror), Udziały (NFS/SMB). | ✅ Aktualny |
| [[04 - Wirtualizacja (Proxmox)]] | Klaster 2-Node (Soyo + Firebat), Roles. | ✅ Aktualny |
| [[05 - Katalog Uslug i Aplikacji]] | Lista wszystkich usług i portów. | ✅ Aktualny |
| [[06. Backup i Procedury Awaryjne (Krytyczne!)]] | **Plan Naprawczy** dla braku backupów. | ⚠️ DO WDROŻENIA |
| [[07. Dane Logowania]] | Szablon bezpieczeństwa (Lokalizacje haseł). | 🔒 Szablon |

---

## 🚀 Szybkie Linki (Management)

| Usługa | Host | Adres IP/Port |
| :--- | :--- | :--- |
| **OPNsense** | Router | `https://192.168.10.1` |
| **Proxmox Node 1** | SOYO | `https://192.168.20.100:8006` |
| **Proxmox Node 2** | Firebat | `https://192.168.20.101:8006` |
| **TrueNAS** | NAS | `https://192.168.20.10` |
| **Homepage** | Docker | `http://192.168.20.100:3000` |
| **Portainer (Agent)** | Docker | `https://192.168.20.100:9443` |

---

## 🗺️ Mapa Drogowa (Roadmap)

Rzeczy, których brakuje w systemie (zidentyfikowane podczas audytu):

- [ ] **Backup (Priorytet 1):** Włączyć Snapshoty na NAS i Vzdump w Proxmox.
- [ ] **Zasilanie (Priorytet 2):** Zakupić UPS dla ochrony ZFS.
- [ ] **High Availability:** Dodać Raspberry Pi jako QDevice (żeby klaster Proxmox miał 3 głosy).
- [ ] **Security:** Przenieść sekrety do Bitwarden, wypełnić plik `07`.