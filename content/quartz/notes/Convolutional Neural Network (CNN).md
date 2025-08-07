---

title: Convolutional Neural Network (CNN) 
created: 2025-07-16 
status: Final 
category: Deep Learning 
difficulty: średniozaawansowany 
language: pl 
tags:

- cnn
- sieci konwolucyjne
- deep learning
- vision
- pytorch
- embeddings 
aliases:
- convolutional neural network
- konwolucyjne sieci neuronowe

---

# 🎯 Definicja

**Convolutional Neural Networks (CNN, sieci konwolucyjne)** to rodzaj sztucznych sieci neuronowych zaprojektowanych do przestrzennego przetwarzania danych, takich jak obrazy, wideo i sygnały. Kluczowym mechanizmem jest warstwa konwolucyjna, która za pomocą przesuwanych filtrów (jąder) automatycznie uczy się wykrywać lokalne wzorce — np. krawędzie lub tekstury — w danych wejściowych. Cechą CNN jest ograniczona liczba połączeń, tzw. połączenia lokalne oraz współdzielenie wag, co czyni te sieci efektywnymi i skalowalnymi do dużych zadań obrazowych.

# 🔑 Kluczowe punkty

- CNN składają się z naprzemiennych warstw konwolucyjnych (filtrujących lokalne cechy), warstw poolingowych (redukujących wymiarowość) i warstw w pełni połączonych.
- Filtry (kernels) to niewielkie macierze przesuwane po obrazie w celu wykrywania wzorców; ich wartości są uczenie się podczas treningu.
- Dzięki lokalności i współdzieleniu filtrów, CNN są wyjątkowo wydajne w przetwarzaniu wysokowymiarowych danych z zachowaniem kluczowych relacji przestrzennych.
- Warstwy pooling (np. max pooling) zmniejszają rozmiar map cech przy zachowaniu najważniejszych informacji.
- CNN znajdują zastosowanie m.in. w klasyfikacji obrazów, detekcji obiektów, segmentacji i rozpoznawaniu sygnałów audio.

# 📚 Szczegółowe wyjaśnienie

## Budowa i zasada działania CNN

Typowy model CNN to sekwencja warstw:

1. **Warstwa konwolucyjna:**
    
    - Przesuwa filtr (kernel), np. 3×3 lub 5×5, po obrazie lub sygnale.
    - Każdy filtr uczy się reagować na określony wzorzec: krawędź, tekstura, plama koloru.
    - Wartości filtrów (wag) są uczone gradientowo podczas treningu tak, by minimalizować błąd modelu.
2. **Warstwa pooling:**
    
    - Redukuje rozmiar przestrzenny mapy cech (np. przez wybór maksimum — max pooling).
    - Zmniejsza liczbę parametrów oraz podatność na drobne przesunięcia i szumy w danych.
3. **Warstwy w pełni połączone (fully connected):**
    
    - Przetwarzają zredukowane przez pooling cechy do odpowiedzi wyjściowej (np. klasyfikacja obrazu).
4. **[[Funkcja aktywacji]] (np. [[ReLU]]):**
    
    - Wprowadzają nieliniowość, umożliwiając modelowanie złożonych funkcji.

## Filtry (kernels)

**Filtr (kernel)** w CNN to mała macierz (np. 3×3 lub 5×5), której wartości są uczenie się automatycznie w fazie treningu. Filtr przesuwany jest po obrazie (operacja zwana konwolucją) i wyznacza "mapę cech" (feature map) — wskazuje na obecność danego wzorca w różnych miejscach danych wejściowych. Ważne, że te same filtry są stosowane w całym obrazie, co radykalnie zmniejsza liczbę parametrów modelu.

## Budowanie osadzeń i architektura w PyTorch

W PyTorch architektura sieci (np. klasy `nn.Module`) umożliwia łatwe komponowanie warstw: konwolucyjnych (`nn.Conv2d`), gęstych (`nn.Linear`), poolingujących (`nn.MaxPool2d`), aktywacji (`nn.ReLU`) czy specjalnych warstw [[embedding]].

- Wagi modelu przechowywane są jako obiekty typu `nn.Parameter` i mogą być przeglądane przez `.parameters()`.
- Można budować osadzenia (embeddings) i inne niestandardowe warstwy, np. `DotProductBias`, ręcznie wykorzystując inicjalizację wag (`Tensor.normal_()`) i tworzenie obiektów typu `nn.Parameter`.

