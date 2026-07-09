---
title: DataFrames (Ramki Danych)
created: 2026-02-04
status: evergreen
category: Data Science/Engineering
difficulty: basic
language: pl
tags:
  - python
  - pandas
  - spark
  - dataframe
  - data-structure
aliases:
  - DataFrame
  - Ramka Danych
---
# 🎯 Definicja
**DataFrame** to dwuwymiarowa, tabelaryczna struktura danych (wiersze i kolumny), przypominająca arkusz Excela lub tabelę [[SQL|SQL]], ale działająca w pamięci komputera (RAM) lub klastra. Jest podstawowym "pojemnikiem na dane" w świecie Data Science i Engineeringu (Python/R).

# 🔑 Kluczowe punkty
- **[[Pandas|Pandas]] DataFrame:** Standard w Pythonie do analizy danych "małych" (mieszczących się w RAM jednego komputera).
- **Spark DataFrame:** Standard w Big Data. Działa na klastrze, przetwarza dane równolegle (Lazy Evaluation).
- **Polars:** Now nowoczesna, super-szybka alternatywa dla [[Pandas|Pandas]] (napisana w Rust).

# 📚 Szczegółowe wyjaśnienie
DataFrame różni się od zwykłej macierzy (Matrix) tym, że kolumny mogą mieć różne typy (jedna to Liczby, druga to Tekst, trzecia to Data).
Zapewnia potężne API do manipulacji danymi:
- Filtrowanie (`df[df.age > 18]`)
- Grupowanie (`df.groupby('city').mean()`)
- Łączenie (`df1.join(df2)`)
To w zasadzie "programowalny [[SQL|SQL]]".

# 💡 Przykład zastosowania
Masz plik CSV z historią zakupów.
Wczytujesz go do [[Pandas|Pandas]]: `df = pd.read_csv('sales.csv')`.
Chcesz zobaczyć średnią sprzedaż w Piątki.
W [[SQL|SQL]] musiałbyś stawiać bazę.
W [[Pandas|Pandas]] piszesz jedną linię: `df[df.day == 'Friday'].amount.mean()`.
Jest to szybkie i interaktywne (np. w Jupyter Notebook).

## 📌 Źródła
- [[Pandas|Pandas]] Documentation.
- [[Apache Spark|Apache Spark]] Documentation.

## 👽 Brudnopis
- RDD (Resilient Distributed Datasets) to przodek DataFramów w Sparku (bardziej niskopoziomowy).
- Koalas / [[Pandas|Pandas]]-on-Spark – biblioteki pozwalające pisać kod [[Pandas|Pandas]], który wykonuje się na Sparku.