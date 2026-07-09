---
title: Medallion Architecture (Architektura Medalionowa)
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - medallion-architecture
  - data-lakehouse
  - bronze-silver-gold
  - delta-lake
  - databricks
  - architektura-danych
aliases:
  - Bronze Silver Gold
  - Architektura Medalionowa
  - Multi-hop Architecture
---

# 🎯 Definicja

**Medallion Architecture** to wzorzec organizacji danych w [[Data Lakehouse|Data Lakehouse]], który dzieli dane na trzy warstwy jakościowe: **Bronze** (surowe), **Silver** (oczyszczone), **Gold** (zagregowane, gotowe do analizy) — jak rafinowanie metalu od rudy do złota.

# 🔑 Kluczowe punkty

- Opracowana przez **Databricks** dla [[Delta Lake]]
- Każda warstwa buduje na poprzedniej — dane płyną jednokierunkowo
- **[[Idempotentność|Idempotentność]]**: można ponownie przetworzyć dane z Bronze bez utraty informacji
- **Separacja odpowiedzialności**: inżynier ładuje Bronze, analityk czyta Gold
- Implementowana w [[Delta Lake]], [[Apache Iceberg|Apache Iceberg]], [[Apache Hudi|Apache Hudi]]

# 📚 Szczegółowe wyjaśnienie

## Trzy warstwy

```
Źródła danych
     │
     ▼
┌─────────────────────────────────────────┐
│  BRONZE (Raw Zone)                       │
│  - Dane 1:1 ze źródła (bez zmian)       │
│  - Przechowywane jako Parquet/Delta     │
│  - Pełna historia, append-only          │
│  - Schemat: jak w źródle                │
└─────────────────┬───────────────────────┘
                  │ oczyszczanie, walidacja
                  ▼
┌─────────────────────────────────────────┐
│  SILVER (Cleansed Zone)                  │
│  - Usunięte duplikaty                   │
│  - Oczyszczone typy danych              │
│  - Standaryzowane nazwy kolumn          │
│  - Zwalidowane reguły biznesowe         │
│  - Enrichment (join ze słownikami)      │
└─────────────────┬───────────────────────┘
                  │ agregacje, modele biznesowe
                  ▼
┌─────────────────────────────────────────┐
│  GOLD (Business Zone)                   │
│  - Modele wymiarowe (Star Schema)       │
│  - Agregaty, metryki, KPI              │
│  - Zoptymalizowane pod zapytania BI     │
│  - Konsumowane przez Power BI, Tableau  │
└─────────────────────────────────────────┘
```

## Implementacja z [[dbt|dbt]]

```sql
-- Bronze: surowe dane (ładuje Airbyte/Kafka)
-- models/bronze/raw_orders.sql
SELECT * FROM {{ source('raw', 'orders') }}

-- Silver: oczyszczone
-- models/silver/orders.sql
SELECT
    id,
    UPPER(status)           AS status,
    CAST(amount AS DECIMAL) AS amount,
    created_at::DATE        AS order_date
FROM {{ ref('raw_orders') }}
WHERE id IS NOT NULL

-- Gold: agregaty
-- models/gold/daily_revenue.sql
SELECT
    order_date,
    COUNT(*)      AS order_count,
    SUM(amount)   AS revenue
FROM {{ ref('orders') }}
GROUP BY 1
```

## Porównanie z Lambda Architecture

| Cecha | Medallion | [[Architektura Lambda]] |
|---|---|---|
| Złożoność | Niższa | Wyższa (batch + stream) |
| Latencja | Minuty–godziny | Sekundy |
| Koszt | Niższy | Wyższy |
| Maintenance | Prostsze | Skomplikowane (2 pipelines) |

# 💡 Przykład zastosowania

**E-commerce Data Platform**: Bronze — surowe zamówienia z Shopify przez [[Airbyte|Airbyte]], Bronze — zdarzenia kliknięć z Kafka. Silver — oczyszczone zamówienia + klienci, Silver — sesje użytkowników. Gold — `daily_revenue_by_channel`, `customer_lifetime_value`, `product_conversion_rate` — konsumowane przez Power BI.

# 📌 Źródła

- [[Data Lakehouse]]
- [[Delta Lake]]
- [[dbt]]
- [[Airbyte]]
- [[Apache Kafka]]
- [[ETL kontra ELT]]
- [[Architektura Lambda]]

# 👽 Brudnopis