Przykład wyciągnięcia wag z modelu:

```python
for name, param in model.named_parameters():
    print(name, param.shape, param.requires_grad)
```

## Interpretacja embeddings

Wytreningowane embeddings (np. `movie_bias` w filtracji kolaboracyjnej) pozwalają:

- Oceniać skłonności (bias) względem użytkownika/obiektu.
- Analizować, które [[wymiary]] ukryte (`latent factors`) odpowiadają za konkretne cechy (np. preferencje użytkowników względem gatunku filmów).
- Używać metod takich jak PCA do redukcji wymiaru embeddingów i wizualizacji głównych czynników wpływających na rekomendacje.

## Convolutions i pooling

Warstwa konwolucyjna wykonuje operację podobną do mnożenia lokalnej macierzy wejścia przez filtr, tworząc aktywację wskazującą na obecność danego wzorca. Kolejne warstwy mogą wykrywać wzorce coraz wyższego rzędu (np. fragmenty obiektów, potem całe obiekty).  
Pooling (np. maxpooling, average pooling) zmniejsza rozmiar danych, redukuje nadmierną czułość na położenie i szum, a ułatwia uogólnianie.

## Zaawansowane architektury i praktyczne aspekty

- Nowoczesne CNN (np. ResNet, Inception) tworzą wielopoziomowe hierarchie cech.
- [[Transfer learning]] i fine-tuning ułatwiają wdrażanie CNN do nowych zadań.
- Regularizacja (dropout, batch normalization), optymalizacja (SGD, Adam) są kluczowe dla skuteczności treningu.
- Modele deep learningowe sprawdzają się zwłaszcza w filtracji kolaboracyjnej, klasyfikacji obrazów, segmentacji i detekcji obiektów.

# 💡 Przykład zastosowania

W klasyfikacji obrazów CNN przyjmują na wejście zdjęcie (np. 32x32x3), przetwarzają je przez warstwy konwolucyjne i pooling, a końcowy output (przez warstwę FC i softmax) zwraca prawdopodobieństwo przynależności do klas – np. „pies”, „kot”, „samochód”. W rekomendacjach filmowych embeddings opisują użytkowników i filmy na osiach preferencji, a głównym narzędziem eksploracji tych osi jest analiza i [[wizualizacja]] wektorów embeddingów.

## 📌 Źródła

- [https://infoshareacademy.com/wiedza/konwolucyjne-sieci-neuronowe/](https://infoshareacademy.com/wiedza/konwolucyjne-sieci-neuronowe/)
- [https://miroslawmamczur.pl/jak-dzialaja-konwolucyjne-sieci-neuronowe-cnn/](https://miroslawmamczur.pl/jak-dzialaja-konwolucyjne-sieci-neuronowe-cnn/)
- [https://home.agh.edu.pl/~horzyk/lectures/ai/SztucznaInteligencja-UczenieG%C5%82%C4%99bokichSieciNeuronowych.pdf](https://home.agh.edu.pl/~horzyk/lectures/ai/SztucznaInteligencja-UczenieG%C5%82%C4%99bokichSieciNeuronowych.pdf)
- [https://infoshareacademy.com/szkolenia-it-dla-firm-b2b/ai/szkolenie-convolutional-neural-networks/](https://infoshareacademy.com/szkolenia-it-dla-firm-b2b/ai/szkolenie-convolutional-neural-networks/)

## 👽 Brudnopis

- CNN – architektura: warstwy konwolucyjne, pooling, FC; zalety: lokalność & współdzielenie parametrów.
- Filtry (kernels) — 3x3, 5x5; uczone automatycznie, kluczowa rola dla feature extraction.
- PyTorch: każdy obiekt klasy Module śledzi wagi (`nn.Parameter`), można wylistować przez `parameters()`.
- Embeddings: bias interpretuje preferencje; PCA — redukcja wymiaru embeddingów do wizualizacji.
- Convolutions = detekcja wzorców na różnych poziomach — od krawędzi po złożone kształty.
- Pooling = zmniejsza wymiar, poprawia generalizację.
- Regularizacja, optymalizacja, [[transfer learning]] — krytyczne aspekty praktycznego wdrażania.