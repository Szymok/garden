---

title: Neuron  
created: 2025-07-16  
status: Final  
category: Sztuczna inteligencja  
difficulty: podstawowy  
language: pl  
tags:

- sztuczna inteligencja
- sieci neuronowe
- deep learning
- perceptron
- uczenie maszynowe  
aliases:
- neuron sztuczny
- sztuczny neuron
- element sieci neuronowej

---

# 🎯 Definicja

**Neuron** w kontekście sztucznej inteligencji odnosi się do podstawowego elementu **sztucznej sieci neuronowej**, który naśladuje działanie biologicznego neuronu. Neuron w sztucznej sieci przetwarza dane wejściowe (np. liczby), wykonuje operacje matematyczne (np. sumowanie, aktywacja), a następnie przekazuje wynik dalej — do kolejnych neuronów w następnych warstwach.

# 🧠 Budowa i działanie sztucznego neuronu

Każdy neuron:

1. Odbiera dane wejściowe — zazwyczaj jako wektor liczb.
2. Mnoży każde wejście przez przypisaną wagę (ang. weight).
3. Dodaje sumę ważoną oraz komponent zwany bias.
4. Przetwarza sumę przez funkcję aktywacji (np. sigmoid, [[ReLU]]).
5. Przekazuje wynik jako sygnał wyjściowy do kolejnej warstwy.

Matematycznie:

```text
output = activation(∑(input_i × weight_i) + bias)
```

# 🔢 Typy neuronów

## Neurony wejściowe (input neurons)

- Tworzą **pierwszą warstwę** sieci.
- Odpowiadają za przyjmowanie surowych danych – np. pikseli obrazu, wartości liczbowych, tokenów tekstowych.
- Nie wykonują transformacji – tylko przekazują dane do neuronów kolejnych warstw.

## Warstwa pośrednia (ukryta) – hidden neurons

- Znajduje się pomiędzy warstwą wejściową a wyjściową.
- Może zawierać wiele neuronów, które uczą się reprezentacji (cech) danych.
- W głębokim uczeniu ([[deep learning]]) warstw pośrednich może być setki, a nawet tysiące.
- Właściwa nauka i ekstrakcja wzorców zachodzą właśnie tutaj.

## Neurony wyjściowe (output neurons)

- Tworzą warstwę końcową.
- Produkują końcową predykcję na podstawie sygnałów z poprzedniej warstwy.
- Ich liczba zależy od typu problemu:
    - 1 neuron – regresja;
    - n neuronów – klasyfikacja wieloklasowa (np. softmax dla klasyfikatora wieloetykietowego).

# 📚 Przykład wizualizacji: klasyczny perceptron

```
   x₁   x₂   x₃  → dane wejściowe
    ↓    ↓    ↓
    ○----○----○  → warstwa wejściowa  
         ↓
        ○○○○○     → warstwa ukryta (neurony uczące się reprezentacji)
         ↓
        ○○         → warstwa wyjściowa (np. 2 klasy: spam / nie-spam)
```

# 💡 Przykład praktyczny

W detekcji spamu pojedynczy e-mail jest przekształcany do wektora liczbowego (np. przez encoding słów). Neurony wejściowe przyjmują te liczby, warstwa pośrednia analizuje ich współzależności (np. czy użyto podejrzanych słów), a neurony wyjściowe przewidują: `1 = spam`, `0 = nie-spam`.

# 📌 Źródła

- [https://en.wikipedia.org/wiki/Artificial_neuron](https://en.wikipedia.org/wiki/Artificial_neuron)
- [[Deep Learning]] — Ian Goodfellow, Yoshua Bengio, Aaron Courville
- [https://towardsdatascience.com/what-is-a-neuron-in-a-neural-network-4c7d8b7c5bd3](https://towardsdatascience.com/what-is-a-neuron-in-a-neural-network-4c7d8b7c5bd3)
- [https://neuralnetworksanddeeplearning.com/](https://neuralnetworksanddeeplearning.com/)

## 👽 Brudnopis

- neuron = jednostka przetwarzająca dane w sieciach AI
- [[funkcja aktywacji]] = nieliniowość nadająca sieci zdolność aproksymacji dowolnej funkcji
- neurony łączone w warstwy = sieć (net)
- [[relu]], tanh, sigmoid – wybór funkcji ma wpływ na uczenie
- uczenie = modyfikacja wag i biasów każdego neuronu
- neuron ≠ biologiczny odpowiednik (tylko model matematyczny inspirowany biologią)

---