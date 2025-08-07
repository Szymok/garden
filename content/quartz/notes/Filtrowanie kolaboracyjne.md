---

title: Filtrowanie kolaboracyjne  
created: 2025-07-16  
status: Final  
category: Uczenie maszynowe  
difficulty: średniozaawansowany  
language: pl  
tags:

- filtrowanie kolaboracyjne
- systemy rekomendacji
- deep learning
- embeddingi
- optymalizacja modeli  
aliases:
- collaborative filtering
- rekomendacje ML

---

# 🎯 Wprowadzenie do filtrowania kolaboracyjnego

**Filtrowanie kolaboracyjne** to kluczowa technika rekomendacyjna wykorzystywana w systemach takich jak Netflix, Amazon czy Spotify. Pozwala przewidywać, które produkty, filmy czy utwory mogą przypaść do gustu użytkownikowi na podstawie historycznych interakcji innych użytkowników.

## 1. Praca z modelami głębokiego uczenia – zarządzanie pamięcią

- **Im większy model**, tym większe zapotrzebowanie na pamięć GPU: umożliwia lepsze uchwycenie skomplikowanych wzorców, ale może powodować wyczerpanie zasobów zwłaszcza na limitowanych GPU Kaggle.
- **Oszczędzanie pamięci**:
    - Restart notebooka przy awarii CUDA.
    - Zwalnianie niepotrzebnych obiektów (`del model` oraz `torch.cuda.empty_cache()`), by uniknąć restartu kernela.
    - Testowanie na małej próbce danych i pojedynczej epoce: szybkie oszacowanie potrzeb modelu.
- **[[Gradient]] accumulation** pozwala trenować modele na małym batchu jakby trenowały na większym – dzielisz sumę gradientów przez liczbę minibatchey przed aktualizacją wag. Rozwiązuje problem małych batchy (niższa stabilność uczenia i większa wariancja wag).

## 2. Tworzenie i testowanie ensemble modeli

- **Ensemble** (bagging) – łącz (średnia/podsumowanie) predykcje różnych modeli (inną architekturę/model/wielkość batchy).
- Dzięki temu uzyskujesz większą odporność na przeuczenie i lepszą dokładność, szczególnie w zastosowaniach konkursowych lub produkcyjnych.
- Planowanie wielomodelowe i kontrola pamięci: ogarniaj parametry, używaj optymalnych batch size i `gradient_accumulation`.

## 3. Modele wielo-celowe (multi-target) i połączona funkcja straty

- Możliwość trenowania modelu na kilku zadaniach jednocześnie, np. rozpoznawanie chorób i odmian na zdjęciach.
- Kluczowe jest oddzielne liczenie straty dla każdego z celów, połączenie (np. suma, średnia) i monitorowanie obu metryk podczas treningu.

## 4. Entropia krzyżowa i softmax

- `F.cross_entropy` łączy softmax (zamiana logitów na rozkład prawdopodobieństwa) i błąd (odejmuje prawdziwą klasę od predykcji).
- Softmax: przelicza logity na prawdopodobieństwa.  
    $$ softmax(x_i) = \frac{e^{x_i}}{\sum_j e^{x_j}} $$
- Cross-entropy: uporządkowana [[miara]] rozbieżności między przewidywaniem a rzeczywistą klasą.
- Problem: softmax zawsze zwraca sumę 1 – także dla niepasujących danych.

## 5. Filtrowanie kolaboracyjne – matematyka i praktyka

### Idea

- Użytkownicy i elementy (np. filmy) reprezentowani są przez wektory („czynniki ukryte”, ang. latent factors).
- Przewidywana ocena użytkownika dla filmu to iloczyn skalarny jego oraz filmowych czynników ukrytych.
- Wszystko trenowane przez minimalizację funkcji straty na dostępnych ocenach.

### Uzupełnianie braków

- Jeśli użytkownik nie ocenił filmu – predykcja to dot product wektorów.
- Czynniki ukryte (embeddingi) uczymy przez optymalizację (np. SGD).

### Embeddingi

- [[Embedding]] użytkownika i filmu po lookupie tablicy (macierze typu `n_users x n_factors`, `n_movies x n_factors`).
- Istota: embeddingi zastępują one-hot encoding matematycznym skrótem (przechowują gęstą reprezentację, a lookup = szybkie przemnożenie przez odpowiedni wiersz/kolumnę).

### Wybor liczby czynników ukrytych

- Większa liczba = większa elastyczność, ryzyko przeuczenia.
- Eksperymentalnie dobierana (reguła kciuka: zacznij od kilkunastu, testuj performance).

## 6. Ulepszanie modelu: biasy, weight decay, regularizacja

- **Biasy** (dla użytkowników i filmów) uwzględniają osobiste lub globalne odchylenia (np. użytkownik daje generalnie wysokie albo niskie oceny).
- **Weight decay** (regularyzacja L2): zapobieganie nadmiernym wartościom czynników ukrytych – minimalizuje ryzyko przeuczenia, model jest bardziej stabilny i ma lepszą generalizację.
- Zbyt duże wartości wag = nadmierne dopasowanie do danych treningowych, za małe – model zbyt „nudny”.

## 7. Implementacja w praktyce (fastai / PyTorch)

- Użycie `CollabDataloaders.from_df` – stwórz dataloader z [[DataFrames|DataFrame]] ocen.
- Zbuduj model poprzez klasę (np. `DotProduct`) – implementuj forward (iloczyn embeddingów, ew. biasy, sigmoida).
- Trening: szybki, nawet na CPU; loss i metryki pozwalają monitorować jakość predykcji; tuning embeddingów przez SGD lub Adam.
- **Sigmoida**: czasem stosowana by ograniczyć zakres przewidywań do np. [0, 5.5] (spłaszcza predykcje, mniej outlierów).

## 8. Efektywne praktyki i wnioski

|Krok|Wskazówki|
|---|---|
|Trening dużych modeli|[[Gradient]] accumulation, batch size tuning, czyszczenie GPU|
|Ensemble|Średnie/spójne predykcje wielu modeli = stabilniejszy wynik|
|Multi-target|Dziel output na bloki, monitoruj metryki i funkcję straty osobno|
|Filtrowanie kolaboracyjne|Czynnikowanie: embeddingi, iloczyny skalarne, biasy, regularyzacja L2|
|Praktyki regularne|Codzienne submission na Kaggle, notowanie wyników iteracji, eksperymenty z seedami|
|Overfitting|Stosuj weight decay, nie przesadzaj z liczbą czynników ukrytych|

**Podsumowanie**: Filtrowanie kolaboracyjne i nowoczesne podejście do budowy modeli głębokich (zarządzanie pamięcią, ensemble, multi-target) stanowią podstawę skutecznych systemów rekomendacyjnych i projektów [[Uczenie Maszynowe|ML]] tabularnych. Praktyka, testowanie i dobór strategii pod konkretne zadanie są tak samo ważne, jak architektura modelu.

---