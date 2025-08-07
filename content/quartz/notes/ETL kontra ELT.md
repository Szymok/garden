---

title: ETL kontra ELT  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- ETL
- ELT
- integracja danych
- hurtownie danych
- data pipeline  
aliases:
- ETL vs ELT

---

# 🎯 Definicja

**ETL (Extract, Transform, Load)** oraz **ELT (Extract, Load, Transform)** to dwa dominujące paradygmaty budowy potoków integracji danych. Podstawowa różnica polega na tym, że **ETL** transformuje dane przed załadowaniem ich do systemu docelowego (np. hurtowni danych), natomiast **ELT** realizuje transformacje już po ich załadowaniu — bezpośrednio w środowisku docelowym, z reguły za pomocą SQL lub dedykowanych narzędzi.

# 🔑 Kluczowe punkty

- **ETL:** Transformacje “przed” ładowaniem, dane są oczyszczane i przetwarzane zanim trafią do hurtowni.
- **ELT:** Ładowanie surowych danych do hurtowni — transformacje wykonywane na miejscu przez silnik systemu docelowego.
- **Wydajność:** ELT korzysta z optymalizacji i skalowalności nowoczesnych rozwiązań chmurowych/warehousów.
- **Elastyczność:** ELT ułatwia późniejsze modyfikacje i eksperymenty, ETL wymaga wcześniejszego przewidzenia wszystkich przypadków użycia.
- **Demokratyzacja pracy z danymi:** ELT (np. [[dbt]], SQL) otwiera możliwość transformacji analitykom, nie tylko inżynierom.

# 📚 Szczegółowe wyjaśnienie

## ETL – klasyczny paradygmat

- Dane są najpierw pobierane z systemu źródłowego, następnie oczyszczane, scalane, mapowane i dopiero potem ładowane do systemu docelowego (np. Oracle, Teradata).
- Typowe środowiska ETL: [[Business Intelligence|BI]] lat 90. i 2000, gdzie miejsce przechowywania było drogie a transformacje musiały minimalizować objętość transferowanych danych.
- Narzędzia: Informatica, IBM DataStage, SSIS, Talend.

## ELT – nowoczesne podejście chmurowe

- Pozyskujemy dane ze źródeł, ładujemy je “as is” do wysoko skalowalnej hurtowni lub [[Data Lakehouse|lakehouse]]’a (np. Snowflake, BigQuery, Redshift).
- Transformacje wykonywane są w docelowej bazie — szybciej, taniej i z możliwością versionowania oraz testowania (np. [[dbt]]).
- Narzędzia: [[dbt]], Dataform (transformacje); Airbyte, Fivetran, Meltano (Extract + Load); orchestratory: [[Apache Airflow|Airflow]], [[Dagster]].

## Ilustracja podejścia

- **ETL:** Extract → Transform → Load
- **ELT:** Extract → Load → Transform (transformacje na surowych danych w hurtowni SQL/[[Data Lakehouse|lakehouse]])

# ⚖️ Tabela porównawcza ETL vs ELT

|Cecha|ETL|ELT|
|---|---|---|
|Miejsce transformacji|Przed ładowaniem (upstream)|Po ładowaniu, w systemie docelowym|
|Dane w systemie docelowym|Przekształcone|Surowe + dowolna liczba warstw T|
|Elastyczność raportowania|Ograniczona do zdefiniowanych T|Maksymalna, raporty “ad hoc”|
|Koszty zmian|Wysokie – reprocessing danych|Niskie – dane surowe zawsze dostępne|
|Wymagania techniczne|Programista/inżynier ETL|Analityk SQL, data engineer|
|Typowe platformy|On-premise, klasyczna hurtownia|Chmura, cloud warehouse/[[Data Lakehouse\|lakehouse]]|

# 🚧 Wady ETL w porównaniu z ELT

- Tylko transformowane dane trafiają do hurtowni — brak możliwości nowych modeli lub korekt analitycznych bez kosztownego reprocessingu.
- Wszelkie zmiany lub błędy w transformacji wymagają ponownego pobrania i przetworzenia danych u źródła.
- Trudności w spójności historycznej — brak “raw data” do ponownych analiz.
- Podejście mniej dostępne dla osób spoza zespołu inżynierii (transformacje poza SQL/SaaS).

# 💡 Przykład zastosowania

**ETL:**  
Instytucja finansowa korzysta z narzędzia SSIS do pobierania dziennych danych o transakcjach, filtruje niepotrzebne rekordy i zarządza typami pól przed załadowaniem do hurtowni Oracle. Dane w hurtowni zawierają tylko zdefiniowane wcześniej miary i wymiarów — ponowna zmiana raportu wymaga kosztownego reprocessingu całości źródeł.

**ELT:**  
Start-up e-commerce wykorzystuje Airbyte i [[dbt]] do ładowania wszystkich danych clickstream “as is” do BigQuery, gdzie analitycy samodzielnie modelują i testują transformacje SQL bez dotykania oryginalnych rekordów. Firma zyskuje szybki czas wdrożenia oraz natychmiastowy dostęp do surowej historii.

# 🤖 Porównanie narzędzi ETL i ELT

Szczegółowa porównywarka narzędzi, w tym integracje ze źródłami i miejsca docelowymi dostępna tutaj:

- [Porównanie narzędzi ETL (Airbyte)](https://airbyte.com/etl-tools-comparison)

# 📌 Źródła

- [Arkusz porównawczy narzędzi ETL/ELT – Airbyte](https://docs.google.com/spreadsheets/d/1QKrtBpg6PliPMpcndpmkZpDVIz_o6_Y-LWTTvQ6CfHA/edit)
- [Porównanie narzędzi ETL – Airbyte Blog](https://airbyte.com/etl-tools-comparison)
- [dbt: ETL vs ELT](https://www.getdbt.com/blog/etl-vs-elt/)

# 👽 Brudnopis

- ETL: transformacja upstream, stricte pipeline, schema on write, bardziej kontrola jakości
- ELT: raw data, transformacje SQL/[[dbt]], versionowanie, elastyczny downstream
- Nowoczesne integratory (Fivetran, Airbyte, Meltano), warehouse’y (BigQuery, Snowflake)
- Różnice kosztowe, wydajnościowe, team skills
- Przykład: startup vs korporacja, e-commerce vs bankowość