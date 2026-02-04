---
title: Dagster
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - dagster
  - orchestration
  - python
  - data-assets
aliases:
  - Orkiestrator Danych
  - Software-Defined Assets
---
# 🎯 Definicja
[**Dagster**](https://dagster.io/) to nowoczesna platforma do **orkiestracji danych**, która redefiniuje podejście do pipeline'ów ETL. Zamiast skupiać się na zadaniach ("zrób X, potem Y"), skupia się na **aktywach danych** ("mam tabelę X i tabelę Y, która zależy od X"). Dzięki modelowi **Software-Defined Assets (SDA)**, kod definiuje stan docelowy danych, a orkiestrator sam wie, co i w jakiej kolejności uruchomić.

# 🔑 Kluczowe punkty
- **Asset-Centric:** Podstawową jednostką nie jest `Task`, ale `Asset` (np. Tabela w Snowflake, Plik Parquet, Model ML).
- **Deklaratywność:** Definiujesz "co to jest", a nie tylko "jak to zrobić".
- **Testowalność:** Dagster od początku był projektowany z myślą o Unit Testach i łatwym lokalnym developmencie (czego brakuje w Airflow).
- **Observability:** Wbudowany Lineage, śledzenie metadanych i logów w kontekście konkretnego zasobu danych.

# 📚 Szczegółowe wyjaśnienie
W tradycyjnym orkiestratorze (np. Airflow) masz graf zadań: `Pobierz -> Przetwórz -> Wyślij`. Jeśli pipeline się uda, zakładasz, że dane są OK.
W Dagsterze definiujesz:
```python
@asset
def raw_users():
    return read_csv("users.csv")

@asset
def clean_users(raw_users):
    return clean(raw_users)
```
Dagster wie, że `clean_users` zależy od `raw_users`. Jeśli zmieni się `raw_users`, system wie, że `clean_users` jest "stale" (przestarzały) i wymaga odświeżenia. To podejście zbliżone do React.js, ale dla danych.

# 💡 Przykład zastosowania
Budujesz ML Pipeline.
1.  Asset A: Surowe dane z BigQuery.
2.  Asset B: Features (cechy) wyliczone z A.
3.  Asset C: Wytrenowany model korzystający z B.
4.  Asset D: Raport skuteczności modelu.
Jeśli poprawisz logikę w B, Dagster automatycznie wie, że trzeba przeliczyć C i D, ale A można zostawić w spokoju. W wizualnym interfejsie Dagit widzisz stan każdego klocka.

## 📌 Źródła
- [Dagster Docs](https://docs.dagster.io/)
- "Software-Defined Assets" Manifesto.

## 👽 Brudnopis
- Działa świetnie z [[dbt]] (traktuje modele dbt jako assety).
- Posiada "Sensors" do uruchamiania pipeline'ów na zdarzenie (np. pojawienie się pliku w S3).
- Konkurencja: Apache Airflow (imperatywny), Prefect (hybrydowy), Mage.ai.