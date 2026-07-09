---

title: "Data Asset"  
created: 2025-07-15  
status: 🌱 draft
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data asset
- produkt danych
- data governance  
aliases:
- Zasób danych
- Data Resource

---

# 🎯 Definicja

**Data Asset** (Zasób Danych) to trwały, identyfikowalny obiekt zawierający dane, który przedstawia rzeczywistość w ustrukturyzowany lub nieustrukturyzowany sposób. Może to być tabela, raport, model ML, strumień danych lub plik CSV. Data Asset ma określoną wartość analityczną i technologiczną, może być wersjonowany, katalogowany oraz zarządzany.

# 🔑 Kluczowe punkty

- **Trwałość i identyfikowalność:** Data Asset istnieje w środowisku technicznym jako konkretny byt (np. tabela w [[SQL|SQL]], model w repozytorium).
- **Przechwytuje „poznanie świata”** – np. zachowania użytkowników, transakcje, prognozy.
- **Element zarządzania danymi:** stanowi podstawową jednostkę w katalogach danych, platformach typu [[Data Catalog|Data Catalog]] czy rozwiązaniach Governance.
- **Odseparowany od kontekstu biznesowego:** w przeciwieństwie do Produktu Danych, nie musi posiadać warstwy interpretacyjnej, użytkowników, SLA.

# 📚 Szczegółowe wyjaśnienie

## Data Asset vs [[Produkt Danych|Produkt Danych]]

|Cecha|Data Asset|[[Produkt Danych|Produkt Danych]]|
|---|---|---|
|Przykład|tabela „user_events_2023”|model „customer_churn_score_v2” jako oferta dla działu marketingu|
|Poziom|Techniczny|Biznesowo-techniczny|
|Właściciel|Często zespół inżynierii danych|Domenowy zespół danych|
|Dokumentacja|Może być minimalna|Powinna zawierać opis celu, użycia i SLA|
|Widoczność|Wewnątrz platformy danych|Udostępniany biznesowi przez katalogi i API|

## Typowe typy Data Assets

- **Tabela lub widok w bazie danych (np. [[Snowflake|Snowflake]], BigQuery)**
- **Model ML (np. Pickle, joblib, PyTorch model)**
- **Metryki lub kalkulacje przechowywane jako warstwy metryk**
- **Zestawy danych statycznych (CSV, JSON, Parquet) w Lakehouse**
- **API zwracające dane lub pipeline DAG**
- **Dashboard/szablon raportu w BI (np. Looker, Power BI)**

## W kontekście [[Data Mesh|Data Mesh]] i Data Products

W podejściu [[Data Mesh|Data Mesh]], Data Asset to techniczny byt istniejący wewnątrz nadzorowanej domeny (np. tabela faktów w hurtowni), ale dopiero gdy zostanie wzbogacony o odpowiedzialność, dokumentację, opis celu i warstwy SLA — staje się Produktem Danych.

# 💡 Przykład zastosowania

W hurtowni danych [[Snowflake|Snowflake]] znajduje się tabela `order_items_2024`, generowana przez codzienny pipeline z systemu transakcyjnego. Ten zasób posiada narzędzia do wersjonowania, lineage, metadanych oraz testów jakości. W katalogu danych klasyfikowana jest jako "Data Asset" – surowe dane faktów sprzedażowych, które inne zespoły mogą wykorzystać dalej przy budowie dostępnych produktów danych.

## 📌 Źródła

- [Data Mesh Glossary: Data Asset](https://datameshlearning.com)
- [Google Cloud – Introduction to Data Assets](https://cloud.google.com/dataplex/docs/concepts/data-assets)
- [Atlan Blog – What is a Data Asset?](https://atlan.com/data-assets/)

## 👽 Brudnopis

- Data Asset: „fizyczna” jednostka danych: plik, tabela, model, widok, API
- [[Produkt Danych|Produkt Danych]] = data asset + value + dokumentacja + SLA + discoverability
- Każdy [[Produkt Danych|Produkt Danych]] zawiera co najmniej jeden Data Asset
- Zarządzanie assetami = wersjonowanie, lineage, steward, kontrola dostępu
- Przykłady: tabela faktów, pickle z predykcją, endpoint /api/metrics/json
- Metryki miar ([[dbt|dbt]] metrics layer) jako asset reuse w raportach i modelach ML