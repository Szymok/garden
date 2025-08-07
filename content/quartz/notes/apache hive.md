---

title: "Apache Hive"  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria danych
- ApacheHive
- DataWarehouse
- HadoopIntegration
- HiveQL  
aliases:
- Hive
- Apache Hive

---

# 🎯 Definicja

**Apache Hive** to open-source’owy system hurtowni danych (Data Warehouse) działający na platformie Apache Hadoop, który umożliwia wykonywanie zapytań analitycznych przy użyciu deklaratywnego języka HiveQL — podobnego do SQL. Hive zapewnia warstwę abstrakcji nad Hadoop MapReduce i pozwala użytkownikom, bez znajomości Javy i MapReduce, efektywnie analizować duże zbiory danych rozproszonych.

# 🔑 Kluczowe punkty

- **SQL podobny język zapytań (HiveQL):** umożliwia analitykom i inżynierom danych przetwarzanie danych bez konieczności pisania kodu MapReduce.
- **Działa na Hadoop Distributed File System (HDFS):** integruje się bezpośrednio z ekosystemem Hadoop.
- **Obsługuje hurtownie danych Big Data:** zapewnia możliwość przechowywania i analizy petabajtów danych.
- **Zoptymalizowane pod kątem wsadowego przetwarzania danych:** sprawdza się w dużej skali, ale nie jest idealne dla zastosowań wymagających niskich opóźnień (np. OLTP).
- **Może działać z alternatywnymi silnikami przetwarzania:** Apache Tez, Apache Spark, sam Hadoop MapReduce.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Apache Hive?

Hive interpretuje zapytania SQL-podobne (HiveQL) i tłumaczy je na zadania MapReduce (lub inne silniki, np. Tez, Spark), które następnie przetwarzają dane rozproszone w klastrze Hadoop.

### Architektura:

|Komponent|Opis|
|---|---|
|Metastore|Przechowuje definicje tabel, schematy, lokalizacje plików, statystyki|
|Driver|Obsługuje sesję, zarządza cyklem życia zapytania|
|Compiler|Kompiluje HiveQL do DAG zadań przetwarzających|
|Execution Engine|Uruchamia wygenerowane zadania za pomocą MapReduce, Tez lub Spark|
|CLI / UI / API|Interfejs użytkownika do wprowadzania zapytań|

## HiveQL – język zapytań

Język podobny do SQL (inspirowany standardem ANSI SQL), z rozszerzeniami dla pracy na plikach, partycjach, strukturach zagnieżdżonych i klasach danych typowych dla Hadoop/HDFS.

```sql
SELECT customer_id, COUNT(*) 
FROM sales 
WHERE country = 'Polska' 
GROUP BY customer_id;
```

## Przykłady zastosowań

- **Analityka wsadowa na dużych wolumenach danych** — [[analiza danych]] logów użytkowników, przetwarzanie danych IoT, raportowanie marketingowe.
- **ETL (Extract, Transform, Load):** partiowe ładowanie i przekształcanie danych do Data Lake lub innych warstw analitycznych.
- **Kompatybilność z narzędziami [[Business Intelligence|BI]]** — takie jak Tableau, Qlik poprzez konektory JDBC/ODBC.

# 💡 Praktyczny przypadek użycia

**Firma e-commerce analizuje dane kliknięć klientów (clickstream):**

- Surowe dane z loggerów użytkowników trafiają do HDFS.
- Apache Hive pozwala zespołowi analitycznemu zadawać zapytania w HiveQL, aby agregować dane wg sesji, źródła ruchu, produktów.
- Wyniki są zapisane do tabel partycjonowanych (np. per dzień) i udostępniane dalej do hurtowni danych lub dashboardów.

# 📌 Źródła

- [Apache Hive – Strona projektu](https://hive.apache.org/)
- [Wikipedia: Apache Hive](https://en.wikipedia.org/wiki/Apache_Hive)
- [HiveQL Overview](https://cwiki.apache.org/confluence/display/Hive/LanguageManual)
- [https://databricks.com/glossary/apache-hive](https://databricks.com/glossary/apache-hive)
- [https://aws.amazon.com/emr/features/hive/](https://aws.amazon.com/emr/features/hive/)

# 👽 Brudnopis

- Hive = alternatywa dla klasycznych DWH w ekosystemie Hadoop.
- Format danych: najczęściej Parquet, [[ORC]], tekst (csv, tsv).
- Użycie Metastore (często współdzielony z Hive, Spark, Presto, Trino).
- Popularny jako katalog w [[Data Lakehouse|lakehouse]] (wraz z [[Apache Iceberg|Iceberg]], Delta etc.).
- Tez/Spark jako silniki – poprawa czasu odpowiedzi względem MapReduce.
- Brak update/delete w klasycznym Hadoop -> obsługiwane przez custom storage formats ([[Transakcje ACID|ACID]] extensions).