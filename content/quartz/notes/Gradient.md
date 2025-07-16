---

title: Gradient  
created: 2025-07-16  
status: Final  
category: Uczenie maszynowe  
difficulty: średniozaawansowany  
language: pl  
tags:

- uczenie maszynowe
- deep learning
- sieci neuronowe
- optymalizacja
- gradient  
aliases:
- pochodna kierunkowa
- gradient funkcji straty
- spadek gradientowy

---

# 🎯 Definicja

**Gradient** to wektor pochodnych cząstkowych funkcji w odniesieniu do jej zmiennych wejściowych. W kontekście uczenia maszynowego i sieci neuronowych, gradient wskazuje kierunek i szybkość największego wzrostu (lub spadku) funkcji — najczęściej funkcji straty (loss function). Jest fundamentem algorytmów optymalizacji takich jak **spadek gradientowy (gradient descent)**.

# 🔑 Kluczowe punkty

- Gradient mówi, jak zmienić parametry modelu, aby **zmniejszyć funkcję straty**.
- Używany w **algorytmach optymalizacji**: np. SGD, Adam, RMSprop.
- Obliczany za pomocą **reguły łańcuchowej (chain rule)** w procesie zwanym **backpropagation**.
- Im bliżej minimum, tym gradienty mają mniejszą wartość — konwergencja.
- Zbyt duże gradienty → **eksplodujące gradienty**, zbyt małe → **zanikające gradienty**.

# 📚 Szczegółowe wyjaśnienie

Gradient dla funkcji $$ f(x, y, z) $$ to wektor składający się z pochodnych cząstkowych względem każdego parametru:

$$ \nabla f = \left[ \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z} \right] $$

W deep learningu typowa funkcja to strata $$ L(\theta) $$, gdzie $$ \theta $$ to parametry modelu (np. wagi sieci neuronowej).

### Przykład użycia:

W każdej iteracji uczącej (epoce) liczymy:

1. **Forward pass** – model przewiduje wynik (predykcja)
2. **Obliczenie loss** – porównanie predykcji z oczekiwaną wartością
3. **Backward pass** – obliczanie gradientu funkcji straty względem wag (backpropagation)
4. **Aktualizacja wag** – przesunięcie w kierunku przeciwnym do gradientu (Gradient Descent)

## Gradient Descent

$$ \theta = \theta - \eta \cdot \nabla_\theta L $$

Gdzie:

- $$ \theta $$ – parametry modelu
- $$ \eta $$ – stopień uczenia (learning rate)
- $$ \nabla_\theta L $$ – gradient funkcji straty względem parametrów modelu

## Gradienty w sieciach neuronowych

- Każda warstwa oblicza własne gradienty względem swojego wejścia i wag.
- Backpropagation propaguje gradienty od końca modelu ku początkom (output → input).
- Optymalizatory aktualizują parametry korzystając z gradientów warstw.

# 💡 Przykład zastosowania

W sieci neuronowej uczącej się rozpoznawania cyfr MNIST, parametrami są wagi warstw ukrytych. Podczas treningu gradient obliczony względem funkcji strat (np. cross-entropy) mówi, jak zmodyfikować wagi, by zmniejszyć błędy predykcji.

## 📌 Źródła

- Deep Learning — I. Goodfellow, Y. Bengio, A. Courville
- MIT 6.S191 — Introduction to Deep Learning (Lecture Notes)
- Neural Networks and Deep Learning — M. Nielsen
- PyTorch Docs — [https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html](https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html)

## 👽 Brudnopis

- gradient = wektor kierunku zmiany
- najprostsza forma — pochodna
- sieci neuronowe: gradienty propagowane przez warstwy → aktualizacja wag
- możliwe problemy: vanishing gradients (sigmoid, RNN), exploding gradients
- różne optymalizatory = różne sposoby wykorzystania gradientu: SGD, Adam, Adagrad
- autograd = automatyczne liczenie gradientów (np. w PyTorch, TensorFlow)
- ważne: gradient nie oznacza błędu – to kierunek do jego zmniejszenia

---