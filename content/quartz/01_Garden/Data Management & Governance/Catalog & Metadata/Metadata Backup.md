---
title: Metadata Backup (Snapshot)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Operations
difficulty: basic
language: en
tags:
  - backup
  - disaster-recovery
  - snapshot
  - maintenance
aliases:
  - Kopia zapasowa metadanych
  - Database Snapshot
---
# 🎯 Definicja
**[[Metadata|Metadata]] [[Backup|Backup]]** (w [[Ataccama|Ataccama]] ONE: Database Snapshot) to pełny zrzut [[Bazy danych|bazy danych]] zarządzającej metadanymi (MMM Database). Zawiera wszystkie konfiguracje, definicje reguł, strukturę katalogu i użytkowników. NIE zawiera samych danych biznesowych (te są w źródłach).

# 🔑 Kluczowe punkty
- **Cel:** Ratunek po awarii (np. nieudany upgrade systemu, przypadkowe usunięcie konfiguracji).
- **Zakres:** Tylko baza konfiguracyjna MMM (Postgres). Nie obejmuje plików w MinIO ani zewnętrznych baz AI.
- **Tryb:** Wymaga przełączenia aplikacji w tryb konserwacji (Maintenance Mode).

# 📚 Szczegółowe wyjaśnienie
To jest Twoja "polisą ubezpieczeniowa". Przed każdą dużą zmianą (np. aktualizacja wersji Ataccamy, import nowego modelu MMDM) należy wykonać Snapshot.
Odtworzenie (Restore) cofa system dokładnie do momentu wykonania zrzutu.

# 💡 Przykład zastosowania
Administrator chce wgrać nową, eksperymentalną wersję modelu metadanych.
1. Robi Snapshot "Pre-MMDM-Change".
2. Wgrywa zmiany.
3. Okazuje się, że nowy model popsuł widoki dla użytkowników.
4. Administrator klika "Restore from Snapshot".
5. Po 5 minutach system wraca do stanu sprzed zmiany, jakby nic się nie stało.

## 📌 Źródła
- [[Ataccama|Ataccama]] Administration Guide - [[Backup|Backup]] & Restore.

## 👽 Brudnopis
- To nie jest [[Backup|backup]] długoterminowy (do tego służą regularne dumpy [[Bazy danych|bazy danych]] Postgres robione przez zespół IT). Snapshot jest narzędziem operacyjnym "na teraz".