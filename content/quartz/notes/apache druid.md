---

title: "Apache Druid"  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria danych
- Druid
- ColumnarStore
- DistributedDatabase
- OLAP  
aliases:
- Apache Druid Database

---

# 🎯 Definicja

**Apache Druid** to rozproszona, kolumnowa baza danych typu OLAP, zoptymalizowana pod kątem szybkiej analizy dużych wolumenów danych zdarzeń w czasie rzeczywistym. Została stworzona z myślą o zastosowaniach, które wymagają niskich opóźnień zapytań analitycznych i błyskawicznego przyjmowania danych strumieniowych.

# 🔑 Kluczowe punkty

- **Kolumnowy model danych:** wydajny magazyn danych idealny dla agregacji i filtrowania.
- **Rozproszona architektura:** umożliwia poziome skalowanie przy dużych ilościach danych.
- **Obsługa danych strumieniowych i wsadowych:** doskonała wydajność zarówno dla danych historycznych, jak i przyrostowych.
- **OLAP-ready:** stworzony typowo pod analizy wielowymiarowe, eksploracje [[Business Intelligence|BI]] i pulpity operacyjne.
- **Niskie opóźnienia zapytań:** nadaje się do analityki w czasie rzeczywistym.

# 📚 Szczegółowe wyjaśnienie

## Architektura techniczna

Apache Druid wykorzystuje modularną architekturę podzieloną na komponenty:

|Komponent|Opis|
|---|---|
|**Middle Manager**|Przetwarza dane podczas indeksowania (transformacje, agregacje).|
|**Historical Node**|Przechowuje dane historyczne w zoptymalizowanej formie kolumnowej.|
|**Broker Node**|Odpowiada za odbiór zapytań od użytkowników i agregację odpowiedzi z innych węzłów.|
|**Coordinator**|Zarządza dystrybucją i replikacją segmentów danych.|
|**Realtime Peon / Indexer**|Wczytuje nowe dane i przekazuje je do segmentów historycznych.|

Dane indeksowane przez Druid są dzielone na segmenty czasowe, co sprzyja zapytaniom po czasie oraz wydajnemu zarządzaniu pamięcią.

## Integracja i źródła danych

Druid obsługuje różnorodne źródła danych przy strumieniowym i wsadowym ładowaniu, np.:

- Apache Kafka (streaming ingestion)
- Apache Hadoop / S3 (batch ingestion)
- Google Cloud Storage, Azure Blob Storage
- Wsparcie dla plików CSV, JSON oraz Avro/Parquet

## Język zapytań

Druid umożliwia zapytania:

- **SQL** – zgodność z ANSI SQL
- **JSON Query API** – oryginalny DSL
- Integruje się z narzędziami [[Business Intelligence|BI]] (np. Superset, Tableau)

# 💡 Przykład zastosowania

Platforma e-commerce analizuje miliony zdarzeń typu clickstream i transakcje użytkowników w czasie rzeczywistym. Przy użyciu Apache Druid dane są natychmiast wchłaniane z Apache Kafka, a użytkownicy mogą przeglądać aktualny stan sprzedaży i metryki kampanii reklamowych w dashboardach operacyjnych z opóźnieniem poniżej jednej sekundy. Agregacje "na żywo" są dostępne dzięki kolumnowemu podejściu i zróżnicowanym segmentom czasowym.

## 📌 Źródła

- [Apache Druid – Strona projektu](https://druid.apache.org/)
- [What is Apache Druid? – Imply.io](https://imply.io/what-is-druid/)
- [Using Druid for Real-Time Analytics – Confluent Blog](https://www.confluent.io/blog/real-time-stream-processing-apache-druid/)

## 👽 Brudnopis

- OLAP kolumnowy, silnie zoptymalizowany pod agregację online, low-latency + high-availability
- Przypadki użycia: clickstream, metrics pipelines, fraud detection [[Analiza Danych|dashboards]]
- Odczyty z Kafka, Kafka Connect, pliki wsadowe, REST API
- Potężna wydajność bez potrzeby budowania skomplikowanej architektury kubernetesowej
- Integruje się z Apache Superset, Looker, Grafana
- Segmentacja czasowa zwiększa wydajność przy analizie trendów i historii
- Nadpisuje tradycyjne kostki OLAP (np. SSAS) dla dużych zbiorów danych z wysoką dynamiką zmian