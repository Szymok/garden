---

title: "Apache Avro"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- Avro
- DataSerialization
- OpenSource
- DataExchange  
aliases:
- avro format
- serializacja avro
- ApacheAvro

---

# 🎯 Definicja

**Apache Avro** to lekki, open-source'owy system serializacji danych stworzony przez Apache Software Foundation. Umożliwia **wydajną i elastyczną wymianę danych** między różnymi językami programowania i systemami obliczeniowymi, przy zachowaniu ścisłego schematu danych (schema definition). Avro bardzo dobrze integruje się z systemami przetwarzania danych takich jak Apache Kafka, Hadoop czy Spark.

# 🔑 Kluczowe punkty

- **Zbudowany w oparciu o schemat (schema):** każde dane są powiązane z opisem struktury (metadata).
- **Kompaktowy i szybki format binarny**, ale potrafi używać także JSON do reprezentacji schematu.
- Wspiera wiele języków: Java, Python, C, C++, Go, Rust.
- Doskonale sprawdza się w systemach strumieniowych – np. Kafka + Avro + Schema Registry.
- Umożliwia **dynamiczną obsługę schematów** i ich ewolucję bez przerwy w obsłudze strumienia.

# 📚 Szczegółowe wyjaśnienie

## Cechy techniczne:

- **Wiąże dane z ich schematem** – każda porcja danych może zawierać kompletny schemat lub nagłówek wskazujący na zarejestrowany schemat.
- **Bezproblemowa serializacja i deserializacja** – niezależna od języka (cross-language).
- **[[Ewolucja schematu]] ([[Ewolucja Schematu|schema evolution]])** – można zmieniać schematy (dodawać pola, zmieniać typy) bez łamania zgodności wstecznej.
- **Brak klas generowanych kodem (jak np. w Avro vs Thrift vs Protobuf)** – działa dynamicznie.
- Optymalny rozmiar i szybkość dla Big Data i przesyłania strumieniowego.

## Przykład schematu Avro (w JSON):

```json
{
  "type": "record",
  "name": "User",
  "fields": [
    { "name": "id", "type": "int" },
    { "name": "name", "type": "string" },
    { "name": "email", "type": ["null", "string"], "default": null }
  ]
}
```

## Przykład w Pythonie (z użyciem `fastavro`):

```python
import fastavro

schema = {
    "type": "record",
    "name": "User",
    "fields": [
        {"name": "id", "type": "int"},
        {"name": "name", "type": "string"},
    ],
}

record = {"id": 1, "name": "Maria"}

with open("user.avro", "wb") as out:
    fastavro.writer(out, schema, [record])
```

## Avro vs inne formaty

|Format|Rodzaj|Schemat|Typowy use-case|
|---|---|---|---|
|**Avro**|Binarne|Tak|Kafka, Hadoop, streaming pipelines|
|**JSON**|Tekstowy|Nie|API, debugowanie|
|**Parquet**|Kolumnowy|Tak|Hurtownie danych, analizy OLAP|
|**[[ORC]]**|Kolumnowy|Tak|[[Apache Hive\|Hive]], optymalne dla dużych zapytań|
|**Protobuf/Thrift**|Binarne|Tak|RPC, komunikacja mikrousług|

## Dlaczego Avro?

- Wydajna serializacja, kompaktowe formaty wysyłkowe
- Idealny dla dużych systemów event-driven (Kafka, Pulsar)
- Bezpieczny przy rozwoju – [[ewolucja schematu]]
- Odczyt danych niezależnie od języka źródłowego

# 💡 Przykład zastosowania

Zespół wykorzystuje Apache Kafka do przyjmowania zdarzeń z aplikacji mobilnych, gdzie każde zdarzenie (log-in, zakup, sesja) kodowane jest jako Avro. Skonfigurowane Kafka Schema Registry umożliwia deserializację danych w Pythonie, Javy i SPARK bez martwienia się o zmiany schematów.

Takie podejście zapewnia spójność struktury danych, a także pozwala dynamicznie zarządzać ich ewolucją w czasie: np. dodając nowe pola bez łamania starszych konsumentów.

## 📌 Źródła

- [https://avro.apache.org/docs/current/](https://avro.apache.org/docs/current/)
- [https://docs.confluent.io/platform/current/schema-registry/index.html](https://docs.confluent.io/platform/current/schema-registry/index.html)
- [https://fastavro.readthedocs.io/en/latest/](https://fastavro.readthedocs.io/en/latest/)
- [https://developer.confluent.io/learn/kafka-avro/](https://developer.confluent.io/learn/kafka-avro/)

## 👽 Brudnopis

- Avro = "lekki Parquet dla strumieni"
- Brak schematu → seria identyfikatorów opartych o Schema Registry
- Kompatybilność schematów → critical w long-lived systems
- Wsparcie Kafka REST Endpoint z Avro
- vs Protobuf: Avro bardziej dynamiczny, schemas jako JSON
- Format preferred przez Kafka Connect, HDFS, Flink

---