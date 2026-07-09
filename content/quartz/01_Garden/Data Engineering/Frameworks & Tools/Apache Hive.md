---
title: Apache Hive
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - hive
  - hadoop
  - sql
  - data-warehouse
aliases:
  - HiveQL
  - Hive Metastore
---
# 🎯 Definicja
**Apache Hive** to system hurtowni danych zbudowany na szczycie Hadoopa, oferujący interfejs [[SQL|SQL]] (HiveQL) do odpytywania danych składowanych w HDFS (Distributed File System).

# 🔑 Kluczowe punkty
- **Hive Metastore (HMS):** Najważniejszy komponent, który "wie", gdzie leżą pliki i jaki mają schemat. Stał się de-facto standardem katalogu danych dla całego ekosystemu (używany przez Sparka, Presto, Trino).
- **[[SQL|SQL]]-like:** Pozwala analitykom znającym [[SQL|SQL]] pracować z Big Data bez pisania kodu Java/Scala ([[MapReduce|MapReduce]]).
- **Batch oriented:** Tradycyjnie wolny (minuty/godziny), choć nowsze wersje (LLAP) są szybsze.

# 📚 Szczegółowe wyjaśnienie
Hive powstał w Facebooku, aby ułatwić życie analitykom. Zamiast pisać pętle w Javie, piszesz `SELECT * FROM sales`.
Hive zamienia to zapytanie na serię zadań ([[MapReduce|MapReduce]] lub Tez) i wykonuje na klastrze.
Dziś Hive jako silnik wykonawczy traci na znaczeniu (na rzecz Sparka/Trino), ale **Hive Metastore** (baza metadanych) jest sercem niemal każdego [[Data Lake|Data Lake]]'a.

# 💡 Przykład zastosowania
Firma telekomunikacyjna trzyma logi połączeń (CDR) z 10 lat w plikach Parquet na HDFS/S3.
Aby znaleźć "wszystkie połączenia do Chin w 2020 roku", analityk wpisuje zapytanie w Hive. Hive sprawdza w Metastore, które pliki zawierają dane z 2020 roku (Partition Pruning), a następnie skanuje tylko te pliki.

## 📌 Źródła
- [Apache Hive Project](https://hive.apache.org/)

## 👽 Brudnopis
- "Hive is slow" - stereotyp, ale prawdziwy dla starych wersji.
- Partitioning & Bucketing - kluczowe dla wydajności.
- External Tables vs Managed Tables.