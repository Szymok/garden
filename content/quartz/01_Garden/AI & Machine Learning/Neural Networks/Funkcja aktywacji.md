---
title: Funkcja Aktywacji (Activation Function)
created: 2026-02-04
status: evergreen
category: Deep Learning
difficulty: basic
language: pl
tags:
  - neural-networks
  - relu
  - sigmoid
  - non-linearity
aliases:
  - Activation Function
  - ReLU
  - Sigmoid
---
# 🎯 Definicja
**Funkcja Aktywacji** to matematyczna "bramka" wewnątrz sztucznego neuronu, która decyduje, czy i jak mocno neuron ma "wystrzelić" sygnał dalej. Najważniejszą rolą funkcji aktywacji jest wprowadzenie **nieliniowości**. Bez niej, sieć neuronowa (nawet z milionem warstw) byłaby matematycznie równoważna zwykłej regresji liniowej i nie mogłaby rozwiązywać skomplikowanych problemów.

# 🔑 Kluczowe punkty
- **Cel:** Wprowadzenie nieliniowości (pozwala modelować krzywe, a nie tylko linie proste).
- **Rodzaje:**
    - **Sigmoid:** Stara, zakres (0,1). Problem zanikającego gradientu.
    - **ReLU (Rectified Linear Unit):** Standard. `max(0, x)`. Szybka i skuteczna.
    - **Softmax:** Zamienia wyniki na prawdopodobieństwa (używana na wyjściu klasyfikatorów).

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie neuron jako funkcję: `y = f(wx + b)`.
Jeśli `f` jest liniowa (np. `f(x) = x`), to złożenie wielu takich funkcji nadal jest liniowe. Sieć nie nauczy się rozpoznawać twarzy (bo twarz to nie linia prosta).
Jeśli użyjemy np. ReLU (zeruj ujemne, przepuść dodatnie), sieć zyskuje zdolność "łamania" przestrzeni decyzyjnej i dopasowania się do dowolnie skomplikowanych danych.

# 💡 Przykład zastosowania
Sieć rozpoznająca cyfry od 0 do 9.
Warstwy ukryte: Używają **ReLU** (bo szybkie uczenie).
Warstwa wyjściowa (ostatnia): Używa **Softmax**.
Dlaczego? Bo na końcu chcemy dostać wynik typu: "80% że to Dwójka, 10% że Trójka...". Suma musi wynosić 100%. Softmax to zapewnia.

## 📌 Źródła
- "Deep Learning" - Ian Goodfellow.

## 👽 Brudnopis
- ReLU ma problem "Dying ReLU" (martwe neurony). Warianty: Leaky ReLU, GELU (używane w BERT/GPT).
- Wybór funkcji aktywacji to jeden z hiperparametrów sieci.