---
title: Slowly Changing Dimension (SCD)
created: 2026-02-04
status: evergreen
category: Data Engineering / Warehousing
difficulty: intermediate
language: pl
tags:
  - scd
  - etl
  - data-warehouse
  - history
  - kimball
aliases:
  - Wymiary Zmienne w Czasie
  - SCD Type 2
---
# 🎯 Definicja
**SCD (Slowly Changing Dimension)** to sposób radzenia sobie ze zmianami w danych historycznych w hurtowni danych.
Przykład: Klient "Jan Kowalski" mieszkał w Warszawie, ale przeprowadził się do Krakowa. Co robimy w bazie?

# 🔑 Kluczowe Typy
- **Type 1 (Nadpisz):** Zmieniamy "Warszawa" na "Kraków". Tracimy historię. (Jan zawsze mieszkał w Krakowie wg bazy).
- **Type 2 (Historia - Wiersze):** Dodajemy nowy wiersz.
    - Jan (W-wa), valid_to: 2023.
    - Jan (Kraków), valid_from: 2024.
    To standard w analityce.
- **Type 3 (Historia - Kolumny):** Mamy kolumny `City` i `Previous_City`. Pamiętamy tylko ostatnią zmianę.

# 📚 Szczegółowe wyjaśnienie
SCD Type 2 jest najpopularniejszy, bo pozwala na "podróż w czasie".
Możesz zapytać: "Gdzie mieszkał Jan, gdy kupował rower w 2022 roku?".
Baza odpowie: "W Warszawie".
Przy SCD Type 1 odpowiedziałaby: "W Krakowie" (co jest fałszem historycznym).

# 💡 Przykład zastosowania
System HR.
Pracownik awansuje z "Junior" na "Senior".
SCD Type 2 pozwala policzyć, ile zarabiał jako Junior, a ile jako Senior.
Bez tego, po awansie, system myślałby, że on od zawsze był Seniorem i od zawsze tyle zarabiał (błąd w raporcie kosztów).

## 📌 Źródła
- Ralph Kimball - "The Data Warehouse Toolkit".

## 👽 Brudnopis
- Implementacja SCD Type 2 jest trudna (merging, daty, flagi `is_current`). Narzędzia jak [[dbt]] mają gotowe "Snapshots", które robią to automatycznie.