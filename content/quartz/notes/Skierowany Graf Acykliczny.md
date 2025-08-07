---

title: Skierowany Graf Acykliczny (DAG - Directed Acyclic Graph)  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- DAG
- grafy
- orkiestracja danych
- lineage  
aliases:
- DAG
- Directed Acyclic Graph
- Graf acykliczny

---

# 🎯 Definicja

**Skierowany Graf Acykliczny (DAG, ang. Directed Acyclic Graph)** to [[Strukturyzacja danych|struktura danych]] składająca się z zestawu wierzchołków (węzłów) i skierowanych krawędzi między nimi, przy czym graf nie zawiera żadnych cykli — nie da się wrócić do punktu wyjścia przez serię połączeń. DAG umożliwia jednoznaczne uporządkowanie zadań lub zależności w przetwarzaniu danych, co czyni go idealnym do modelowania potoków danych i procesów transformacji.

# 🔑 Kluczowe punkty

- **Skierowany**: każda krawędź ma kierunek (od węzła rodzica do dziecka).
- **Acykliczny**: brak możliwości utworzenia pętli — nie można wrócić do tego samego węzła.
- **Kolejność zależności**: Graf wyraża zależności między krokami procesu (np. ETL, transformacji danych).
- **[[Idempotentność|Idempotencja]] i retry**: dzięki strukturze DAG, możliwe jest bezpieczne ponowne uruchamianie tylko wybranych fragmentów procesu.
- **Zastosowanie w Data Engineeringu — orkiestracja, lineage, obserwowalność.**

# 📚 Szczegółowe wyjaśnienie

## Zastosowanie DAG w inżynierii danych

W systemach takich jak **Apache [[Apache Airflow|Airflow]]**, **[[Dagster]]**, **Prefect** czy **[[dbt]]**, DAG reprezentuje potok przetwarzania danych:

- **Węzeł (node)**: oznacza krok w potoku (np. ekstrakcję, transformację, agregację).
- **Krawędź (edge)**: reprezentuje zależność — jeden krok musi zakończyć się sukcesem, by drugi mógł się rozpocząć.
- **Flow danych**: DAG pozwala ustalić, które zadania można uruchomić równolegle, a które muszą nastąpić po sobie.

## Cechy funkcjonalne DAG

- **Deterministyczność**: przy tych samych danych wejściowych – te same wyniki.
- **[[Idempotentność|Idempotencja]]**: każdy krok może być bezpiecznie uruchomiony wielokrotnie – patrz: [[Idempotentność]].
- **Debuggowanie i retry**: w przypadku błędu można powtórzyć tylko problematyczny krok, a nie cały potok.
- **Rozszerzalność**: łatwo dodawać nowe węzły i zależności bez przebudowy całego workflow.

## Przykładowe narzędzia wykorzystujące DAG

|Narzędzie|Opis|
|---|---|
|**[[Apache Airflow]]**|Planowanie i zarządzanie złożonymi pipeline’ami danych|
|**[[Dagster]]**|Podejście typu "[[Data Source\|data asset]]-oriented" z deklaratywnym API|
|**[[dbt]]**|[[Modelowanie danych]] w SQL jako DAG transformacji|
|**Prefect**|Nowoczesna orkiestracja z retry, caching, task runnerami|

## Przykład graficzny DAG

Przykładowy DAG potoku danych:

```
raw_data_ingest
       ↓
transform_clean_data
       ↓
aggregate_to_metrics
       ↓
publish_to_dashboard
```

Każdy z tych kroków jest od siebie zależny i może zostać uruchomiony tylko wtedy, gdy jego poprzednik zakończy się pomyślnie.

# 💡 Przykład zastosowania

W architekturze danych e-commerce, zespół buduje pipeline oparty o Apache Airflow, w którym:

- Task A: pobiera dane zamówień z API (`extract_orders`)
- Task B: oczyszcza dane (`clean_orders`)
- Task C: agreguje dane dzienne (`agg_daily_orders`)
- Task D: publikuje dane do Tableau (`update_dashboard`)

Wszystkie kroki są modelowane jako DAG. Jeśli podczas agregacji (Task C) wystąpi błąd, można ponownie uruchomić tylko ten krok — nie trzeba uruchamiać ekstrakcji ani integracji z Tableau. Struktura DAG pozwala również na analizę pochodzenia danych (_data lineage_) i automatyczne planowanie przetwarzania (np. codzienna aktualizacja).

## 📌 Źródła

- [Airflow DAG Concepts](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/dags.html)
- [Dagster — Asset Graphs and Lineage](https://docs.dagster.io/concepts/assets)
- [dbt Docs — DAG](https://docs.getdbt.com/docs/build/building-models/graph-overview)
- [Wikipedia: Directed Acyclic Graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)

# 👽 Brudnopis

- DAG: Directed → każde połączenie ma kierunek
- Acykliczny → brak cykli, nie ma pętli
- DAG ≠ drzewo — mogą być wierzchołki z wieloma parentami
- Istotne w przetwarzaniu danych, [[Business Intelligence|BI]], orkiestracji
- Struktura bazowa np. w [[dbt]]: każdy model SQL to węzeł DAG
- Retry, flow control, impact analysis, parallelism → wszystko dostępne dzięki DAG
- DAG = mapowanie zależności logicznych między taskami – nie wykres ładowania danych