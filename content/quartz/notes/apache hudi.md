---

title: "Apache Hudi"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- ApacheHudi
- DataLakeFormat
- Uber
- OpenSource
- ApacheIncubator  
aliases:
- hudi
- format tabel hudi
- hoodie

---

# 🎯 Definicja

**Apache Hudi** (skrót od Hadoop Upserts Deletes and Incrementals), wymawiany „Hoodie”, to silnik zarządzania danymi oraz warstwa tablic nad jeziorem danych (Data Lake Table Format), zaprojektowany z myślą o obsłudze **przetwarzania danych typu upsert, time-travel, inkrementalnego przetwarzania i wersjonowania danych bezpośrednio na formacie kolumnowym (np. Parquet)**.

Projekt został zapoczątkowany w Uberze w 2016 roku i zapewnia **ACID**, **merge-on-read**, **write-once-read-many** semantyki w środowiskach takich jak Apache Spark, Amazon EMR, Presto, Trino, Flink i Hive.

# 🔑 Kluczowe punkty

- Obsługuje operacje **in-place update**, **delete**, **upsert** na danych w formacie jeziora.
- Zbudowany jako **Data Lake Table Format** podobnie jak Apache Iceberg i Delta Lake.
- Dostarcza pełną historię zmian oraz możliwość odczytu z konkretnego punktu w czasie (**time travel**).
- Wspiera tryby zapisu: **Copy-on-write (COW)** i **Merge-on-read (MOR)**.
- Pracuje bezpośrednio z formatem plików Parquet oraz Avro.

# 📚 Szczegółowe wyjaśnienie

## Główne funkcje Apache Hudi

- ✨ **ACID**: zapewnia transakcyjność zapisu danych w jeziorku – nawet przy współbieżnych sesjach.
- 🔁 **Upsert/delete**: modyfikujesz — nie tylko dopisujesz — dane w Data Lake.
- 🕓 **Time travel**: odczyt danych z określonego commita, timestampu lub wersji (`as.of.instant`).
- ⚡ **Inkrementalne odczyty (incremental pull)**: tylko te dane, które uległy zmianie między zapisami.
- 💾 **Write-once** / Read-optimized: różne tryby zapisu dostosowane do przypadku użycia.

## Tryby zapisu

|Tryb|Opis|
|---|---|
|**Copy-on-Write**|Za każdym razem powstaje nowy plik Parquet z wersją danych (łatwiejszy odczyt, większe zużycie zasobów przy zapisie)|
|**Merge-on-Read**|Dane są rozdzielone: plik bazowy + log (commit), odczyt wymaga składania danych z logów (tańszy zapis, złożony odczyt)|

## Integracje i obsługiwane narzędzia

- **Apache Spark** (natywnie, poprzez `HoodieWriteClient`)
- **Apache Flink** i **Flink SQL**
- **Apache Hive**, **Trino**, **Presto** – dzięki tabelom katalogowym kompatybilnym z Hive Metastore
- **Amazon EMR**, **GCP Dataproc**, **Databricks** (niestandardowo)
- **Apache Airflow / Dagster** – w pipeline’ach orkiestracyjnych

## Apache Hudi vs Delta Lake vs Iceberg

|Cecha|Apache Hudi|Delta Lake|Apache Iceberg|
|---|---|---|---|
|Wsparcie upsert/delete|✅ Tak|✅ Tak|✅ Tak|
|Time Travel|✅ Tak|✅ Tak|✅ Tak|
|Format plików|Parquet, Avro|Parquet|Parquet, ORC, Avro|
|Metadata catalog|Hive Metastore / własny|Delta Log / LM|Własny metastore + Glue|
|Write modes|COW / MOR|COW|Snapshot-based|
|Trudność wdrożenia|Średnia|Niska|Wysoka|

# 💡 Przykład zastosowania

Zespół danych w firmie transportowej rejestruje miliardy zdarzeń z aplikacji mobilnej. Za pomocą Apache Hudi tworzy system Lakehouse z pełną historią aktualizacji danych o kursach i użytkownikach. Dzięki trybowi MOR mogą tanio dopisywać aktualizacje stanu zamówień, a analitycy mogą korzystać z widoków logicznych bez przetwarzania całości danych.

# 📌 Źródła

- [https://hudi.apache.org/](https://hudi.apache.org/)
- [GitHub – Apache Hudi](https://github.com/apache/hudi)
- [https://blog.tryolabs.com/2023/03/02/data-lake-table-formats-a-comparison/](https://blog.tryolabs.com/2023/03/02/data-lake-table-formats-a-comparison/)
- [https://www.globenewswire.com/news-release/2020/06/04/2043732/0/en/The-Apache-Software-Foundation-Announces-Apache-Hudi-as-a-Top-Level-Project.html](https://www.globenewswire.com/news-release/2020/06/04/2043732/0/en/The-Apache-Software-Foundation-Announces-Apache-Hudi-as-a-Top-Level-Project.html)

## 👽 Brudnopis

- Merge-on-read ≠ tylko append – może „symulować” update
- Hudi = ACID + upsert + time-travel przy zachowaniu lekkości lake'a
- Obsługa partition pruning, incremental pull ≠ dostępne w Parquecie bez metadanych
- Przewaga nad czystym Parquet → story-aware logika
- Naming: HoodieTable, HoodieCommit, instants
- Spark jobs = commit log i tracking wersji
- Wybierz: Hudi – streaming & write-heavy, Delta – analytics & ETL, Iceberg – modularity & catalog

---