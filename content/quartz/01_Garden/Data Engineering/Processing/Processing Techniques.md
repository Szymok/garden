---
title: Processing Techniques (Row vs Columnar vs Vector)
created: 2026-02-04
status: evergreen
category: Data Engineering / Performance
difficulty: advanced
language: pl
tags:
  - row-oriented
  - column-oriented
  - vectorization
  - simd
  - performance
aliases:
  - Techniki Przetwarzania Danych
  - Silniki Wektorowe
  - Row vs Column
---
# 🎯 Definicja
Jak komputer czyta dane?
- **Row-Oriented (Wierszowo):** Czyta całego klienta (Imię, Nazwisko, Adres, Telefon).
- **Column-Oriented (Kolumnowo):** Czyta same Nazwiska wszystkich klientów.
- **Vectorized (Wektorowo):** Czyta 1000 Nazwisk na raz w jednym cyklu procesora.

# 🔑 Kluczowe punkty
- **[[OLTP|OLTP]] (Row):** Bazy transakcyjne (Postgres, MySQL). Dobre do zapisu pojedynczych transakcji ("Dodaj koszyk").
- **OLAP (Column):** Hurtownie ([[Snowflake|Snowflake]], BigQuery). Dobre do analiz ("Policz średnią cenę ze wszystkich koszyków").
- **Vector Engines:** Nowoczesne silniki ([[DuckDB]], ClickHouse). Wykorzystują instrukcje SIMD procesora (robią matematykę na całych wektorach liczb na raz).

# 📚 Szczegółowe wyjaśnienie
Dlaczego kolumnowe są szybsze do analizy?
Chcesz policzyć średni wiek Polaków.
- W bazie wierszowej: Musisz wczytać z dysku całe rekordy (z Imionami, Adresami), żeby wyciągnąć Wiek. Marnujesz I/O.
- W bazie kolumnowej: Wczytujesz z dysku tylko kolumnę `Wiek`. Ignorujesz resztę. Jest 100x mniej danych do przeczytania.

# 💡 Przykład zastosowania
Analityk wrzuca zapytanie na 100 mln wierszy w [[Pandas]]. Trwa to 20 minut (Python jest wolny, pętle są wolne).
Przepisuje to na [[DuckDB]] (Silnik Wektorowy). Trwa to 2 sekundy.
Dlaczego? Bo [[DuckDB|DuckDB]] używa C++ i SIMD, przetwarzając dane blokami (Vectors), a nie wiersz po wierszu.

## 📌 Źródła
- "Designing Data-Intensive Applications".

## 👽 Brudnopis
- Format pliku też ma znaczenie. CSV/JSON są wierszowe (powolne). [[Apache Parquet]]/[[ORC|ORC]] są kolumnowe (szybkie).
