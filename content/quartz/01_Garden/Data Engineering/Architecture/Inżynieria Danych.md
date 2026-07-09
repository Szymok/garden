---
title: Inżynieria Danych (Data Engineering)
created: 2026-02-04
status: evergreen
category: Data Engineering / Career
difficulty: basic
language: pl
tags:
  - data-engineering
  - role
  - pipelines
  - infrastructure
aliases:
  - Data Engineer
  - Inżynier Danych
  - DE
---
# 🎯 Definicja
**Inżynieria Danych** to dziedzina IT zajmująca się **transportem, transformacją i przechowywaniem danych**. Inżynier Danych to "hydraulik", który buduje system rur (Pipeline'y), aby dostarczyć czystą wodę (Dane) do kranów (Raporty BI, Modele ML), z których korzystają mieszkańcy (Biznes, Data Scientiści).

# 🔑 Kluczowe punkty
- **Cel:** Dostarczenie wiarygodnych danych we właściwym czasie i formacie.
- **Narzędzia:** [[SQL|SQL]], Python, Chmura (AWS/Azure/GCP), Orkiestratory (Airflow), [[Bazy danych|Bazy danych]] ([[Snowflake|Snowflake]], Postgres).
- **Różnica:** Data Scientist analizuje dane (szuka wzorców). Data Engineer buduje systemy, które te dane dostarczają.

# 📚 Szczegółowe wyjaśnienie
Główne zadania DE:
1.  **Ingestion:** Pobranie danych z API, plików, baz (ELT).
2.  **Transformation:** Czyszczenie, łączenie i aggregacja ([[dbt|dbt]], Spark).
3.  **Serving:** Wystawienie danych dla innych (Data Marts, API).
4.  **Orchestration:** Zarządzanie kolejnością zadań (Airflow, [[Dagster|Dagster]]).
5.  **Quality:** Dbanie o to, by dane nie były "śmieciami".

# 💡 Przykład zastosowania
Sklep internetowy chce wiedzieć, co klienci klikają.
Inżynier Danych:
1. Konfiguruje zbieranie logów ze strony (Clickstream).
2. Ustawia streamowanie tych logów do [[Data Lake|Data Lake]] (S3).
3. Pisze proces Spark/[[SQL|SQL]], który co godzinę mieli te logi i wylicza "Top 10 produktów".
4. Zapisuje wynik do hurtowni, skąd pobiera go dashboard marketingu.

## 📌 Źródła
- "Fundamentals of Data Engineering" - Joe Reis & Matt Housley.

## 👽 Brudnopis
- Obecnie granica między DE a Software Engineeringiem się zaciera ([[DataOps|DataOps]], Data reliability engineering).
- Kluczowa umiejętność: [[SQL|SQL]]. Bez [[SQL|SQL]] nie ma Inżynierii Danych.