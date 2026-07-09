---
title: ReLU (Rectified Linear Unit)
created: 2026-02-04
status: evergreen
category: Deep Learning / Activation Functions
difficulty: basic
language: pl
tags:
  - relu
  - activation-function
  - neural-networks
  - deep-learning
aliases:
  - Funkcja aktywacji ReLU
---
# 🎯 Definicja
**ReLU** to najpopularniejsza [[Funkcja aktywacji|funkcja aktywacji]] w sieciach neuronowych. Jest banalnie prosta: "Jeśli liczba jest ujemna, zamień ją na zero. Jeśli dodatnia, zostaw bez zmian".
Wzór: `f(x) = max(0, x)`.

# 🔑 Kluczowe punkty
- **Szybkość:** Bardzo łatwa do policzenia dla komputera (w przeciwieństwie do Sigmoid czy Tanh, które wymagają potęgowania).
- **Nieliniowość:** Mimo prostoty, pozwala sieciom uczyć się skomplikowanych wzorców.
- **Standard:** Domyślny wybór w większości nowoczesnych sieci (CNN, Transformery).

# 📚 Szczegółowe wyjaśnienie
Dlaczego "zerowanie ujemnych" jest takie ważne?
Wprowadza nieliniowość. Bez tego sieć neuronowa byłaby tylko wielką macierzą mnożenia (regresją liniową), niezdolną do rozpoznawania twarzy czy rozumienia języka.
Problem ReLU: **Dying ReLU**. Jeśli [[Neuron|neuron]] "utknie" na ujemnych wartościach, na zawsze pozostanie zerem i przestanie się uczyć. (Rozwiązanie: Leaky ReLU).

# 💡 Przykład zastosowania
W sieci rozpoznającej obrazy (CNN), ReLU jest stosowane po każdym splocie (Convolution). Pozwala "odciąć szum" (ujemne wartości pikseli po filtracji) i przepuścić tylko silne sygnały (krawędzie, kształty).

## 📌 Źródła
- "Deep Sparse Rectifier [[Neural Networks|Neural Networks]]" (Glorot et al.).

## 👽 Brudnopis
- Jeśli nie wiesz, jakiej funkcji aktywacji użyć w warstwach ukrytych, użyj ReLU. W warstwie wyjściowej użyj Softmax (klasyfikacja) lub Linear (regresja).