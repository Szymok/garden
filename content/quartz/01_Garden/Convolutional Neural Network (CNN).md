---
title: Convolutional Neural Network (CNN)
created: 2026-02-04
status: evergreen
category: AI/Deep Learning
difficulty: intermediate
language: pl
tags:
  - cnn
  - computer-vision
  - deep-learning
  - neural-networks
aliases:
  - Sieci konwolucyjne
  - Sieci splotowe
---
# 🎯 Definicja
**Convolutional Neural Network (CNN)** (Sieć splotowa) to typ sieci neuronowej zaprojektowany specjalnie do przetwarzania danych mających strukturę siatki, głównie **obrazów**. Jej sekretem jest operacja **splotu (convolution)**, która pozwala wykrywać wzorce (krawędzie, kształty) niezależnie od ich położenia na obrazie.

# 🔑 Kluczowe punkty
- **Filtry (Kernels):** Małe matryce (np. 3x3), które "przesuwają się" po obrazie jak lupa, szukając konkretnych cech (np. pionowej kreski).
- **Lokalność:** CNN patrzy na małe fragmenty obrazu naraz, a nie na wszystkie piksele jednocześnie (jak MLP).
- **Pooling:** Operacja zmniejszania obrazu (np. Max Pooling), która wybiera najważniejsze cechy i odrzuca szum, czyniąc sieć odporną na przesunięcia i skalowanie.

# 📚 Szczegółowe wyjaśnienie
CNN działa jak ludzkie oko i kora wzrokowa.
1. **Warstwy początkowe:** Wykrywają proste prymitywy: linie, kropki, łuki.
2. **Warstwy środkowe:** Składają prymitywy w kształty: koło, kwadrat, oko, ucho.
3. **Warstwy końcowe:** Składają kształty w obiekty: Twarz, Kot, Samochód.

Architektura: `Input -> [[Conv -> ReLU -> Pool]] * N -> Flat -> Fully Connected -> Output`.

# 💡 Przykład zastosowania
Rozpoznawanie znaków drogowych w autonomicznych samochodach.
Kamera widzi obraz. CNN analizuje go.
Filtr nr 1 wykrywa kolor czerwony.
Filtr nr 2 wykrywa kształt ośmiokąta.
Filtr nr 3 wykrywa napis "STOP".
Sieć łączy te fakty i daje wynik: "Znak STOP (99% pewności)".

## 📌 Źródła
- Yann LeCun (ojciec CNN).
- Architektury: AlexNet, VGG, ResNet.

## 👽 Brudnopis
- CNN działa nie tylko na obrazach 2D!
- 1D CNN: Analiza sygnałów audio (fale dźwiękowe), tekstu (NLP przed Transformerami).
- 3D CNN: Analiza wideo (obraz + czas) lub skanów medycznych (CT/MRI).