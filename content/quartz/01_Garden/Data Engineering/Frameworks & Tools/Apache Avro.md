---
title: Apache Avro
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - avro
  - serialization
  - kafka
  - schema-registry
aliases:
  - Format Avro
  - Serializacja Avro
---
# 🎯 Definicja
**Apache Avro** to system serializacji danych (format binarny), który przechowuje schemat (strukturę danych) razem z samymi danymi lub w zewnętrznym rejestrze. Jest standardem w ekosystemie streamingowym (Kafka).

# 🔑 Kluczowe punkty
- **Schema Evolution:** Kluczowa cecha pozwalająca na zmianę struktury danych (np. dodanie pola) bez psucia istniejących konsumentów (Backward/Forward Compatibility).
- **Wydajność:** Format binarny jest znacznie lżejszy i szybszy niż JSON.
- **Row-based:** W przeciwieństwie do Parquet (kolumnowy), Avro jest zapisywany wierszami, co czyni go idealnym do przesyłania pojedynczych zdarzeń/komunikatów.

# 📚 Szczegółowe wyjaśnienie
W systemach Big Data "umowa" co do kształtu danych jest krytyczna. Avro wymusza tę umowę poprzez Schemat (zazwyczaj w formacie JSON).
Producent wysyła dane zakodowane w Avro + ID schematu. Konsument pobiera schemat z Schema Registry i dekoduje dane. Dzięki temu nazwy pól ("firstName", "lastName") nie muszą być wysyłane z każdym rekordem (jak w JSON), co oszczędza pasmo.

**Avro vs Parquet:**
- Avro: Zapis/Odczyt całego rekordu (Streaming, API).
- Parquet: Zapis/Odczyt wybranych kolumn (Analityka, OLAP).

# 💡 Przykład zastosowania
System bankowy wysyła zdarzenie `TransactionCreated` na topic Kafki. Używa Avro, aby zapewnić, że pole `amount` jest zawsze typem `Decimal`, a nie `String`. Gdy bank doda pole `currency` w nowej wersji aplikacji, stare aplikacje nadal mogą czytać dane (ignorując nowe pole), dzięki regułom kompatybilności Avro.

## 📌 Źródła
- [Apache Avro Docs](https://avro.apache.org/docs/current/)
- [Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)

## 👽 Brudnopis
- Schemat w JSON: `{"type": "record", "fields": [{"name":"id", "type":"int"}]}`.
- Kompresja: Snappy, Deflate.
- Idealny partner dla Kafki.