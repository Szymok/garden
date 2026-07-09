---
title: Push-Down Optimization
created: 2026-02-04
status: evergreen
category: Data Engineering / Performance
difficulty: advanced
language: pl
tags:
  - performance
  - optimization
  - sql
  - elt
  - dbt
aliases:
  - Push-down
  - Optymalizacja zapytań
  - Predicate Pushdown
---
# 🎯 Definicja
**[[Push-Down|Push-Down]] Optimization** to technika przesuwania ciężkich obliczeń tam, gdzie dane leżą (do [[Bazy danych|bazy danych]]), zamiast przesyłania danych do aplikacji. Zasada: "Przesyłaj pytania, nie dane".

# 🔑 Kluczowe punkty
- **Zmniejszenie Transferu:** Zamiast pobierać 1TB danych i filtrować lokalnie, wysyłasz `WHERE rok = 2024` i pobierasz 1GB.
- **Wykorzystanie Mocy:** [[Bazy danych|Bazy danych]] ([[Snowflake|Snowflake]], BigQuery) mają potężne silniki optymalizacji. Niech one pracują.
- **ELT vs ETL:** [[Push-Down|Push-down]] jest sercem podejścia **ELT** (Extract-Load-Transform), gdzie transformacja dzieje się w docelowej bazie.

# 📚 Szczegółowe wyjaśnienie
W systemach rozproszonych (Spark, Presto) istnieje termin **Predicate Pushdown**.
Jeśli format pliku (np. [[ORC]] lub Parquet) wspiera statystyki, silnik może pominąć czytanie całych bloków pliku, jeśli wie, że nie ma tam szukanych danych.
Przykład: Szukasz `ID=5`. W nagłówku bloku jest napisane "W tym bloku są ID od 100 do 200". Silnik w ogóle nie czyta tego bloku z dysku. To ogromna oszczędność I/O.

# 💡 Przykład zastosowania
Narzędzie BI (np. Tableau) łączy się z bazą.
Użytkownik filtruje dashboard na "Polska".
**Zły scenariusz:** Tableau pobiera wszystkie kraje do pamięci laptopa i filtruje. (Wolno).
**Dobry scenariusz ([[Push-Down|Push-down]]):** Tableau generuje [[SQL|SQL]] `SELECT ... FROM ... WHERE Country = 'Polska'` i wysyła go do bazy. Baza zwraca tylko wynik. (Szybko).

## 📌 Źródła
- Databricks Glossary - Predicate Pushdown.

## 👽 Brudnopis
- W [[dbt|dbt]] [[Push-Down|push-down]] dzieje się automatycznie, bo [[dbt|dbt]] po prostu kompiluje [[SQL|SQL]] i uruchamia go w bazie. To największa zaleta [[dbt|dbt]].
