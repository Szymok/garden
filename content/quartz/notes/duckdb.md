---
title: "DuckDB"
tags:
- inżynieria danych
---
[DuckDB](https://duckdb.org/) to system zarządzania bazą danych SQL typu [OLAP](notes/olap.md) działający w trybie wewnątrzprocesowym. Posiada silne wsparcie dla SQL. DuckDB opiera się na implementacji powłoki SQLite. Każda baza danych jest pojedynczym plikiem na dysku. Można go porównać do "[SQLite](https://www.sqlite.org) dla obciążeń **analitycznych (OLAP)**" (bezpośrednie porównanie w artykule [Porównanie SQLite i DuckDB](https://simonwillison.net/2022/Sep/1/sqlite-duckdb-paper/) tutaj), podczas gdy SQLite jest przeznaczony dla obciążeń OLTP. Jednak DuckDB może obsługiwać ogromne ilości danych lokalnie. Jest to mniejsza, lżejsza wersja [Apache Druid](Apache%20Druid) i innych technologii OLAP.

Jest zaprojektowany do pracy jako biblioteka osadzona, eliminując opóźnienia sieciowe, które zazwyczaj występują podczas komunikacji z bazą danych.

> [!note] Zastąp pracę z podatnymi na błędy plikami Excela lub CSV
>
> Dzięki DuckDB nie musimy już korzystać bezpośrednio z plików zwykłych (CSV, Excel, Parquet). DuckDB obsługuje schemat, typy i interfejs SQL, jest także bardzo szybki.

## Zastosowania
- Bardzo szybki przypadek użycia analitycznego lokalnie. Na przykład przykład z taksówką obejmuje przykład danych o taksówkach z ostatnich 10 lat, zawierający 1,5 miliarda wierszy, który nadal działa na laptopie. Patrz poniżej dla wyników testów wydajnościowych.
- Można go używać jako osłonę SQL z zerowymi kopiowaniami (na wierzchu plików Parquet w S3).
- Przynoszenie **danych do użytkowników** zamiast przeprowadzania dużych cykli komunikacji i opóźnień za pomocą wywołań REST. Zamiast tego dane można umieścić wewnątrz klienta. Można osiągnąć 60 klatek na sekundę, ponieważ dane znajdują się tam, gdzie jest zapytanie.
- DuckDB na platformie Kubernetes jako warstwa zerowego kopiowania do odczytywania danych z S3 w [Jeziorze Danych](https://glossary.airbyte.com/notes/data-lake)! Inspirowane [tym](https://twitter.com/Ubunta/status/1584907743391272961) wpisem na Twitterze. Najtańsza i najszybsza opcja rozpoczęcia pracy.

Sprawdź [Rill Data](https://www.rilldata.com/), narzędzie [BI](notes/narzędzia%20business%20intelligence.md), które zapewnia interaktywność w czasie poniżej sekundy, ponieważ jest oparte na DuckDB (a także [Druid](Apache%20Druid) dla usług chmurowych na poziomie przedsiębiorstwa).

[MotherDuck](https://motherduck.com/) to usługa zarządzana wokół DuckDB, która pozwala na skalowanie od lokalnej bazy danych do bazy danych w chmurze i hybrydowej — stworzona przez jednego z twórców Google BigQuery, takich jak [Jordan Tigani](notes/Jordan%20Tigani). Zapoznaj się z jego dyskusją w [Podcaście Inżynierii Analitycznej na temat Osobistej Hurtowni Danych](https://open.spotify.com/episode/3CmeFOuIOg91xApdjbWqey?si=CmelGaxBTZ-Z-BR3fvMjmg&utm_source=copy-link&nd=1). Ożywiająca

 rozmowa na temat powiązanych technologii WebAssembly, np. jest to aplikacja skompilowana do kodu C, który jest bardzo szybki. Na przykład Figma korzysta z tego, co w przeciwnym razie nigdy nie działałoby w przeglądarce.

## Testy wydajnościowe
- [Szybka analiza za pomocą DuckDB + Pyarrow](https://tech.gerardbentley.com/python/data/intermediate/2022/04/26/holy-duck.html) - 2022
- [SQL w Pythonie, część 1: Prostota DuckDB](https://www.orchest.io/blog/sql-on-python-part-1-the-simplicity-of-duckdb): Jak użyć DuckDB do analizy ponad 4,6 miliona wzmianek o zmianach klimatu na Reddicie.
- [Tweet](https://mobile.twitter.com/medriscoll/status/1554698141789614081): Imponująco szybka, wspólna eksploracja analizy danych na zestawie danych o ponad 20 milionach wierszy, hostowanym w chmurze za pomocą Jamsocket od Drifting + Rill Data + DuckDB - 2022
- [Używanie DuckDB z interfejsem Arrow w Rust dla wyników z DuckDB](https://vikramoberoi.com/using-polars-on-results-from-duckdbs-arrow-interface-in-rust/)

## Projekty przykładowe
- [Nowoczesny Stos Danych w Pudełku z wykorzystaniem DuckDB](https://duckdb.org/2022/10/12/modern-data-stack-in-a-box.html): Szybki, darmowy i otwarty nowoczesny stos danych (MDS) można teraz w pełni wdrożyć na laptopie lub na pojedynczym komputerze za pomocą połączenia DuckDB, Meltano, dbt i Apache Superset.
- [Pełny projekt przykładowy](https://github.com/dagster-io/dagster/blob/master/examples/project_fully_featured/)(s3, dbt, parquet i snowflake) odczytywanie z Hackernews zorchestrowane za pomocą dagster.
- [Inżynieria Danych w 2022: Badanie dbt z DuckDB](https://rmoff.net/2022/10/20/data-engineering-in-2022-exploring-dbt-with-duckdb/): Przewodnik krok po kroku dotyczący korzystania z dbt i DuckDB.
- [Zbuduj własne biedne jezioro danych od podstaw z DuckDB](https://dagster.io/blog/duckdb-data-lake): W pełni wyposażony przykład od Dagster, także w [wideo](https://youtu.be/33sxkrt6eYk).

## Technologia i Publikacje
DuckDB jest dostarczany jako budowa [amalgamation](https://www.sqlite.org/amalgamation.html) - pojedynczy ogromny plik C++ (SQLite to pojedynczy ogromny plik C). Oprócz tego opiera się na solidnych podstawach naukowych. Został stworzony przez badaczy akademickich odpowiedzialnych za MonetDB i zawiera implementacje kilku interesujących publikacji:
-   [Zarządzanie danymi dla nauki o danych - W kierunku osadzonej analizy](https://www.duckdb.org/pdf/CIDR2020-raasveldt-muehleisen-duckdb.pdf) (CIDR 2020)
-   [DuckDB: Osadzalna baza danych analityczna](https://www.duckdb.org/pdf/SIGMOD2019-demo-duckdb.pdf) (SIGMOD 2019 Demo)

Z artykułu [Dlaczego DuckDB](https://duckdb.org/why_duckdb):
> DuckDB zawiera **kolumnowy silnik wykonywania zapytań**, w którym zapytania są wciąż interpretowane, ale duży pakiet wartości („wektor”) jest przetwarzany za jednym razem. To dramatycznie zmniejsza narzut w tradycyjnych systemach takich jak PostgreSQL, MySQL czy SQLite, które przetwarzają każdy wiersz sekwencyjnie. Wykonywanie zapytań wektorowych prowadzi do znacznie lepszej wydajności w zapytaniach OLAP.

## Interfejs Pythona i Obsługa Danych
Z dokumentacji DuckDB - Python API:
### Pobieranie danych za pomocą SQL
```python
# pobierz jako ramka danych pandas
df = con.execute("SELECT * FROM items").fetchdf()
print(df)
#        item   value  count
# 0     jeans    20.0      1
# 1    hammer    42.2      2
# 2    laptop  2000.0      1
# 3  chainsaw   500.0     10
# 4    iphone   300.0      2

# pobierz jako słownik tablic numpy
arr = con.execute("SELECT * FROM items").fetchnumpy()
print(arr)
# {'item': masked_array(data=['jeans', 'hammer', 'laptop', 'chainsaw', 'iphone'],
#              mask=[False, False, False, False, False],
#        fill_value='?',
#             dtype=object), 'value': masked_array(data=[20.0, 42.2, 2000.0, 500.0, 300.0],
#              mask=[False, False, False, False, False],
#        fill_value=1e+20), 'count': masked_array(data=[1, 2, 1, 10, 2],
#              mask=[False, False, False, False, False],
#        fill_value=999999,
#             dtype=int32)}
```
### Tworzenie tabeli
```python
# utwórz tabelę
con.execute("CREATE TABLE items(item VARCHAR, value DECIMAL(10,2), count INTEGER)")
# wstaw dwa elementy do tabeli
con.execute("INSERT INTO items VALUES ('jeans', 20.0, 1), ('hammer', 42.2, 2)")

# pobierz elementy ponownie
con.execute("SELECT * FROM items")
print(con.fetchall())
# [('jeans', 20.0, 1), ('hammer', 42.2, 2)]
```
### Wstawianie danych
```python
# wstaw wiersz za pomocą instrukcji przy

gotowanej
con.execute("INSERT INTO items VALUES (?, ?, ?)", ['laptop', 2000, 1])

# wstaw wiele wierszy za pomocą instrukcji przygotowanej
con.executemany("INSERT INTO items VALUES (?, ?, ?)", [['chainsaw', 500, 10], ['iphone', 300, 2]] )

# zapytaj bazę danych za pomocą instrukcji przygotowanej
con.execute("SELECT item FROM items WHERE value > ?", [400])
print(con.fetchall())
# [('laptop',), ('chainsaw',)]