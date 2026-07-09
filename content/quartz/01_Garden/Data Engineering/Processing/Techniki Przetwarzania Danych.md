---

title: Techniki Przetwarzania Danych – Przechowywanie Wierszowe, Kolumnowe i Silniki Wektorowe  
created: 2025-07-15  
status: 🌱 draft
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- DatabaseTechnology
- ColumnarStorage
- RowStorage
- VectorEngine
- DataOptimization  
aliases:
- Metody przetwarzania danych

---

# 🎯 Definicja

**Techniki przetwarzania danych** obejmują różne sposoby przechowywania, pobierania i przetwarzania danych w bazach danych, rozróżniając m.in. przechowywanie wierszowe, kolumnowe oraz wykorzystanie nowoczesnych silników wektorowych. Celem tych metod jest optymalizacja wydajności dla odpowiednich typów obciążeń: transakcyjnych, analitycznych czy przetwarzania na dużą skalę.

# 🔑 Kluczowe punkty

- **Przechowywanie kolumnowe** optymalizuje analitykę i duże skany danych.
- **Przechowywanie wierszowe** zapewnia wysoką wydajność operacji transakcyjnych ([[OLTP|OLTP]]).
- **Silnik wektorowy** wykorzystuje paralele przetwarzanie blokowe i instrukcje SIMD, drastycznie zwiększając wydajność zapytań analitycznych.
- Wybór metody zależy od charakteru danych oraz typowych operacji.

# 📚 Szczegółowe wyjaśnienie

## Przechowywanie kolumnowe

- Dane przechowywane są w osobnych blokach dla każdej kolumny tabeli.
- Umożliwia szybkie agregacje, selektywne pobieranie wybranych kolumn i skuteczną kompresję.
- Idealne do hurtowni danych, [[Business Intelligence|BI]], raportowania – zapytania odczytujące wybrane kolumny z milionów wierszy.
- Przykłady: **[[Apache Druid]]**, **ClickHouse**, **BigQuery**, **[[Snowflake|Snowflake]]**.

**Zalety:**

- Szybkie skanowanie kolumn i duża oszczędność miejsca przy dużej powtarzalności wartości.
- Wysoka wydajność w obciążeniach analitycznych (OLAP).

**Ograniczenia:**

- Wolniejsze wstawianie/aktualizacja pojedynczych rekordów.
- Mniej wydajne w aplikacjach operujących na całych wierszach.

## Przechowywanie wierszowe

- Dane przechowywane są w postaci kolejnych wierszy (rekordów).
- Każdy wiersz reprezentuje pełną encję obiektu, np. pojedynczy zamówienie lub użytkownik.
- Stosowane w relacyjnych bazach transakcyjnych: **PostgreSQL**, **MySQL**, **[[SQL|SQL]] Server**.

**Zalety:**

- Szybkie pobieranie, aktualizacja i usuwanie pojedynczych rekordów.
- Dobre wsparcie dla typowego [[OLTP|OLTP]]: operacje CRUD, transakcje, wykrywanie kolizji.

**Ograniczenia:**

- Mało wydajne dla analiz na wielu kolumnach z dużych zestawów danych.
- Brak możliwości sprytnego kompresowania w obrębie pojedynczej kolumny.

|Technika|Przykłady zastosowania|Typowe [[Bazy danych|bazy danych]]|
|---|---|---|
|Kolumnowe|Analityka, [[Business Intelligence\|BI]], hurtownie|Druid, BigQuery, ClickHouse|
|Wierszowe|[[OLTP|OLTP]], systemy operacyjne|MySQL, Postgres, Oracle|

## Silnik wektorowy

- Nowoczesny sposób przetwarzania zapytań, gdzie operacje (np. suma kolumny) są wykonywane na „wektorach” (dużych blokach danych) zamiast pojedynczych wierszy.
- Wykorzystuje instrukcje SIMD procesora – jedno polecenie operuje na wielu wartościach naraz.
- Minimalizuje narzut obsługi zapytań względem przetwarzania wiersz po wierszu.
- Podnosi wydajność cache’owania, umożliwia masowe przetwarzanie oraz znacznie przyspiesza analizy i agregacje.

**Przykłady silników:**

- **[[DuckDB]]** – analizy OLAP na laptopie, Python, R.
- **Photon Engine (Databricks)** – [[Analiza Danych]] w chmurze.
- **[[Apache Arrow]], Polars** (engine typu [[DataFrames|dataframe]]).

**Zalety:**

- Drastyczny wzrost wydajności w przetwarzaniu masowym.
- Efektywna współpraca z silnikami kolumnowymi i narzędziami data science.

# 💡 Przykład zastosowania

Analizy danych clickstream w platformie e-commerce: dane z milionów odsłon są ładowane do bazy z przechowywaniem kolumnowym (np. Druid), a agregacje oraz transformacje do raportów wykonywane są przez silnik wektorowy [[DuckDB|DuckDB]], co zapewnia szybkie generowanie raportów nawet przy bardzo dużych wolumenach danych.

## 📌 Źródła

- [DuckDB — Oficjalna dokumentacja](https://duckdb.org/docs/why_duckdb)
- [Photon Engine (Databricks)](https://databricks.com/blog/2021/12/15/introducing-photon-the-next-generation-engine-on-the-databricks-lakehouse-platform.html)
- [Column-based vs Row-based Data Stores — Vertica Blog](https://www.vertica.com/blog/column-based-vs-row-based-data-stores/)
- [SIMD and Vectorization Explained — DuckDB Blog](https://duckdb.org/2022/09/07/vectorized-processing.html)

# 👽 Brudnopis

- Kolumnowe – skanowanie, kompresja, agregacje, OLAP.
- Wierszowe – CRUD, [[OLTP|OLTP]], wydajne aktualizacje pojedynczych rekordów.
- Wektorowe – przetwarzanie masowe, SIMD, cache locality, [[DuckDB]], Databricks Photon.
- Wybór zależy od przypadku i obciążenia (transakcje vs analityka vs [[Uczenie Maszynowe|ML]]).
- Bazy: [[DuckDB]] = wektorowy + kolumnowy, Druid = kolumnowy/OLAP, Postgres/MySQL = wierszowy.