---

title: Dane półstrukturalne  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- dane półstrukturalne
- inżynieria danych
- koncepcja  
aliases:
- semi-structured data

---

# 🎯 Definicja

**Dane półstrukturalne** to dane, które nie posiadają ściśle określonego schematu relacyjnego, ale są uporządkowane za pomocą tagów, znaczników, atrybutów czy struktur typu klucz-wartość. Najczęściej występują w postaci plików JSON, XML, YAML, Parquet czy Avro — ich schemat może być zmienny lub częściowy, lecz istnieją elementy umożliwiające rekonstrukcję lub „zrozumienie” zawartości przez maszyny.

# 🔑 Kluczowe punkty

- Posiadają strukturę pozwalającą na odczyt i analizę, ale nie są związane stałym schematem tabeli.
- Mogą zawierać różnej długości pola, zagnieżdżenia i kolekcje (np. listy, słowniki).
- Przykłady: JSON, XML, pliki logów, eventy przesyłane przez API.
- Łatwo przekształcić je do postaci strukturalnej w ramach integracji i transformacji danych, zwłaszcza w procesach ETL/ELT.
- Umożliwiają elastyczne przechowywanie dynamicznych informacji – kluczowe w systemach analitycznych, chmurowych, platformach integracyjnych (np. Airbyte, Kafka, Data Lake).

# 📚 Szczegółowe wyjaśnienie

## Czym różnią się dane półstrukturalne od innych typów?

- **Dane strukturalne:** posiadają sztywny, wyraźnie zdefiniowany schemat (np. tabele SQL, arkusze Excela).
- **Dane nieustrukturyzowane:** nie mają regularnej struktury (np. teksty, obrazy, e-maile).
- **Dane półstrukturalne:** są pomiędzy – mają metadane lub tagi, ułatwiając transformację do formatu tabelarycznego.

Przykład (JSON w bazie danych jako tekst):

||_airbyte_data|
|---|---|
|Rekord 1|"{"id": 1, "name": "Mary X"}"|
|Rekord 2|"{"id": 2, "name": "John D"}"|

## Transformacja do danych strukturalnych

Transformacja danych półstrukturalnych, np. JSON w kolumnie tekstowej, na strukturę tabelaryczną polega na:

- Parsowaniu JSON/XML.
- Mapowaniu kluczy do poszczególnych kolumn.
- Ustaleniu typu danych i walidacji wartości.

Po transformacji:

|id|name|
|---|---|
|1|"Mary X"|
|2|"John D"|

Proces ten może być zautomatyzowany w narzędziach takich jak Airbyte, dbt, Apache NiFi czy funkcjach SQL (np. funkcje `jsonb_extract_path` w PostgreSQL).

## Typowe zastosowania

- Magazyny danych (Data Lake) obsługujące pliki JSON, Avro, Parquet.
- Integracja z API – wiele nowoczesnych usług zwraca dane jako JSON/XML.
- Platformy streamingowe (Kafka, Pulsar) przechowujące komunikaty jako JSON.
- ELT/ETL – dane półstrukturalne pobierane i transformowane do tabel faktów lub wymiarów.

# 💡 Przykład zastosowania

Zespół analityczny w e-commerce gromadzi logi zdarzeń (clickstream) z aplikacji mobilnej w formacie JSON (półstrukturalnym). Logi te są ładowane do Data Lake w surowej postaci, a następnie podczas procesu ELT są automatycznie „rozwijane” do ustrukturyzowanej tabeli, pozwalającej np. na analizę konwersji, segmentacji użytkowników i testów A/B w hurtowni danych.

# 📌 Źródła

- [What are Semi-Structured Data? — IBM](https://www.ibm.com/cloud/blog/semi-structured-data)
- [Data Warehousing 101: Structured, Semi-Structured, and Unstructured Data — Databricks](https://www.databricks.com/glossary/semi-structured-data)
- [JSON Functions and Operators – PostgreSQL Documentation](https://www.postgresql.org/docs/current/functions-json.html)

# 👽 Brudnopis

- Dane półstrukturalne = JSON, XML, Parquet, logi, Avro, lista eventów w Kafka/S3.
- JSON jako tekst/klucz-wartość → parsowanie do struktur SQL (funkcje jsonb).
- Używane w integracji, BI, analityce, Lakehouse; elastyczna struktura i dynamiczność.
- ETL/ELT: najczęściej moment „zdejmowania” struktur do tabeli (json > kolumny).
- Data Lake = przechowywanie półstrukturalne + warstwa transformująca downstream.