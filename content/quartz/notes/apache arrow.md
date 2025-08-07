---

title: "Apache Arrow"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- ApacheArrow
- InMemoryAnalytics
- BigDataProcessing
- columnar formats  
aliases:
- arrow format
- pamięciowe przetwarzanie danych
- arrow memory model

---

# 🎯 Definicja

**Apache Arrow** to wysokowydajna, kolumnowa platforma do analiz i przetwarzania danych „w pamięci” (in-memory). Oferuje **efektywny, językowo niezależny format danych** służący do wspólnej reprezentacji, wymiany i transferu danych pomiędzy aplikacjami analitycznymi i big data — bez potrzeby ich kopiowania lub dekodowania.

# 🔑 Kluczowe punkty

- Bazuje na **formatowaniu kolumnowym** i strukturze danych zapisanych w RAM — zoptymalizowanej pod kątem nowoczesnych procesorów i CPU cache.
- Umożliwia współdzielenie danych pomiędzy językami, systemami i narzędziami (np. Python ↔ R ↔ Spark).
- Apache Arrow to **standard wymiany danych** dla wielu projektów open source (np. [[Pandas]], [[DuckDB]], Parquet, Spark, Polars).
- Eliminuje konieczność konwersji serializacji (JSON, CSV, protobuf itd.) — jedno wspólne API danych.
- Wspiera strumieniowanie danych i dostarcza zintegrowany format „zero-copy”.

# 📚 Szczegółowe wyjaśnienie

## Podstawy działania

Dane są reprezentowane jako **tabele kolumnowe** osadzone w tzw. Arrow Memory Format. Są one:

- ustandaryzowane w schemacie
- wektorowe (operacje na zestawach elementów)
- nie wymagają kopiowania do innego formatu przy przesyłaniu między narzędziami

### Główne komponenty:

- **Arrow Format** – binarny zapis danych kolumnowych w pamięci
- **Arrow Flight** – RPC do przesyłania danych strumieniowo między klientami a serwerami
- **Arrow Compute** – lokalny silnik operacji numerycznych nad kolumnami
- **Arrow IPC** – format sterowania przesyłem danych (inter-process communication)

## Przykład wykorzystania

W Pythonie korzystając z biblioteki `pyarrow`:

```python
import pyarrow as pa

# Tworzymy prostą tabelę w pamięci
data = {
    "nazwa": ["A", "B", "C"],
    "wartosc": [5, 10, 20],
}
table = pa.table(data)

# Zapis do pliku Arrow
with pa.output_stream("dane.arrow") as sink:
    with pa.RecordBatchFileWriter(sink, table.schema) as writer:
        writer.write_table(table)
```

## Zastosowania

|Obszar|Jak pomaga Apache Arrow|
|---|---|
|**Data Science (Analytics)**|Szybka integracja [[Pandas]], [[Numpy]], Polars|
|**ETL & Big Data**|Szybkie dzielenie danych pomiędzy Spark ↔ Python|
|**[[Data Lakehouse\|Lakehouse]]**|Format transportowy pomiędzy silnikami (Arrow ↔ Parquet)|
|**SQL Engines**|Używany jako backend format w [[DuckDB]], DataFusion, etc|
|**Cloud/Streaming**|Kompatybilny z Kafka, Arrow Flight, gRPC zero-copy|

## Apache Arrow vs inne formaty

|Format|Typ przechowywania|Zastosowanie|
|---|---|---|
|**Arrow**|kolumnowy (w pamięci)|wymiana, compute in-memory|
|**Parquet**|kolumnowy (na dysku)|storage + kompresja|
|**CSV / JSON**|wierszowy (tekstowy)|wymiana, czytelność|
|**[[ORC]]**|kolumnowy (na dysku)|storage w [[Apache Hive\|Hive]]|

# 💡 Przykład zastosowania

System analityczny o wysokiej częstotliwości używa Apache Arrow do pośredniczenia między silnikiem Spark a aplikacją [[Uczenie Maszynowe|ML]] w Pythonie. Dzięki temu nie trzeba eksportować danych do CSV czy JSON — wszystko działa w pamięci, w czasie rzeczywistym, przy minimalnym opóźnieniu i bez konwersji.

## 📌 Źródła

- [https://arrow.apache.org/](https://arrow.apache.org/)
- [https://arrow.apache.org/docs/python/](https://arrow.apache.org/docs/python/)
- [https://databricks.com/blog/2023/01/18/apache-arrow-columnar-memory-format](https://databricks.com/blog/2023/01/18/apache-arrow-columnar-memory-format)
- [https://www.linkedin.com/pulse/apache-arrow-vs-parquet-vs-orc-hadoop-mahaboob-pasha/](https://www.linkedin.com/pulse/apache-arrow-vs-parquet-vs-orc-hadoop-mahaboob-pasha/)

## 👽 Brudnopis

- Arrow = większa interoperacyjność p. [[Stos Danych Otwartych|open data stack]]
- Flight = RPC z transferem danych → zerokopiowy, streamingowy replacement for REST
- Zmusza do myślenia w kolumnach, nie rekordach
- staje się standardem "RAM-native format" real-time compute
- [[DuckDB]] / Polars – mają natywne wsparcie dla Arrow jako primarnego typu
- Zero-copy + stream-friendly → idealne do dużych ilości danych w locie

---