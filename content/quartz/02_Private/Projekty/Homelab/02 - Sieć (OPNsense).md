# 📄 02. Sieć (OPNsense)

> [!INFO] Płyta Główna Sieci
> Ten dokument opisuje logiczną strukturę sieci.
> - **Router:** OPNsense (CWWK N150) - `192.168.10.1`
> - **Switch:** KeepLiNK Managed - `192.168.10.2`
> - **Wi-Fi:** TP-Link EAP653 - `192.168.10.x`

---

## 1. 🌐 Połączenie Internetowe (WAN)

Sieć działa za podwójnym NAT-em (DMZ), co jest kompromisem wymuszonym przez sprzęt operatora.

- **Dostawca:** Orange Światłowód
- **Urządzenie ISP:** Orange Funbox
- **Tryb:** **DMZ** (Router OPNsense jest ustawiony jako host DMZ w Funboxie).
- **Zaleta:** Cały ruch przychodzący jest przekierowany na OPNsense.
- **Wada:** OPNsense na interfejsie WAN widzi prywatny adres IP Funboxa (np. `192.168.1.x`), a nie publiczny.

## 2. 🗺️ Segmentacja Sieci (VLAN)

Ruch jest podzielony na 4 odseparowane VLAN-y.

| VLAN ID | Nazwa | Podsieć | Brama (OPNsense) | Opis |
| :--- | :--- | :--- | :--- | :--- |
| **1** | `MANAGEMENT` | `192.168.10.0/24` | `192.168.10.1` | **Główna sieć domowa**. PC, telefony, Switch, AP. Pełny dostęp do wszystkiego. |
| **20** | `SERWERY` | `192.168.20.0/24` | `192.168.20.1` | Infrastruktura: NAS, Proxmox, kontenery Docker. |
| **30** | `IOT` | `192.168.30.0/24` | `192.168.30.1` | Urządzenia "Smart": TV, gniazdka, AGD. Odcięte od reszty. |
| **40** | `GOSCIE` | `192.168.40.0/24` | `192.168.40.1` | Izolowany dostęp do internetu dla odwiedzających. |

## 3. 🔌 Konfiguracja Switcha (KeepLiNK)

Switch 8x 2.5GbE + 1x 10G zarządza tagowaniem ruchu.

| Port | Typ | VLANs | Podłączone Urządzenie |
| :--- | :--- | :--- | :--- |
| **P1** | Trunk | `1 (U), 20 (T), 30 (T), 40 (T)` | **Uplink do Routera (OPNsense)** |
| **P2** | Access | `1` | PC Stacjonarny |
| **P3-6** | Access | `20` | Serwery (Proxmox, NAS) |
| **P7** | Trunk | `1 (U), 30 (T), 40 (T)` | **Wi-Fi (TP-Link EAP653)** |
| **P8** | Access | `30` | Mostek IoT (np. Hue) |

> **Legenda:** **(U)** = Untagged (Nietagowany), **(T)** = Tagged (Tagowany).

## 4. 🔥 Reguły Firewalla (Polityka Bezpieczeństwa)

Poniżej znajdują się aktywne reguły sterujące ruchem w sieci.

### 🟢 LAN (VLAN 1)
*Sieć Zaufana (Management)*
- **Default Allow:** Zezwól na wszystko do dowolnego miejsca (Any -> Any).

### 🟠 SERWERY (VLAN 20)
*Infrastruktura i usługi*
| Źródło | Port | Cel | Port | Opis |
| :--- | :--- | :--- | :--- | :--- |
| **SERWERY** | * | `192.168.20.100` | `53 (DNS)` | Dostęp do Pi-hole (DNS). |
| `192.168.20.100` | * | **This Firewall** | `443` | Dostęp Homepage do API OPNsense. |
| **SERWERY** | * | `10.0.0.0/24` | * | Dostęp do sieci VPN (WireGuard). |
| **SERWERY** | * | `192.168.10.10` | `11434` | Dostęp do Ollama API na PC (Zaufanym). |
| **SERWERY** | * | **IOT** | * | Pełny dostęp serwerów do urządzeń IoT. |
| **SERWERY** | * | `RFC1918 (Lokalne)` | * | ⛔ **BLOKADA** dostępu do innych sieci lokalnych. |
| **SERWERY** | * | * | * | Zezwól na dostęp do Internetu. |

### 🔴 IOT (VLAN 30)
*Urządzenia Niezaufane*
| Źródło | Port | Cel | Port | Opis |
| :--- | :--- | :--- | :--- | :--- |
| **IOT** | * | `192.168.20.100` | `53 (DNS)` | Dostęp do Pi-hole (DNS). |
| `192.168.30.102` (TV) | * | `192.168.20.10` (NAS) | `8096` | Dostęp TV do Jellyfin. |
| **Block_China_IoT** | * | * | * | ⛔ **BLOKADA** chińskich serwerów telemetrycznych. |
| **IOT** | * | **This Firewall** | * | Synchronizacja urządzeń? (Sprawdź bezpieczeństwo). |
| **IOT** | * | `RFC1918 (Lokalne)` | * | ⛔ **BLOKADA** dostępu do LAN/Serwerów. |
| **IOT** | * | * | * | Dostęp do Internetu. |

### 🟣 GOŚCIE (VLAN 40)
*Izolowana strefa dla odwiedzających*
| Źródło | Port | Cel | Port | Opis |
| :--- | :--- | :--- | :--- | :--- |
| **GOSCIE** | * | `192.168.20.100` | `53 (DNS)` | Dostęp do Pi-hole (DNS). |
| **GOSCIE** | * | `RFC1918 (Lokalne)` | * | ⛔ **BLOKADA** dostępu do jakichkolwiek zasobów lokalnych. |
| **GOSCIE** | * | * | * | Dostęp do Internetu. |

### 🌍 Tunel VPN (WireGuard)
- **Allow All:** Ruch w tunelu VP_OVH jest domyślnie dozwolony (zaufany link Site-to-Site).

## 5. 🔑 Kluczowe Usługi Sieciowe

Usługi skonfigurowane bezpośrednio w OPNsense.

- **Serwer DHCP:**
  - Aktywny dla każdego VLAN-u (1, 20, 30, 40).
  - **Serwer DNS (dla klientów):** Wszyscy klienci otrzymują adres `192.168.20.100` (Pi-hole).
- **DNS (Unbound):**
  - Skonfigurowany jako **forwarder** do Pi-hole.
- **Dynamiczny DNS (DDNS):**
  - Skonfigurowany (DuckDNS/Cloudflare) dla domeny zewnętrznej.
- **Tunel VPN (WireGuard):**
  - Stałe połączenie z VPS OVH (IP wyjściowe dla usług).