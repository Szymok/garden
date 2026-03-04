---
title: Apache Airflow
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - airflow
  - orchestration
  - python
  - dag
  - etl
aliases:
  - Orkiestracja procesów
  - Airflow DAGs
---
# 🎯 Definicja
**Apache Airflow** to platforma open-source do programowego tworzenia, planowania i monitorowania przepływów pracy (workflows). Traktuje pipeline'y danych jako kod (Workflows as Code).

# 🔑 Kluczowe punkty
- **DAG (Directed Acyclic Graph):** Reprezentacja procesu jako grafu zadań, które mają określoną kolejność i zależności, ale nie tworzą pętli.
- **Python:** Cała logika definicji procesu jest pisana w Pythonie, co daje ogromną elastyczność (pętle, warunki, generowanie dynamiczne).
- **Operatory:** Gotowe klocki do integracji (np. `PostgresOperator`, `BashOperator`, `PythonOperator`, `S3Sensor`).

# 📚 Szczegółowe wyjaśnienie
Airflow nie przetwarza danych (to nie Spark), tylko nimi **dyryguje**. Mówi "teraz uruchom Sparka", "poczekaj aż plik pojawi się na S3", "wyślij maila z raportem".
Dzięki podejściu "code-first", inżynierowie danych mogą wersjonować swoje pipeline'y w Git, pisać testy jednostkowe i stosować praktyki CI/CD.

Każdy DAG ma swój harmonogram (np. `@daily` lub cron expression).

# 💡 Przykład zastosowania
Prosty ETL:
1. **Extract:** Pobierz dane pogodowe z API (HttpOperator).
2. **Transform:** Przelicz średnią temperaturę (PythonOperator + Pandas).
3. **Load:** Zapisz wynik do hurtowni Snowflake (SnowflakeOperator).

Wszystko zapięte w DAG, który uruchamia się codziennie o 6:00 rano. Jeśli krok 1 zawiedzie, Airflow automatycznie ponowi próbę (Retry policy) i wyśle alert na Slacka w razie ostatecznego niepowodzenia.

## 📌 Źródła
- [Apache Airflow - Oficjalna strona](https://airflow.apache.org)

## 👽 Brudnopis
- Scheduler vs Webserver vs Worker vs Triggerer.
- Backfilling: Uruchamianie historycznych przebiegów (np. przelicz dane za zeszły rok).
- XComs: Mechanizm wymiany małych danych między taskami.
- Alternatywy: Prefect, Dagster, Mage.