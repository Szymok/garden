---

title: DataFrames  
created: 2025-07-16  
status:  
category: data science  
difficulty: podstawowy  
language: pl  
tags:

- pandas
- PySpark
- struktury danych
- analiza danych
- data science  
aliases:
- ramki danych
- data frame
- dataframe

---

# 🎯 Definicja

**DataFrame** to podstawowa struktura danych używana w analizie danych, reprezentująca uporządkowaną dwuwymiarową tabelę danych (podobną do arkusza kalkulacyjnego lub tabeli SQL), gdzie kolumny mają nazwy i typy danych. DataFrames są wykorzystywane m.in. w bibliotekach takich jak Pandas (Python) i PySpark (Spark) w celu wydajnej manipulacji i analizy danych.

# 🔑 Kluczowe punkty

- 🔢 Struktura 2D: dane są zorganizowane w wiersze i kolumny, z indeksami i metadanymi.
- ⚙️ Obsługuje różne typy danych: liczby całkowite, zmiennoprzecinkowe, tekst, daty itd.
- 🔄 Umożliwia operacje: filtrowanie, grupowanie, sortowanie, dołączanie (join), pivot, analizę statystyczną.
- 📊 Stanowi podstawę dla zadań ETL, eksploracji danych, wizualizacji, przetwarzania wsadowego.

# 📚 Szczegółowe wyjaśnienie

## DataFrame w Pandas (Python)

Pandas DataFrame to jedna z najczęściej używanych struktur danych w analizie danych w języku Python. Idealnie nadaje się do pracy z danymi CSV, Excel, SQL, JSON.

```python
import pandas as pd

data = {
    'Imię': ['Anna', 'Tomek', 'Kasia'],
    'Wiek': [28, 34, 25]
}

df = pd.DataFrame(data)
print(df)
```

||Imię|Wiek|
|--:|---|---|
|0|Anna|28|
|1|Tomek|34|
|2|Kasia|25|

### Przykładowe operacje:

- `df['Wiek'].mean()` – średnia wieku
- `df[df['Wiek'] > 30]` – filtrowanie
- `df.groupby('Imię').count()` – grupowanie

## DataFrame w PySpark (Spark)

W rozproszonym przetwarzaniu danych (Big Data), PySpark oferuje Spark DataFrame – analogiczną strukturę, która pozwala na równoległe operacje na dużych zbiorach danych.

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Example").getOrCreate()
data = [('Anna', 28), ('Tomek', 34), ('Kasia', 25)]

df = spark.createDataFrame(data, ['Imię', 'Wiek'])
df.show()
```

|Imię|Wiek|
|---|---|
|Anna|28|
|Tomek|34|
|Kasia|25|

### Operacje na DataFrame Spark:

- `df.filter(df['Wiek'] > 30)` – filtrowanie
- `df.groupBy('Imię').count()` – grupowanie
- `df.select('Imię')` – wybór kolumn

# 💡 Przykład zastosowania

Analityk danych przygotowuje dzienny raport sprzedaży. Używa Pandas do wczytania arkusza Excel, przekształca dane w DataFrame, wylicza średnią wartość koszyka, filtruje produkty premium i eksportuje wynik do nowego pliku CSV. W środowisku big data – te same operacje realizuje w PySpark, ale skaluje je na miliony rekordów dziennie.

# 📌 Źródła

- [https://pandas.pydata.org/docs/user_guide/dsintro.html#dataframe](https://pandas.pydata.org/docs/user_guide/dsintro.html#dataframe)
- [https://spark.apache.org/docs/latest/sql-programming-guide.html](https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [https://realpython.com/pandas-python-explore-dataset/](https://realpython.com/pandas-python-explore-dataset/)
- [https://learn.microsoft.com/en-us/azure/databricks/sql/dataframes](https://learn.microsoft.com/en-us/azure/databricks/sql/dataframes)

# 👽 Brudnopis

- DataFrame = struktura tabelaryczna: kolumny + indeks
- Pandas: nano- i mikro-dane (od setek do milionów rekordów)
- PySpark: big data (GB–PB, rozproszone środowisko, Spark SQL)
- Dobre do ETL, analizy, ML, raportowania
- Możliwość konwersji do JSON, tabel SQL, CSV, Parquet, Arrow itp.