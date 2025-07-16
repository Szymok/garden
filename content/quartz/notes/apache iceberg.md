---

title: "Apache Iceberg"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- ApacheIceberg
- DataLakeFormat
- Netflix
- OpenSource
- ApacheIncubator  
aliases:
- iceberg
- format tabel iceberg
- Apache Iceberg project

---

# 🎯 Definicja

**Apache Iceberg** to nowoczesny, rozproszony format tabelowy dla jezior danych (Data Lakes), zaprojektowany z myślą o obsłudze ogromnych tabel w środowiskach big data (petabajtów danych, miliardów plików). Pozwala pracować z danymi w sposób spójny, transakcyjny i zgodny z paradygmatami Spark/Flink/Trino, ułatwiając budowę architektury typu **Lakehouse**.

Iceberg został opracowany przez Netflix, aby przezwyciężyć ograniczenia tradycyjnych tabel Hive, i od 2020 r. jest pełnoprawnym projektem Apache.

# 🔑 Kluczowe cechy

- ✨ Obsługuje w pełni **ACID**, **time travel**, **upsert/delete**, **schema evolution**
- 📦 Format **niezależny od silnika i języka** – integruje się z Spark, Flink, Trino, Dremio, Hive
- 📄 Pracuje na popularnych formatach danych: Parquet, ORC, Avro
- 📈 Wspiera **snapshot-based querying**, **versioned data**, **metadata caching**
- 🧊 Używany przez liderów branży (Netflix, Apple, Expedia, Adobe, Stripe)

# 📚 Szczegółowe wyjaśnienie

## Jak działa Apache Iceberg?

Iceberg przechowuje dane w warstwie storage (np. S3, GCS, HDFS) w formacie kolumnowym (Parquet, Avro), a dodatkowo tworzy warstwę metadanych:

- **manifesty**: listy plików danych należących do snapshotów
- **snapshoty**: punkty w czasie — każda zmiana (insert, delete, update) tworzy nowy snapshot
- **metadata.json**: szczegóły dotyczące całej tabeli, schematu, partycjonowania
- **history**: dziennik przeszłych snapshotów – baza do time-travel

Zmiana danych (insert, delete, update) nie nadpisuje plików, tylko tworzy **nowe snapshoty**, które są odczytywane w momencie zapytania.

## Obsługa przez silniki

Iceberg wspiera wiele rozwiązań analitycznych i streamowych:

|Silnik|Wsparcie Iceberg|
|---|---|
|Apache Spark|✅ Pełna integracja (Spark 3.1+)|
|Apache Flink|✅ Streaming i batch|
|Trino|✅ SQL query directly over Iceberg|
|Dremio|✅ GUI + optymalizacje|
|AWS Glue / Athena|✅ read-only|
|Hive, Impala|częściowe/wsparcie zależne od wersji|

### Przykład użycia (Spark SQL):

```sql
CREATE TABLE iceberg_sales (
  id BIGINT,
  value STRING,
  date DATE
)
USING iceberg
PARTITIONED BY (date)
LOCATION 's3://dataset/sales/iceberg_table';
```

## Iceberg vs Delta Lake vs Hudi

|Cecha|Iceberg|Delta Lake|Hudi|
|---|---|---|---|
|ACID|✅|✅|✅|
|Time Travel|✅|✅|✅|
|Zoptymalizowany dla|OLAP|Spark-centric ETL|Write-heavy / streaming|
|Multi-engine (Silniki)|Spark, Trino, Flink|głównie Spark|Spark, Flink|
|Format pliku|Parquet (ew. Avro)|Parquet|Parquet + log files|
|Metadata table catalog|✅ (REST, Hive, Glue)|❌ (własny Delta Log)|Hive-centric|
|Copy-on-write / MOR|Snapshot-based|COW|COW/MOR|
|Partition Evolution|✅ (elastyczne)|❌ (statyczne)|❌ (manualne)|

# 💡 Przykład zastosowania

Firma streamingowa przechowuje histogramy sesji w tabeli Iceberg na S3. Dzięki obsłudze snapshotów i time-travel mogą analizować dane dzienne z ostatniego tygodnia oraz porównać je ze stanem sprzed 24h — bez potrzeby tworzenia oddzielnych tabel.

Zapytania OLAP są efektywne, bo tylko nowe pliki snapshotu są skanowane, a katalog metadanych umożliwia pre-filtering plików po timestampach.

# 📌 Źródła

- [https://iceberg.apache.org/](https://iceberg.apache.org/)
- [https://github.com/apache/iceberg](https://github.com/apache/iceberg)
- Blog Netflix: [https://netflixtechblog.com/building-iceberg-a-table-format-for-huge-analytic-datasets-9aa8f75e1977](https://netflixtechblog.com/building-iceberg-a-table-format-for-huge-analytic-datasets-9aa8f75e1977)
- [https://docs.databricks.com/ingestion/auto-loader/iceberg.html](https://docs.databricks.com/ingestion/auto-loader/iceberg.html)
- [https://medium.com/expedia-group-tech/a-short-introduction-to-apache-iceberg-d34f628b6799](https://medium.com/expedia-group-tech/a-short-introduction-to-apache-iceberg-d34f628b6799)

## 👽 Brudnopis

- Iceberg = ACID + snapshot + reads on petabyte scale
- Control plane: metadane poza storage → odczyt szybki
- Snapshot-based ≠ log-based (jak w Hudi)
- Dowolne partycjonowanie – dynamiczne, ewoluujące
- Metastore: Hive Metastore, AWS Glue, REST Catalog
- Doskonałe do federacyjnych zapytań: Trino → Iceberg na S3
- “Format tabel RDF dla Lakehouse” = most między DWH i DL

---