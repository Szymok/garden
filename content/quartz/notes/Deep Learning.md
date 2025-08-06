---

title: Deep Learning  
created: 2025-07-16  
status: Final  
category: Sztuczna Inteligencja  
difficulty: podstawowy  
language: pl  
tags:

- Sztuczna-Inteligencja
- deep learning
- fastai-course
- uczenie głębokie  
aliases:
- DL
- głębokie sieci neuronowe

---

# 🎯 Definicja

**Deep Learning (uczenie głębokie)** to poddziedzina uczenia maszynowego skoncentrowana na wykorzystaniu **wielowarstwowych sieci neuronowych**, które same uczą się reprezentacji danych i wyciągania wzorców. To kluczowa technologia stojąca za przełomowymi osiągnięciami w dziedzinach takich jak rozpoznawanie obrazów, przetwarzanie języka naturalnego, gry, medycyna i wiele innych.

# 🔑 Kluczowe pojęcia i mechanizmy

## 🔎 Model

To algorytm uczący się na danych, przewidujący lub klasyfikujący nowe przypadki. W DL model przyjmuje wejście (np. obraz lub tekst), przetwarza je przez warstwy, używając wag i aktywacji, i generuje wynik.

## ⚖️ Wagi

Parametry modelu, które decydują o wpływie danych wejściowych na wynik. Są dostosowywane w trakcie uczenia, aby zmniejszyć błąd modelu.

## 🔁 Struktura działania

- Dane wejściowe → przechodzą przez warstwy modelu → wynik
- Porównanie wyniku z prawdziwą etykietą → obliczenie błędu (funkcja strat)
- Obliczanie gradientów → aktualizacja wag ([[gradient]] descent)
- Powtarzanie tego cyklu = nauka

## 📉 Funkcja strat (loss function)

Mierzy różnicę między przewidywaniami modelu a rzeczywistymi wartościami. Pomaga kierować uczenie się modelu – im mniejsza strata, tym lepszy model.

## 🧠 Optymalizacja

Proces aktualizacji wag modelu, np. za pomocą algorytmu spadku gradientu. Dzięki temu model „uczy się” z danych.

## 💪 Model wytrenowany

Np. **ResNet18** – model wytrenowany na dużym zbiorze danych (ImageNet), potrafiący rozpoznawać podstawowe cechy obrazu. Można go użyć jako punktu startowego ([[transfer learning]]).

## 🔧 Fine-Tuning

Dostrajanie modelu do konkretnego zadania, bazując na istniejącej architekturze i wadze. Wykorzystywane przy klasyfikacji niestandardowej, segmentacji itp.

## 🎯 Przewidywanie

Użycie wytrenowanego i (ew. dowolnie) dostrojonego modelu do klasyfikacji nowych danych (np. nowych obrazów ptaków za pomocą `.predict`).

# 📚 Praktyczne elementy z kursu fastai

|Element|Opis|
|---|---|
|**TIMM**|Biblioteka z setkami modeli vision pre-trained. Fastai integruje ją płynnie.|
|**Segmentacja obrazu**|Przypisanie etykiety do każdego piksela (semantic segmentation)|
|**SegmentationDataLoaders**|Specjalny loader do danych segmentacyjnych (obrazy + maski klas)|
|**DataBlock & show_batch**|Sposób przygotowania danych do treningu i ich inspekcji|
|**Augmentacje** (`Resize`, `squish`, `tta`)|Kluczowe dla generalizacji — zmieniają obrazy podczas treningu|
|**Gradio, huggingface spaces**|Sposoby na szybki deployment modelu na www|
|**Rozmiar obrazu vs batch size**|Fundamentalna decyzja przy trenowaniu na GPU|
|**fastkaggle**|Szybki interfejs do Kaggle – pobieranie danych, przesyłanie modeli|

# 💡 Dodatkowe pojęcia i praktyki

- Modele przed erą DL (np. OneR, SVM, RF) wymagały ręcznego inżynierowania cech.
- Głębokie sieci (np. CNN, RNN, Transformer) **same uczą się reprezentacji**.
- Implementacja: PyTorch, TensorFlow, fastai.
- [[Transfer learning]] powszechny w CV – przyspiesza i zwiększa skuteczność modeli.

# 🧪 Przykład flow pracy z modelem (vision)

1. Pobierz dane (np. przez DuckDuckGo lub ggd).
2. Oczyść dane (usuń uszkodzone obrazy).
3. Użyj `DataBlock` → `DataLoaders` → `show_batch`.
4. Trenuj model (np. `cnn_learner`) → `fit_one_cycle`.
5. Wykonaj `lr_find`, `fine_tune`.
6. Eksportuj model (`export.pkl`) i buduj interfejs (`gr.Interface`).

# 📌 Źródła

- [https://course.fast.ai](https://course.fast.ai)
- [https://github.com/rwightman/pytorch-image-models](https://github.com/rwightman/pytorch-image-models) (TIMM)
- [https://docs.fast.ai](https://docs.fast.ai)
- [https://huggingface.co/docs](https://huggingface.co/docs)
- [https://paperswithcode.com](https://paperswithcode.com)

## 👽 Brudnopis

- DL = automatyczne „feature engineering” + przygotowanie reprezentacji
- TIMM = Złoty katalog CV modeli [[Pretrained models|pretrained]]
- fastai = mniej kodu, a więcej gotowych potężnych narzędzi (API wysokiego poziomu)
- Segmentacja = „klasyfikacja pikseli”
- Show_batch = szybki feedback na jakość danych
- tfms = transformacje → augmentacje
- Notebook + interfejs = szybki prototyp modelu dostępny online

---