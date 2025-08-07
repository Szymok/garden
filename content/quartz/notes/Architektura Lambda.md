---

title: "Architektura Lambda"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- architektura danych
- stream processing
- batch processing
- lambda architecture  
aliases:
- lambda
- lambda data architecture
- lambda architektura danych

---

# 🎯 Definicja

**Architektura Lambda** to wzorzec architektoniczny przetwarzania danych, który łączy przetwarzanie wsadowe (batch) i strumieniowe (streaming), aby umożliwić wydajne, skalowalne i dokładne systemy analityczne. Została zaprojektowana z myślą o dużych wolumenach danych (Big Data), wymaganiach dotyczących przetwarzania w czasie rzeczywistym oraz wysokiej niezawodności.

# 🔑 Kluczowe punkty

- Łączy przetwarzanie wsadowe i strumieniowe dla zrównoważenia dokładności, opóźnień i wydajności.
- Dane są przetwarzane dwoma ścieżkami: **warstwa batch** (kompletna, dokładna wiedza) i **warstwa speed** (ciągła, niskie opóźnienia).
- Obie warstwy zapisują widoki danych do **warstwy serwera widoków (serving layer)**, gdzie są łączone w czasie prezentacji.
- Redundantność zwiększa odporność na błędy i umożliwia rewaluację danych.
- Wzorzec popularny w zastosowaniach wymagających aktualnych oraz precyzyjnych danych – np. w analizie logów, e-commerce, fraud detection.

# 📚 Szczegółowe wyjaśnienie

## Składniki Architektury Lambda

1. **Warstwa batch (batch layer):**
    
    - Gromadzi wszystkie historyczne dane i przetwarza je okresowo.
    - Wynik: tzw. batch views — [[Rollup|agregaty]], obliczenia, modele tworzone z pełnego zestawu danych.
    - Technologie: Hadoop MapReduce, Spark Batch, [[Apache Hive|Hive]], BigQuery.
2. **Warstwa speed (speed layer):**
    
    - Przetwarza dane strumieniowo, w wysokiej częstotliwości — aby dostarczyć **świeże dane** pomiędzy wsadami.
    - Wynik: tzw. real-time views — chwilowe, przybliżone wyniki.
    - Technologie: Apache Kafka, Spark Streaming, Flink, Storm, Pulsar.
3. **Warstwa serwowania (serving layer):**
    
    - Umożliwia łączenie i udostępnianie wyników batch i real-time w jednym punkcie.
    - Dostarcza interfejsy do zapytań analitycznych — API, SQL Engines, REST.
    - Technologie: Druid, HBase, Cassandra, Elasticsearch, Redis.

![lambda-architecture](images/data-lambda-architecture

- Nowe dane najpierw trafiają do warstwy speed i dają natychmiastowe rezultaty (np. aktualizacja dashboardu).
- Równolegle te same dane są zapisywane jako „truth data” do hurtowni / jeziora danych.
- W ustalonym interwale (co godzinę, dzień) uruchamiany jest batch job, który przetwarza cały zestaw danych – zapewniając dokładność.
- Podczas zapytań interfejs API łączy wyniki z warstwy speed i batch `view`, zapewniając użytkownikowi najlepszą możliwą odpowiedź.

## Zalety

- Połączenie niskiej latencji (speed layer) z wysoką dokładnością (batch layer).
- Odporność na błędy danych – dane są korygowane w przyszłych wsadach.
- Elastyczne podejście – osobne optymalizacje dla wsadowych i strumieniowych zadań.
- Skalowalność dzięki oddzielnym ścieżkom przetwarzania danych.

## Wady / Wyzwania

- Złożoność implementacyjna – trzeba utrzymywać dwie ścieżki kodu.
- Redundantne przetwarzanie – te same dane analizowane dwukrotnie.
- Trudności w synchronizacji widoków i deduplikacji.
- Wzorzec często zastępowany przez **Architekturę Kappa**, która wykorzystuje tylko streaming.

# 💡 Przykład zastosowania

Serwis transakcyjny analizuje dane o zakupach użytkowników. Warstwa speed oblicza wskaźniki konwersji i popularności produktów w czasie rzeczywistym, na potrzeby dashboardów marketingowych. Warstwa batch co godzinę wykonuje dokładne obliczenia [[KPI]], które są używane do raportów okresowych i modeli predykcyjnych.

## 📌 Źródła

- Lambda Architecture by Nathan Marz: [https://www.oreilly.com/library/view/big-data/9781118824824/](https://www.oreilly.com/library/view/big-data/9781118824824/)
- Databricks — Lambda vs Kappa Architectures
- AWS Lambda Architecture Guidelines: [https://docs.aws.amazon.com/whitepapers/latest/lambda-architecture-on-aws/welcome.html](https://docs.aws.amazon.com/whitepapers/latest/lambda-architecture-on-aws/welcome.html)

## 👽 Brudnopis

- Lambda = batch + speed + serving
- batch → dokładność, speed → aktualność
- serving → merge logiczne VIEW
- MapReduce zbyt wolne – potrzeba speed layer → Spark Streaming
- Duplikacja logiki i stanu → koszt ang. engineering & data QA
- [[Data Lakehouse|Lakehouse]] + stream unifikacja → trend przejścia na architekturę jednolitą
- Kiedy warto: równoważenie precyzji z latencją, np. monitoring, analityka zachowań
- Amazon, Netflix, Twitter – historyczne wdrożenia lambda

---