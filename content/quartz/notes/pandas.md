---

title: Pandas  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- pandas
- python
- data manipulation
- dataframe  
aliases:
- biblioteka Pandas

---

# 🎯 Definicja

**Pandas** to popularna open-source’owa biblioteka do analizy danych w języku Python, służąca do wygodnego i wydajnego manipulowania danymi w formie tabelarycznej. Oferuje dwie główne struktury danych: **Series** (dla jednowymiarowych danych) oraz **DataFrame** (dla danych dwuwymiarowych – podobnych do arkusza kalkulacyjnego lub tabel SQL).

Pandas jest podstawowym narzędziem wykorzystywanym w zadaniach inżynierii danych, analityki, modelowania, oczyszczania danych oraz budowy ETL/ELT w środowiskach lokalnych i interaktywnych, takich jak Jupyter Notebook.

# 🔑 Kluczowe punkty

- Udostępnia bogaty zestaw funkcji do filtrowania, agregacji, transformacji i łączenia danych.
- Struktura DataFrame przypomina tabelę w SQL lub arkuszu kalkulacyjnym.
- Wspiera ładowanie danych z formatów CSV, Excel, JSON, Parquet, SQL i API.
- Umożliwia szybkie operacje wektorowe (dzięki wykorzystaniu NumPy).
- Świetnie nadaje się do prototypowania, eksploracji i analizy ad hoc.
- Jest zoptymalizowany do pracy z danymi do kilkuset milionów rekordów — przy większych zbiorach warto rozważyć np. Polars lub PySpark.

# 📚 Szczegółowe wyjaśnienie

## 🎛 Główne struktury danych

- **Series** – jednowymiarowa struktura danych:

```python
import pandas as pd
s = pd.Series([10, 20, 30], index=["a", "b", "c"])
```

- **DataFrame** – dwuwymiarowa tabela danych z etykietami:

```python
import pandas as pd
df = pd.DataFrame({
    "imie": ["Anna", "Jan", "Tomasz"],
    "wiek": [23, 35, 45]
})
```

Możesz filtrować, agregować, obracać, łączyć i grupować dane w bardzo prosty sposób, np.:

```python
df[df['wiek'] > 30]
df.groupby("imie").agg({"wiek": "mean"})
```

## 🛠 Częste operacje z Pandas

|Operacja|Przykład|
|---|---|
|Wczytywanie danych|`pd.read_csv("plik.csv")`|
|Agregacja grup|`df.groupby("kolumna").sum()`|
|Filtrowanie|`df[df["wiek"] > 30]`|
|Usuwanie duplikatów|`df.drop_duplicates()`|
|Dołączanie danych|`pd.merge(df1, df2, on="klucz")`|
|Czas i indeksy|`df.set_index("data")`, `resample("D")`|

## Pandas a inne narzędzia

|Biblioteka|Opis|
|---|---|
|**NumPy**|Wektorowe operacje matematyczne – fundament Pandas|
|**Polars**|Szybsza alternatywa dla Pandas, oparta na Apache Arrow|
|**Dask**|Rozproszona wersja Pandas dla dużych zbiorów na wielu rdzeniach|
|**Koalas**|Interfejs Pandas na Spark (obecnie część PySpark)|

## Przykłady użycia w praktyce

- Eksploracja danych z CSV i Exceli
- Budowa modeli ML (np. feature engineering z Pandas + scikit-learn)
- Testowanie transformacji danych, które będą potem implementowane w dbt/SQL
- ETL lokalny lub lekkie API do przetwarzania danych w mikroserwisie

# 💡 Przykład zastosowania

W Jupyter Notebook, data scientist analizuje dane epidemiologiczne w pliku CSV:

```python
import pandas as pd

df = pd.read_csv("covid_stats.csv")
df['data'] = pd.to_datetime(df['data'])
df = df.set_index('data')

# Agregacja tygodniowa liczby przypadków:
weekly = df['przypadki'].resample('W').sum()

# Porównanie z poprzednim tygodniem:
weekly_diff = weekly.diff()

weekly_diff.plot()
```

W kilkunastu linijkach prototypuje wskaźniki, które później stają się KPI i będą wdrożone w hurtowni.

## 📌 Źródła

- [Oficjalna dokumentacja Pandas](https://pandas.pydata.org/docs/)
- [10 Minutes to pandas (Quickstart)](https://pandas.pydata.org/docs/user_guide/10min.html)
- [Koalas – Pandas on Apache Spark](https://koalas.readthedocs.io/en/latest/)

# 👽 Brudnopis

- Pandas ≈ Excel na sterydach + NumPy w tyle
- Wczytaj, przekształć, przekaż — idealne do eksploracji lub API transformacyjnych
- Główne ograniczenie: pamięć RAM i wydajność przy dużych zbiorach
- Interoperacyjność: Pandas → Arrow → pyarrow/parquet/DuckDB
- Futures: pandas 3.x, typy statyczne, integracja z polars/pyarrow
- Złoty standard: transformacja danych do 1GB – Pandas, 10GB+ – Spark/Polars/Dask