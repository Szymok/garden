---
title: Apache Kafka
created: 2026-05-06
status: 🌱 draft
category: Data Engineering
difficulty: zaawansowany
language: pl
tags:
  - kafka
  - streaming
  - event-driven
  - apache
  - real-time
  - message-queue
aliases:
  - Kafka
  - Event Streaming
  - Strumieniowanie danych
---

# 🎯 Definicja

**Apache Kafka** to rozproszona platforma strumieniowania zdarzeń (event streaming), działająca jako trwały, wysoce wydajny dziennik wiadomości (log). Kafka obsługuje miliony zdarzeń na sekundę, umożliwiając realtime pipelines danych między systemami.

# 🔑 Kluczowe punkty

- **Topic**: nazwany strumień wiadomości (np. `orders`, `user-events`)
- **Producer**: aplikacja publikująca wiadomości do topicu
- **Consumer**: aplikacja czytająca wiadomości z topicu
- **Partition**: temat podzielony na partycje — równoległe czytanie
- **Offset**: pozycja wiadomości w partycji — consumer pamięta gdzie skończył
- **Retention**: Kafka przechowuje wiadomości przez zadany czas (np. 7 dni), niezależnie czy zostały przeczytane
- **Kafka Connect**: gotowe konektory do baz danych, S3, Elasticsearch

# 📚 Szczegółowe wyjaśnienie

## Architektura

```
Producer          Kafka Broker          Consumer
  │                                         │
  │  publish      ┌──────────────┐  read   │
  └──────────────►│  Topic:      │◄────────┘
                  │  orders      │
                  │  Part 0: [A,B,C]        │
                  │  Part 1: [D,E,F]        │
                  └──────────────┘
```

## Kafka vs tradycyjna kolejka wiadomości

| Cecha | Kafka | RabbitMQ/SQS |
|---|---|---|
| Przechowywanie | Trwały log (dni/tygodnie) | Usuwa po przeczytaniu |
| Wielu konsumentów | Każdy czyta niezależnie | Wiadomość = jeden konsument |
| Kolejność | Gwarantowana w partycji | Nie gwarantowana |
| Wydajność | Miliony msg/s | Tysiące msg/s |
| Replay | Tak (od dowolnego offsetu) | Nie |

## Kafka Connect — CDC (Change Data Capture)

```json
{
  "name": "postgres-source",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "database.hostname": "postgres",
    "database.dbname": "production",
    "table.include.list": "public.orders,public.customers"
  }
}
```

Każda zmiana w bazie PostgreSQL → event w Kafka → konsumenci przetwarzają na bieżąco.

## Kafka Streams — przetwarzanie w locie

```java
// Zlicz zamówienia per klient w oknie 5 minut
KStream<String, Order> orders = builder.stream("orders");
orders
    .groupByKey()
    .windowedBy(TimeWindows.of(Duration.ofMinutes(5)))
    .count()
    .toStream()
    .to("order-counts");
```

## Miejsce w Modern Data Stack

```
Source DB → Kafka (CDC) → Data Lake (S3/Delta Lake) → dbt → Data Warehouse
                ↓
         Real-time consumers (alerting, ML scoring, dashboards)
```

# 💡 Przykład zastosowania

**Realtime Data Quality Monitoring**: każda transakcja bankowa trafia do topicu Kafki `transactions`. Konsument pobiera zdarzenia i w czasie rzeczywistym sprawdza reguły DQ w [[Ataccama.md|Ataccama]] (np. kwota > 0, waluta z listy dopuszczalnych). Naruszenia trafiają do topicu `dq-violations` → alert do stewardów danych. Czas reakcji: sekundy zamiast godzin.

# 📌 Źródła

- [[Change Data Capture (CDC)]]
- [[ETL kontra ELT]]
- [[Potoki przetwarzania danych]]
- [[Apache Spark]]
- [[Data Lakehouse]]
- [[Inkrementalna synchronizacja]]

# 👽 Brudnopis
