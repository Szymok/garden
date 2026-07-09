---

title: "Data Lake"  
created: 2025-07-16  
status: 🌱 draft
category: inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- przechowywanie danych
- big data
- data lake  
aliases:
- Data Lake
- jezioro danych


---

# 🎯 Definicja

**Data Lake** to skalowalne, elastyczne repozytorium danych służące do przechowywania masowych ilości danych w oryginalnym, niesformatowanym (tzw. surowym) stanie — zarówno strukturalnych, półstrukturalnych, jak i niestrukturalnych. W odróżnieniu od klasycznych hurtowni danych ([[Data Warehouse|Data Warehouse]]), dane w Data Lake trafiają bez zdefiniowanego celu analitycznego, co umożliwia ich późniejsze przetwarzanie, transformację i analizę w różnych kontekstach biznesowych.

# 🔑 Kluczowe punkty

- **Przechowuje dane w dowolnym formacie**: CSV, JSON, XML, obrazy, logi, dokumenty, pliki binarne — zarówno strukturalne, jak i niestrukturalne.
- **Zasada "najpierw przechowuj, potem modeluj" (schema-on-read):** dane ładowane są bez wstępnej transformacji; transformacja następuje dopiero na etapie analizy.
- **Zbudowane na systemach rozproszonych** — np. Hadoop HDFS, Amazon S3, Azure Data Lake Storage.
- **Obsługuje różne cele**: analityka, przetwarzanie strumieniowe (streaming), [[Uczenie Maszynowe|uczenie maszynowe]], analiza logów, [[Integracja Danych|integracja danych]] w czasie rzeczywistym.
- **Niska cena przechowywania dużych wolumenów danych.**

# 📚 Szczegółowe wyjaśnienie

## Główne cechy Data Lake

|Cecha|Opis|
|---|---|
|Typy danych|Strukturalne, półstrukturalne, niestrukturalne|
|Format przechowywania|Surowy (raw); bez obowiązkowego schematu|
|Integracja|W pełni integruje się z hurtowniami danych, systemami AI/ML, BI|
|Koszty|Stosunkowo niskie względem klasycznych baz danych|
|Struktura dostępu|Możliwa analiza ad hoc, ELT, przetwarzanie wsadowe lub w czasie rzeczywistym|
|Skalowalność|Praktycznie nieograniczona w chmurze i systemach distributed|

## Typowe komponenty Data Lake

- **[[Storage Layer|Storage layer]]** (np. Amazon S3, Azure Data Lake Storage Gen2, HDFS)
- **Ingestion layer** (np. Kafka, Flume, Nifi)
- **Catalog/[[Metadata|Metadata]] layer** (np. [[Apache Hive|Apache Hive]], AWS Glue, DataHub)
- **Processing layer** (np. [[Apache Spark|Apache Spark]], Flink, Presto, Athena)
- **Access/Consumption layer** (np. Jupyter, [[SQL|SQL]] clients, BI Tools)

## Przykłady zastosowania

- **Utrwalanie surowych danych aplikacyjnych i systemowych** do późniejszej analizy (np. logi ze stron internetowych)
- **[[Integracja Danych|Integracja danych]] z wielu źródeł** (IoT, kliknięcia, media społecznościowe, CRM)
- **Data Science i [[Uczenie Maszynowe|uczenie maszynowe]]** — Data Lake to elastyczne źródło danych do feature engineering
- **Audyt i compliance** — przechowywanie nieprzetworzonych danych pozwala na ich ponowne wykorzystanie bez utraty kontekstu

## Data Lake vs [[Data Warehouse|Data Warehouse]]

|Cechy|Data Lake|[[Data Warehouse|Data Warehouse]]|
|---|---|---|
|Schemat|Schemat przy odczycie (schema-on-read)|Schemat przy zapisie (schema-on-write)|
|Typ danych|Dowolne (strukturalne i nie)|Głównie strukturalne|
|Koszty|Niski koszt przechowywania|Wyższe koszty przechowywania|
|Cel przechowywania|Możliwe przyszłe wykorzystanie|Konkretne raportowanie / zapytania biznesowe|
|Wydajność zapytań|Niższa, wymaga optymalizacji|Wysoka (przy dobrze zdefiniowanym schemacie)|
|Najlepsze zastosowanie|AI/ML, eksploracja danych|BI, raportowanie operacyjne|

# 💡 Wskazówka praktyczna

Data Lake jest często używane jako „warstwa brudna” (raw layer) w nowoczesnych platformach typu **[[Data Lakehouse|Data Lakehouse]]** lub **Modern Data Stack**, w których dane są najpierw przechowywane w niestrukturalnej formie, a następnie przekształcane i ładowane do hurtowni danych lub poddawane analizie modelami ML.

# 📌 Źródła

- [Hortonworks Data Lake Whitepaper (2014)](http://hortonworks.com/wp-content/uploads/2014/05/TeradataHortonworks_Datalake_White-Paper_20140410.pdf)
- [https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/](https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/)
- [https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/](https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/)
- [https://www.databricks.com/solutions/data-lakes](https://www.databricks.com/solutions/data-lakes)
- [https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831](https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831)

# 👽 Brudnopis

- Data Lake jako pierwszy punkt kontaktu danych — ingest → storage → processing
- Format: Avro, Parquet, JSON, CSV, logi, binaria
- Analityka AI/ML: LLM zasilane przez wektorowe wyszukiwanie w Data Lake
- Proces ETL/ELT może startować z Data Lake
- Zasada działania: write once, read many — dane czasem nigdy nie są w pełni przetwarzane, ale muszą być dostępne
- Lądują tam dane z API, IoT, clickstream, SAP, media, DB i plików Excel