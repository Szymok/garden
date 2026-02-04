---
title: Data Slice (Wycinek Danych)
created: 2026-02-04
status: evergreen
category: Ataccama/Monitoring
difficulty: intermediate
language: pl
tags:
  - data-slice
  - monitoring
  - partitioning
  - optimization
aliases:
  - Wycinek Danych
  - Partycja Monitoringu
---
# 🎯 Definicja
**Data Slice** (Wycinek Danych) w Ataccama ONE to mechanizm wirtualnego podziału zbioru danych na mniejsze części w celu bardziej precyzyjnego monitorowania. Zamiast sprawdzać jakość *całej* tabeli (co może być kosztowne i powolne), definiujesz "plaster" – np. tylko dane z wczoraj lub tylko dane dla kraju "PL".

# 🔑 Kluczowe punkty
- **Optymalizacja kosztów:** Nie skanujesz całej historii (10 lat), tylko ostatni dzień.
- **Lepsze alerty:** Możesz mieć inne reguły dla "PL" (wymagany PESEL) i inne dla "DE" (brak PESEL).
- **Rodzaje:**
    - **Dynamiczne:** Np. `date = today() - 1`.
    - **Statyczne:** Np. `country = 'USA'`.

# 📚 Szczegółowe wyjaśnienie
Gdy masz tabelę z 1 miliardem wierszy, uruchamianie pełnego DQ Checka codziennie jest nierealne.
Tworzysz Data Slice oparty na kolumnie daty (`transaction_date`).
Konfigurujesz Monitoring Project, aby uruchamiał się na tym Slice.
Codziennie system pobiera tylko nowe rekordy, sprawdza ich jakość i dodaje wynik do historycznego trendu. Dzięki temu masz ciągły monitoring bez "zabijania" bazy danych.

# 💡 Przykład zastosowania
Globalna tabela sprzedaży.
Chcesz monitorować jakość danych osobno dla każdego regionu, bo każdy region ma innego Data Stewarda.
Tworzysz Slices: `Region=EMEA`, `Region=APAC`, `Region=AMER`.
Steward z EMEA dostaje alerty tylko, gdy spadnie jakość w jego "kawałku" tortu, a nie gdy coś się zepsuje w USA.

## 📌 Źródła
- Ataccama ONE Documentation - Data Slices.

## 👽 Brudnopis
- Data Slice działa jak klauzula `WHERE` w SQL.
- Jest kluczowy dla dużych wolumenów danych (Big Data).