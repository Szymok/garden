---
title: Koncepcje Inżynierii Danych (Przegląd)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: basic
language: pl
tags:
  - data-engineering
  - concepts
  - architecture
  - map
aliases:
  - Mapa Pojeć DE
  - Data Engineering Concepts
---
# 🎯 Definicja
Ten dokument to **mapa mentalna** kluczowych pojęć w nowoczesnej Inżynierii Danych. Dzieli świat danych na obszary: Architektury, Przetwarzania, Narzędzi i Metodologii. Służy jako spis treści dla bardziej szczegółowych notatek.

# 🔑 Kluczowe Obszary
1.  **Storage:** [[Data Warehouse]] (uporządkowane), [[Data Lake]] (surowe), [[Data Lakehouse]] (hybryda).
2.  **Processing:** [[ETL kontra ELT|ETL vs ELT]], Batch (wsadowe) vs Streaming (ciągłe).
3.  **Governance:** [[Data Catalog]], [[Data Quality]], [[Lineage]].
4.  **DevOps:** [[CI/CD]], [[IaC]] (Infrastructure as Code), Konteneryzacja ([[Docker]], [[Kubernetes]]).

# 📚 Szczegółowe wyjaśnienie
Trendy, które zmieniają branżę (2024+):
- **Deklaratywność:** Zamiast pisać kod "jak ładować", piszemy "co chcemy załadować" ([[dbt]], SQLMesh).
- **Data Contracts:** Traktowanie danych jako produktu z gwarancją jakości (SLA).
- **FinOps:** Optymalizacja kosztów chmury (bo Snowflake/BigQuery potrafią być drogie).

# 💡 Przykład zastosowania
Inżynier Danych projektując nowy system musi wybrać klocki z tej mapy:
"Zbudujemy **Lakehouse** (Architektura) na **S3** (Storage) używając formatu **Apache Iceberg**. Dane będziemy przetwarzać za pomocą **Spark** (Processing) w trybie **Batch**, a całość orkiestrować **Airflow**. Jakość zapewni nam **Great Expectations** (Governance)."

## 📌 Źródła
- "Fundamentals of Data Engineering".

## 👽 Brudnopis
- Ta dziedzina zmienia się bardzo szybko. To, co było standardem 5 lat temu (Hadoop), dziś jest legacy. To co jest modne dziś (DuckDB), za 5 lat może być standardem.