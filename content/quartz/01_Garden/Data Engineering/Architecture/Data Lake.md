---

title: "Data Lake"  
created: 2025-07-16  
status: 🌱 draft
category: inÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- przechowywanie danych
- big data
- data lake  
aliases:
- Data Lake
- jezioro danych


---

# ðŸŽ¯ Definicja

**Data Lake** to skalowalne, elastyczne repozytorium danych sÅ‚uÅ¼Ä…ce do przechowywania masowych iloÅ›ci danych w oryginalnym, niesformatowanym (tzw. surowym) stanie â€” zarÃ³wno strukturalnych, pÃ³Å‚strukturalnych, jak i niestrukturalnych. W odrÃ³Å¼nieniu od klasycznych hurtowni danych (Data Warehouse), dane w Data Lake trafiajÄ… bez zdefiniowanego celu analitycznego, co umoÅ¼liwia ich pÃ³Åºniejsze przetwarzanie, transformacjÄ™ i analizÄ™ w rÃ³Å¼nych kontekstach biznesowych.

# ðŸ”‘ Kluczowe punkty

- **Przechowuje dane w dowolnym formacie**: CSV, JSON, XML, obrazy, logi, dokumenty, pliki binarne â€” zarÃ³wno strukturalne, jak i niestrukturalne.
- **Zasada "najpierw przechowuj, potem modeluj" (schema-on-read):** dane Å‚adowane sÄ… bez wstÄ™pnej transformacji; transformacja nastÄ™puje dopiero na etapie analizy.
- **Zbudowane na systemach rozproszonych** â€” np. Hadoop HDFS, Amazon S3, Azure Data Lake Storage.
- **ObsÅ‚uguje rÃ³Å¼ne cele**: analityka, przetwarzanie strumieniowe (streaming), uczenie maszynowe, analiza logÃ³w, integracja danych w czasie rzeczywistym.
- **Niska cena przechowywania duÅ¼ych wolumenÃ³w danych.**

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## GÅ‚Ã³wne cechy Data Lake

|Cecha|Opis|
|---|---|
|Typy danych|Strukturalne, pÃ³Å‚strukturalne, niestrukturalne|
|Format przechowywania|Surowy (raw); bez obowiÄ…zkowego schematu|
|Integracja|W peÅ‚ni integruje siÄ™ z hurtowniami danych, systemami AI/ML, BI|
|Koszty|Stosunkowo niskie wzglÄ™dem klasycznych baz danych|
|Struktura dostÄ™pu|MoÅ¼liwa analiza ad hoc, ELT, przetwarzanie wsadowe lub w czasie rzeczywistym|
|SkalowalnoÅ›Ä‡|Praktycznie nieograniczona w chmurze i systemach distributed|

## Typowe komponenty Data Lake

- **Storage layer** (np. Amazon S3, Azure Data Lake Storage Gen2, HDFS)
- **Ingestion layer** (np. Kafka, Flume, Nifi)
- **Catalog/Metadata layer** (np. Apache Hive, AWS Glue, DataHub)
- **Processing layer** (np. Apache Spark, Flink, Presto, Athena)
- **Access/Consumption layer** (np. Jupyter, SQL clients, BI Tools)

## PrzykÅ‚ady zastosowania

- **Utrwalanie surowych danych aplikacyjnych i systemowych** do pÃ³Åºniejszej analizy (np. logi ze stron internetowych)
- **Integracja danych z wielu ÅºrÃ³deÅ‚** (IoT, klikniÄ™cia, media spoÅ‚ecznoÅ›ciowe, CRM)
- **Data Science i uczenie maszynowe** â€” Data Lake to elastyczne ÅºrÃ³dÅ‚o danych do feature engineering
- **Audyt i compliance** â€” przechowywanie nieprzetworzonych danych pozwala na ich ponowne wykorzystanie bez utraty kontekstu

## Data Lake vs Data Warehouse

|Cechy|Data Lake|Data Warehouse|
|---|---|---|
|Schemat|Schemat przy odczycie (schema-on-read)|Schemat przy zapisie (schema-on-write)|
|Typ danych|Dowolne (strukturalne i nie)|GÅ‚Ã³wnie strukturalne|
|Koszty|Niski koszt przechowywania|WyÅ¼sze koszty przechowywania|
|Cel przechowywania|MoÅ¼liwe przyszÅ‚e wykorzystanie|Konkretne raportowanie / zapytania biznesowe|
|WydajnoÅ›Ä‡ zapytaÅ„|NiÅ¼sza, wymaga optymalizacji|Wysoka (przy dobrze zdefiniowanym schemacie)|
|Najlepsze zastosowanie|AI/ML, eksploracja danych|BI, raportowanie operacyjne|

# ðŸ’¡ WskazÃ³wka praktyczna

Data Lake jest czÄ™sto uÅ¼ywane jako â€žwarstwa brudnaâ€ (raw layer) w nowoczesnych platformach typu **Data Lakehouse** lub **Modern Data Stack**, w ktÃ³rych dane sÄ… najpierw przechowywane w niestrukturalnej formie, a nastÄ™pnie przeksztaÅ‚cane i Å‚adowane do hurtowni danych lub poddawane analizie modelami ML.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [Hortonworks Data Lake Whitepaper (2014)](http://hortonworks.com/wp-content/uploads/2014/05/TeradataHortonworks_Datalake_White-Paper_20140410.pdf)
- [https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/](https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/)
- [https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/](https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/)
- [https://www.databricks.com/solutions/data-lakes](https://www.databricks.com/solutions/data-lakes)
- [https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831](https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831)

# ðŸ‘½ Brudnopis

- Data Lake jako pierwszy punkt kontaktu danych â€” ingest â†’ storage â†’ processing
- Format: Avro, Parquet, JSON, CSV, logi, binaria
- Analityka AI/ML: LLM zasilane przez wektorowe wyszukiwanie w Data Lake
- Proces ETL/ELT moÅ¼e startowaÄ‡ z Data Lake
- Zasada dziaÅ‚ania: write once, read many â€” dane czasem nigdy nie sÄ… w peÅ‚ni przetwarzane, ale muszÄ… byÄ‡ dostÄ™pne
- LÄ…dujÄ… tam dane z API, IoT, clickstream, SAP, media, DB i plikÃ³w Excel