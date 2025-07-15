---

title: Programowanie Funkcyjne  
created: 2025-07-15  
status:  
category: Programowanie  
difficulty: średni  
language: pl  
tags:

- programowanie
- paradygmat funkcyjny
- deklaratywność
- czyste funkcje
- kodowanie  
aliases:
- Programowanie Funkcyjne w Pythonie
- Functional Programming

---

# 🎯 Definicja

**Programowanie funkcyjne** (ang. _functional programming_) to paradygmat programowania, który traktuje obliczenia jako ewaluację funkcji matematycznych. Kładzie nacisk na **czystość funkcji**, **niezmienność danych**, brak efektów ubocznych oraz deklaratywność kodu. Oznacza to, że wynik funkcji zależy tylko od jej argumentów wejściowych, a nie od kontekstu zewnętrznego czy stanu aplikacji.

# 🔑 Kluczowe punkty

- **Czyste funkcje:** Funkcje, które zawsze dla tych samych argumentów zwracają ten sam wynik i nie mają skutków ubocznych.
- **Niezmienność:** Zmienne nie zmieniają swojej wartości po zainicjowaniu (immutable data structures).
- **Deklaratywność:** Opisuje _co_ należy zrobić zamiast _jak_ to zrobić krok po kroku.
- **Programowanie wyższego rzędu:** Możliwość przekazywania funkcji jako argumentów i zwracania ich jako wyników.
- **Brak stanu globalnego:** Unikanie zmian zewnętrznych — cały stan przekazywany jest jawnie.

# 📚 Szczegółowe wyjaśnienie

## Przykłady operacji funkcyjnych

W Pythonie:

```python
# Czysta funkcja
def square(x):
    return x * x

# Funkcja wyższego rzędu: map()
numbers = [1, 2, 3, 4]
squares = list(map(square, numbers))  # 👉 [1, 4, 9, 16]

# Filter jako funkcja funkcyjna
evens = list(filter(lambda x: x % 2 == 0, numbers))  # 👉 [2, 4]
```

W Haskellu (języku funkcyjnym):

```haskell
square x = x * x
squares = map square [1, 2, 3, 4]
```

## Zalety programowania funkcyjnego

- ✅ **Czytelność i testowalność** – funkcje są niezależne i łatwe do przetestowania.
- ✅ **Debugowanie i traceability** – brak efektów ubocznych ułatwia lokalizację błędów.
- ✅ **Równoległość** – ponieważ dane nie są zmienne, kod łatwo drzewić i uruchamiać współbieżnie.
- ✅ **Przewidywalność** – funkcje zachowują się identycznie przy powtórzeniu.

## Zastosowania w praktyce

- **Data Engineering** – np. pipelines danych z zastosowaniem czystych transformacji (por. Funkcjonalny Data Engineering).
- **Web development (React)** – paradygmaty funkcyjne w zarządzaniu komponentami i stanem.
- **Programowanie rozproszone i równoległe** – brak stanu = mniej błędów przy concurrency.

## Przykładowe języki wspierające programowanie funkcyjne

|Język|Opis|
|---|---|
|**Haskell**|Czysty język funkcyjny, silny typ systemu, brak efektów ubocznych.|
|**Scala**|Hybryda funkcyjno-obiektowa, popularna w Sparku i data engineering.|
|**Elixir**|Funkcyjny język oparty o Erlanga – skalowalność systemów rozproszonych.|
|**Clojure**|Funkcyjny język dla JVM, bogaty ekosystem i wsparcie dla immutability.|
|**Python**|Nie jest stricte funkcyjny, ale obsługuje wiele koncepcji funkcyjnych.|
|**JavaScript**|Wspiera funkcje anonimowe, map, reduce – często stosowane we front-endzie.|

# 💡 Przykład zastosowania

W systemie przetwarzania danych zbudowanym na **dbt + Airflow**, zespoły wykorzystują czyste funkcje SQL bez efektów ubocznych, które transformują dane na podstawie zadeklarowanych modeli. Każdy model (`select`) opisuje jedynie _co_ powinno zostać uzyskane, a nie _w jaki sposób_ — jest to podejście zgodne z filozofią programowania funkcyjnego.

## 📌 Źródła

- [Functional Programming in Python – RealPython](https://realpython.com/python-functional-programming/)
- [Functional Data Engineering — Maxime Beauchemin](https://maximebeauchemin.medium.com/functional-data-engineering-a-modern-paradigm-for-batch-data-processing-2327ec32c42a)
- [Intro to Functional Programming – freeCodeCamp](https://www.freecodecamp.org/news/introduction-to-functional-programming/)

# 👽 Brudnopis

- czyste funkcje, brak side effectów, testowalność, ewaluacja leniwa, składanie funkcji
- FP → lepsza modularność, mniej błędów, deterministyczny wynik
- Python: `map`, `filter`, `reduce`, funkcje wyższego rzędu, lambda
- Dobry styl w modelowaniu pipelines, transformacjach, ML preprocessing
- DBA/BI: zrozumienie FP pomaga pisać lepsze modele logiczne (np. dbt, dagster SDA)
- FP vs Imperatywność: opis -> rezultat, nie sekwencja instrukcji