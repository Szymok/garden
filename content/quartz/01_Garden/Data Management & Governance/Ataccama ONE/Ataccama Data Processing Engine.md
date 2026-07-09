---
title: Silnik Przetwarzania Danych (DPE)
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - dpe
  - processing
  - spark
  - performance
aliases:
  - Data Processing Engine
  - Ataccama DPE
---
# 🎯 Definicja
Główny komponent wykonawczy platformy [[Ataccama|Ataccama]] ONE, odpowiedzialny za realizację operacji na danych, takich jak profilowanie, uruchamianie reguł jakości danych (DQ), transformacje ETL oraz zadania MDM.

# 🔑 Kluczowe punkty
- **Skalowalność:** DPE obsługuje skalowanie horyzontalne (dodawanie węzłów) w celu zwiększenia mocy obliczeniowej.
- **[[Push-Down|Push-down]]:** DPE potrafi delegować obliczenia do zewnętrznych klastrów Big Data (Spark) lub hurtowni danych ([[Snowflake|Snowflake]], [[SQL|SQL]]) w celu optymalizacji wydajności.
- **Koordynacja:** DPE zarządza cyklem życia zadania – od pobrania konfiguracji, przez wykonanie (lokalne lub zdalne), po zapisanie wyników.

# 📚 Szczegółowe wyjaśnienie
DPE to "koń roboczy" systemu. Może działać w trybie lokalnym (wykonując obliczenia we własnej pamięci RAM) lub jako orkiestrator zlecający pracę potężniejszym systemom (Spark/Databricks).
Kluczowa jest odpowiednia alokacja zasobów (pamięć RAM, CPU) dla procesu DPE, zwłaszcza przy przetwarzaniu dużych wolumenów danych w pamięci (in-memory). Właściwa konfiguracja konektorów i etykiet (Labels) zapewnia, że DPE ma dostęp to wymaganych źródeł danych.

# 💡 Przykład zastosowania
Konfiguracja DPE do przetwarzania Spark:
Zamiast przetwarzać 10TB danych lokalnie, DPE generuje kod Spark Job, przesyła go do klastra Databricks, czeka na zakończenie i pobiera tylko wyniki (np. statystyki profilowania).

## 📌 Źródła


## 👽 Brudnopis
Data processing Engine (DPE): The workhorse for data processing. Its configuration is key to handling large datasets efficiently.
Scalability: DPE can be scaled horizontally to handle increasing data volumes. Resource Allocation - Cluster side: Make sure memory is scaled appropriately. The DPE configuration can also be key. Configuration: You must edit your Data Processing Engine (DPE) so that it can access and modify data. Job Submission: The DPE submits [[Data Quality|data quality]] tasks ([[Profiling|profiling]], rule execution) to the Big Data cluster (e.g., Spark, [[Snowflake|Snowflake]]). Coordination: The DPE coordinates the overall process, from spark to snowsql executions. Constraints: DPE labels help route jobs to particular DPEs based on [[Data Source|data source]] location or cluster type.