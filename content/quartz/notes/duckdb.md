---

title: DuckDB  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- DuckDB
- OLAP
- baza danych
- inżynieria danych
- python
- SQL  
aliases:
- in-memory OLAP

---

# 🎯 Definicja

**DuckDB** to szybki system zarządzania relacyjną bazą danych typu OLAP, działający bezpośrednio w pamięci procesu (in-process), projektowany jako „SQLite do analizy danych”. Wyróżnia się kolumnowym silnikiem zapytań, obsługą SQL i elastycznością użycia w środowiskach analitycznych, od laptopa po aplikacje chmurowe.

# 🔑 Kluczowe punkty

- **OLAP in-process:** Brak opóźnień sieciowych – wszystko dzieje się bezpośrednio w procesie użytkownika.
- **Wysoka wydajność:** Obsługuje analityczne zapytania na miliardach rekordów na sprzęcie konsumenckim (laptop).
- **Pełna obsługa SQL:** DuckDB oferuje wydajne przetwarzanie zapytań zgodnie ze standardem SQL.
- **Integracja z nowoczesnymi narzędziami:** Silne wsparcie dla Pythona, R, plików Parquet, CSV, Arrow, itp.
- **Jednoplikowe bazy:** Baza danych to pojedynczy plik na dysku; brak zewnętrznych zależności.
- **Łatwość wdrożenia:** Zero-dependency, gotowa do pracy na większości platform (Linux, MacOS, Windows).

# 📚 Szczegółowe wyjaśnienie

## Mechanizmy działania i architektura

- **Kolumnowy silnik zapytań:** DuckDB przetwarza dane w wektorach (chunkach) zamiast wierszy pojedynczo, co znacząco podnosi wydajność typowych analiz OLAP.
- **Amalgamacja kodu:** Podobnie jak SQLite, DuckDB jest dostarczany jako jeden duży plik binarny, łatwy do osadzenia w aplikacjach.
- **Wieloformatowa obsługa plików:** Bezpośredni odczyt/zapis Parquet, CSV, JSON, obsługa S3, lokalny oraz zdalny dostęp.
- **Wieloplatformowość:** Biblioteki dla Pythona, R, Javy, Node.js, Go i innych języków.

## Typowe zastosowania

- Szybka analiza dużych wolumenów danych (setki GB, miliardy wierszy) na laptopie lub serwerze.
- „SQL nad Parquet”: Warstwa analityczna nad plikami Parquet bez potrzeby ładowania wszystkiego do zewnętrznej bazy.
- Komponent w nowoczesnym stacku danych (np. w połączeniu z dbt, Superset, Meltano).
- Alternatywa dla Excela i CSV w analizach biznesowych i data science.

## Przewagi i różnice względem innych rozwiązań

|DuckDB|SQLite|Apache Druid / ClickHouse|
|:--|:--|:--|
|OLAP (analiza)|OLTP (transakcje)|OLAP rozproszony|
|Kolumnowy silnik zapytań|Wierszowy silnik|Kolumnowy, skalowalny sieciowo|
|Jednośrodowiskowy, prosty|Jednośrodowiskowy|Skalowalny, skomplikowana obsługa|
|Bardzo szybki lokalnie|Do pracy z małymi danymi|Do pracy z Big Data|
|Bez zewnętrznej infrastruktury|||

## Zintegrowany interfejs Python/SQL

DuckDB doskonale współpracuje z Pandas i NumPy:

```python
import duckdb
con = duckdb.connect()
con.execute("CREATE TABLE items(item VARCHAR, value DECIMAL(10,2), count INTEGER)")
con.execute("INSERT INTO items VALUES ('jeans', 20.0, 1), ('hammer', 42.2, 2)")
con.execute("INSERT INTO items VALUES (?, ?, ?)", ['laptop', 2000, 1])
arr = con.execute("SELECT * FROM items").fetchnumpy()
print(arr)
```

# 💡 Przykład zastosowania

Firma analityczna analizuje 1,5 miliarda rekordów transakcji taxi NYC z ostatnich 10 lat. Zamiast ładować dane do wielkoskalowej hurtowni, przeprowadza całość analizy lokalnie na laptopie korzystając z DuckDB, SQL oraz Pandas, uzyskując wyniki w kilka sekund bez kosztów chmury i złożoności wdrożenia.

# 📌 Źródła

- DuckDB – Oficjalna strona i dokumentacja
- „SQLite i DuckDB – Porównanie” (Simon Willison)
- CIDR 2020: „Zarządzanie danymi dla nauki o danych – W kierunku osadzonej analizy”

# 👽 Brudnopis

- OLAP single-file, zero-dependency, integracja z Pandas, Arrow, szybki odczyt Parquet i CSV
- “SQLite do analityki” – porównanie, różnica: kolumnowy engine, obsługa dużych plików
- Projekty: MotherDuck (cloud), Rill Data (BI), Stack MDS in-a-box
- Zero latency (in-process), alternatywa dla workbenchów opartych o Excela/CSV
- Realne testy na miliardowych zbiorach na laptopie
- Przydatność: szybka eksploracja danych, BI ad hoc, uczenie maszynowe prototypowo

: DuckDB – dokumentacja i strona produktu  
: Simon Willison, „SQLite and DuckDB: a comparison”  
: Raasveldt, Mühleisen, „Data Management for Data Science: Towards Embedded Analytics”, CIDR 2020