---
title: Neuron (Sztuczny)
created: 2026-02-04
status: evergreen
category: Deep Learning
difficulty: basic
language: pl
tags:
  - neural-networks
  - perceptron
  - activation-function
  - basics
aliases:
  - Perceptron
  - Węzeł sieci neuronowej
---
# 🎯 Definicja
**Sztuczny Neuron** to matematyczna cegiełka budująca sztuczną inteligencję. Jest to uproszczony model biologicznego neuronu. Działa jak mała funkcja: pobiera sygnały wejściowe, waży ich ważność, sumuje i decyduje, czy "wystrzelić" sygnał dalej (aktywacja).

# 🔑 Kluczowe punkty
- **Wejścia (Inputs):** Dane (x1, x2...), np. jasność piksela.
- **Wagi (Weights):** Siła połączenia (w1, w2...). "Jak ważne jest to wejście?". Uczenie sieci to po prostu szukanie odpowiednich wag.
- **Funkcja Aktywacji (Activation):** Decyzja. "Jeśli suma przekracza 5, wyślij 1. Jeśli nie, wyślij 0" (np. ReLU, Sigmoid).

# 📚 Szczegółowe wyjaśnienie
Matematycznie neuron to: `y = f(suma(x * w) + b)`.
Pojedynczy neuron (Perceptron) potrafi rozwiązać tylko proste problemy liniowe (np. oddzielić czarne kropki od białych kreską).
Ale miliony neuronów połączonych w warstwy tworzą **Sieć Neuronową** (Deep Learning), która potrafi rozpoznawać twarze, tłumaczyć języki i pisać wiersze (LLM).

# 💡 Przykład zastosowania
Neuron decydujący: "Czy iść na spacer?".
Wejścia:
1. Czy pada? (x1 = 1 [tak], waga = -10 [nienawidzę deszczu]).
2. Czy mam czas? (x2 = 1 [tak], waga = 5).
3. Czy kolega idzie? (x3 = 1 [tak], waga = 3).
Suma: (1 * -10) + (1 * 5) + (1 * 3) = -2.
Wynik ujemny -> Nie idę. (Brak aktywacji).

## 📌 Źródła
- "Neural Networks and Deep Learning" (Michael Nielsen).

## 👽 Brudnopis
- Biologiczne neurony są dużo bardziej skomplikowane, ale matematyczna abstrakcja wystarczy, by zbudować ChatGPT.