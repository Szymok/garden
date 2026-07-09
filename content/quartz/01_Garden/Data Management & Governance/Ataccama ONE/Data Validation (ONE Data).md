---
title: Data Validation with ONE Tables
created: 2026-02-04
status: evergreen
category: Ataccama ONE / DQ
difficulty: intermediate
language: en
tags:
  - validation
  - reference-data
  - lookups
  - one-data
  - dq-rules
aliases:
  - Walidacja z ONE Data
  - Reference Data Validation
---
# 🎯 Definicja
Walidacja danych przy użyciu tabel **ONE Data** (zarządzanych tabel wewnątrz platformy [[Ataccama|Ataccama]]) to nowoczesna alternatywa dla słowników statycznych (Lookups).
Pozwala Stewardom edytować słownik "Legalnych Wartości" w Excelowym interfejsie w przeglądarce, a Reguły DQ automatycznie pobierają te zmiany.

# 🔑 Kluczowe punkty
- **Dynamiczność:** Nie musisz przebudowywać plików [[Lookup|lookup]] (.lkp). Zmieniasz rekord w tabeli, reguła "widzi" to od razu.
- **Is From Catalog Item:** Warunek w regule DQ używany do sprawdzenia obecności wartości w tabeli ONE Data.
- **Self-Service:** Biznes sam zarządza swoimi słownikami (np. Lista Kodów Produktów), bez proszenia IT o wgranie pliku.

# 📚 Szczegółowe wyjaśnienie
Stara metoda: Plik tekstowy `codes.txt`. Import do Lookupa. Build. Wgranie na serwer. Restart.
Nowa metoda: Tabela w ONE Data `ref_codes`. Biznes wchodzi, dodaje wiersz. Koniec.
Reguła: `attribute is from catalog item "ref_codes"`.

# 💡 Przykład zastosowania
Walidacja kodów pocztowych.
Poczta zmienia kody. Pojawia się nowy kod "00-999".
Steward wchodzi do ONE Data, dodaje "00-999" do tabeli `ZipCodes`.
Od tej sekundy wszystkie nowe rekordy z tym kodem są oznaczane jako poprawne.

## 📌 Źródła
- One Data - Validate using managed tables.

## 👽 Brudnopis
- To ogromne ułatwienie operacyjne (Data Ops). Przesuwa odpowiedzialność za utrzymanie słowników z IT na Biznes (tam gdzie ich miejsce).
