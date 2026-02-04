---
title: Apache Arrow
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: advanced
language: pl
tags:
  - apache-arrow
  - in-memory
  - performance
  - columnar
  - interoperability
aliases:
  - Arrow format
  - In-memory columnar format
---
# 🎯 Definicja
**Apache Arrow** to standard reprezentacji danych kolumnowych w pamięci RAM, zaprojektowany w celu przyspieszenia analityki i umożliwienia bezkosztowej wymiany danych między różnymi systemami (np. Python Pandas <-> Spark <-> R).

# 🔑 Kluczowe punkty
- **Zero-Copy:** Umożliwia przesyłanie danych między procesami bez ich serializacji/deserializacji (ogromny zysk wydajności).
- **Columnar Layout:** Dane w pamięci są ułożone kolumnami (jak w plikach Parquet, ale w RAM), co jest idealne dla procesorów wektorowych (SIMD).
- **Interoperacyjność:** Jest "lingua franca" dla nowoczesnych narzędzi Data Science.

# 📚 Szczegółowe wyjaśnienie
Tradycyjnie, gdy Python (Pandas) chciał wysłać dane do Bazy Danych lub Sparka, musiał je zapisać do CSV/JSON (serializacja), przesłać, a odbiorca musiał je odczytać (deserializacja). To zjadało 80% czasu procesora.
Arrow definiuje wspólny standard ułożenia bitów w pamięci. Jeśli oba systemy "mówią w Arrow", przesyłanie danych polega na przekazaniu wskaźnika do pamięci. Zero kopiowania. Zero konwersji.

Projekt **Arrow Flight** to protokół RPC oparty na Arrow, który ma zastąpić powolne ODBC/JDBC w przesyłaniu dużych wolumenów danych.

# 💡 Przykład zastosowania
Biblioteka **Polars** (szybka alternatywa dla Pandas) jest zbudowana na Arrow. Dzięki temu operacje na milionach wierszy są błyskawiczne, a współpraca z plikami Parquet jest naturalna.
Użytkownik wczytuje `data.parquet` do pamięci jako Arrow Table, wykonuje filtrowanie i zapisuje wynik, wszystko z prędkością bliską limitom sprzętowym.

## 📌 Źródła
- [Apache Arrow Homepage](https://arrow.apache.org/)
- "The Composable Data Management System" manifesto.

## 👽 Brudnopis
- Arrow vs Parquet: Arrow = RAM (nieskompresowany, szybki dostęp losowy), Parquet = Dysk (skompresowany, archiwizacja).
- SIMD (Single Instruction Multiple Data) - procesory uwielbiają ciągłe bloki liczb w pamięci.
- Pandas 2.0 ma backend oparty na Arrow (pyarrow).