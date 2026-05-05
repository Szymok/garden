---

title: Co to jest Data Lineage  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data lineage
- monitoring danych
- dokumentacja danych
- analiza danych  
aliases:
- śledzenie pochodzenia danych
- rodowód danych

---

# 🎯 Definicja

**Data Lineage** (rodowód danych) to proces śledzenia ścieżki, jaką dane przebywają w organizacji — od momentu ich powstania w systemie źródłowym, przez kolejne etapy przetwarzania (np. integracja, transformacja), aż do ich końcowego wykorzystania w analizach, dashboardach czy modelach ML. Linia danych odpowiada na pytania: _skąd pochodzą dane, jak zostały zmienione, kto je modyfikował i gdzie są wykorzystywane_.

# 🔑 Kluczowe punkty

- Data Lineage zapewnia **widoczność przepływu danych** przez systemy, pipeline’y i transformacje.
- Pomaga analizować wpływ zmian (impact analysis) i określić, co zostanie dotknięte zmianą upstream.
- Niezbędne w audycie, zgodności regulacyjnej (np. RODO, SOX) i zarządzaniu jakością danych.
- Ułatwia rozwiązywanie błędów i problemów wykrytych w metrykach lub raportach końcowych.
- Może łączyć warstwy techniczne (SQL, pipelines) z warstwą semantyczną (produkty danych, miary BI).

# 📚 Szczegółowe wyjaśnienie

## Elementy Data Lineage

- **Źródła danych** – skąd pochodzą: bazy produkcyjne, API, pliki.
- **Transformacje** – co dzieje się z danymi: agregacja, oczyszczanie, anonimizacja, enrichment.
- **Systemy pośrednie i docelowe** – gdzie dane są przechowywane i przetwarzane: staging, warehouse, lake.
- **Użytkownicy i aplikacje** – kto lub co korzysta z danych: modele ML, dashboardy Power BI, visibility przez API.

## Typy lineage

- **Technical lineage** – konkretne zależności między tabelami, kolumnami, jobami w repozytorium kodu (SQL, dbt DAG, Airflow).
- **Business lineage** – zestawienie jak dane wpływają na wskaźniki, procesy biznesowe (np. “Miesięczna sprzedaż” używa danych ze źródła X, z atrybutów Y).
- **Operational lineage** – informacje logujące kto, kiedy i jak modyfikował dane. Często używane w Data Governance.

## Jak generowane jest Data Lineage?

- Automatycznie: poprzez narzędzia ETL/ELT, dbt (DAG), systemy katalogowania (np. DataHub, Atlan, Collibra).
- Ręcznie: dokumentacja tworzona i uzupełniana przez inżynierów danych.
- Często: mix manualnego opisu i automatycznego zbierania metadanych (śledzenie DAG, query parsing).

## Rola w ekosystemie danych

- Wspiera strukturę odpowiedzialności (Data Ownership).
- Ułatwia rozwiązywanie incydentów jakości danych (data observability).
- Dokumentuje zależności w projektach dbt, Airflow czy Spark.
- Ułatwia audyty i analizę zgodności (np. skąd pochodzi dana metryka KPI w raporcie zarządu).

# 💡 Przykład zastosowania

Zespół BI odkrywa, że wartości kolumny „przychód_miesięczny” są podejrzanie zaniżone. Dzięki systemowi Data Lineage analizują ścieżkę powstawania danej metryki:

- Dane źródłowe pochodzą z systemu ERP →
- Przechodzą przez job integracyjny Apache Airbyte →
- Zapisują się do stagingowej tabeli w Snowflake →
- Transformowane za pomocą pipeline dbt (model core__revenue) →
- Wykorzystywane w metryce w Looker.

Błąd został zidentyfikowany w joinie w modelu dbt – szybka naprawa zapobiegła propagacji błędnych danych do raportów zarządczych.

## 📌 Źródła

- [What is Data Lineage? – IBM](https://www.ibm.com/topics/data-lineage)
- [Data Lineage in Modern Data Stack – Alation](https://www.alation.com/blog/what-is-data-lineage/)
- [dbt Docs & Lineage Graph](https://docs.getdbt.com/docs/building-a-dbt-project/documentation)

## 👽 Brudnopis

- Data Lineage = skąd pochodzi dane + co się z nimi działo + gdzie są wykorzystane
- Visual DAG – jak w dbt → model A korzysta z tabeli B tworzonej z C → wartości z A wpływają na dashboard D
- Pożyteczne m.in. w: debugowaniu danych, compliance, katalogowaniu, „auditability”
- Automatyzowane: dbt, Airflow, DataHub, Marquez, OpenMetadata
- Działa w tandem z Data Contracts i katalogiem danych (Data Catalog)
- Przykład: wartość KPI w Power BI, jak została policzona i które dane weszły w skład wskaźnika