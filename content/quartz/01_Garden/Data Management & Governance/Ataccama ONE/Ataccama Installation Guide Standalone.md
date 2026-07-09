---
title: Instalacja Ataccama ONE (Standalone Environment)
created: 2026-02-04
status: sapling
category: DevOps
difficulty: advanced
language: pl
tags:
  - ataccama
  - installation
  - on-premise
  - mdm
  - rdm
aliases:
  - Standalone Installation
  - Instalacja MDM
---
# 🎯 Definicja
Procedura pełnej instalacji platformy [[Ataccama|Ataccama]] ONE (MDM, [[RDM|RDM]], DQ) na infrastrukturze klienta (On-Premise), bez zależności od chmury producenta.

# 🔑 Kluczowe punkty
- **Playbooki:** Używamy `mdm_standalone.yml` lub `rdm_standalone.yml` zależnie od licencji. Nie używaj `site.yml` jeśli instalujesz tylko jeden komponent.
- **Inventory:** Skopiuj `examples/mdm_standalone`.
- **Dostęp:** Wymagany SSH (root/sudo) do wszystkich serwerów docelowych.

# 📚 Szczegółowe wyjaśnienie
W wersji Standalone, klient zarządza wszystkim: bazą danych, aplikacją, serwerem [[Keycloak|Keycloak]] (IAM) i monitoringiem.
Typowe adresy usług po instalacji:
- `https://console.<domena>` - Panel administracyjny.
- `https://mda.<domena>` - Aplikacja MDM.
- `https://rdm.<domena>` - Aplikacja [[RDM|RDM]].

**Bezpieczeństwo:**
Hasła do [[Bazy danych|bazy danych]] i Keycloaka definiujemy w `secrets.yml`. Należy je zaszyfrować (Ansible Vault) w środowisku produkcyjnym.

# 💡 Przykład weryfikacji
Po instalacji wejdź na `https://monitoring.<domena>/targets`. Wszystkie usługi (MDM Core, [[Keycloak|Keycloak]], Postgres Exporter) powinny świecić się na zielono (UP).

## 📌 Źródła
- [[Ataccama|Ataccama]] Installation Guide - Standalone.

## 👽 Brudnopis
- Wymagany Nginx jako Reverse Proxy (instalowany przez Ansible).
- Certyfikaty SSL: domyślnie self-signed, w produkcji podmień na własne w `vars.yml`.
