---

title: Delta Lake  
created: 2025-07-16  
status: Final  
category: Data Architecture  
difficulty: średniozaawansowany  
language: pl  
tags:

- delta lake
- dane hurtowniane
- lakehouse
- spark
- parquet  
aliases:
- jezioro danych delta
- delta table

---

# 🎯 Definicja

**Delta Lake** to [[warstwa przechowywania]] danych typu open-source zaprojektowana do pracy na jeziorach danych (Data Lake), która dodaje funkcjonalności [[Transakcje ACID|ACID]], versioning oraz walidację do plików przechowywanych w formacie **[[Apache Parquet]]**. Umożliwia budowanie architektur typu **[[Data Lakehouse|Lakehouse]]**, łącząc elastyczność data lake z niezawodnością hurtowni danych.

# 🔑 Kluczowe punkty

- Umożliwia operacje **[[Transakcje ACID|ACID]]** (Atomicity, Consistency, Isolation, Durability) na zbiorach danych w jeziorze.
- Przechowuje dane jako **pliki Parquet**, z dodatkowymi metadanymi śledzącymi transakcje (DeltaLog).
- Obsługuje **time travel** — zapytania do danych sprzed określonego punktu w czasie.
- Integruje się z Apache Spark, Databricks, Presto/Trino, Snowflake i innymi systemami.
- Umożliwia streaming i batch w ramach jednej tabeli (unifikacja architektury [[Architektura Lambda|lambda]] i Kappa).

# 📚 Szczegółowe wyjaśnienie

## Jak działa Delta Lake?

Delta Lake działa jako warstwa nad plikami Parquet w Data Lake (np. na S3, ADLS, GCS). Dodaje system DeltaLog z zapisami metadanych i operacji logicznych. Dzięki temu pozwala na:

- transakcyjne zapisywanie i odczyt danych,
- walidację schematu,
- rollback danych,
- aktualizacje i upsert (merge) danych.

### Przykład integracji PySpark:

```python
df.write.format("delta").mode("append").save("/mnt/raw/delta/events")
```

Odczyt:

```python
spark.read.format("delta").load("/mnt/raw/delta/events")
```

## Kluczowe funkcjonalności

|Funkcja|Opis|
|---|---|
|**[[Transakcje ACID\|ACID]] Transactions**|Gwarantuje spójność danych w warunkach współbieżnego dostępu.|
|**Upsert (MERGE)**|Możliwość aktualizacji i scalania rekordów bez pełnego nadpisu.|
|**Time Travel**|Możliwość przeglądania danych z przeszłości.|
|**Schema Enforcement**|Walidacja struktury danych przy zapisie.|
|**Unified Batch/Streaming**|Wsparcie dla danych wsadowych i strumieniowych w jednej tabeli.|

## Zastosowania praktyczne

- Budowa **[[data lakehouse]]** — połączenie elastyczności data lakes z niezawodnością DWH.
- **Zasilanie modeli [[Uczenie Maszynowe|ML]]** – uproszczony dostęp do wersjonowanych danych treningowych.
- **ETL i pipeline’y danych** – bezpieczne i spójne przetwarzanie danych wsadowych i streamingowych.
- **Obsługa danych operacyjnych** – upserty i bieżące aktualizacje np. statusów systemowych.

# 💡 Przykład zastosowania

W nowoczesnej platformie e-commerce architektura [[Data Lakehouse|Lakehouse]] oparta na Delta Lake pozwala zarówno analitykom biznesowym, jak i zespołom [[Uczenie Maszynowe|ML]], pracować na tym samym źródle danych. Logi transakcyjne są zapisywane jako strumień na bieżąco (streaming), a modele rekomendacyjne są trenowane na migawkach z tygodnia (batch). Dzięki upsertom można łatwo usuwać błędy pobrań danych przy zachowaniu spójności analitycznej.

## 📌 Źródła

- [https://delta.io/](https://delta.io/)
- [https://www.databricks.com/discover/delta-lake](https://www.databricks.com/discover/delta-lake)
- [https://docs.databricks.com/delta/index.html](https://docs.databricks.com/delta/index.html)

## 👽 Brudnopis

- Delta Lake = Parquet + metadane + log transakcji
- [[Data Lakehouse|Lakehouse]] = DataLake + [[Transakcje ACID|ACID]] + szybki SQL → unifikacja DW i [[Deep Learning|DL]]
- MERGE INTO = upsert bez kosztownego nadpisywania całych plików
- Time Travel → `VERSION AS OF` lub `TIMESTAMP AS OF`
- Zintegrowane z Spark, Databricks, [[Apache Iceberg|Iceberg]], Presto
- Alternatywy: [[Apache Hudi]], [[Apache Iceberg]]
- Rozwiązuje problem „plików jako [[Data Source|źródło danych]]” → dodaje transakcyjność i walidację schematu
- Obsługa Z-ordering, optimize, vacuum dla wydajności i czyszczenia