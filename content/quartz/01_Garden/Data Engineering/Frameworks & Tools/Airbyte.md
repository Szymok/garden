---
title: Airbyte
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - airbyte
  - elt
  - data-integration
  - connectors
  - open-source
  - modern-data-stack
aliases:
  - ELT Tool
  - Data Integration Platform
---

# 🎯 Definicja

**Airbyte** to open-source'owa platforma integracji danych (ELT), która synchronizuje dane ze źródeł (bazy danych, SaaS API, pliki) do hurtowni danych lub data lake — z ponad 300 gotowymi konektorami. Jest centralnym komponentem [[Nowoczesny Stos Danych|Modern Data Stack]].

# 🔑 Kluczowe punkty

- **300+ konektorów**: Salesforce, PostgreSQL, BigQuery, Stripe, Google Analytics, Shopify...
- **ELT model**: dane trafiają surowe do destination, transformacje robi [[dbt]]
- **[[Inkrementalna synchronizacja|Incremental sync]]**: tylko nowe/zmienione rekordy (zamiast full refresh)
- **[[Kursor|Cursor]]**: znacznik ostatnio zsynchronizowanego rekordu
- **CDC**: natywne wsparcie Change Data Capture przez Debezium
- **Airbyte Cloud** — wersja zarządzana (SaaS), **Airbyte OSS** — self-hosted

# 📚 Szczegółowe wyjaśnienie

## Architektura

```
Source                    Airbyte                Destination
  │                          │                       │
  │   Extract (SQL/API)      │   Load (raw)          │
  ├─────────────────────────►│──────────────────────►│
  │                          │                       │
  │   PostgreSQL             │   Snowflake / BigQuery│
  │   Salesforce             │   S3 / Delta Lake     │
  │   Google Analytics       │   Redshift            │
```

## Tryby synchronizacji

| Tryb | Opis | Kiedy używać |
|---|---|---|
| Full Refresh | Usuwa wszystko, ładuje od nowa | Małe tabele, brak cursora |
| Incremental Append | Dołącza nowe rekordy | Tabele z `updated_at` |
| Incremental Dedup | Dołącza + deduplikuje | Jak wyżej + unikalne rekordy |
| CDC | Każda zmiana jako event | Duże tabele, realtime |

## Konfiguracja połączenia (UI / YAML)

```yaml
source:
  type: postgres
  host: db.company.com
  port: 5432
  database: production
  username: airbyte_reader
  replication_method:
    type: CDC  # lub STANDARD

destination:
  type: snowflake
  account: company.eu-central-1
  warehouse: COMPUTE_WH
  database: RAW

streams:
  - name: orders
    sync_mode: incremental_dedup
    cursor_field: updated_at
    primary_key: [id]
```

## Airbyte + dbt — typowy stack

```
PostgreSQL → Airbyte → Snowflake (raw schema)
                              ↓
                            dbt (transform)
                              ↓
                     Snowflake (marts schema)
                              ↓
                         Power BI / Tableau
```

## Normalizacja w Airbyte

Airbyte może opcjonalnie wykonać podstawową normalizację (spłaszczenie zagnieżdżonych JSON) przed dostarczeniem do destination. Szczegóły: [[Normalizacja w Airbyte]].

# 💡 Przykład zastosowania

**Marketing Analytics Stack**: Airbyte synchronizuje dane z Salesforce (CRM), Google Analytics (traffic) i Stripe (płatności) do BigQuery. Synchronizacja co godzinę, tryb incremental. dbt transformuje surowe dane w `raw` schema do modeli analytics w `marts` schema. Power BI czyta z marts.

# 📌 Źródła

- [[ETL kontra ELT]]
- [[Inkrementalna synchronizacja]]
- [[Change Data Capture (CDC)]]
- [[Kursor]]
- [[dbt]]
- [[Nowoczesny Stos Danych]]
- [[Normalizacja w Airbyte]]

# 👽 Brudnopis
