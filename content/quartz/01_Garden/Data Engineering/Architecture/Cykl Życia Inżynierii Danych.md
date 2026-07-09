---
title: Cykl Życia Inżynierii Danych (Data Engineering Lifecycle)
created: 2026-02-04
status: evergreen
category: Data Engineering/Theory
difficulty: intermediate
language: pl
tags:
  - data-lifecycle
  - ingestion
  - transformation
  - serving
  - architecture
aliases:
  - Data Engineering Lifecycle
  - DE Lifecycle
  - Cykl życia danych
---
# 🎯 Definicja
**Cykl Życia Inżynierii Danych** to kompleksowy proces zarządzania danymi od momentu ich powstania do momentu ich zużycia (przez analityków, AI lub aplikacje). Obejmuje 5 głównych etapów: **Generowanie, Pobieranie (Ingestion), Przechowywanie (Storage), Przetwarzanie (Transformation) i Udostępnianie (Serving)**. Wszystko to spinają klamry: Zarządzanie (Governance), Jakość (DQ) i Obserwowalność (Observability).

# 🔑 Kluczowe punkty
- **Nie jest liniowy:** To często pętla. Dane wynikowe z jednego procesu stają się źródłem dla kolejnego.
- **Undercurrents:** Joe Reis (autor "Fundamentals of Data Engineering") definiuje "prądy podskórne", które muszą działać na każdym etapie: Security, [[Data Management|Data Management]], [[DataOps|DataOps]], Data Architecture, Software Engineering, Orchestration.
- **Cel:** Celem nie jest "posiadanie danych", tylko "dostarczenie wartości" na końcu cyklu (Serving).

# 📚 Szczegółowe wyjaśnienie
1. **Ingestion:** Pobranie danych. Batch (raz dziennie) vs Streaming (real-time). Narzędzia: Fivetran, [[Airbyte|Airbyte]], Kafka.
2. **Storage:** Gdzie to trzymamy? [[Data Lake|Data Lake]] (S3), [[Data Warehouse|Data Warehouse]] ([[Snowflake|Snowflake]]), Lakehouse.
3. **Transformation:** Robienie sensu z surowych danych. Czyszczenie, łączenie, agregacja. Narzędzia: [[dbt|dbt]], Spark, [[SQL|SQL]].
4. **Serving:** Wystawienie danych dla odbiorcy. Dashboard (BI), API (Reverse ETL), Feature Store (ML).

# 💡 Przykład zastosowania
Aplikacja Uber.
1. **Generation:** Aplikacja generuje zdarzenie "Zamówiono przejazd".
2. **Ingestion:** Kafka przesyła zdarzenie w czasie rzeczywistym.
3. **Storage:** Dane lądują w [[Data Lake|Data Lake]] (archiwum) i w bazie operacyjnej (bieżące).
4. **Transformation:** System oblicza cenę dynamiczną (Surge Pricing) na podstawie popytu.
5. **Serving:** Aplikacja kierowcy dostaje powiadomienie z ceną. Analityk dostaje raport dobowy.

## 📌 Źródła
- Joe Reis & Matt Housley, "Fundamentals of Data Engineering".

## 👽 Brudnopis
- Garbage In, Garbage Out (GIGO) - jeśli Ingestion wpuści śmieci, Serving wypluje śmieci. Dlatego [[Data Quality|Data Quality]] jest kluczowe na wejściu.
- FinOps - inżynier musi dbać o koszty chmury na każdym etapie (szczególnie Storage i Compute podczas transformacji).