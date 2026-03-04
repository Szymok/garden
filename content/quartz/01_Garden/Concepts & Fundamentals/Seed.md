---
title: Seed (Ziarno Losowości)
created: 2026-02-04
status: evergreen
category: Machine Learning / Basics
difficulty: basic
language: pl
tags:
  - seed
  - randomness
  - reproducibility
  - python
  - numpy
aliases:
  - Random Seed
  - Punkt Startowy
---
# 🎯 Definicja
**Seed (Ziarno)** to liczba, która sprawia, że "losowość" w komputerze staje się powtarzalna.
Komputery nie potrafią rzucać kostką. Używają algorytmów pseudolosowych. Jeśli podasz ten sam Seed (np. `42`), algorytm zawsze wygeneruje ten sam ciąg liczb.

# 🔑 Kluczowe punkty
- **Reprodukowalność:** Kluczowa w nauce. Jeśli Twój eksperyment AI zadziałał dzisiaj, musi zadziałać jutro u kolegi. Seed to gwarantuje.
- **Debugging:** Jeśli błąd zdarza się tylko przy pechowym losowaniu danych, ustawienie Seeda pozwala go odtwarzać w nieskończoność i naprawić.

# 📚 Szczegółowe wyjaśnienie
W Pythonie:
```python
import random
random.seed(42)
print(random.randint(0, 100)) # Zawsze wypisze np. 81
```
Bez `seed()`, komputer bierze jako ziarno aktualny czas (milisekundy), więc za każdym razem wynik jest inny.

# 💡 Przykład zastosowania
Trenujesz sieć neuronową.
Inicjalizacja wag jest losowa.
Jeśli nie ustawisz Seeda, Twój model raz będzie miał Accuracy 90%, a raz 88% - tylko przez przypadek.
Ustawiasz `torch.manual_seed(42)` i masz pewność, że zmiana wyniku wynika z Twoich poprawek w kodzie, a nie z losowości.

## 📌 Źródła
- Numpy Random Seed documentation.

## 👽 Brudnopis
- Dlaczego 42? To odpowiedź na "Wielkie Pytanie o Życie, Wszechświat i całą resztę" z "Autostopem przez Galaktykę". Programiści to lubią.