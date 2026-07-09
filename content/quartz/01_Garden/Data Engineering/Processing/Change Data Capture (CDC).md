---
title: Change Data Capture (CDC)
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: zaawansowany
language: pl
tags:
  - cdc
  - change-data-capture
  - inkrementalna-synchronizacja
  - debezium
  - kafka
  - streaming
aliases:
  - CDC
  - Przechwytywanie zmian danych
---

# 🎯 Definicja

**Change Data Capture (CDC)** to wzorzec integracji danych, który przechwytuje każdą zmianę w bazie źródłowej (INSERT, UPDATE, DELETE) i propaguje ją do systemów docelowych w czasie rzeczywistym — bez kopiowania całej tabeli przy każdej synchronizacji.

# 🔑 Kluczowe punkty

- **Wal-based CDC**: czyta dziennik transakcji (WAL w PostgreSQL, binlog w MySQL)
- **Debezium** — najpopularniejszy open-source CDC connector (działa z [[Apache Kafka|Kafka]])
- **Low latency**: zmiany propagowane w sekundach, nie godzinach
- **Pełna historia**: DELETE widoczny jako event, nie znika ze źródła
- **Bez obciążenia źródła**: czyta log, nie wykonuje `SELECT *` na tabeli
- Alternatywa dla [[Inkrementalna synchronizacja|incremental sync]] opartego na `updated_at`

# 📚 Szczegółowe wyjaśnienie

## CDC vs Incremental Sync (porównanie)

| Cecha | CDC | Incremental (`updated_at`) |
|---|---|---|
| Latencja | Sekundy | Minuty/godziny |
| DELETE | Przechwytuje | Nie widzi |
| Obciążenie źródła | Minimalne | Query na każdej synchronizacji |
| Złożoność | Wyższa | Niższa |
| Wymaga cursora | Nie | Tak |

## Architektura z Debezium + Kafka

```
PostgreSQL (WAL)
      │
      ▼
 Debezium Connector
      │  czyta log transakcji
      ▼
 Apache Kafka Topic
  ("db.public.orders")
      │
  ┌───┴───┐
  ▼       ▼
S3/Delta Lake   Real-time App
(Data Lake)     (alerting)
```

## Event CDC — struktura

Każda zmiana to event z metadanymi:

```json
{
  "op": "u",                    // u=update, c=create, d=delete
  "before": {
    "id": 1001,
    "status": "pending"
  },
  "after": {
    "id": 1001,
    "status": "shipped"
  },
  "source": {
    "table": "orders",
    "ts_ms": 1714900000000
  }
}
```

## Konfiguracja PostgreSQL dla CDC

```sql
-- Włącz logical replication w postgresql.conf
wal_level = logical

-- Utwórz slot replikacji
SELECT pg_create_logical_replication_slot('debezium', 'pgoutput');

-- Ustaw REPLICA IDENTITY dla DELETE
ALTER TABLE orders REPLICA IDENTITY FULL;
```

## CDC w [[Airbyte]]

Airbyte obsługuje CDC jako tryb synchronizacji — bez konieczności manualnej konfiguracji Debezium. Dostępne dla PostgreSQL, MySQL, SQL Server.

# 💡 Przykład zastosowania

**Realtime Data Warehouse**: tabela `customers` w PostgreSQL produkcyjnym ma 50M rekordów — full refresh trwałby 6 godzin. CDC przez Debezium → Kafka → Delta Lake przechwytuje tylko zmienione rekordy. Każda aktualizacja adresu klienta trafia do hurtowni w ciągu 10 sekund.

# 📌 Źródła

- [[Apache Kafka]]
- [[Inkrementalna synchronizacja]]
- [[ETL kontra ELT]]
- [[Airbyte]]
- [[Delta Lake]]
- [[Ewolucja Schematu]]

# 👽 Brudnopis
