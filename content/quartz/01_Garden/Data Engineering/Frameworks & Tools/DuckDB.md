---
title: DuckDB
created: 2026-02-04
status: evergreen
category: Database
difficulty: intermediate
language: pl
tags:
  - olap
  - in-process
  - sql
  - python
  - local-analytics
aliases:
  - SQLite for Analytics
---
# 🎯 Definicja
**DuckDB** to wbudowana baza danych SQL typu OLAP (analityczna). Można o niej myśleć jak o "SQLite dla analityki". Działa wewnątrz procesu aplikacji (np. Pythona), nie wymaga serwera, instalacji ani konfiguracji, a przetwarza miliony wierszy w ułamku sekundy dzięki formatowi kolumnowemu.

# 🔑 Kluczowe punkty
- **In-Process:** Nie ma "połączenia sieciowego". Baza siedzi w pamięci RAM twojego skryptu.
- **Kolumnowa:** Zoptymalizowana do agregacji (`SUM`, `AVG`, `GROUP BY`), a nie transakcji (`INSERT`).
- **Zero-Copy:** Potrafi czytać dane bezpośrednio z Pandas DataFrame lub plików Parquet bez ich kopiowania.
- **SQL:** Pełne wsparcie dla standardu SQL.

# 📚 Szczegółowe wyjaśnienie
DuckDB wypełnia lukę między Pandas (dobre do małych danych, słabe SQL) a Sparkiem/Snowflake (dobre do Big Data, ale wymagają klastra).
Pozwala robić zaawansowane SQL na plikach lokalnych (`.csv`, `.parquet`, `.json`) na zwykłym laptopie.
Jest fundamentem trendu "Modern Data Stack in a Box".

# 💡 Przykład zastosowania
Masz 10GB plików parquet z logami serwera na dysku.
Chcesz policzyć liczbę błędów `500` na godzinę.
W Pandas: Musiałbyś wczytać wszystko do RAM (może braknąć pamięci).
W DuckDB:
`duckdb.query("SELECT hour, count(*) FROM 'logs/*.parquet' WHERE status=500 GROUP BY hour").df()`
DuckDB zrobi to strumieniowo, używając mało RAMu i wszystkich rdzeni procesora.

## 📌 Źródła
- DuckDB.org Documentation.
- "DuckDB: SQLite for Analytics".

## 👽 Brudnopis
- Idealne narzędzie dla Data Scientista i Inżyniera Danych do lokalnych testów.
- Używane przez dbt (dbt-duckdb) do lokalnego developmentu.