---
title: Pandas
created: 2026-02-04
status: evergreen
category: Python / Data Engineering
difficulty: basic
language: pl
tags:
  - python
  - dataframe
  - analysis
  - etl
  - library
aliases:
  - Biblioteka Pandas
  - pd.DataFrame
---
# 🎯 Definicja
**Pandas** to najpopularniejsza biblioteka Pythona do analizy danych ("Excel for Python"). Pozwala wczytywać pliki (CSV, Excel, [[SQL|SQL]]), przetwarzać je w tabelach (zwanych **DataFrame**) i zapisywać wyniki.

# 🔑 Kluczowe punkty
- **DataFrame:** Główny obiekt. To po prostu tabela w pamięci RAM komputera.
- **Wszechstronność:** Czyta prawie każdy format danych.
- **Szwajcarski Scyzoryk:** Filtrowanie, grupowanie, łączenie (Join), czyszczenie danych, proste wykresy.

# 📚 Szczegółowe wyjaśnienie
Pandas jest świetny do danych, które mieszczą się w pamięci RAM (np. do 1GB). Dla większych zbiorów (Big Data) używa się **Spark** lub **Polars**.
Pod maską Pandas używa [[NumPy]], więc jest szybki w operacjach matematycznych.

# 💡 Przykład zastosowania
Analityk dostaje plik `sprzedaz.csv`.
```python
import pandas as pd
df = pd.read_csv('sprzedaz.csv')
# Pokaż sprzedaż wg miasta
raport = df.groupby('Miasto')['Kwota'].sum()
raport.to_excel('wynik.xlsx')
```
Cztery linijki kodu zastępują godzinę klikania w Excelu.

## 📌 Źródła
- Pandas Documentation.
- "Python for Data Analysis" (Wes McKinney - twórca Pandas).

## 👽 Brudnopis
- Uwaga: Pandas jest "memory hungry". Jeśli masz plik 10GB, Pandas prawdopodobnie "wywali" Twój laptop. Wtedy użyj `chunksize` albo przesiądź się na [[DuckDB|DuckDB]]/Polars.