---

title: Software-Defined Assets  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria danych
- Dagster
- orchestration
- software-defined assets
- deklaratywność
- lineage  
aliases:
- zasoby zdefiniowane programowo

---

# 🎯 Definicja

**Software-Defined Assets (SDA)**, czyli zasoby zdefiniowane programowo, to podejście do zarządzania danymi, w którym zasoby danych (tabele, modele, metryki) są deklarowane bezpośrednio w kodzie – jako funkcje w systemie orkiestracyjnym. Koncepcja została zaproponowana i zaimplementowana przez zespół **[[Dagster]]**, jako fundament **deklaratywnej orkiestracji danych**. SDA zapewniają pełne odwzorowanie pochodzenia danych (_data lineage_), reproducowalność i możliwość zarządzania przepływami danych przy pomocy wersjonowanego kodu.

# 🔑 Kluczowe punkty

- **Deklaratywna definicja zasobów danych**: opisanie, _co_ ma istnieć, a nie _jak_ to zbudować.
- **Kod jako źródło prawdy (IaC dla danych)**: zasoby są zdefiniowane funkcjami z nazwami, opisem i kontrolą wersji.
- **Orkiestracja oparta na danych, nie zadaniach**: orchestrator rozumie, czym są dane, a nie tylko operacje na nich.
- **Pełna inspekcyjność i kontrola lini dziedziczenia (lineage)**: widoczność związku między źródłami, modelem i konsumentami danych.
- **Element nowoczesnych narzędzi orkiestracyjnych z „ciemną logiką” przeniesioną do warstwy semantycznej.**

# 📚 Szczegółowe wyjaśnienie

## Na czym polega różnica?

⛔️ W podejściu klasycznym (imperatywnym):

- Tworzysz DAG (np. w [[Apache Airflow|Airflow]]), który operuje na zadaniach – nie na konkretnych danych.
- Aby zrozumieć przepływ danych, trzeba analizować kod poszczególnych zadań i zależności.

✅ W Software-Defined Assets:

- Definiujesz dane jako wyjście funkcji — np. `@asset def customer_orders()`.
- Każdy zasób ma ścisły input/output i nazwę stanowiącą element globalnego modelu danych.
- [[Dagster]] orkiestruje zależności między zasobami automatycznie na podstawie ich sygnatury.

## Kluczowe właściwości SDA

|Właściwość|Opis|
|---|---|
|[[Deklaratywność]]|Skupia się na _co_ ma być osiągnięte – a nie _jak_ to zrealizować.|
|Izolacja i testowalność|Każdy asset to funkcja – można ją testować jednostkowo.|
|Wersjonowalność|Każda zmiana definicji zasobu może być kontrolowana przez system VCS.|
|Obserwowalna linia dziedziczenia|Orchestrator zna, skąd pochodzą dane i kto z nich korzysta.|
|Aktywna kompozycja|SDA mogą być dowolnie łączone, organizowane i komponowane.|

## Zastosowania

- Budowanie wersjonowalnych i testowalnych pipeline’ów o wysokiej przejrzystości.
- Orkiestracja zestawów danych z precyzyjnym modelem zależności: danych wejściowych, miar, modeli [[Uczenie Maszynowe|ML]].
- Automatyczna dokumentacja i monitoring linii pochodzenia danych.
- Budowa warstwy semantycznej na assetach, np. Modele w [[dbt]] jako SDA w Dagsterze.

## Integracja z paradygmatem funkcjonalnym

Zasoby SDA są blisko spokrewnione z ideą **funkcjonalnej inżynierii danych**:

- Funkcja deterministyczna, deklaratywna, bez efektów ubocznych → zasób danych.
- Zasób danych to wynik funkcji dla określonego zestawu danych wejściowych.
- Dzięki czystości i braku stanu, możliwa jest pełna automatyzacja testów, retry’ów i restartingów.

# 💡 Przykład zastosowania

Zespół danych buduje pipeline do generowania prognoz sprzedaży sklepowej. Korzystając z Dagstera i podejścia SDA:

- Definiują `raw_sales` jako zasób powstały z danych z API.
- `clean_sales` to asset oczyszczający dane — przetwarzany jako funkcja z `raw_sales`.
- `forecast_model` otrzymuje dane `clean_sales` oraz metadane kalendarzowe.
- Wszystkie trzy funkcje/zasoby są zdefiniowane w kodzie DAG i wersjonowane w repozytorium Git.

[[Dagster]] buduje DAG automatycznie, raportuje szczelność lineage i oferuje view panel SDAs.

## 📌 Źródła

- [Functional [[Inżynieria Danych|Data Engineering]] — [[Maxime Beauchemin]]](https://maximebeauchemin.medium.com/functional-data-engineering-a-modern-paradigm-for-batch-data-processing-2327ec32c42a)
- [[[Dagster]] Logic Overview](https://docs.dagster.io/concepts/assets/software-defined-assets)
- [Community Day Video 2023 – Dagster](https://www.youtube.com/live/An78xLxM9zQ?feature=share)
- [Trendy w Orkiestracji Danych – Airbyte Blog](https://airbyte.com/blog/data-orchestration-trends)

# 👽 Brudnopis

- SDA = asset as function → czysto funkcyjne postrzeganie pipeline'u
- [[Dagster]] = orchestrator understands data, not just steps
- DRY, testowalność, modularność, lineage visibility
- zamiast: DAG 100 tasków → assety 1:1 jako funkcje
- powrót do danych, nie procesu: co, nie jak
- SDA x [[dbt]]: asset = model
- Przyszłość orkiestracji? Headless pipelines z semantyczną warstwą assetów jako API