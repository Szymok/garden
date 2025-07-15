---

title: Apache Airflow  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- Apache Airflow
- orkiestracja danych
- workflow as code
- DAG
- Python
- Maxime Beauchemin  
aliases:
- Airflow
- orchestrator danych

---

# 🎯 Definicja

**Apache Airflow** to otwartoźródłowy system orkiestracji przepływów pracy (data workflows), zaprojektowany do tworzenia, harmonogramowania i monitorowania zadań w formie kodu. Umożliwia budowę złożonych pipeline’ów przetwórczych jako DAG-ów (Directed Acyclic Graphs). Airflow został opracowany przez Maxime'a Beauchemina w Airbnb i szybko stał się de facto standardem orkiestracji w inżynierii danych.

# 🔑 Kluczowe punkty

- **Imperatywne podejście ("Workflow as Code")** – kodujesz logikę i zależności między zadaniami ręcznie w Pythonie.
- **Pipeline’y jako DAG** – logiczne zależności między zadaniami odwzorowane w postaci grafu acyklicznego.
- **Dynamiczne tworzenie DAG-ów** – dzięki wykorzystaniu Pythona można programowo generować przepływy pracy.
- **Rozszerzalność** – możliwość budowania własnych operatorów i integracji z zewnętrznymi systemami.
- **Bogaty interfejs graficzny (UI)** – podgląd statusu zadań, logów, uruchomień i historii workflow.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Apache Airflow?

Airflow przekształca każdy pipeline w DAG, którego węzły (taski) to operacje do wykonania – np. ekstrakcja danych, transformacja, walidacja, eksport. DAG definiuje kolejność wykonywania zadań oraz momenty ich uruchomienia.

### Przykład kodu DAG:

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def extract(): ...
def transform(): ...
def load(): ...

with DAG('etl_pipeline', start_date=datetime(2025, 1, 1), schedule_interval='@daily') as dag:
    t1 = PythonOperator(task_id='extract', python_callable=extract)
    t2 = PythonOperator(task_id='transform', python_callable=transform)
    t3 = PythonOperator(task_id='load', python_callable=load)

    t1 >> t2 >> t3  # uporządkowanie zadań jako kierunkowy przepływ
```

## Funkcje i możliwości

- ✅ **Pure Python** – definicje DAG-ów i tasków w Pythonie, bez DSL czy dodatkowych narzędzi.
- 🔄 **Retry i SLA** – możliwość automatycznego ponawiania zadań, śledzenia opóźnień (Service-Level Agreement).
- ✨ **Jinja2 templating** – wbudowane szablony do dynamicznego tworzenia zapytań SQL, ścieżek, itp.
- 🌐 **Integracje** – obsługuje m.in.: Google Cloud, AWS, Azure, Docker, Kubernetes, Slack, Airbyte.

## Zastosowanie Airflow w praktyce

- Budowa i harmonogramowanie pipeline’ów ETL/ELT
- Zautomatyzowane pobieranie i przetwarzanie danych z API
- Koordynacja startu modeli Machine Learning
- Generowanie raportów i batchowe aktualizacje dashboardów BI

# 💡 Przykład zastosowania

Zespół danych w firmie e-commerce korzysta z Airflow do orchestracji codziennego pipeline'u przetwarzania zamówień:

- t1: pobranie danych z API sklepu (operator HttpSensor + PythonOperator)
- t2: walidacja rekordów (task sprawdzający null/duplicaty)
- t3: załadowanie danych do hurtowni (BigQueryOperator)
- t4: restart refreshu dashboardu BI (WebhookOperator)

Każdy z tasków jest jawnie zdefiniowany w kodzie DAG i może być niezależnie retry’owany w razie błędów.

## 📌 Źródła

- [Apache Airflow – Oficjalna strona](https://airflow.apache.org)
- [Airflow Docs: DAG Concepts](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/dags.html)
- [Maxime Beauchemin – Medium: Functional Data Engineering](https://maximebeauchemin.medium.com/functional-data-engineering-a-modern-paradigm-for-batch-data-processing-2327ec32c42a)

# 👽 Brudnopis

- Imperatywny: określasz _jak_ i _co_, vs Dagster/dbt (_co ma powstać_)
- DAG jako metafora flow: data lineage eksplorowane przez zależności
- UI: monitoring, manual trigger, calendar, retry
- Elastyczność > automatyka (decyzja użytkownika co i jak), ale większy koszt utrzymania
- Ścisła integracja z taskami infrastrukturalnymi, np. Bash, Python, KubernetesPodOperator
- Airflow jako standard → wiele organizacji ma go jako podstawowego scheduler’a