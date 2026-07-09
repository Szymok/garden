---
title: Storage Layer (Warstwa Przechowywania)
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: basic
language: pl
tags:
  - storage
  - s3
  - hdfs
  - database
  - data-lake
aliases:
  - Warstwa Przechowywania
  - Magazyn Danych
---
# 🎯 Definicja
**Storage Layer** to fizyczne (lub wirtualne) miejsce, gdzie leżą bity i bajty danych.
W [[Nowoczesny Stos Danych|MDS]] (Cloud) to zazwyczaj **Object Storage** (S3, ADLS, GCS).
W tradycyjnym IT to macierze dyskowe lub HDFS.

# 🔑 Kluczowe punkty
- **Tanie i Skalowalne:** W chmurze storage jest tani. Możesz trzymać petabajty danych za ułamek ceny [[Bazy danych|bazy danych]].
- **Rozdzielenie:** Compute (Obliczenia - CPU/RAM) jest oddzielone od Storage (Dysk). To cecha Cloud Native.[[Data Lake|Jezior Danych]].
- **Trwałość (Durability):** Gwarancja, że dane nie zginą (np. AWS S3 ma trwałość "11 dziewiątek").

# 📚 Szczegółowe wyjaśnienie
Warstwa Storage jest fundamentem. Na niej buduje się tabele ([[Delta Lake]], [[Apache Iceberg]]).
Na tabelach buduje się logikę ([[Measure Layer]]).
Ale na samym dnie zawsze jest plik (Parquet, JSON, CSV) leżący na dysku w chmurze.

# 💡 Przykład zastosowania
Amazon S3 (Simple Storage Service).
Wrzucasz tam zdjęcia, logi, backupy [[Bazy danych|bazy danych]], pliki Parquet hurtowni danych.
[[Snowflake|Snowflake]] (baza danych) pod spodem trzyma swoje dane właśnie na S3 (w swoim formacie), ale Ty tego nie widzisz. Ty płacisz za Storage (S3) i Compute (Warehouse) osobno.

## 📌 Źródła
- AWS S3 Documentation.

## 👽 Brudnopis
- "Data Gravity" - dane przyciągają aplikacje. Ponieważ przesyłanie danych jest wolne/drogie, aplikacje (Obliczenia) przenosi się tam, gdzie jest Storage.
