---
title: ORC (Optimized Row Columnar)
created: 2026-02-04
status: evergreen
category: Data Engineering / Formats
difficulty: intermediate
language: pl
tags:
  - file-formats
  - big-data
  - hive
  - compression
  - columnar
aliases:
  - Format ORC
  - Pliki ORC
---
# 🎯 Definicja
**ORC** to format zapisu danych Big Data (podobnie jak Parquet), stworzony dla ekosystemu Hadoop (Hive). Jest formatem **kolumnowym**, co oznacza, że jest super wydajny przy analizach, gdzie czytasz tylko wybrane kolumny z milionów wierszy.

# 🔑 Kluczowe punkty
- **Kolumnowy:** Idealny do zapytań analitycznych ("Policz średnią wieku").
- **Kompresja:** Świetnie się kompresuje (mniej zajmuje na dysku niż CSV czy JSON).
- **Hive-Native:** Działa najlepiej w środowisku Hive/Hadoop (Parquet jest bardziej uniwersalny dla Sparka).

# 📚 Szczegółowe wyjaśnienie
ORC dzieli plik na "Paski" (Stripes). Każdy pasek ma własne indeksy (Min/Max, Bloom Filter).
Dzięki temu, jeśli szukasz "Ludzi starszych niż 100 lat", baza danych może pominąć całe bloki pliku (Predicate Pushdown), nie czytając ich z dysku. To drastycznie przyspiesza zapytania.

# 💡 Przykład zastosowania
Masz petabajt danych logów.
Jeśli zapiszesz je jako CSV, zapytanie "Pokaż błędy z wczoraj" zajmie godziny.
W formacie ORC, system odczyta tylko kolumnę "Data" i "Status", pominie resztę, i zwróci wynik w sekundy.

## 📌 Źródła
- Apache ORC Project.

## 👽 Brudnopis
- ORC vs Parquet: To jak Android vs iOS. Parquet wygrał popularność dzięki Sparkowi i Databricks. ORC jest nadal silny tam, gdzie króluje Hive.