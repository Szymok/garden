---

title: "ORC"  
created: 2025-07-16  
status: Final  
category: Data Engineering  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- data lake
- formaty kolumnowe
- storage  
aliases:
- optimized row columnar
- orc file format
- format ORC

---

# 🎯 Definicja

**ORC (Optimized Row Columnar)** to zorientowany kolumnowo format plików zaprojektowany z myślą o wysokowydajnym przechowywaniu i przetwarzaniu danych dużej skali — zwłaszcza w ekosystemie Hadoop/[[Apache Hive|Hive]]. Format ORC został opracowany przez firmę Hortonworks i jest jednym z **najwydajniejszych sposobów zapisu danych kolumnowych** w systemach typu Big Data (np. [[Apache Hive]], Apache Spark).

# 🔑 Kluczowe punkty

- ORC to **format kolumnowy**: dane są przechowywane kolumna po kolumnie zamiast wiersz po wierszu.
- Optymalizowany pod kątem **kompresji**, **odczytu selektywnego** i ograniczenia rozmiaru danych.
- Używany najczęściej w połączeniu z [[[Apache Hive]]](https://hive.apache.org/) lub silnikami typu **Presto**, **Trino**, **Spark**.
- Przechowuje zarówno dane użytkownika, jak i metadane (statystyki, indeksy) w jednym pliku.
- Wspiera **predicate pushdown**, **compression**, i **splity danych (stripes, stripes footers, indexes)**.

# 📚 Szczegółowe wyjaśnienie

## Jak działa ORC?

Dane są podzielone na jednostki fizyczne zwane **"stripes"**, gdzie:

- Każdy stripe zawiera dane kolumnowe, indeksy i statystyki.
- Zawarte są footery i metadane globalne, dzięki czemu można wydajnie nawigować po pliku bez ładowania wszystkiego do pamięci.
- Obsługuje kompresję na poziomie kolumn, np. **Zlib**, **Snappy**, **LZO**.

## Dlaczego ORC?

|Zaleta|Opis|
|---|---|
|**Wydajność odczytu**|Tylko potrzebne kolumny są ładowane do pamięci|
|**Oszczędność miejsca**|Małe rozmiary plików dzięki kompresji kolumnowej i statystykom|
|**Indeksowanie inline**|Dane mają wbudowane indeksy dla kolumn|
|**Zgodność z [[Apache Hive\|Hive]]**|Native format dla tabel [[Apache Hive\|Hive]] i silnika LLAP|
|**Pushdowny (predicate pushdown)**|Możliwość filtrowania już na etapie odczytu pliku|

### Przykład — struktura pliku ORC:

```
| Magic | Header | Stripe 1 | Stripe 2 | ... | Footer | Postscript |
```

## ORC vs Parquet vs Avro

|Cecha|ORC|Parquet|Avro|
|---|---|---|---|
|Struktura|Kolumnowa|Kolumnowa|Wierszowa|
|Kompresja|Bardzo dobra (Zlib, Snappy)|Dobra (Snappy, Gzip)|Dobra|
|Do użytku z|[[Apache Hive\|Hive]], Spark, Trino|Spark, [[Apache Hive\|Hive]], Flink|Kafka, row-based usage|
|Indexy|Tak|Ograniczone|Brak|
|Predykaty|Tak (dobry pushdown)|Tak|Nie|

# 💡 Przykład zastosowania

Duży zbiór danych logów użytkowników przechowywany jest w Amazon S3 i przetwarzany przy pomocy [[Apache Hive]] w formacie ORC. Dzięki kompresji, indeksom i selektywnemu odczytowi kolumn zapytania SQL na miliardach rekordów są bardzo szybkie i tanie w realizacji — [[Apache Hive|Hive]] nie musi ładować milionów niepotrzebnych wierszy do pamięci.

## 📌 Źródła

- [Apache ORC format](https://orc.apache.org/)
- [[[Apache Hive|Hive]] + ORC optimizations](https://cwiki.apache.org/confluence/display/Hive/ORCFile)
- [Airbyte – Data Lake Architecture Guide](https://airbyte.com/blog/data-lake-lakehouse-guide-powered-by-table-formats-delta-lake-iceberg-hudi)
- [Comparison Parquet vs ORC](https://databricks.com/glossary/orc)

## 👽 Brudnopis

- orc = optimized row columnar, ale struktura rzeczywista → kolumnowa
- bardzo wydajny przy filtracji + zapytaniach statystycznych
- lepszy niż Parquet w [[Apache Hive|Hive]], Parquet bardziej uniwersalny dla cloud
- Stripes = bloki danych + metadane → idealne pod przetwarzanie rozproszone
- np. Spark.read.orc("path") — bezpośrednie wsparcie
- AWS Glue, Athena — bezpośrednia obsługa
- Nie wspiera wszystkich typów danych np. nested jak Parquet

---