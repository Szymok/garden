---

title: "Dagster"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- orkiestracja
- dagster
- data pipelines
- orkiestrator danych  
aliases:
- orchestrator danych
- dagster.io

---

# 🎯 Definicja

[**Dagster**](https://dagster.io/) to nowoczesna platforma do **orkiestracji danych** i budowy pipelines oparta na modelu "software-defined assets". Umożliwia tworzenie, testowanie, wdrażanie oraz monitorowanie zadań ETL/ELT i projektów danych z pełną obserwowalnością oraz kontrolą jakości. Stawia na [[Deklaratywność|podejście deklaratywne]], transparentność oraz rozwój zgodny ze standardami inżynierii oprogramowania.

# 🔑 Kluczowe punkty

- Umożliwia **zarządzanie aktywami danych (data assets)** jako obiektami pierwszorzędnymi w kodzie.
- Posiada **wbudowaną genealogię danych (data lineage)** i **obserwowalność** każdej transformacji i zależności.
- Wspiera **lokalne testowanie, środowiska staging**, współdzielone katalogi, deploye i kontrolę wersji assetów.
- Ułatwia **śledzenie świeżości danych**, metadanych i statusów aktywów (data freshness & health checks).
- Integruje się z narzędziami ekosystemu open source: [[dbt]], Airbyte, Snowflake, S3, PowerBI, [[DuckDB]] i więcej.
- Zaprojektowany z myślą o zespołach [[Inżynieria Danych|DataOps]]/AI/[[Uczenie Maszynowe|ML]] oraz inżynierach danych – wysoka ergonomia pracy programistycznej.

# 📚 Szczegółowe wyjaśnienie

## Główne cechy Dagstera

### 1. Asset-based orchestration

Dagster pozwala modelować dane jako aktywa (`@asset`) — np. tabele, modele [[Uczenie Maszynowe|ML]], [[Wizualizacja|wykresy]]. Aktywa te mają zależności, są wersjonowane i posiadają własne reguły update'ów (np. bazujące na świeżości upstream).

### 2. [[Deklaratywność]] i modularność

Pipeline to nie task po tasku (imperatywne DAGi jak w Airflow), ale zależności między aktywami. Zbudowany na Pythonie DAG opisuje _co zależy od czego_, nie _w jakiej kolejności to wykonać_.

### 3. Obserwowalność

Każdy run rejestruje dane wyjściowe, logi, metadata file-level i kolumnową. Portal UI (Dagster UI) pozwala przeglądać historię, kontrolować retry, wywoływać ponownie assety i debugować.

### 4. Development-first UX

- Możliwość testowania lokalnie (`dagster dev`), bez potrzeby deployowania.
- Obsługa m.in. branch deployments, wizualna inspekcja DAG-ów, logi i statusy online.
- Obsługa projektów mono-repo i funkcje CI/CD.

### 5. Zarządzanie środowiskami i harmonogramami

- Obsługa `jobs`, `sensors`, `triggers`, `partitions`, `resources`
- Podejście komponowalne i w pełni programowalne
- Harmonogramy cykliczne + reakcje na zdarzenia/presencję danych

## Dlaczego Dagster?

|Cechy|Opis|
|---|---|
|**Obiektowość danych**|Aktywa danych jako centralne byty – z genealogią, monitoringiem i metadanymi|
|**Testowalność**|Możliwość testów + stagingu przed produkcją|
|**User-friendly UI**|Nowoczesne, interaktywne narzędzie webowe z wizualizacjami DAG|
|**Integracje**|Rozbudowany ekosystem open-source i wsparcie ELT tools|
|**Deklaratywny styl kodowania**|Lepsze zarządzanie złożonością, większa modularność i przejrzystość|

# 💡 Przykład zastosowania

Firma e-commerce integruje dane z Airbyte (synchronizacja z API i baz), przekształca je z użyciem [[dbt]], a następnie prezentuje raporty w Power [[Business Intelligence|BI]]. Dagster jako warstwa orkiestracji:

- Wyzwala pipeline po pojawieniu się nowych danych w S3,
- Obsługuje wersjonowanie tabelek po stronie Snowflake,
- Monitoruje świeżość aktywów („czy raporty są aktualne względem danych z poprzedniej nocy?”),
- Pozwala na błyskawiczne ponowne uruchomienie konkretnego assetu po błędach upstream.

## 📌 Źródła

- [Oficjalna strona Dagster](https://dagster.io)
- [Blog – Modern [[Stos danych|Data Stack]] with Dagster](https://dagster.io/blog/)
- [GitHub – dagster-io/dagster](https://github.com/dagster-io/dagster)
- [ETL with Dagster – darmowy kurs (2025)](https://dagster.io/etl-course)

## 👽 Brudnopis

- dagster = SDK + orchestrator + lineage-sensitive platforma
- dekleratywna orkiestracja DAG = clean DAGs, odporność na zależności
- genialna dla [[Inżynieria Danych|DataOps]]: retries, run logs, asset freshness
- wygodniejszy niż airflow: brak kodowania imperatywnego + łatwiejsze testy
- stale się rozwija, kluczowy gracz [[Stos Danych Otwartych|open data stack]] obok [[dbt]]/airbyte/superset
- UI = wszystko: lineage, aktualność, podgląd danych, scheduler

---