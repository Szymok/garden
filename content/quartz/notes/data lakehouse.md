---

title: "Data Lakehouse"  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria danych
- lakehouse
- data lake
- data warehouse
- ACID
- delta lake  
aliases:
- Lakehouse
- data lakehouse

---

# 🎯 Definicja

**Data Lakehouse** to nowoczesna architektura danych, która łączy najlepsze cechy klasycznego **Data Lake** oraz **Data Warehouse**. Umożliwia przechowywanie wszystkich typów danych (strukturalnych, półstrukturalnych i niestrukturalnych) w jednym repozytorium oraz zapewnia wsparcie dla analityki biznesowej ([[Business Intelligence|BI]]), uczenia maszynowego ([[Uczenie Maszynowe|ML]]) i pracy partycypacyjnej na danych – bez potrzeby ich duplikowania.

Lakehouse zawdzięcza swoją wydajność i spójność formatom tabel warstwowych (m.in. **[[Delta Lake]]**, **[[Apache Hudi]]**, **[[Apache Iceberg]]**), które zapewniają [[Transakcje ACID|transakcyjność]] ([[Transakcje ACID|ACID]]), time-travel, mutacje i wersjonowanie danych w środowisku data lake.

# 🔑 Kluczowe punkty

- **Łączy Data Lake i Data Warehouse**: zapewnia możliwość analizy hurtownianej na danych surowych.
- **Obsługuje [[transakcje ACID]]** w systemach plików (np. S3, ADLS, HDFS) dzięki warstwom zarządzania metadanymi i logiem.
- **Wspiera różne typy przetwarzania**: batch, streaming, interaktywne zapytania SQL, [[Uczenie Maszynowe|ML]], AI.
- **Otwarte standardy**: delta/[[Apache Iceberg|iceberg]]/[[Apache Hudi|hudi]] czynią lakehouse rozwiązaniem niezależnym od dostawców i chmurowych vendor lock-in.
- **Zoptymalizowane pod kątem kosztów**: eliminuje potrzebę dublowania danych między lake a warehouse.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Data Lakehouse?

Lakehouse opiera się na idei współdzielenia jednego źródła prawdy – dane są przechowywane w formie plików (np. Parquet) w data lake, natomiast warstwa **tabel kolumnowych z logiem transakcji** umożliwia ich modyfikację jak w relacyjnej bazie danych.

|Warstwa|Opis|
|---|---|
|Data Storage Layer|Surowe dane (parquet/[[ORC]]) przechowywane w object store|
|Metadata Layer|Katalog (np. [[Apache Hive\|Hive]] Metastore), log transakcji, wersjonowanie|
|Query Layer|Narzędzia typu Spark, Dremio, Databricks, Trino, Snowflake|
|[[Uczenie Maszynowe\|ML]] & [[Business Intelligence\|BI]] Layer|Apache Spark MLlib, [[Pandas]], TensorFlow, Power [[Business Intelligence\|BI]], Tableau|

## Popularne formaty lakehouse

|Format|[[Transakcje ACID]]|Mutacje danych|Time Travel|Kompatybilność|
|---|---|---|---|---|
|[[Delta Lake]]|✅|✅|✅|Spark, Trino, Dremio, Databricks|
|[[Apache Iceberg]]|✅|✅|✅|Spark, Flink, Trino, Presto|
|[[Apache Hudi]]|✅|✅|✅|Spark + [[Apache Hudi\|Hudi]] APIs, [[Apache Hive\|Hive]], Flink|

## Zalety lakehouse

- **Jedna platforma, wiele zastosowań**: konsolidacja danych i przetwarzania – eliminacja silo danych.
- **Koniec ETL-owania do warehouse:** analiza możliwa bezpośrednio na danych w lake.
- **Wsparcie [[Uczenie Maszynowe|AI]]/[[Uczenie Maszynowe|ML]] i SQL**: zarówno modele AI, jak i [[Narzędzia Business Intelligence|narzędzia BI]] działają na tej samej warstwie danych.
- **Zgodność z open source**: redukcja lock-in do jednego dostawcy.
- **Niższy koszt utrzymania** względem podwójnej infrastruktury [[Data Lake z magazynem|lake + warehouse]].

# 💡 Przykład zastosowania

**Databricks Lakehouse Platform**  
Firma wykorzystuje Databricks do przetwarzania strumieniowego danych clickstream, uczenia modeli rekomendacyjnych i jednoczesnego udostępniania wyników zespołowi analityków poprzez Power [[Business Intelligence|BI]]. Wszystko to dzieje się w jednym źródle danych, bez potrzeby ekstrakcji do hurtowni. Rewizje danych są wersjonowane (time-travel), a transformacje mają charakter [[Transakcje ACID|ACID]].

# 📌 Źródła

- [https://databricks.com/solutions/data-lakehouse](https://databricks.com/solutions/data-lakehouse)
- [https://lakefs.io/blog/what-is-a-data-lakehouse](https://lakefs.io/blog/what-is-a-data-lakehouse)
- [https://www.starburst.io/blog/open-lakehouse-overview/](https://www.starburst.io/blog/open-lakehouse-overview/)
- [https://www.datanami.com/2023/02/20/delta-lake-iceberg-hudi-understanding-the-pros-and-cons/](https://www.datanami.com/2023/02/20/delta-lake-iceberg-hudi-understanding-the-pros-and-cons/)
- [https://www.tableau.com/learn/whitepapers/what-is-a-data-lakehouse](https://www.tableau.com/learn/whitepapers/what-is-a-data-lakehouse)

# 👽 Brudnopis

- Lakehouse = [[Data Lake z magazynem|Lake + Warehouse]] + [[Transakcje ACID|ACID]]
- Eliminacja "data duplication", processing na jednym repozytorium
- Rolling versions, time travel, [[Ewolucja Schematu|schema evolution]]
- Delta/[[Apache Iceberg|Iceberg]]/[[Apache Hudi|Hudi]] różnią się w wsparciu dla upsert, cache, compaction
- Narzędzia: Trino, Presto, Spark, Flink, [[DuckDB]], Dremio
- Przyszłość: Query Fabric, federacja, semantyczne warstwy single-point-interaction