---
title: Data Export (Eksport Danych w Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama/User Guide
difficulty: basic
language: pl
tags:
  - export
  - integration
  - one-web
  - csv
aliases:
  - Eksport danych
  - Pobieranie danych
---
# 🎯 Definicja
**Data Export** w [[Ataccama|Ataccama]] ONE to funkcjonalność pozwalająca na wyciągnięcie danych z platformy (z poziomu [[Catalog Items|Catalog Items]]) do systemów zewnętrznych lub plików. Umożliwia analitykom pobranie wyników czyszczenia lub przetworzonych danych do dalszej pracy (np. w Excelu lub Power BI).

# 🔑 Kluczowe punkty
- **Opcje eksportu:**
    1.  Do pliku (CSV, TXT).
    2.  Do [[Bazy danych|bazy danych]] (RDBMS).
    3.  Do ONE Data (wewnętrzna baza platformy).
- **Bezpieczeństwo:** Eksport podlega uprawnieniom. Jeśli dane są maskowane lub użytkownik nie ma prawa "Data Export", operacja się nie uda.
- **Konfiguracja:** Wymaga zdefiniowania _Write Credentials_ (poświadczeń zapisu) dla baz danych.

# 📚 Szczegółowe wyjaśnienie
Proces eksportu do [[Bazy danych|bazy danych]]:
1.  **Przygotowanie:** Musisz mieć zdefiniowane połączenie (Connection) w `Sources` i dodane poświadczenia z prawami zapisu (`Write Credentials`).
2.  **Uruchomienie:** Wybierasz Catalog Item -> `...` (More options) -> `Export`.
3.  **Kreator:**
    - Wybierasz cel (Target Database & Table).
    - Mapujesz kolumny (Co idzie gdzie).
    - Ustawiasz tryb (Append, Overwrite, Truncate).
4.  **Wykonanie:** Eksport działa jako zadanie w tle (Processing Job).

# 💡 Przykład zastosowania
Data Steward oczyścił listę mailingową w [[Ataccama|Ataccama]] ONE (usunął duplikaty, poprawił e-maile).
Teraz chce wgrać tę listę z powrotem do systemu CRM (np. Salesforce lub baza [[SQL|SQL]]).
Używa funkcji "Export to Database", wskazuje tabelę stagingową CRM-u i uruchamia proces.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Export Data.

## 👽 Brudnopis
- Pamiętaj, że eksport dużych zbiorów danych (miliony rekordów) przez przeglądarkę (do CSV) nie jest zalecany. Lepiej użyć "Export to Database" lub dedykowanego procesu ETL/Planu.
- Limity eksportu plikowego zależą od konfiguracji instancji (DPE).