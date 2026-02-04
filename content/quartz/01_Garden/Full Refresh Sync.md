---
title: Full Refresh Sync (Pełna Synchronizacja)
created: 2026-02-04
status: evergreen
category: Data Integration
difficulty: basic
language: pl
tags:
  - etl
  - replication
  - airbyte
  - full-refresh
  - sync-modes
aliases:
  - Pełna synchronizacja odświeżania
  - Full Refresh
---
# 🎯 Definicja
**Full Refresh Sync** to najprostsza metoda kopiowania danych: "Skasuj wszystko co mam w celu i pobierz wszystko od nowa ze źródła".

# 🔑 Kluczowe punkty
- **Prostota:** Nie musisz martwić się o "Changes", "Deltas" czy "Watermarks".
- **Spójność:** Masz gwarancję, że dane docelowe są identyczne jak w źródle (w tym usunięte rekordy).
- **Koszt:** Bardzo kosztowne dla dużych tabel. Pobierasz 1GB danych codziennie, nawet jak zmienił się 1KB.

# 📚 Szczegółowe wyjaśnienie
Dwa tryby:
1.  **Overwrite:** Skasuj starą tabelę, wstaw nową. (Najczęstsze).
2.  **Append:** Dodaj nowe dane na koniec starej tabeli (Duplikaty! Używane rzadko, np. do snapshotów historycznych "Jak wyglądała tabela wczoraj?").

# 💡 Przykład zastosowania
Masz tabelę `SłownikKrajów` (200 wierszy). Zmienia się rzadko.
Ustawiasz **Full Refresh Overwrite**. Raz dziennie pobierasz całą listę krajów.
Trwa to 2 sekundy. Nie ma sensu bawić się w skomplikowaną synchronizację przyrostową (Incremental).

## 📌 Źródła
- Airbyte Sync Modes.

## 👽 Brudnopis
- Reguła kciuka: Używaj Full Refresh dla tabel słownikowych i małych wymiarów. Używaj Incremental dla tabel Faktów (transakcji).
