---
title: Apache Druid
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: advanced
language: pl
tags:
  - druid
  - olap
  - real-time
  - analytics
aliases:
  - Baza Druid
  - Real-time OLAP
---
# 🎯 Definicja
**Apache Druid** to wysokowydajna, rozproszona baza danych czasu rzeczywistego (Real-Time Analytics Database), zaprojektowana do błyskawicznych zapytań agregujących na dużych zbiorach danych (OLAP).

# 🔑 Kluczowe punkty
- **Sub-second queries:** Odpowiedzi na zapytania analityczne w milisekundy, nawet przy petabajtach danych.
- **Streaming Ingestion:** Natywna integracja z Kafką (czyta dane natychmiast po ich pojawieniu się).
- **Architektura:** Kolumnowy zapis, indeksowanie bitmapowe, brak pełnych transakcji (UPDATE jest trudny/niemożliwy, to append-only system).

# 📚 Szczegółowe wyjaśnienie
Druid wypełnia lukę między Hurtownią Danych (Snowflake/BigQuery - wysoki latency, duża elastyczność) a bazami Key-Value (Redis - niski latency, brak analityki).
Jest idealny do "User-Facing Analytics" – np. dashboardu dla klienta banku, który pokazuje jego wydatki z ostatnich 5 lat z podziałem na kategorie w ułamku sekundy.

Architektura:
- **Broker:** Przyjmuje zapytania.
- **Historical:** Przechowuje stare segmenty danych (Deep Storage).
- **MiddleManager:** Przyjmuje strumień na żywo.

# 💡 Przykład zastosowania
Netflix używa Druida do monitorowania jakości odtwarzania w czasie rzeczywistym. miliardy zdarzeń ("użytkownik X zatrzymał film", "buforowanie", "błąd sieci") trafiają do Kafki, a potem do Druida. Inżynierowie mogą w czasie rzeczywistym zapytać: "Pokaż mi mapę błędów sieciowych w regionie Polska z ostatnich 10 minut".

## 📌 Źródła
- [Apache Druid Homepage](https://druid.apache.org/)

## 👽 Brudnopis
- Alternatywy: ClickHouse, Pinot.
- Nie zastępuje Data Warehouse (brak złożonych JOINów, trudne usuwanie danych).
- Zapisuje dane w segmentach (Time partitioning).