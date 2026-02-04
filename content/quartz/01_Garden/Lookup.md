---
title: Lookup (Słownik Referencyjny)
created: 2026-02-04
status: evergreen
category: Data Quality / Ataccama
difficulty: basic
language: pl
tags:
  - lookup
  - reference-data
  - enrichment
  - validation
  - ataccama
aliases:
  - Lookup Item
  - Plik LKP
  - Słownik
---
# 🎯 Definicja
**Lookup** to plik lub tabela służąca do **tłumaczenia** kodów na nazwy lub **weryfikacji** poprawności danych. To taki "słowniczek", do którego system zagląda, żeby sprawdzić, co oznacza "PL" (Polska) albo czy kod pocztowy "00-001" istnieje.

# 🔑 Kluczowe punkty
- **Enrichment (Wzbogacanie):** Masz kod "PL", Lookup zwraca "Polska, Warszawa, +48".
- **Validation (Walidacja):** Sprawdzasz, czy wartość istnieje na liście.
- **Cache:** Lookupy są zazwyczaj ładowane do pamięci RAM, żeby działały błyskawicznie (nawet przy milionach rekordów).

# 📚 Szczegółowe wyjaśnienie
W Ataccama ONE `.lkp` to specyficzny format pliku binarnego/tekstowego, zoptymalizowany pod szybkie wyszukiwanie.
Można go zbudować z pliku CSV, tabeli w bazie danych lub innej operacji ETL.
Rodzaje:
- **Simple Lookup:** Klucz -> Wartość.
- **Range Lookup:** Jeśli zarobki są między 1000 a 2000 -> "Junior".

# 💡 Przykład zastosowania
Analityka sprzedaży.
W bazie transakcyjnej masz tylko `product_id`.
W raporcie chcesz widzieć `product_name` i `category`.
Używasz kroku **Lookup**, który "dokleja" te informacje do każdej transakcji w locie, nie obciążając głównej bazy zapybaniami SQL JOIN.

## 📌 Źródła
- Ataccama Documentation - Lookup Step.

## 👽 Brudnopis
- W SQL odpowiednikiem jest `LEFT JOIN`. W Excelu `VLOOKUP` (stąd nazwa).