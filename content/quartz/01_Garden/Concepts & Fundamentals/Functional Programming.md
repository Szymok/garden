---
title: Functional Programming (Programowanie Funkcyjne)
created: 2026-02-04
status: evergreen
category: Computer Science / Paradigms
difficulty: advanced
language: pl
tags:
  - functional-programming
  - python
  - scala
  - immutability
  - pure-functions
aliases:
  - Programowanie Funkcyjne
  - Paradygmat funkcyjny
---
# 🎯 Definicja
**[[Programowanie Funkcyjne|Programowanie Funkcyjne]] (FP)** to styl pisania kodu, w którym traktujesz program jak wielkie równanie matematyczne, a nie jak listę rozkazów dla procesora. Kluczem są **funkcje**, które nie zmieniają stanu świata (Side Effects), tylko zwracają nowe wartości.

# 🔑 Kluczowe punkty
- **Immutability (Niezmienność):** Zamiast zmieniać listę `x.append(1)`, tworzysz nową listę `y = x + [1]`. To zapobiega błędom wielowątkowym.
- **Pure Functions (Czyste Funkcje):** Funkcja `f(x)` zawsze zwraca to samo dla tego samego `x` i nie wysyła maili ani nie pisze do bazy w ukryciu.
- **Higher-Order Functions:** Funkcje mogą przyjmować inne funkcje jako argumenty (`map`, `filter`, `reduce`).

# 📚 Szczegółowe wyjaśnienie
W Data Engineering (np. w Spark, [[dbt|dbt]]) FP jest bardzo naturalne.
Pipeline danych to: `Dane Wejściowe -> f(transformacja) -> Dane Wyjściowe`.
Nie interesuje nas stan pamięci procesora, tylko przepływ danych.

# 💡 Przykład zastosowania
Python (hybrydowo):
```python
# Imperatywnie (zmienia stan):
lista = [1, 2, 3]
for i in range(len(lista)):
    lista[i] = lista[i] * 2

# Funkcyjnie (nowa wartość):
lista = [1, 2, 3]
nowa_lista = list(map(lambda x: x * 2, lista))
```
W FP kod jest często krótszy, łatwiejszy do testowania i bezpieczniejszy.

## 📌 Źródła
- "Structure and Interpretation of Computer Programs" (SICP).
- "Functional Programming written in Scala".

## 👽 Brudnopis
- [[SQL|SQL]] jest językiem deklaratywnym, bliskim FP. Mówisz "CO" chcesz (Select), a nie "JAK" to zrobić (Pętle).
