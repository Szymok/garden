---

title: Funkcja aktywacji  
created: 2025-07-16  
status: Final  
category: Deep Learning  
difficulty: podstawowy  
language: pl  
tags:

- deep learning
- sieci neuronowe
- funkcje matematyczne
- aktywacja  
aliases:
- activation function
- funkcje nieliniowe

---

# 🎯 Definicja

**Funkcja aktywacji** to funkcja matematyczna stosowana w sztucznych neuronach w sieciach neuronowych. Określa ona, czy dany neuron powinien być aktywowany (czyli przekazać sygnał dalej), transformując sumę ważoną wejść neuronu na sygnał wyjściowy. Wprowadza nieliniowość do modelu, co umożliwia sieciom głębokiego uczenia uczenie się złożonych zależności.

# 🔑 Kluczowe punkty

- Funkcje aktywacji wprowadzają **nieliniowość** do sieci neuronowej – bez nich model działałby jak rozbudowany regresor liniowy.
- Najpopularniejsze funkcje aktywacji to: `ReLU`, `Sigmoid`, `Tanh`, `Leaky ReLU`, `Softmax`.
- Wybór funkcji aktywacji wpływa bezpośrednio na szybkość konwergencji, stabilność uczenia i możliwość reprezentacji złożonych funkcji.
- Funkcje aktywacji mogą działać lokalnie (dla każdego neuronu) lub globalnie (np. Softmax dla całej warstwy).
- W głębokich sieciach wybór odpowiedniej funkcji aktywacji jest kluczowy dla przeciwdziałania zanikającemu lub eksplodującemu gradientowi.

# 📚 Szczegółowe wyjaśnienie

## Najczęściej stosowane funkcje aktywacji

|Nazwa|Wzór matematyczny|Zalety|Wady|
|---|---|---|---|
|**ReLU**|`f(x) = max(0, x)`|szybkie obliczenia, eliminacja zanikającego gradientu|"martwe neurony", brak aktywacji dla x < 0|
|**Sigmoid**|`f(x) = 1 / (1 + e^(-x))`|interpretowalność jako prawdopodobieństwo|problem zanikającego gradientu, nasycenie|
|**Tanh**|`f(x) = tanh(x)`|wartości między -1 a 1, lepsze niż sigmoid|nadal podatna na zanikanie gradientu|
|**Leaky ReLU**|`f(x) = x dla x>0, ax dla x<0`|rozwiązuje problem martwych neuronów|wybór parametru `a` może być arbitralny|
|**Softmax**|`f(xᵢ) = exp(xᵢ) / Σ exp(xⱼ)`|normalizuje wyjścia jako rozkład prawd.|tylko dla warstw wyjściowych (klasyfikacja)|

## Po co jest funkcja aktywacji?

- Symuluje sposób działania biologicznych neuronów.
- Pozwala sieci na **uczenie się nieliniowych relacji** (np. XOR, złożone klasyfikacje).
- Wprowadza różniczkowalność, umożliwiając działanie algorytmu backpropagation.
- Umożliwia propagację gradientów przez wiele warstw (w połączeniu z normalizacją).

## Wpływ na trening modelu

- ReLU i jego warianty są obecnie standardem w ukrywanych warstwach sieci neuronowych.
- Dla klasyfikacji wieloklasowej na końcu sieci stosuje się `Softmax`, a dla binarnej – `Sigmoid`.
- Źle dobrana funkcja aktywacji może spowolnić lub uniemożliwić konwergencję modelu.

# 💡 Przykład zastosowania

W modelu konwolucyjnej sieci neuronowej (CNN), np. do rozpoznawania obrazów, stosuje się:

- **ReLU** w warstwach ukrytych dla wydajności i redukcji problemu zaniku gradientu.
- **Softmax** w warstwie wyjściowej, aby zwrócić prawdopodobieństwa przynależności do klas (np. „pies”, „kot”, „samochód”).

**Przykładowy kod (PyTorch):**

```
import torch.nn as nn

model = nn.Sequential(
    nn.Conv2d(3, 32, kernel_size=3),
    nn.ReLU(),
    nn.Flatten(),
    nn.Linear(32 * 28 * 28, 10),
    nn.Softmax(dim=1)
)
```

## 📌 Źródła

- [1] DeepAI – Activation Function Overview: [https://deepai.org/machine-learning-glossary-and-terms/activation-function](https://deepai.org/machine-learning-glossary-and-terms/activation-function)
- [2] IBM – What is an activation function?: [https://www.ibm.com/cloud/learn/activation-functions](https://www.ibm.com/cloud/learn/activation-functions)
- [3] Stanford CS231n Notes: [http://cs231n.github.io/neural-networks-1/](http://cs231n.github.io/neural-networks-1/)

## 👽 Brudnopis

- Funkcja aktywacji = kluczowy element sieci neuronowej.
- Bez niej brak możliwości nauki nieliniowych zależności.
- ReLU: najbardziej wydajna (prosta), ale może dezaktywować neuron.
- Softmax: typowa dla warstwy wyjściowej (multi-class)
- Sigmoid i Tanh coraz rzadziej używane ze względu na problemy gradientowe.
- Głębokość sieci wymaga dobrze dobranej aktywacji ze względu na propagację gradientu.

---