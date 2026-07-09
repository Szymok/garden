---

title: Apache Spark  
created: 2025-07-15  
status: 🌱 draft
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- Apache Spark
- DataEngineering
- BigDataProcessing
- MachineLearning
- open source  
aliases:
- Apache Spark Engine

---

# 🎯 Definicja

**Apache Spark™** to otwartoźródłowy, wielojęzyczny silnik do rozproszonego przetwarzania dużych wolumenów danych, szeroko stosowany w inżynierii danych, uczeniu maszynowym oraz analityce Big Data. Spark umożliwia operacje zarówno na pojedynczych maszynach, jak i skalowalnych klastrach, oferując wysoką wydajność dzięki przetwarzaniu danych w pamięci (in-memory processing).

# 🔑 Kluczowe punkty

- **Rozproszony silnik danych:** Obsługuje [[Przetwarzanie danych|przetwarzanie danych]] na dużą skalę—idealny do Big Data.
- **Wsparcie wielu języków:** Programowanie w Scala, Python (PySpark), Java, R, [[SQL|SQL]].
- **Przetwarzanie in-memory:** Znacząco przyspiesza analizy i obliczenia względem tradycyjnych systemów dyskowych (np. Hadoop [[MapReduce|MapReduce]]).
- **Modularna architektura:** Obejmuje Spark [[SQL|SQL]], Spark Streaming (przetwarzanie strumieniowe), MLlib ([[Uczenie Maszynowe|uczenie maszynowe]]), GraphX (przetwarzanie grafowe).
- **Integracja z chmurą:** Gotowy do uruchamiania w chmurach publicznych oraz w [[Kubernetes|Kubernetes]].
- **Kompatybilność:** Łączy się z HDFS, S3, bazami relacyjnymi, Cassandra, Hive, [[Delta Lake|Delta Lake]] itp.

# 📚 Szczegółowe wyjaśnienie

## Architektura

Apache Spark działa w modelu master-worker, gdzie:

- **Driver** zarządza aplikacją i planuje zadania.
- **Worker Nodes** wykonują faktyczne przetwarzanie (taski) na partycjach danych.
- **Cluster Manager** (YARN, Mesos, [[Kubernetes|Kubernetes]], czy Spark Standalone) zarządza zasobami klastra.

### Przetwarzanie in-memory

Silnik Spark trzyma obliczenia i główne zestawy danych w pamięci RAM, co pozwala efektywnie “drążyć” dane, wykonywać wielokrotne analizy ad-hoc i wysoce równolegle prowadzić eksperymenty z uczeniem maszynowym.

### Moduły Spark

|Moduł|Przeznaczenie|
|---|---|
|**Spark [[SQL|SQL]]**|[[Analiza Danych|Analiza danych]] tablicowych i [[SQL|SQL]]|
|**Spark Streaming**|[[Przetwarzanie danych|Przetwarzanie danych]] strumieniowych (real time)|
|**MLlib**|Wbudowana biblioteka uczenia maszynowego|
|**GraphX**|Analiza grafów i relacji|

## Spark na [[Kubernetes|Kubernetes]]

Apache Spark obsługuje natywne uruchamianie w środowisku [[Kubernetes|Kubernetes]], które pozwala:

- **Automatycznie skalować** zasoby (pody workerów) do wymagań jobów.
- **Zarządzać wdrożeniami** w modelu Infrastructure as Code.
- **Ułatwiać integrację** z popularnymi narzędziami chmurowymi, monitorowaniem, CI/CD.
- **Tworzyć środowiska multi-tenant** i dynamicznie dzielić klaster dla różnych zespołów/projektów.

# 💡 Przykład zastosowania

Firma telekomunikacyjna przetwarza miliardy rekordów billingowych i sygnałów połączeń w czasie rzeczywistym, wykorzystując Spark Streaming na platformie [[Kubernetes|Kubernetes]]. Dane są analizowane pod kątem wykrywania fraudów, modelowania churnu i dynamicznej alokacji zasobów sieciowych, a modele maszyny uczącej są wdrażane w MLlib do przewidywania awarii i segmentacji klientów.

# 📌 Źródła

- [Apache Spark – Oficjalna dokumentacja](https://spark.apache.org/docs/latest/)
- [Przetwarzanie Big Data w Apache Spark – Databricks](https://databricks.com/glossary/what-is-apache-spark)
- [Spark on Kubernetes – Kubernetes docs](https://spark.apache.org/docs/latest/running-on-kubernetes.html)
- [Apache Spark – Overview – IBM Cloud](https://www.ibm.com/cloud/learn/apache-spark)

# 👽 Brudnopis

- Silnik in-memory, rozproszony, batch & streaming + MLlib
- Native cloud/K8s, dynamic scaling, integracja z Lakehouse i cloud storage ([[Delta Lake|Delta Lake]], S3)
- PySpark jako główny interfejs do Data Engineering/ML na Spark
- Popularne scenariusze: ETL batch, modele ML produkcyjnie, przetwarzanie clickstreamów, rekomendacje
- Rywalizacja: Dask, Flink (streaming), [[Pandas|Pandas]]/Polars (lokalnie), Databricks platforma (komercyjna Spark)
- Unified approach: batch+stream+ML+[[SQL|SQL]] = jeden silnik dla całego pipeline’u danych

---