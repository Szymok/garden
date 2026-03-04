---
title: Open Data Stack (Otwarty Stos Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: intermediate
language: pl
tags:
  - open-source
  - data-stack
  - modern-data-stack
  - dbt
  - airbyte
  - dagster
aliases:
  - Stos Danych Otwartych
  - MDS Open Source
---
# 🎯 Definicja
**Open Data Stack** to odpowiedź świata Open Source na Modern Data Stack (Snowflake/Fivetran/dbt Cloud).
To zestaw darmowych, otwartych narzędzi, które razem tworzą kompletną platformę danych.
Filozofia: Pełna kontrola, brak vendor lock-in, deployment na własnej infrastrukturze (Kubernetes).

# 🔑 Kluczowe Komponenty
1.  **Ingestion (EL):** [[Airbyte]] / Meld. (Zamiast Fivetran).
2.  **Transformation (T):** [[dbt]] Core.
3.  **Orchestration:** [[Dagster]] / [[Apache Airflow]] / Prefect.
4.  **Storage:** [[DuckDB]] / Postgres / [[Apache Iceberg]]. (Zamiast Snowflake/BigQuery).
5.  **Visualization:** Apache Superset / Metabase. (Zamiast Looker/Tableau).

# 📚 Szczegółowe wyjaśnienie
Zalety:
- **Koszt:** Płacisz tylko za serwery. Zero opłat licencyjnych.
- **Prywatność:** Dane nie opuszczają Twojej chmury/serwerowni.
- **Elastyczność:** Możesz modyfikować kod narzędzi.

Wady:
- **Obsługa:** Musisz sam to zainstalować, łatać i utrzymywać (DevOps heavy).

# 💡 Przykład zastosowania
Startup buduje analitykę. Nie stać ich na Snowflake ($$$).
Stawiają:
- Airbyte na k8s do pobierania danych z bazy prod.
- PostgreSQL jako hurtownię.
- dbt Core do modelowania.
- Dagster do orkiestracji.
- Metabase do dashboardów.
Koszt miesięczny: $50 (za VMki). Data Stack gotowy.

## 📌 Źródła
- "The Modern Data Stack is Dead, Long Live the Open Data Stack".

## 👽 Brudnopis
- Wersja "Light": DuckDB + dbt + Rill/Evidence. To tzw. "Laptop Data Stack" - potężna analityka działająca lokalnie na plikach Parquet, bez żadnych serwerów.
