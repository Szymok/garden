---
title: Ataccama Ansible Installation Variants (Warianty Instalacji)
created: 2026-02-04
status: evergreen
category: DevOps/Ataccama
difficulty: intermediate
language: pl
tags:
  - ansible
  - installation
  - playbook
  - config
aliases:
  - Configuring Ansible Inventory
  - Warianty inventory
  - site.yml
---
# 🎯 Definicja
Podczas instalacji platformy Ataccama ONE za pomocą Ansible, musisz wybrać odpowiedni **wariant instalacji** (Inventory Variant) i odpowiadający mu **Playbook**. Wybór zależy od tego, jakie komponenty (Meduły) zakupiłeś i chcesz wdrożyć.

# 🔑 Kluczowe punkty
- **Naming Convention:** Nazwa pliku inventory powinna odzwierciedlać organizację (np. `prod_bank_xyz`), a nie domyślne `example`.
- **Wspierane kombinacje:** Nie każda kombinacja modułów jest oficjalnie wspierana. Używaj gotowych szablonów.
- **Katalog:** Przykłady leżą w `~/one/ansible/inventories/example_<variant-name>`.

# 📚 Warianty Instalacji

| Scenariusz | Instalowane komponenty | Wariant (Folder) | Playbook |
|---|---|---|---|
| **Ataccama ONE** | Data Quality, Catalog, Observability | `plain` | `site.yml` |
| **ONE + DQIT** | Powyższe + Issue Tracker | `dqit` | `site.yml` |
| **Full Platform** | ONE + MDM + RDM + DQIT | `full` | `site.yml` |
| **Hybrid DPE** | Tylko silnik przetwarzania (Hybryda) | `hybrid` | `hybrid-dpe.yml` |
| **Standalone RDM** | Tylko Reference Data Manager | `rdm_standalone` | `rdm_standalone.yml` |
| **Standalone MDM** | Tylko Master Data Management | `mdm_standalone` | `mdm_standalone.yml` |
| **MDM + RDM** | MDM i RDM bez Katalogu | `mdmrdm` | `mdm_rdm.yml` |

# 💡 Wskazówki konfiguracji
1. **Kopiowanie:** Zawsze kopiuj przykład: `cp -r inventories/example_full inventories/moj_projekt`.
2. **Edycja:** Edytujesz `hosts` (adresy IP) i `group_vars/all` (licencje, ścieżki, hasła).
3. **MDM/DQIT Warning:** Instalacja MDM/DQIT wymaga *projektu konfiguracyjnego* (modelu). Pusta instalacja serwera nie wystarczy, trzeba wgrać pliki projektu ("Solution"). W wersji demo są one dostarczane, w produkcji tworzy je Professional Services.

## 📌 Źródła
- Ataccama Installation Guide.

## 👽 Brudnopis
- `site.yml` to główny playbook "do wszystkiego", ale dla wariantów Standalone (samo MDM) są lżejsze playbooki.
- Grupy w Inventory (np. `[tx_server]`, `[keycloak]`) sterują tym, co gdzie się zainstaluje.
