---
title: "Apache Hive"
tags:
- inżynieria danych
- ApacheHive
- DataWarehouse
- HadoopIntegration
- HiveQL
---
Apache Hive to projekt oprogramowania typu [Data Warehouse](notes/data%20warehouse.md) zbudowany na platformie [Apache Hadoop](notes/apache%20hadoop.md), który zapewnia możliwość wykonywania zapytań i analizy danych. Hive udostępnia interfejs SQL-podobny do zapytywania danych przechowywanych w różnych bazach danych i systemach plików, które integrują się z Hadoopem. Tradycyjne zapytania SQL muszą być implementowane w [MapReduce](notes/mapreduce.md) Java API, aby wykonywać aplikacje i zapytania SQL na danych rozproszonych. Hive zapewnia niezbędną abstrakcję SQL, aby zintegrować zapytania SQL-podobne ([HiveQL](https://en.wikipedia.org/wiki/Apache_Hive#HiveQL)) z podstawową warstwą Java bez konieczności implementacji zapytań w niskopoziomowym Java API.