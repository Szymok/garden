# 📄 05. Katalog Usług i Aplikacji

> [!INFO] Monitorowanie
> Stan wszystkich usług jest monitorowany przez **Homepage** (Dashboard) oraz **Uptime Kuma**.
> Adresy `Current` oznaczają węzeł główny **SOYO (192.168.20.100)**.

---

## 1. 🟢 Host: SOYO (Core & Logic)
**IP:** `192.168.20.100` | **Rola:** Infrastruktura, Zarządzanie, Finanse.

| Usługa | Status | Port/Adres | Opis |
| :--- | :--- | :--- | :--- |
| **Traefik** | ✅ Active | `:80 / :443` | Reverse Proxy. Punkt wejścia dla wszystkich subdomen. |
| **Authentik** | ✅ Active | `auth.domena` | Centralne uwierzytelnianie (SSO) i zabezpieczenie usług. |
| **Pi-hole** | ✅ Active | `:53 / :80` | Blokowanie reklam i lokalny DNS. |
| **Omada Controller** | ✅ Active | `:8043` | Zarządzanie Access Pointem TP-Link i Switchem. |
| **Homepage** | ✅ Active | `:3000` | Główny dashboard startowy. |
| **Uptime Kuma** | ✅ Active | `:3001` | Monitoring dostępności usług. |
| **NetAlertX** | ✅ Active | - | Skaner sieci/Wi-Fi (wykrywanie intruzów). |
| **Documents (Paperless?)** | ✅ Active | - | Zarządzanie dokumentami i skanami. |
| **Ghostfolio** | ✅ Active | - | Śledzenie majątku i inwestycji. |
| **Firefly III** | ✅ Active | - | Budżet domowy i wydatki. |
| **Wallos** | ✅ Active | - | Zarządzanie subskrypcjami. |
| **FreshRSS** | ✅ Active | - | Agregator wiadomości RSS. |
| **Open WebUI** | ✅ Active | - | Interfejs dla lokalnych modeli AI (Ollama). |
| **AliasVault** | ✅ Active | - | Menedżer aliasów e-mail? |
| **Postiz** | ✅ Active | - | Planowanie postów w social media. |
| **Ntfy** | ✅ Active | - | Serwer powiadomień Push. |
| **Monitoring** | ✅ Active | - | Stack monitoringu (Prometheus/Grafana?). |
| *Home Assistant* | 🛑 Exited | - | *Obecnie wyłączony.* |
| *Reading Room* | 🛑 Inactive | - | *Nieaktywny.* |

---

## 2. 🔵 Host: FIREBAT (Worker / Apps)
**IP:** `192.168.20.101` | **Rola:** Aplikacje użytkowe, self-hosted alternatywy.

| Usługa | Status | Kategoria | Opis |
| :--- | :--- | :--- | :--- |
| **Vikunja** | ✅ Active | Productivity | Zarządzanie zadaniami (ToDo). |
| **NocoDB** | ✅ Active | Database | Alternatywa dla Airtable. Baza danych low-code. |
| **Obsidian LiveSync** | ✅ Active | Productivity | Synchronizacja notatek Obsidian w czasie rzeczywistym. |
| **Mealie** | ✅ Active | Food | Planowanie posiłków i przepisy. |
| **Fittrackee** | ✅ Active | Sport | Śledzenie aktywności fizycznej (GPS). |
| **Wger** | ✅ Active | Sport | Dziennik treningowy (siłownia). |
| **Gramps Web** | ✅ Active | Genealogy | Drzewo genealogiczne. |
| **HortusFox** | ✅ Active | Plants | Menedżer roślin domowych/ogrodowych. |
| **YamTrack** | ✅ Active | Media | Śledzenie przeczytanych książek/obejrzanych filmów? |
| **Airtrail** | ✅ Active | Travel | Planowanie lotów? |
| **KaraKeep** | ✅ Active | Fun | Karaoke / Zarządzanie utworami? |
| **MySpeed** | ✅ Active | Network | Monitor prędkości łącza (Speedtest). |
| **Dawarich** | ✅ Active | Geography | Historia lokalizacji (Google Maps Timeline alternative). |
| **ChangeDetection** | ✅ Active | Utilities | Monitorowanie zmian na stronach www. |
| **Automation** | ✅ Active | Logic | (n8n? Node-RED?) |
| **Tools** | ✅ Active | Utilities | Zestaw narzędzi IT (CyberChef itp.). |

---

## 3. 🟠 Host: NAS (Storage & Media)
**IP:** `192.168.20.10` | **Rola:** Ciężkie operacje na danych, Streaming.

| Usługa | Status | Rola | Opis |
| :--- | :--- | :--- | :--- |
| **Nextcloud** | ✅ Active | Chmura | "Dropbox". Pliki, kalendarz, kontakty. |
| **Immich** | ✅ Active | Zdjęcia | Backup zdjęć z telefonów (Google Photos alternative). |
| **Media Stack** | ✅ Active | \*arr | Sonarr, Radarr - zarządzanie biblioteką. |
| **Media Mgmt** | ✅ Active | Jellyfin? | Serwer strumieniowania wideo. |
| **Downloads VPN** | ✅ Active | Torrent | Klient pobierania (qBittorrent) za Gluetun VPN. |
| **Ix-Dockge** | ✅ Active | Management | Zarządzanie kontenerami Docker na NASie. |
| **Socket Proxy** | ✅ Active | Security | Zabezpieczenie socketa Dockera. |

---

## 4. ☁️ External (VPS / Cloud)
Serwery zewnętrzne pełniące funkcję "Okna na świat" i hostingu lekkich usług.

| Host | Dostawca | Rola | Usługi |
| :--- | :--- | :--- | :--- |
| **VPS OVH** | OVHCloud | **Brama VPN / Public IP** | - **WireGuard Server** (Endpoint dla domu)<br>- **Reverse Proxy** (Wyjście na świat)<br>- **WgDashboard** (Panel zarządzania) |
| **Mikrus** | Mikr.us | **Web Hosting** | - **Hugo** (Statyczna strona WWW)<br>- *Opcja na backup plików konfiguracyjnych* |