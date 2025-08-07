---

title: Imperatywność  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- imperatywne programowanie
- inżynieria danych
- orkiestracja
- pipelines  
aliases:
- programowanie imperatywne

---

# 🎯 Definicja

**Imperatywność** (ang. _imperative approach_) to styl tworzenia systemów i pipeline’ów danych, w którym inżynier jawnie określa kolejność wykonywania kroków (operacji) — czyli opisuje _jak_ osiągnąć oczekiwany rezultat. W podejściu imperatywnym budujesz logiczny przepływ na podstawie kolejnych kroków, które system ma wykonać — często w formie ułożonych zadań, poleceń lub wywołań funkcji.

# 🔑 Kluczowe punkty

- **Jawne sterowanie przepływem logiki**: inżynier określa kolejność operacji (np. Task A → Task B → Task C).
- **Podejście proceduralne**: logiczna kontrola i zależności muszą zostać wyraźnie zakodowane.
- **Typowe dla klasycznych systemów orkiestracyjnych ([[Apache Airflow|Airflow]], Luigi)**.
- **Większa elastyczność, ale mniejsza optymalizacja** na poziomie wykonania.
- **Kontrastuje z deklaratywnością**, gdzie wyrażasz _co_ chcesz osiągnąć, a nie _jak_.

# 📚 Szczegółowe wyjaśnienie

## Pipeline imperatywny w inżynierii danych

W przypadku pipeline’u imperatywnego, inżynier:

1. Programuje sekwencję zadań i ich zależności.
2. Kontroluje warunki uruchamiania, retry, alertowanie.
3. Sam zarządza stanami i przepływem wykonania.

### Przykład w [[Apache Airflow]]:

```python
from airflow import DAG
from airflow.operators.python_operator import PythonOperator

def extract(): ...
def transform(): ...
def load(): ...

dag = DAG('etl_dag')
t1 = PythonOperator(task_id='extract', python_callable=extract, dag=dag)
t2 = PythonOperator(task_id='transform', python_callable=transform, dag=dag)
t3 = PythonOperator(task_id='load', python_callable=load, dag=dag)

t1 >> t2 >> t3  # jawna kolejność zadań
```

## Wady podejścia imperatywnego

- 👷‍♀️ Wysoka odpowiedzialność inżyniera: każda zmiana wymaga ręcznego dostosowania DAG-a.
- 🔄 Trudna optymalizacja globalna — silnik nie rozumie _celu_, tylko _kroki_.
- 📈 Duży koszt utrzymania przy dużych pipeline’ach.
- 🚫 Brak standaryzacji metryk/[[KPI]] — różne definicje mogą krążyć w różnych taskach.

## Imperatywność vs [[deklaratywność]]

|Cecha|Imperatywność|[[Deklaratywność]]|
|---|---|---|
|Sterowanie przepływem|Jawne, napisane przez użytkownika|Ukryte, realizowane przez silnik/planista|
|Przykład|[[Apache Airflow]], Prefect|[[dbt]], Dagster SDA, Cube, Terraform|
|Poziom abstrakcji|Niski – logika krok po kroku|Wysoki – definicja „co ma istnieć”|
|Testowalność|Trudniejsza – zależy od sekwencji|Lepsza – izolowane jednostki (assets)|
|Optymalizacja|Manualna|Automatyczna, zależna od silnika|

## Kiedy warto stosować imperatywność?

- W przetwarzaniu danych **operacyjnych**, gdzie wymagane są dokładne warunki uruchamiania zadań.
- W skomplikowanych DAG-ach zależnych od warunków logicznych.
- W środowiskach, gdzie kontrola nad retry, SLA, powiadomieniami, cache’ami ma priorytet.

# 💡 Przykład zastosowania

Zespół danych używa **Apache [[Apache Airflow|Airflow]]**, aby zbudować codzienny pipeline klasycznego ETL z danymi transakcyjnymi. W DAG-u definiują osobne kroki: ekstrakcja z baz danych, przekształcenie plików z S3, łączenie danych i ładowanie do hurtowni. Kolejność i retry logic zostały ręcznie zaprogramowane. Choć efektywne, pipeline wymaga intensywnej konserwacji — każda zmiana source’a czy flow wymaga edycji kodu DAG.

## 📌 Źródła

- [Airflow Docs – DAG Design](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/dags.html)
- [Dagster Docs – Vergleich deklaratywny vs imperatywny](https://docs.dagster.io/concepts/assets/software-defined-assets)
- [Orkiestracja danych – trendy 2024 – Airbyte Blog](https://airbyte.com/blog/data-orchestration-trends)

# 👽 Brudnopis

- Imperatywny pipeline = jawna kolejność kroków + kontrola wykonania
- Programista musi myśleć „jak działa system” – większe techniczne wymagania
- Brak optymalizacji: deklaratywny silnik może „zrozumieć graph”, imperatywny – nie
- Przykład: [[Apache Airflow|Airflow]] DAG z taskami PythonOperator, Bash i transferami między nimi
- Odstaje od „Data as Product” i reuse: każda metryka musi być reimplementowana
- Alternatywa: dbt, Dagster Asset Graph, z definicjami danych zamiast zadań