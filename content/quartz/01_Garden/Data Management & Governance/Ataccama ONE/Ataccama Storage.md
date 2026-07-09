---
title: Wymagania Przestrzeni Dyskowej (Storage)
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - storage
  - disk-space
  - fhs
aliases:
  - Wymagania dyskowe Ataccama
  - Katalog domowy Ataccama
---
# 🎯 Definicja
Zalecenia dotyczące alokacji przestrzeni dyskowej oraz struktury katalogów dla instalacji komponentów [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **Lokalizacja instalacji:** Domyślnie katalog `/opt` (ale konfigurowalne).
- **Zastosowanie:** Katalog ten przechowuje binaria, biblioteki, logi (!) oraz dane tymczasowe.
- **FHS:** Zewnętrzne komponenty (Postgres, OpenSearch) używają standardowych ścieżek `/var/lib/...`.
- **Logi:** Należy zapewnić duży bufor miejsca na logi, które mogą szybko rosnąć przy wysokim poziomie szczegółowości.

# 📚 Szczegółowe wyjaśnienie
Błąd "No space left on device" to jedna z najczęstszych przyczyn awarii platformy.
Szczególną uwagę należy zwrócić na:
1. `/opt/ataccama` (lub inny home directory) - tu lądują duże pliki zrzutów pamięci (heap dumps) w razie awarii Javy.
2. `/var/lib/opensearch` - tu lądują indeksy logów i monitoringu.
3. `/var/lib/pgsql` - tu ląduje baza danych metadanych.

# 💡 Przykład zastosowania
Rekomendacja partycjonowania:
- System (`/`): 50 GB
- Aplikacja (`/opt`): 100 GB+
- Dane (`/var`): 200 GB+ (dedykowana partycja dla baz danych)

## 📌 Źródła


## 👽 Brudnopis
- Platform services are installed in module home directories, which are by default subdirectories of `/opt`.
- This location can be modified for individual modules.
- In addition to module executables and libraries, these directories store **module data, logs, and temporary files**.
- Therefore, **ensure sufficient disk space in `/opt`** (or the new home directory if defaults are not used).
- **Authentication is required for downloading MMM basic content** (S3 keys required).

Storage Requirements: FHS and Caution
Third-party software deployed as part of the [[Ataccama|Ataccama]] ONE installation uses directories mandated by the Filesystem Hierarchy Standard (FHS), such as /var/lib/postgresql or /var/lib/opensearch.
These directories must also have adequate free space.
