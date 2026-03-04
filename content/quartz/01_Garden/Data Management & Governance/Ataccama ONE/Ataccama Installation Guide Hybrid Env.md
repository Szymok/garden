---
title: Instalacja Ataccama ONE (Hybrid Environment)
created: 2026-02-04
status: sapling
category: DevOps
difficulty: advanced
language: pl
tags:
  - ataccama
  - installation
  - hybrid-cloud
  - ansible
  - dpe
aliases:
  - Hybrid DPE Installation
  - Instalacja DPE
---
# 🎯 Definicja
Procedura instalacji hybrydowego silnika przetwarzania (Hybrid DPE), który łączy się z chmurą Ataccama Cloud (SaaS), ale przetwarza dane lokalnie (on-premise / private cloud).

# 🔑 Kluczowe punkty
- **Ansible Controller:** Wymagana maszyna sterująca z dostępem do internetu.
- **Inventory:** Należy skopiować `examples/hybrid` i uzupełnić hostname'y oraz zmienne w `vars.yml`.
- **Komunikacja:** DPE musi "widzieć" chmurę Ataccama (Keycloak, MinIO, DPM), ale chmura nie musi widzieć DPE (jeśli używamy bidirectional mode).

# 📚 Szczegółowe wyjaśnienie
Instalacja hybrydowa to kompromis: dane zostają u klienta (bezpieczeństwo), a metadane i UI są w chmurze (wygoda SaaS).
Kluczowe zmienne do skonfigurowania w `vars.yml`:
- `keycloak_url`: URL do autoryzacji.
- `minio_url`: Object Storage w chmurze.
- `dpe_jwt_key`: Klucz prywatny DPE (generowany przez klienta).
- `dpm_jwt_key`: Klucz publiczny Cloud DPM (pobrany z chmury).

**Kroki:**
1. Przygotuj Inventory (`hosts.yml`).
2. Skonfiguruj sekrety (`client_id`, `client_secret` z Ataccama Cloud).
3. Uruchom playbook: `ansible-playbook -i inventories/prod/hosts.yml hybrid-dpe.yml`.

# 💡 Przykład weryfikacji
Po uruchomieniu playbooka, sprawdź logi. Zadanie `Check DPE availability` powinno zwrócić sukces. Jeśli nie – sprawdź firewall (czy DPE może wyjść na port 443 do domeny `*.ataccama.online`).

## 📌 Źródła
- Ataccama Installation Guide - Hybrid DPE.

## 👽 Brudnopis
- DPE wymaga klucza licencji (`license.plf`).
- Sterowniki JDBC są pobierane automatycznie, ale można dodać własne.
- Bidirectional mode: DPM <-> DPE communication over single websocket tunnel.