---

title: Potoki przetwarzania danych  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data pipelines
- ETL
- przetwarzanie danych  
aliases:
- data pipelines
- pipelines danych
- potoki danych

---

# 🎯 Definicja

**Potoki przetwarzania danych** (ang. _data pipelines_) to zorganizowane zbiory kroków przetwarzania, które automatyzują przepływ danych — od momentu ich pozyskania (sources), poprzez transformację, aż po zapis w docelowym systemie (sink), takim jak hurtownia danych, system raportowania lub magazyn danych analitycznych.

# 🔑 Kluczowe punkty

- Potoki automatyzują procesy **ekstrakcji (E)**, **transformacji (T)** i **ładownia danych (L)** – klasyczne **ETL** lub nowoczesne **ELT**.
- Składają się z wielu etapów (steps/stages), które mogą działać synchronicznie, asynchronicznie lub strumieniowo.
- Mogą działać wsadowo (batch) lub w czasie rzeczywistym (streaming).
- Zarządzane za pomocą **orkiestratorów**: Airflow, Dagster, Prefect.
- Stanowią trzon każdej nowoczesnej platformy danych i umożliwiają zasilanie downstream: BI, ML, dashboardów, raportów.

# 📚 Szczegółowe wyjaśnienie

## Typowa struktura potoku danych

1. **Źródło danych (data source):**  
    Bazy danych OLTP, API, pliki CSV, IoT, media społecznościowe.
    
2. **Ingestion (pobieranie):**  
    Narzędzia typu Airbyte, Fivetran, Kafka zbierają dane w surowej postaci.
    
3. **Transformacja (data transformation):**  
    Przetwarzanie, oczyszczanie, standaryzacja, łączenie źródeł (np. przez dbt, Spark, SQL).
    
4. **Ładowanie (loading/sink):**  
    Zapis do systemów typu Snowflake, BigQuery, Redshift, S3, Delta Lake, Elasticsearch.
    
5. **Monitorowanie (observability):**  
    Walidacja jakości, alerty (testy: null check, expect range), logowanie run'ów.
    

## Rodzaje potoków

|Typ|Opis|
|---|---|
|**ETL**|Transformacja odbywa się przed załadunkiem do celu (transformacja „w locie”)|
|**ELT**|Ładowanie następuje przed transformacją, najczęściej w hurtowni danych|
|**Streaming**|Obsługa danych w czasie rzeczywistym (np. Kafka → Flink/Spark)|
|**Batch**|Przetwarzanie cykliczne, dużymi porcjami|

## Kluczowe cechy dobrze zaprojektowanego potoku

- **Idempotentność** – ponowne wykonanie nie zmienia systemu.
- **Retry / Failure isolation** – odporność na błędy danego kroku.
- **Logowanie i audyt** – obserwowalność każdego etapu runu.
- **Skalowalność** – pozioma i automatyczna.
- **Modularność** – możliwość ponownego użycia komponentów.

# 💡 Przykład zastosowania

Zespół danych w firmie e-commerce tworzy potok danych, który codziennie:

1. Pobiera dane z PostgreSQL i API reklamowego (Airbyte).
2. Ładuje je do hurtowni BigQuery.
3. Transformuje dane zamówień i sesji użytkownika do modelu wymiarowego (dbt).
4. Udostępnia dane analitykom w Lookerze i automatyzuje alerty w przypadku błędnych danych.

## 📌 Źródła

- [https://docs.getdbt.com/docs/build/data-pipelines](https://docs.getdbt.com/docs/build/data-pipelines)
- [https://airflow.apache.org/](https://airflow.apache.org/)
- [https://www.datacamp.com/tutorial/data-pipelines-with-python](https://www.datacamp.com/tutorial/data-pipelines-with-python)
- [https://airbyte.com/blog/what-is-a-data-pipeline](https://airbyte.com/blog/what-is-a-data-pipeline)

## 👽 Brudnopis

- data pipelines = plumbing dla informacji
- różnica: ETL → transformacja wcześniej, ELT → na poziomie hurtowni
- potoki są nadrzędne nad taskami / dagami – model systemowy
- ważne dla ML (data ingestion + features + retraining) i analityki
- orchestration ≠ ingestion ≠ transformation – rozdzielone komponenty
- narzędzia: Airbyte, dbt, Spark, Airflow, Dagster, Fivetran, Prefect
- testy danych: Great Expectations, elementary, soda
- context-aware pipelines → dynamic DAG (np. per client, per date)

---