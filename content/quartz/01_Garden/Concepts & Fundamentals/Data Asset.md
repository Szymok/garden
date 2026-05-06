---

title: "Data Asset"  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- data asset
- produkt danych
- data governance  
aliases:
- ZasÃ³b danych
- Data Resource

---

# ðŸŽ¯ Definicja

**Data Asset** (ZasÃ³b Danych) to trwaÅ‚y, identyfikowalny obiekt zawierajÄ…cy dane, ktÃ³ry przedstawia rzeczywistoÅ›Ä‡ w ustrukturyzowany lub nieustrukturyzowany sposÃ³b. MoÅ¼e to byÄ‡ tabela, raport, model ML, strumieÅ„ danych lub plik CSV. Data Asset ma okreÅ›lonÄ… wartoÅ›Ä‡ analitycznÄ… i technologicznÄ…, moÅ¼e byÄ‡ wersjonowany, katalogowany oraz zarzÄ…dzany.

# ðŸ”‘ Kluczowe punkty

- **TrwaÅ‚oÅ›Ä‡ i identyfikowalnoÅ›Ä‡:** Data Asset istnieje w Å›rodowisku technicznym jako konkretny byt (np. tabela w SQL, model w repozytorium).
- **Przechwytuje â€žpoznanie Å›wiataâ€** â€“ np. zachowania uÅ¼ytkownikÃ³w, transakcje, prognozy.
- **Element zarzÄ…dzania danymi:** stanowi podstawowÄ… jednostkÄ™ w katalogach danych, platformach typu Data Catalog czy rozwiÄ…zaniach Governance.
- **Odseparowany od kontekstu biznesowego:** w przeciwieÅ„stwie do Produktu Danych, nie musi posiadaÄ‡ warstwy interpretacyjnej, uÅ¼ytkownikÃ³w, SLA.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Data Asset vs Produkt Danych

|Cecha|Data Asset|Produkt Danych|
|---|---|---|
|PrzykÅ‚ad|tabela â€žuser_events_2023â€|model â€žcustomer_churn_score_v2â€ jako oferta dla dziaÅ‚u marketingu|
|Poziom|Techniczny|Biznesowo-techniczny|
|WÅ‚aÅ›ciciel|CzÄ™sto zespÃ³Å‚ inÅ¼ynierii danych|Domenowy zespÃ³Å‚ danych|
|Dokumentacja|MoÅ¼e byÄ‡ minimalna|Powinna zawieraÄ‡ opis celu, uÅ¼ycia i SLA|
|WidocznoÅ›Ä‡|WewnÄ…trz platformy danych|UdostÄ™pniany biznesowi przez katalogi i API|

## Typowe typy Data Assets

- **Tabela lub widok w bazie danych (np. Snowflake, BigQuery)**
- **Model ML (np. Pickle, joblib, PyTorch model)**
- **Metryki lub kalkulacje przechowywane jako warstwy metryk**
- **Zestawy danych statycznych (CSV, JSON, Parquet) w Lakehouse**
- **API zwracajÄ…ce dane lub pipeline DAG**
- **Dashboard/szablon raportu w BI (np. Looker, Power BI)**

## W kontekÅ›cie Data Mesh i Data Products

W podejÅ›ciu Data Mesh, Data Asset to techniczny byt istniejÄ…cy wewnÄ…trz nadzorowanej domeny (np. tabela faktÃ³w w hurtowni), ale dopiero gdy zostanie wzbogacony o odpowiedzialnoÅ›Ä‡, dokumentacjÄ™, opis celu i warstwy SLA â€” staje siÄ™ Produktem Danych.

# ðŸ’¡ PrzykÅ‚ad zastosowania

W hurtowni danych Snowflake znajduje siÄ™ tabela `order_items_2024`, generowana przez codzienny pipeline z systemu transakcyjnego. Ten zasÃ³b posiada narzÄ™dzia do wersjonowania, lineage, metadanych oraz testÃ³w jakoÅ›ci. W katalogu danych klasyfikowana jest jako "Data Asset" â€“ surowe dane faktÃ³w sprzedaÅ¼owych, ktÃ³re inne zespoÅ‚y mogÄ… wykorzystaÄ‡ dalej przy budowie dostÄ™pnych produktÃ³w danych.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [Data Mesh Glossary: Data Asset](https://datameshlearning.com)
- [Google Cloud â€“ Introduction to Data Assets](https://cloud.google.com/dataplex/docs/concepts/data-assets)
- [Atlan Blog â€“ What is a Data Asset?](https://atlan.com/data-assets/)

## ðŸ‘½ Brudnopis

- Data Asset: â€žfizycznaâ€ jednostka danych: plik, tabela, model, widok, API
- Produkt Danych = data asset + value + dokumentacja + SLA + discoverability
- KaÅ¼dy Produkt Danych zawiera co najmniej jeden Data Asset
- ZarzÄ…dzanie assetami = wersjonowanie, lineage, steward, kontrola dostÄ™pu
- PrzykÅ‚ady: tabela faktÃ³w, pickle z predykcjÄ…, endpoint /api/metrics/json
- Metryki miar (dbt metrics layer) jako asset reuse w raportach i modelach ML