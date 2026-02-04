---
title: Apache Parquet
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - parquet
  - columnar-format
  - storage
  - compression
aliases:
  - Format Parquet
  - Pliki Parquet
---
# 🎯 Definicja
**Apache Parquet** to otwarty, kolumnowy format zapisu danych, zoptymalizowany pod kątem wydajności analityki (OLAP) i kompresji. Jest standardem przechowywania danych w nowoczesnych Data Lake'ach.

# 🔑 Kluczowe punkty
- **Kolumnowość:** Wartości z tej samej kolumny są zapisywane obok siebie. To pozwala na świetną kompresję (bo dane są podobne, np. same daty) i szybkie sczytywanie tylko potrzebnych kolumn (Projection Pushdown).
- **Embedded Schema:** Każdy plik zawiera w stopce swoje metadane (nazwy kolumn, typy danych, statystyki min/max).
- **Agnostyczny:** Wspierany przez niemal każde narzędzie (Spark, Pandas, Hive, Impala, AWS Athena, Excel).

# 📚 Szczegółowe wyjaśnienie
Dlaczego CSV jest zły dla Big Data? Bo żeby policzyć średnią wieku z pliku CSV 1TB, musisz przeczytać całe 1TB tekstu, parsować przecinki i wyciągać kolumnę "Wiek".
W Parquet, kolumna "Wiek" jest zapisana w osobnym bloku. Dysk musi odczytać tylko np. 500MB tej jednej kolumny. To daje przyspieszenie rzędu 10x-100x.
Dodatkowo, dzięki statystykom (min/max) w nagłówkach bloków, silnik może pominąć całe fragmenty pliku, jeśli wie, że nie ma tam szukanych danych (Predicate Pushdown).

# 💡 Przykład zastosowania
Tabela sprzedaży: `Data`, `Produkt`, `Cena`, `Sklep`.
Zapytanie: `SELECT SUM(Cena) FROM sprzedaz`.
Parquet pozwala silnikowi odczytać **tylko** kolumnę `Cena`, ignorując `Produkt` czy `Sklep`. Operacja I/O jest minimalna.

## 📌 Źródła
- [Apache Parquet](https://parquet.apache.org/)

## 👽 Brudnopis
- Kompresja: Snappy (szybka), Gzip (mocna), Zstd (złoty środek).
- Row Groups: Dane są dzielone na poziome pasy (np. co 100k wierszy), wewnątrz których są kolumny.
- Nested Types: Wspiera struktury zagnieżdżone (Map, List, Struct).