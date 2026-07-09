---
title: Data Lakehouse
created: 2026-02-04
status: evergreen
category: Data Engineering/Architecture
difficulty: intermediate
language: pl
tags:
  - lakehouse
  - delta-lake
  - iceberg
  - hudi
  - architecture
aliases:
  - Lakehouse
  - Otwarty Lakehouse
---
# 🎯 Definicja
**Data Lakehouse** to nowoczesna architektura danych łącząca elastyczność **[[Data Lake|Data Lake]]** z zarządzaniem i wydajnością **[[Data Warehouse|Data Warehouse]]**. Dzięki wykorzystaniu otwartych formatów tabel (takich jak [[Delta Lake]], Iceberg, Hudi), umożliwia obsługę transakcji [[Transakcje ACID|ACID]], Schema Enforcement i Time Travel bezpośrednio na tanim magazynie obiektowym (S3/ADLS), bez konieczności kopiowania danych do oddzielnej hurtowni.

# 🔑 Kluczowe punkty
- **Best of both worlds:** Tani storage (jak Lake) + Transakcyjność i [[SQL|SQL]] (jak Warehouse).
- **Brak duplikacji:** Dane leżą w jednym miejscu. BI i AI korzystają z tych samych plików.
- **Otwarte formaty:** Dane nie są zamknięte w "pudle" vendora (jak w Oracle czy [[Snowflake|Snowflake]]'u starszej generacji), ale są zwykłymi plikami Parquet z warstwą metadanych.

# 📚 Szczegółowe wyjaśnienie
Tradycyjnie miałeś Lake (bałagan, pliki) i Warehouse (porządek, [[SQL|SQL]]). Lakehouse dodaje warstwę "Table Format" na pliki w Lake'u.
Dzięki temu pliki Parquet na S3 zachowują się jak tabele [[SQL|SQL]]:
- Możesz robić `UPDATE` i `DELETE` (dzięki [[Delta Lake|Delta Lake]] log).
- Masz wersjonowanie historii (możesz zapytać o dane "sprzed tygodnia").
- Masz dużą wydajność (indexy, skipping data).
Silniki takie jak Databricks [[SQL|SQL]], Trino czy Starburst pozwalają odpytywać te dane z prędkością bliską hurtowniom.

# 💡 Przykład zastosowania
Databricks Platform.
Inżynierowie wrzucają surowe dane do tabel Delta ("Bronze"). Czyszczą je do "Silver". Agregują do "Gold". Wszystko to dzieje się na S3.
Analityk otwiera Power BI i łączy się do tych samych tabel "Gold" przez [[SQL|SQL]] Endpoint.
Data Scientist bierze te same tabele "Silver" do trenowania modelu w Pythonie.
Nikt nie kopiuje danych do osobnego [[SQL|SQL]] Servera.

## 📌 Źródła
- "Lakehouse: A New Generation of Open Platforms that Unify Data Warehousing and Advanced Analytics" - Databricks Paper.

## 👽 Brudnopis
- Kluczowe technologie: [[Delta Lake]], [[Apache Iceberg]], [[Apache Hudi]].
- Lakehouse jest odpowiedzią na problemy [[Data Swamp|Data Swamp]] i kosztów chmury.