---

title: "MapReduce"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- hadoop
- big data
- distributed computing
- mapreduce  
aliases:
- map reduce
- przetwarzanie rozproszone

---

# 🎯 Definicja

**MapReduce** to paradygmat programowania obliczeń rozproszonych, zaprojektowany do efektywnego przetwarzania i generowania dużych zestawów danych na klastrach serwerów. Składa się z dwóch faz: `Map` (mapowania) i `Reduce` (redukowania), które umożliwiają równoległą i skalowalną analizę danych. MapReduce jest podstawowym komponentem w ekosystemie Apache Hadoop.

# 🔑 Kluczowe punkty

- MapReduce umożliwia **równoległe przetwarzanie danych** na setkach lub tysiącach węzłów.
- Składa się z dwóch funkcji: **Map** (operacje na danych wejściowych) i **Reduce** (agregacje wyników).
- Został spopularyzowany przez Google i zaimplementowany m.in. w Hadoop jako silnik przetwarzania wsadowego.
- Rewolucyjne podejście do **przetwarzania dużych zbiorów danych** z automatycznym rozproszeniem i tolerancją błędów.
- Aktualnie wykorzystywany głównie w systemach starszego typu lub jako koncepcja w nowoczesnych frameworkach Spark/Flink.

# 📚 Szczegółowe wyjaśnienie

## Jak działa MapReduce?

1. **Map (mapowanie):**
    
    - Każdy węzeł przetwarza fragment danych wejściowych.
    - Operacja `Map` przekształca dane w pary klucz-wartość **(key-value)**.
    - Przykład: (słowo, 1) dla zliczania słów w dokumencie.
2. **Shuffle and Sort (przesiewanie i sortowanie):**
    
    - System grupuje wynikowe pary z etapu `Map` według kluczy.
    - Wszystkie wartości o tym samym kluczu są łączone w jeden ciąg.
3. **Reduce (redukowanie):**
    
    - Funkcja `Reduce` agreguje/scala/zlicza wartości na podstawie wspólnego klucza.
    - Ostateczny wynik może być np. suma, średnia, maksimum.

### Przykład: Word Count (liczenie słów)

**Map Phase:**  
Input → „hello world hello”  
Output:  
(`hello`, 1), (`world`, 1), (`hello`, 1)

**Reduce Phase:**  
Po shuffle:  
(`hello`, ), (`world`, )  
Output:  
(`hello`, 2), (`world`, 1)

## Zalety

- **Skalowalność:** Dane mogą być przetwarzane na tysiącach węzłów równolegle.
- **Odporność na błędy:** Dzięki Hadoop Distributed File System (HDFS).
- **Prostota interfejsu programistycznego:** Map i Reduce to funkcje logiczne zaimplementowane niezależnie.

## Wyzwania i ograniczenia

- **Brak interaktywności:** MapReduce działa w trybie wsadowym – nie nadaje się do analiz czasu rzeczywistego.
- **Złożoność tworzenia pipelines:** Złożone operacje wymagają wielu etapów.
- **Wysokie opóźnienia (latency):** Nadaje się do dużych wolumenów, ale nie do niskiej latencji.

## Nowoczesne alternatywy

- **Apache Spark** – wykonuje przetwarzanie in-memory, szybsze niż MapReduce.
- **Apache Flink / Beam** – obsługuje strumieniowanie i sesje czasowe w sposób naturalny.
- **Databricks / Cloud native engines** – ułatwiają programowanie DAG zamiast sekwencji Map → Reduce.

# 💡 Przykład zastosowania

W firmie telekomunikacyjnej dane z logów połączeń telefonicznych były gromadzone w plikach HDFS. Zadania MapReduce używane były do agregacji minut rozmów przez regiony i godziny szczytu. Mimo że wydajne, z czasem architektura została zastąpiona Apache Spark w celu zmniejszenia czasu przetwarzania.

## 📌 Źródła

- Jeffrey Dean & Sanjay Ghemawat – "MapReduce: Simplified Data Processing on Large Clusters" (Google Research)
- [https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/)
- [https://en.wikipedia.org/wiki/MapReduce](https://en.wikipedia.org/wiki/MapReduce)

## 👽 Brudnopis

- Map = lokalne przekształcenie → emit (key, value)
- Reduce = agregacja po kluczu
- Shuffle między nimi = bottleneck wydajności
- Niezależne etapy → łatwo rozproszyć
- Hadoop MR = poprzednik Spark → duży latency, używany historycznie
- Typowe zastosowania: count, join, group, sum, deduplicate
- Brak wsparcia dla graph queries / ML → delegowane do Spark MLlib, GraphX
- Wciąż używane w niektórych pipelines offline/legacy

---