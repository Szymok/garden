---
title: Rollup (Agregacja)
created: 2026-02-04
status: evergreen
category: Data Engineering / SQL
difficulty: intermediate
language: pl
tags:
  - rollup
  - aggregation
  - sql
  - olap
  - performance
aliases:
  - Agregacja Rollup
  - Group By Rollup
---
# 🎯 Definicja
**Rollup** to technika "zwijania" danych. Zamieniasz miliony szczegółowych transakcji (paragonów) w jeden wiersz podsumowania (Suma dnia).
Najczęściej używane w SQL (`GROUP BY ROLLUP`) oraz w narzędziach OLAP.

# 🔑 Kluczowe punkty
- **Optymalizacja:** Raport na podstawie Rollupa generuje się w 0.1s. Raport na podstawie surowych danych w 10s.
- **Hierarchia:** Działa świetnie z hierarchiami (Rok -> Kwartał -> Miesiąc -> Dzień).
- **Pre-agregacja:** Często materializujemy rollupy w nocy, żeby w dzień analitycy mieli szybki dostęp.

# 📚 Szczegółowe wyjaśnienie
W SQL `GROUP BY ROLLUP (Region, Sklep)` wygeneruje 3 poziomy danych w jednym wyniku:
1.  Sumy dla każdego Sklepu w Regionie.
2.  Sumy dla każdego Regionu (wszystkie sklepy razem).
3.  Sumę całkowitą (Grand Total).
To podstawa działania tabel przestawnych i kostek OLAP.

# 💡 Przykład zastosowania
Dashboard Sprzedaży dla CEO.
CEO nie chce widzieć każdego sprzedanego batonika.
Chce widzieć: "Polska: 5 mln zł".
Robisz Rollup do poziomu Kraju.
Gdy CEO kliknie w "Polska", system może sięgnąć do niższego Rollupa (Województwo). Dopiero gdy zjedzie na sam dół, system sięgnie po dane surowe (co zdarza się rzadko).

## 📌 Źródła
- PostgreSQL Documentation - Grouping Sets, Cubes, and Rollups.

## 👽 Brudnopis
- W czasach Big Data (Snowflake, BigQuery) rollupy są mniej krytyczne niż kiedyś (bo bazy są super szybkie), ale nadal oszczędzają pieniądze (płacisz za przetworzone bajty). Skanowanie 1KB Rollupa vs 1TB Raw Data to duża różnica w cenie.