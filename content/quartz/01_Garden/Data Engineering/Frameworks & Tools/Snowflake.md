---
title: Snowflake
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - snowflake
  - cloud-data-warehouse
  - sql
  - modern-data-stack
  - saas
aliases:
  - Cloud Data Warehouse
  - Snowflake DWH
---

# 🎯 Definicja

**Snowflake** to cloudowa platforma danych (Data Cloud) działająca jako SaaS, oferująca hurtownię danych, data lake i możliwości udostępniania danych — na AWS, Azure i GCP. Wyróżnia ją rozdzielenie compute od storage i architektura multi-cluster.

# 🔑 Kluczowe punkty

- **Rozdzielenie compute/storage**: płacisz osobno za przechowywanie i za obliczenia
- **Virtual Warehouse**: klaster obliczeniowy, który można uruchamiać i zatrzymywać
- **Auto-suspend/resume**: warehouse zatrzymuje się po bezczynności — brak kosztów w tle
- **Time Travel**: powrót do dowolnego stanu danych z ostatnich 90 dni
- **Zero-copy cloning**: kopia tabeli/bazy bez duplikowania danych (metadane)
- **Data Sharing**: udostępnianie danych innym organizacjom bez kopiowania

# 📚 Szczegółowe wyjaśnienie

## Architektura trójwarstwowa

```
┌─────────────────────────────────┐
│     Cloud Services Layer        │  Optymalizacja zapytań,
│  (Authentication, Optimizer)    │  metadata, security
└────────────────┬────────────────┘
                 │
┌────────────────▼────────────────┐
│     Compute Layer               │  Virtual Warehouses
│  ┌──────┐ ┌──────┐ ┌──────┐   │  niezależne klastry
│  │ VW 1 │ │ VW 2 │ │ VW 3 │   │
│  └──────┘ └──────┘ └──────┘   │
└────────────────┬────────────────┘
                 │
┌────────────────▼────────────────┐
│     Storage Layer               │  Dane w S3/Blob/GCS
│  (compressed columnar format)   │  płacisz per GB/miesiąc
└─────────────────────────────────┘
```

## Kluczowe funkcje SQL

```sql
-- Time Travel — dane sprzed 3 dni
SELECT * FROM orders AT (OFFSET => -3*24*60*60);

-- Zero-copy clone — środowisko testowe w sekundy
CREATE DATABASE production_clone CLONE production;

-- Streams — CDC wbudowane w Snowflake
CREATE STREAM orders_stream ON TABLE orders;
SELECT * FROM orders_stream WHERE METADATA$ACTION = 'INSERT';

-- Dynamic Tables — automatyczne odświeżanie widoków
CREATE DYNAMIC TABLE silver_orders
    TARGET_LAG = '10 minutes'
    WAREHOUSE = compute_wh
AS
SELECT id, UPPER(status) as status FROM raw_orders;
```

## Snowflake w Modern Data Stack

```
Airbyte → Snowflake (raw) → dbt (transform) → Snowflake (marts) → BI Tool
```

## Koszty — pułapki

- Warehouse działa przez minimum 60 sekund po uruchomieniu
- `COPY INTO` ładuje pliki z S3 — tańsze niż INSERT
- Unikaj `SELECT *` na dużych tabelach — pełen scan
- Clustering keys dla dużych tabel (alternatywa dla partycjonowania)

# 💡 Przykład zastosowania

**Centralna platforma analityczna**: [[Airbyte]] ładuje dane z 15 systemów źródłowych do Snowflake `RAW` database. [[dbt]] transformuje do `ANALYTICS` database. Marketing używa VW `marketing_wh` (XS), Finance używa `finance_wh` (L, tylko w godzinach roboczych) — każdy płaci osobno, nie blokują się nawzajem.

# 📌 Źródła

- [[Data Warehouse]]
- [[Nowoczesny Stos Danych]]
- [[dbt]]
- [[Airbyte]]
- [[ETL kontra ELT]]
- [[Medallion Architecture]]

# 👽 Brudnopis
