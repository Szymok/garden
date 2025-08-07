---

title: Recurrent Neural Networks (RNN)  
created: 2025-07-16  
status: Final  
category: Sztuczna Inteligencja  
difficulty: średni  
language: pl  
tags:

- sieci neuronowe
- deep learning
- RNN
- sekwencje
- NLP  
aliases:
- sieci rekurencyjne

---

# 🎯 Definicja

**Recurrent Neural Networks (RNN)** to klasa sztucznych sieci neuronowych zaprojektowana do przetwarzania danych sekwencyjnych. Ich kluczową cechą jest posiadanie stanu wewnętrznego (tzw. pamięci), który umożliwia uwzględnianie kontekstu historycznego przy przetwarzaniu bieżących wejść. Dzięki temu RNN doskonale nadają się do zadań takich jak analiza szeregów czasowych, tłumaczenie maszynowe, przetwarzanie języka naturalnego i rozpoznawanie pisma.

# 🔑 Kluczowe punkty

- RNN przetwarzają dane sekwencyjnie, krok po kroku, przekazując informację przez czas.
- Mają pętlę rekurencyjną, umożliwiającą zapamiętanie poprzednich stanów.
- Doskonałe do modelowania kontekstu w ciągach (teksty, dźwięki, dane czasowe).
- Często cierpią na problem „zanikających gradientów” przy długich sekwencjach.
- Ich rozszerzeniem są bardziej złożone architektury: LSTM i GRU.

# 📚 Szczegółowe wyjaśnienie

## Budowa i mechanizm

RNN to warstwa sieci neuronowej, która dla danego kroku czasowego t wykorzystuje:

- aktualne dane wejściowe $$ x_t $$
- wewnętrzny stan z poprzedniego kroku $$ h_{t-1} $$

Formuła ogólna: $$ h_t = f(W_x x_t + W_h h_{t-1} + b) $$

- $$ h_t $$ – nowy stan ukryty
- $$ W_x, W_h $$ – wagi
- $$ f $$ – nieliniowa [[funkcja aktywacji]] (np. tanh)

Ten obieg informacji (feedback loop) pozwala „przypominać sobie”, co było wcześniej w sekwencji.

## Przykładowe zastosowania

|Zastosowanie|Opis|
|---|---|
|Przetwarzanie języka (NLP)|Analiza sentymentu, rozpoznawanie nazwanych encji, dialogi|
|Tłumaczenie maszynowe|Sekwencja tekstu źródłowego → sekwencja tekstu docelowego|
|[[Szeregi czasowe]]|Prognozy finansowe, zużycie energii, sensory IoT|
|Przetwarzanie audio|Rozpoznawanie mowy, muzyka|
|Pismo ręczne|Rozpoznawanie sekwencji liter/cyfr|

## Problem zanikających gradientów

Jedną z wad klasycznych RNN jest efekt **vanishing gradients** – podczas trenowania sieci z długimi sekwencjami, gradienty wstecznej propagacji stają się bliskie zeru, co uniemożliwia skuteczne uczenie wcześniejszych kroków sekwencji. To powoduje:

- trudność w zapamiętywaniu kontekstu po wielu krokach
- niestabilność treningu
- ograniczoną użyteczność przy długich wejściach tekstowych/sygnałowych

Rozwiązania:

- **LSTM ([[Long Short-term Memory Network (LSTM)|Long Short-Term Memory]])** – dodaje mechanizmy bramek pamięci
- **GRU (Gated Recurrent Units)** – uproszczona alternatywa LSTM
- **Transformers** – zupełnie inna, nienastępcza architektura bez zanikających gradientów

# 💡 Przykład zastosowania

Firma logistyczna analizuje historyczne dane dostaw (czas nadejścia, opóźnienia, trasa). Dane są sekwencyjne i powiązane tematycznie. Zespół zbudował model RNN do przewidywania punktualności kolejnych dostaw w czasie — wykorzystując dane z poprzednich dni utrzymywane w stanie ukrytym modelu. Po zauważeniu problemów z wydajnością (np. gdy sekwencje miały ponad 100 kroków) zespół zastąpił klasyczne RNN modelem LSTM, który rozwiązał problem utraty kontekstu.

## 📌 Źródła

- [Understanding RNNs – Colah's Blog](https://colah.github.io/posts/2015-08-Understanding-LSTMs/)
- [Vanishing [[Gradient]] Problem – DeepAI](https://deepai.org/machine-learning-glossary-and-terms/vanishing-gradient-problem)
- [Stanford CS231n – RNNs Lecture](http://cs231n.stanford.edu/slides/2021/lecture13.pdf)

## 👽 Brudnopis

- RNN = kolejny krok zna przeszłość, bo ma rekurencyjny stan
- Zastosowania: NLP, audio, czasowe – wszędzie tam, gdzie sekwencje
- backpropagation through time (BPTT) = otrzymujemy bardzo płytkie gradienty
- jeśli s == długa sekwencja → class RNN == ✅ działa z SHA – zgaśnie
- transformers = attention dostępne do wszystkiego, RNN = tylko do przodu
- LSTM/GRU „wybiera”, co pamiętać — gate: input, forget, output
- RNN dziś rzadziej stosowane — ustąpiły miejsca transformerom w NLP + [[Szeregi czasowe|Time Series]] (pyts, darts)