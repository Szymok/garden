---

title: Co to jest Data Lineage  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- data lineage
- monitoring danych
- dokumentacja danych
- analiza danych  
aliases:
- Å›ledzenie pochodzenia danych
- rodowÃ³d danych

---

# ðŸŽ¯ Definicja

**Data Lineage** (rodowÃ³d danych) to proces Å›ledzenia Å›cieÅ¼ki, jakÄ… dane przebywajÄ… w organizacji â€” od momentu ich powstania w systemie ÅºrÃ³dÅ‚owym, przez kolejne etapy przetwarzania (np. integracja, transformacja), aÅ¼ do ich koÅ„cowego wykorzystania w analizach, dashboardach czy modelach ML. Linia danych odpowiada na pytania: _skÄ…d pochodzÄ… dane, jak zostaÅ‚y zmienione, kto je modyfikowaÅ‚ i gdzie sÄ… wykorzystywane_.

# ðŸ”‘ Kluczowe punkty

- Data Lineage zapewnia **widocznoÅ›Ä‡ przepÅ‚ywu danych** przez systemy, pipelineâ€™y i transformacje.
- Pomaga analizowaÄ‡ wpÅ‚yw zmian (impact analysis) i okreÅ›liÄ‡, co zostanie dotkniÄ™te zmianÄ… upstream.
- NiezbÄ™dne w audycie, zgodnoÅ›ci regulacyjnej (np. RODO, SOX) i zarzÄ…dzaniu jakoÅ›ciÄ… danych.
- UÅ‚atwia rozwiÄ…zywanie bÅ‚Ä™dÃ³w i problemÃ³w wykrytych w metrykach lub raportach koÅ„cowych.
- MoÅ¼e Å‚Ä…czyÄ‡ warstwy techniczne (SQL, pipelines) z warstwÄ… semantycznÄ… (produkty danych, miary BI).

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Elementy Data Lineage

- **Å¹rÃ³dÅ‚a danych** â€“ skÄ…d pochodzÄ…: bazy produkcyjne, API, pliki.
- **Transformacje** â€“ co dzieje siÄ™ z danymi: agregacja, oczyszczanie, anonimizacja, enrichment.
- **Systemy poÅ›rednie i docelowe** â€“ gdzie dane sÄ… przechowywane i przetwarzane: staging, warehouse, lake.
- **UÅ¼ytkownicy i aplikacje** â€“ kto lub co korzysta z danych: modele ML, dashboardy Power BI, visibility przez API.

## Typy lineage

- **Technical lineage** â€“ konkretne zaleÅ¼noÅ›ci miÄ™dzy tabelami, kolumnami, jobami w repozytorium kodu (SQL, dbt DAG, Airflow).
- **Business lineage** â€“ zestawienie jak dane wpÅ‚ywajÄ… na wskaÅºniki, procesy biznesowe (np. â€œMiesiÄ™czna sprzedaÅ¼â€ uÅ¼ywa danych ze ÅºrÃ³dÅ‚a X, z atrybutÃ³w Y).
- **Operational lineage** â€“ informacje logujÄ…ce kto, kiedy i jak modyfikowaÅ‚ dane. CzÄ™sto uÅ¼ywane w Data Governance.

## Jak generowane jest Data Lineage?

- Automatycznie: poprzez narzÄ™dzia ETL/ELT, dbt (DAG), systemy katalogowania (np. DataHub, Atlan, Collibra).
- RÄ™cznie: dokumentacja tworzona i uzupeÅ‚niana przez inÅ¼ynierÃ³w danych.
- CzÄ™sto: mix manualnego opisu i automatycznego zbierania metadanych (Å›ledzenie DAG, query parsing).

## Rola w ekosystemie danych

- Wspiera strukturÄ™ odpowiedzialnoÅ›ci (Data Ownership).
- UÅ‚atwia rozwiÄ…zywanie incydentÃ³w jakoÅ›ci danych (data observability).
- Dokumentuje zaleÅ¼noÅ›ci w projektach dbt, Airflow czy Spark.
- UÅ‚atwia audyty i analizÄ™ zgodnoÅ›ci (np. skÄ…d pochodzi dana metryka KPI w raporcie zarzÄ…du).

# ðŸ’¡ PrzykÅ‚ad zastosowania

ZespÃ³Å‚ BI odkrywa, Å¼e wartoÅ›ci kolumny â€žprzychÃ³d_miesiÄ™cznyâ€ sÄ… podejrzanie zaniÅ¼one. DziÄ™ki systemowi Data Lineage analizujÄ… Å›cieÅ¼kÄ™ powstawania danej metryki:

- Dane ÅºrÃ³dÅ‚owe pochodzÄ… z systemu ERP â†’
- PrzechodzÄ… przez job integracyjny Apache Airbyte â†’
- ZapisujÄ… siÄ™ do stagingowej tabeli w Snowflake â†’
- Transformowane za pomocÄ… pipeline dbt (model core__revenue) â†’
- Wykorzystywane w metryce w Looker.

BÅ‚Ä…d zostaÅ‚ zidentyfikowany w joinie w modelu dbt â€“ szybka naprawa zapobiegÅ‚a propagacji bÅ‚Ä™dnych danych do raportÃ³w zarzÄ…dczych.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [What is Data Lineage? â€“ IBM](https://www.ibm.com/topics/data-lineage)
- [Data Lineage in Modern Data Stack â€“ Alation](https://www.alation.com/blog/what-is-data-lineage/)
- [dbt Docs & Lineage Graph](https://docs.getdbt.com/docs/building-a-dbt-project/documentation)

## ðŸ‘½ Brudnopis

- Data Lineage = skÄ…d pochodzi dane + co siÄ™ z nimi dziaÅ‚o + gdzie sÄ… wykorzystane
- Visual DAG â€“ jak w dbt â†’ model A korzysta z tabeli B tworzonej z C â†’ wartoÅ›ci z A wpÅ‚ywajÄ… na dashboard D
- PoÅ¼yteczne m.in. w: debugowaniu danych, compliance, katalogowaniu, â€žauditabilityâ€
- Automatyzowane: dbt, Airflow, DataHub, Marquez, OpenMetadata
- DziaÅ‚a w tandem z Data Contracts i katalogiem danych (Data Catalog)
- PrzykÅ‚ad: wartoÅ›Ä‡ KPI w Power BI, jak zostaÅ‚a policzona i ktÃ³re dane weszÅ‚y w skÅ‚ad wskaÅºnika