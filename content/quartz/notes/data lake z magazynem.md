---

title: Data Lake z magazynem  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- data lake
- magazyn danych
- data warehouse
- lakehouse
- storage  
aliases:
- data lake z magazynem danych
- połączenie data lake i data warehouse
- lake + warehouse

---

# 🎯 Definicja

**Data Lake z magazynem danych (data warehouse)** to architektura hybrydowa, która łączy elastyczność i skalowalność przechowywania danych w surowej formie (Data Lake) z wydajnością i strukturą raportowania danych (Data Warehouse). Celem takiego połączenia jest optymalizacja kosztów składowania przy zachowaniu wysokiej wydajności analitycznej.

# 🔑 Kluczowe punkty

- 🔗 Łączy **Data Lake** (np. Amazon S3, Azure Data Lake) + **hurtownię danych** (np. Snowflake, BigQuery, Redshift).
- 🔄 Umożliwia **separację warstw przetwarzania** — dane surowe przechowywane są tanio, a przetwarzane i analizowane zgodnie z potrzebami.
- ⚙️ Typowe podejście w modelach **modern data stack** i architekturze Lakehouse.
- 📊 Umożliwia zaawansowaną analizę danych wykorzystując silniki SQL, ML i BI.

# 📚 Szczegółowe wyjaśnienie

## Co daje połączenie Data Lake + Data Warehouse?

|Warstwa|Zadanie|Przykład|
|---|---|---|
|**Data Lake**|Przechowywanie plików surowych (raw)|Data z IoT, API, logi w S3, ADLS|
|**Data Warehouse**|Strukturalna analiza i modelowanie danych|Obliczenia agregatów, raporty KPI|

Architektura umożliwia:

- Pobieranie i trzymanie **dużych wolumenów danych surowych** w obiektowym storage (np. pliki JSON, Parquet).
- Transformacje danych (ETL/ELT) w narzędziach takich jak: dbt, Spark, Databricks.
- Ładowanie odpowiednio przetworzonych danych do hurtowni w celu wydajnych zapytań analitycznych.

## Zalety

- ✅ **Niższy koszt składowania** dzięki tanim warstwom danych (np. S3, ADLS).
- ✅ **Wydajne zapytania** na danym zestawie – przeliczenia w warehouse (np. Redshift, BigQuery).
- ✅ **Skalowalność i elastyczność** – dane mogą być trzymane as-is, bez narzucania schematów.
- ✅ Zgodność z podejściami typu RAG (Retrieval Augmented Generation), Machine Learning, BI.

## Uwaga – wyzwania

- 🧩 Złożoność infrastruktury: różne silniki, formaty, transformacje – wzrost kosztu utrzymania.
- 🚦 Ilość kopiowanych danych może prowadzić do redundancji — konieczność wersjonowania i kontroli lineage.
- ⚠️ Potrzeba silnego data governance, katalogów danych, zgodności typów, testów jakości danych.

# 💡 Przykład zastosowania

**Wdrożenie w firmie retail:**

- Dane z kas fiskalnych i e-commerce zbierane są do AWS S3 (Data Lake).
- Spark przez EMR przetwarza dane wsadowo (batch).
- Oczyszczone i wzbogacone dane są ładowane do Snowflake.
- Dział BI korzysta z Power BI do raportowania – raporty opierają się na hurtowni.
- W przyszłości ta sama architektura umożliwia wytrenowanie modelu ML na danych z lake przy użyciu Databricks, bez potrzeby dublowania danych.

# 📌 Źródła

- [https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831](https://towardsdatascience.com/data-lake-vs-data-warehouse-vs-data-lakehouse-2b9ac5c7c831)
- [https://www.databricks.com/glossary/lakehouse](https://www.databricks.com/glossary/lakehouse)
- [https://docs.snowflake.com/](https://docs.snowflake.com/)
- [https://learn.microsoft.com/en-us/fabric/data-lake/overview](https://learn.microsoft.com/en-us/fabric/data-lake/overview)

# 👽 Brudnopis

- Architektura przejściowa między DSS a Lakehouse
- Typowe zdublowanie procesów ETL/ELT → surowe -> staging -> curated -> analytical
- Narzędzia: AWS S3 + Snowflake / Azure Data Lake + Synapse / GCS + BigQuery
- dbt, Apache Airflow, Spark, Glue, Informatica – integracje warstw
- Lakehouse = naturalna ewolucja tego podejścia – ulepszenie ACID + wersjonowanie + ML-ready