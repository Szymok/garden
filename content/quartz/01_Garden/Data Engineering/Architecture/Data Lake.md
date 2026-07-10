---
title: Data Lake (Jezioro Danych)
created: 2026-07-10
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - database
  - data-lake
  - architecture
  - storage
aliases:
  - Data Lake
  - Jezioro danych
---
# 🎯 Definicja
**Data Lake** (Jezioro danych) to centralne repozytorium pamięci masowej, które umożliwia przechowywanie ogromnych ilości surowych, strukturyzowanych, półstrukturyzowanych (np. JSON, XML) oraz w pełni niestrukturyzowanych danych (np. obrazy, wideo, logi) w ich natywnym formacie, bez wcześniejszego narzucania schematu (Schema-on-Read).

# 🔑 Kluczowe punkty
*   **Schema-on-Read:** Dane są zapisywane w postaci surowej, a ich schemat i struktura są definiowane dopiero w momencie czytania (zapytywania) danych, co daje ogromną elastyczność.
*   **Tani Storage:** Oparty na tanich systemach przechowywania obiektów (Object Storage), takich jak AWS S3, Azure ADLS Gen2 lub on-premise HDFS.
*   **Data Swamp (Bagnisko danych):** Ryzyko przekształcenia jeziora danych w nieużyteczny śmietnik plików z powodu braku metadanych, katalogowania oraz właściwego [[Katalog Danych|Data Governance]].
*   **Formaty analityczne:** Nowoczesne jeziora korzystają z wydajnych formatów kolumnowych (np. Apache Parquet, Apache Iceberg) w celu przyspieszenia odczytu.

# 📚 Szczegółowe wyjaśnienie
Klasyczne hurtownie danych (Data Warehouse) wymagają wcześniejszego zaprojektowania schematu (Schema-on-Write) i transformacji danych przed ich zapisem. Data Lake odrzuca te ograniczenia, realizując podejście ELT (Extract, Load, Transform) – ładujemy wszystko w stanie surowym, a transformację wykonujemy później.

Kluczowe technologie w ekosystemie Data Lake:
1.  **Warstwa przechowywania (Storage):** AWS S3, MinIO, Azure Blob.
2.  **Warstwa obliczeniowa (Compute):** Apache Spark, Trino, Presto, które potrafią czytać dane bezpośrednio z plików rozproszonych.
3.  **Formaty tabelaryczne:** Delta Lake, Iceberg – wprowadzające obsługę [[Transakcje ACID|transakcji ACID]] oraz wersjonowanie danych bezpośrednio na tanim storage'u, co tworzy architekturę Data Lakehouse.

# 💡 Przykład zastosowania
Firma telekomunikacyjna gromadzi miliardy surowych logów z nadajników BTS (formaty tekstowe i JSON) bezpośrednio na AWS S3 (Data Lake). 
*   Analitycy biznesowi budują na ich podstawie raporty za pomocą Apache Spark.
*   Inżynierowie data science trenują na tych samych surowych plikach modele uczenia maszynowego.
*   Wszystkie te dane są skatalogowane w centralnym narzędziu typu [[Katalog Danych|Katalog Danych]], aby stewardzi danych mogli kontrolować ich jakość.

## 📌 Źródła
*   [[Siatka danych|Decentralizacja danych w architekturze Data Mesh]]
*   [[Transakcje ACID|Transakcje ACID w bazach danych i formatach tabelarycznych]]