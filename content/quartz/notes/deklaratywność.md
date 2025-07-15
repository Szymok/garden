---

title: Deklaratywność  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- deklaratywność
- programowanie funkcyjne
- orkiestracja
- data pipelines  
aliases:
- programowanie deklaratywne
- podejście deklaratywne

---

# 🎯 Definicja

**Deklaratywność** (ang. _declarativeness_) to styl definiowania logiki programowej lub pipeline’ów, w którym użytkownik opisuje _co_ chce osiągnąć, a nie _jak_ to osiągnąć. Zamiast określania sekwencji kroków (kontroli przepływu), twórca deklaruje końcowy stan lub oczekiwany rezultat. To podejście znajduje szerokie zastosowanie w inżynierii danych, szczególnie w kontekście orkiestracji, płynności pipeline’ów, modelowania danych czy transformacji.

# 🔑 Kluczowe punkty

- **Opisuje cel, nie procedurę** – zamiast „kroku po kroku”, opisujesz „co ma być uzyskane”.
- **Ułatwia automatyzację i optymalizację przez system** – orchestrator lub silnik może dowolnie zaplanować wykonania.
- **Fundament funkcjonalnej inżynierii danych i czystych pipeline’ów.**
- **Silny związek z testowalnością, kontrolą wersji i obserwowalnością danych.**
- Zbliżony do filozofii „Infrastructure as Code” czy „software-defined data”.

# 📚 Szczegółowe wyjaśnienie

## Deklaratywność vs Imperatywność

|Cecha|Podejście deklaratywne|Podejście imperatywne|
|---|---|---|
|Co zamiast jak|✔️ Opis „co ma być”|❌ Instrukcja „jak to zrobić”|
|Automatyzacja i optymalizacja|✔️ Engine sam wpina kroki|❌ Ty musisz zdefiniować przepływ ręcznie|
|Debuggowanie i testowanie|✔️ Jasne warunki końcowe|❌ Skupienie na implementacji kroków|
|Przykład|Definicja modelu w dbt (`SELECT ...`)|DAG w Airflow ze zdefiniowaną sekwencją tasków|
|Kod|DSL, YAML, SQL, API|Python, Procedural Script|

## Deklaratywność w inżynierii danych

### Przykłady deklaratywnego podejścia

- **dbt:** definicje modeli w SQL – `select` definiuje produkowany zestaw danych, a orchestracja, zależności i cache obsługuje silnik.
- **Dagster SDA / Software-Defined Assets:** deklaracja „ten asset powinien istnieć” – silnik decyduje, kiedy i jak go obliczyć.
- **Terraform:** deklaracja stanu infrastruktury jako kod – zamiast imperatywnego skryptu deployującego instancje.
- **SQL:** klasyczny przykład – zapytania opisują wynik, a nie algorytm wykonania.

### Główne korzyści:

- ✨ **Powtarzalność** – pipeline zawsze odtwarza te same wyniki bazując na definicji rezultatów.
- 🔍 **Obserwowalność i analiza błędów** – łatwo ustalić, czego brakuje w oczekiwanych artefaktach (np. brak tabeli LTV_2024).
- 📐 **Skalowalność operacyjna** – orchestratorzy rozumieją zależności i mogą optymalizować wykonanie.
- 🛠️ **Testowalność i audytowalność** – deklaracje są izolowane i możliwe do wersjonowania w Git.

## Node logic: "ten produkt danych powinien istnieć"

Tak opisuje się np. w Dagster, dbt, Cube lub Looker View:  
Każda jednostka (asset, metryka, model) ma ściśle zdefiniowaną sygnaturę i zależności. Dzięki temu cała orkiestracja działa „wprzód” względem celu (target), a nie od zera jak w tradycyjnych DAG-ach.

# 💡 Przykład zastosowania

Zespół danych definiuje model `customer_lifetime_value` jako asset w Dagsterze przy użyciu dekoratora `@asset`. Funkcja deklaruje jedynie inputy i transformację (np. model ML, SQL). Orchestrator decyduje, kiedy i w jakiej kolejności uruchomić obliczenia (na podstawie potrzeb downstream i materiałizacji danych). Inżynierowie nie muszą już ręcznie zarządzać zadaniami — ważne jest tylko to, _co_ powinno powstać i _z jakich danych_.

## 📌 Źródła

- [The Declarative Manifesto – Dagster Blog](https://dagster.io/blog/the-declarative-manifesto)
- [Programowanie deklaratywne – Wikipedia](https://pl.wikipedia.org/wiki/Programowanie_deklaratywne)
- [Declarative vs Imperative Pipelines – Airbyte](https://airbyte.com/blog/data-orchestration-trends)
- [Functional Data Engineering – Maxime Beauchemin](https://maximebeauchemin.medium.com/functional-data-engineering-a-modern-paradigm-for-batch-data-processing-2327ec32c42a)

# 👽 Brudnopis

- Deklaratywne = _co_, a nie _jak_
- DSL, modele danych, asset-y, metryki – wszystkie opisane poprzez deklaracje
- Imperatywne = zadania, kolejność, ręczne retry, kod proceduralny
- Deklaratywność ≈ clean DAGs without orchestration logic
- Otwarcie na Future-of-Work: samooptymalizujące się pipeline’y, mniej DevOps overhead
- Zobacz też: Software-Defined Assets, Warstwa Miary, dbt, Cube, Dagster, Declarative Manifesto