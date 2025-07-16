---

title: ReLU  
created: 2025-07-16  
status: Final  
category: Deep Learning  
difficulty: podstawowy  
language: pl  
tags:

- deep learning
- funkcje aktywacji
- sieci neuronowe
- relu  
aliases:
- rectified linear unit
- funkcja aktywacji relu

---

# 🎯 Definicja

**ReLU (Rectified Linear Unit)** to jedna z najpopularniejszych nieliniowych funkcji aktywacji stosowana w głębokich sieciach neuronowych. Jej działanie polega na przepuszczeniu dodatnich wartości bez zmian i "wyzerowaniu" wartości ujemnych. ReLU wprowadza nieliniowość w sposób bardzo prosty obliczeniowo i pomaga przeciwdziałać problemowi zanikającego gradientu.

# 🔑 Kluczowe punkty

- Funkcja ReLU definiowana jest jako **f(x) = max(0, x)**.
- Znacznie przyspiesza uczenie głębokich sieci dzięki małemu kosztowi obliczeniowemu.
- Unika zjawiska saturacji, typowego dla funkcji sigmoid i tanh.
- Działa dobrze w warstwach ukrytych sieci neuronowych.
- Może prowadzić do problemu tzw. "martwych neuronów" — neurony w których gradient wynosi 0 i przestają się uczyć.

# 📚 Szczegółowe wyjaśnienie

## Jak działa ReLU?

ReLU jest funkcją kawałkami liniową – zachowuje się następująco:

|Wartość wejściowa (x)|Wartość wyjściowa (f(x))|
|---|---|
|x > 0|x|
|x ≤ 0|0|

Na wykresie funkcja przypomina odciętą od dołu prostą. Przepuszcza tylko dodatnie wartości, eliminując liczby ujemne i zerując je.

## Zastosowania

- W warstwach ukrytych głębokich sieci neuronowych (DNN, CNN, RNN)
- Standardowa aktywacja w modelach konwolucyjnych (np. VGG, ResNet)
- Komponent nieliniowy w klasyfikatorach, autoenkoderach i sieciach GAN

## Zalety

- **Prostota implementacji** — nie wymaga kosztownych operacji takich jak wykładniki.
- **Szybka propagacja gradientów.**
- **Mniejsze ryzyko wystąpienia vanishing gradient (niż np. sigmoid lub tanh).**

## Wady i ograniczenia

- **Martwe neurony:** dla danych z dużą liczbą wartości ujemnych wiele neuronów może nigdy się nie aktywować.
- **Brak gradientu dla x ≤ 0**, co utrudnia aktualizację wag.

Alternatywy:

- `Leaky ReLU`: dopuszcza małe ujemne wartości (np. 0.01x)
- `ELU`, `GELU`, `Mish`: bardziej zaawansowane wersje redukujące problem martwych neuronów

# 💡 Przykład zastosowania

Przykładowy fragment kodu z PyTorch:

```python
import torch.nn as nn

layer = nn.Sequential(
    nn.Linear(128, 64),
    nn.ReLU(),
    nn.Linear(64, 10)
)
```

ReLU aktywuje neurony tylko dla wartości większych od zera – dzięki temu sieć może szybciej i wydajniej się uczyć.

## 📌 Źródła

- DeepAI – ReLU: [https://deepai.org/machine-learning-glossary-and-terms/relu](https://deepai.org/machine-learning-glossary-and-terms/relu)
- Stanford CS231n – Activation Functions: [http://cs231n.github.io/neural-networks-1/#actfun](http://cs231n.github.io/neural-networks-1/#actfun)
- PyTorch Documentation – [https://pytorch.org/docs/stable/generated/torch.nn.ReLU.html](https://pytorch.org/docs/stable/generated/torch.nn.ReLU.html)

## 👽 Brudnopis

- ReLU = max(0,x)
- - szybka, efektywna, nie saturuje, używana domyślnie w CNN/DNN
- - martwe neurony, brak gradientu dla x<0
- rozwiązywane przez LeakyReLU, ELU
- obecna praktycznie w każdej architekturze
- część standardowej warstwy aktywacji w pytorch/keras
- aktywuje tylko, gdy wejście > 0
- idea: tylko dodatnie sygnały przechodzą dalej
- przykład kodu dla torch/keras + visualization wykresu? (do rozbudowania)