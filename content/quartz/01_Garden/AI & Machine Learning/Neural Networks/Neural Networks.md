---
title: Neural Networks (Sieci Neuronowe)
created: 2026-02-04
status: evergreen
category: AI / Deep Learning
difficulty: intermediate
language: pl
tags:
  - neural-networks
  - deep-learning
  - ann
  - layers
  - neurons
aliases:
  - Sieci neuronowe
  - ANN
  - Perceptron
---
# 🎯 Definicja
**[[Sieci neuronowe|Sieci Neuronowe]]** to algorytmy inspirowane mózgiem. Składają się z warstw "neuronów" (prostych funkcji matematycznych). Każdy [[Neuron|neuron]] bierze sygnały, waży je i przekazuje dalej.
Razem potrafią uczyć się niesamowicie skomplikowanych rzeczy (rozpoznawanie twarzy, tłumaczenie języków).

# 🔑 Kluczowe punkty
- **Warstwy:** Wejście -> Warstwy Ukryte (Hidden) -> Wyjście. Im więcej ukrytych, tym "głębsza" sieć ([[Deep Learning]]).
- **Wagi:** To "wiedza" sieci. Uczenie polega na takim dobieraniu wag, żeby wynik był poprawny.
- **Trening:** Pokazujesz sieci zdjęcie kota i mówisz "to jest kot". Sieć koryguje wagi (Backpropagation), żeby następnym razem sama to zgadła.

# 📚 Szczegółowe wyjaśnienie
To uniwersalne aproksymatory funkcji.
Tradycyjny programista pisze `if (wasy && ogon) return kot`.
Sieć sama znajduje cechy (może to będą wąsy, a może tekstura futra), o których programista by nie pomyślał.
Typy sieci:
- **MLP:** Podstawowe.
- **CNN:** Do obrazów (widzą krawędzie, kształty).
- **RNN/Transformer:** Do tekstu i sekwencji.

# 💡 Przykład zastosowania
Wykrywanie spamu w emailach.
Sieć czyta miliony emaili. Uczy się, że słowa "Viagra", "Darowizna", "Książę z Nigerii" występują razem w spamie.
Nie musisz pisać reguł. Sieć sama "czuje", co jest spamem.

## 📌 Źródła
- 3Blue1Brown - Neural Networks Series (YouTube).

## 👽 Brudnopis
- To fundament dzisiejszej rewolucji AI. Wszystko co nowoczesne (GPT, Midjourney) to po prostu wielkie [[Sieci neuronowe|sieci neuronowe]].
