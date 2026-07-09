---

title: Przetwarzanie danych  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data processing
- ETL
- transformacje danych  
aliases:
- data processing
- pipeline danych

---

# 🎯 Definicja

**Przetwarzanie danych** to ogólny termin opisujący wszelkie operacje wykonywane na danych w celu ich transformacji, uporządkowania, analizy lub przygotowania do dalszego użycia. Może obejmować czynności takie jak konwersja formatów, czyszczenie, łączenie danych, agregowanie wartości, filtrowanie, wzbogacanie lub analitykę.

# 🔑 Kluczowe punkty

- Proces konieczny do przekształcenia surowych danych w **wartościowe informacje**.
- Może odbywać się w trybie **wsadowym (batch)** lub **strumieniowym (real-time/streaming)**.
- Zwykle część większego systemu typu **ETL**, **ELT**, **potok danych** lub **platforma danych**.
- Przetwarzane mogą być dane ustrukturyzowane (np. [[Bazy danych|bazy danych]]), półustrukturyzowane (np. JSON) lub nieustrukturyzowane (np. logi, media).
- Codziennie przetwarzają dane systemy takie jak: Spark, Flink, Beam, [[SQL|SQL]], [[dbt|dbt]], [[Pandas|Pandas]], Airflow.

# 📚 Szczegółowe wyjaśnienie

## Typowe etapy przetwarzania danych

1. **Pobieranie danych** – z plików, API, baz danych, sensorów.
2. **Weryfikacja / czyszczenie (data cleaning)** – usuwanie duplikatów, nulli, normalizacja wartości.
3. **Transformacja** – np. pivot, zmiana typów, scalanie tabel, funkcje analityczne.
4. **Agregacja lub obliczenia** – wyliczanie sum, średnich, median itp.
5. **Eksport / zapis** – do hurtowni danych, dashboardu lub silnika analitycznego.

## Sposoby realizacji

|Tryb|Opis|
|---|---|
|**Batch**|Dane przetwarzane okresowo (np. raz dziennie)|
|**Streaming**|Dane przetwarzane na bieżąco (np. z IoT, logów)|
|**Near-real time**|Opóźnienie sekund-minutowe, np. w analizie clickstreamu|
|**On-demand**|Na żądanie, przetwarzanie przez API lub trigger|

## Narzędzia i technologie

- **Języki przetwarzania danych**: [[SQL|SQL]], Python ([[Pandas|pandas]]), Scala
- **Silniki:** [[Apache Spark|Apache Spark]], Apache Flink, Apache Beam, Trino, BigQuery
- **Orkiestracja:** [[Apache Airflow|Apache Airflow]], Prefect, [[Dagster|Dagster]]
- **Transformacje analityczne:** [[dbt|dbt]]
- **ETL/ELT:** [[Airbyte|Airbyte]], Fivetran, Talend
- **Przetwarzanie lokalne:** [[Pandas|Pandas]], Dask

# 💡 Przykład zastosowania

Dane sprzedażowe z aplikacji mobilnej są pobierane co godzina z systemu transakcyjnego i przesyłane do potoku przetwarzania w [[Apache Spark|Apache Spark]]. Potok wykonuje:

- konwersję dat,
- czyszczenie rekordów,
- łączenie z danymi o kampaniach marketingowych,
- agregację przychodów wg kraju.  
    Wynik trafia do tabel w BigQuery, gdzie analitycy mogą budować dashboardy.

## 📌 Źródła

- [https://datacamp.com/tutorial/data-processing-pipeline](https://datacamp.com/tutorial/data-processing-pipeline)
- [https://cloud.google.com/architecture/data-processing-architecture](https://cloud.google.com/architecture/data-processing-architecture)
- [https://towardsdatascience.com/introduction-to-data-processing-pipelines-75f4d32aa3bf](https://towardsdatascience.com/introduction-to-data-processing-pipelines-75f4d32aa3bf)
- [https://www.ibm.com/cloud/learn/data-processing](https://www.ibm.com/cloud/learn/data-processing)

## 👽 Brudnopis

- Przetwarzanie = ETL ≈ ELT ≈ orchestration (pojęcia nakładają się)
- Batch = tańsze, bardziej stabilne; streaming = realtime, trudniejszy w debugowaniu
- [[Pandas|Pandas]] = lokalne przetwarzanie, Spark = rozproszone
- Potok = wiele kroków transformacji danych, źródło do celu
- Warto znać różnicę: przetwarzanie danych ≠ [[Analiza Danych|analiza danych]] (etap późniejszy)

---