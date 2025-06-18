---
title: Deep Learning
tags:
  - Sztuczna-Inteligencja
  - fastai-course
aliases:
  - DL
---
**Co to jest model?**
Model w kontekście uczenia maszynowego to uproszczona reprezentacja rzeczywistości, zbudowana w celu przewidywania lub klasyfikowania danych. Model składa się z algorytmu, który uczy się na podstawie danych i stosuje tę naukę do nowych, nieznanych przypadków.

**Co to są wagi?**
Wagi w modelu uczenia maszynowego to parametry, które określają wpływ poszczególnych cech (features) danych wejściowych na wynik. W modelu sieci neuronowej, wagi są dostosowywane podczas procesu uczenia, aby model mógł lepiej przewidywać lub klasyfikować dane.

**Jak dane, wagi i model współpracują ze sobą, aby wyprodukować wynik?**
Dane wejściowe są przekazywane do modelu, który używa swoich wag do przetworzenia tych danych i wygenerowania wyniku. W trakcie procesu uczenia, model używa danych treningowych do dostosowywania swoich wag, starając się minimalizować błąd między przewidzianymi a rzeczywistymi wynikami.

**Dlaczego początkowe wyniki są często niezadowalające?**
Początkowo, wagi w modelu są zazwyczaj inicjalizowane losowo, co oznacza, że model nie ma jeszcze "nauczonej" wiedzy pozwalającej na dokładne przewidywania. Dlatego początkowe wyniki mogą być dalekie od oczekiwanych.

**Czy możemy zaprojektować funkcję mówiącą modelowi, jak dobrze sobie radzi? (funkcja strat)**
Tak, funkcja strat (loss function) jest kluczowym elementem w uczeniu maszynowym. Mierzy ona różnicę między wynikami przewidywanymi przez model a rzeczywistymi wartościami. Pomaga to w ocenie, jak dobrze model radzi sobie z zadaniem.

**Czy możemy znaleźć sposób na aktualizowanie/poprawianie wag, wiedząc, jak dobrze/źle model uczy się z danych?**
Tak, proces ten nazywa się optymalizacją. Używa się algorytmów, takich jak algorytm spadku gradientu (gradient descent), który iteracyjnie dostosowuje wagi modelu, w oparciu o gradient funkcji strat, aby minimalizować błąd.

**Jeśli możemy powtarzać ten cykl wiele razy, czy możemy zbudować potężny model?**
Tak, poprzez wielokrotne iteracje i dostosowywanie wag w odpowiedzi na błąd (stratę), model staje się coraz lepszy w przewidywaniu lub klasyfikacji. Jest to kluczowy proces w uczeniu maszynowym, pozwalający na budowanie coraz potężniejszych i dokładniejszych modeli.

**Czy podstawowa idea głębokiego uczenia zmieniła się od 1959 roku?** Podstawowy koncept głębokiego uczenia - uczenie się reprezentacji danych przez wielowarstwowe sieci neuronowe - pozostał stosunkowo niezmieniony. Jednak znaczące postępy technologiczne, takie jak rozwój algorytmów, zwiększenie mocy obliczeniowej i dostępność dużych zbiorów danych, doprowadziły do znacznych osiągnięć w tej dziedzinie.

**Co programowaliśmy w modelach przed erą głębokiego uczenia?** Przed erą głębokiego uczenia, algorytmy uczenia maszynowego opierały się bardziej na technikach statystycznych i modelach liniowych, takich jak regresja liniowa, maszyny wektorów nośnych (SVM) i drzewa decyzyjne. Wymagało to często ręcznego projektowania cech (feature engineering), czyli wybierania i przekształcania surowych danych w format użyteczny dla modeli.

**Czy fastai był pierwszym i jedynym frameworkiem implementującym TIMM?** Fastai nie był pierwszym frameworkiem, który zaimplementował TIMM (PyTorch Image Models), ale integruje go wyjątkowo dobrze, umożliwiając łatwe wykorzystanie modeli TIMM. Można używać dowolnego modelu z TIMM w projektach fastai.

**Gdzie można dowiedzieć się więcej o TIMM?** Więcej o TIMM można dowiedzieć się:

1. **Dokumentacja TIMM**: Oficjalna dokumentacja TIMM jest doskonałym źródłem informacji.
2. **Repozytorium GitHub**: Sprawdzanie kodu źródłowego i przykładów użycia.
3. **Społeczności i Fora**: Pytania i dyskusje na tematy związane z TIMM na forach takich jak Stack Overflow, Reddit, itp.

**Co to jest wytrenowany model, np. Resnet18?** Pretrained model, jak ResNet18, to model uczenia maszynowego, który został już wytrenowany na dużym i zróżnicowanym zestawie danych, zazwyczaj na ImageNet. Uczy się rozpoznawać różne cechy i wzorce w danych obrazowych.

**Co dokładnie robi "fine tuning" z wytrenowanym modelem?** Fine tuning dostosowuje wytrenowany model do konkretnego zadania. Zamiast uczyć model od zera, "dopasowuje" on wagi modelu na podstawie nowego zestawu danych, pozwalając mu lepiej przewidywać lub klasyfikować dane w kontekście tego konkretnego zadania.

**Jak użyć fine-tuned modelu do robienia przewidywań?** Po fine-tuning, model jest gotowy do robienia przewidywań. W fastai, możesz użyć funkcji `predict` na modelu, przekazując jej nowe dane (na przykład obrazy), aby otrzymać przewidywania.

**Czy możemy fine-tune wytrenowane modele CV do określenia, do jakiego obiektu należy każdy piksel na zdjęciu?** Tak, to jest możliwe i nazywa się segmentacją obrazu. Przy użyciu odpowiednio wytrenowanych modeli głębokiego uczenia można przeprowadzać fine-tuning do zadań segmentacji, gdzie model uczy się przypisywać każdemu pikselowi odpowiednią etykietę klasy.

**Dlaczego potrzebujemy specjalizowanych DataLoaderów jak SegmentationDataLoaders, biorąc pod uwagę DataBlock?** Specjalizowane DataLoadery, jak `SegmentationDataLoaders`, są dostosowane do konkretnych zadań, takich jak segmentacja obrazu. Takie DataLoadery automatycznie zajmują się specyficznymi wymaganiami zadania, takimi jak obsługa par obrazów i ich odpowiadających im masek segmentacji, co ułatwia i przyspiesza proces tworzenia modelu.

**Rozpoznawanie ptaków przed 2015**: Przed 2015 rokiem komputery miały ograniczoną zdolność do rozpoznawania zdjęć ptaków. Chociaż istniały techniki przetwarzania obrazu, głębokie uczenie, które znacznie poprawiło dokładność takich zadań, było wtedy w powijakach.
   
**Pobieranie i wyświetlanie obrazów z DuckDuckGo**: Aby pobrać i wyświetlić obraz ptaka z DuckDuckGo, można użyć bibliotek Pythona takich jak `requests` do pobierania obrazów i `PIL` lub `matplotlib` do ich wyświetlania. Należy wysłać zapytanie do API DuckDuckGo i przetworzyć odpowiedź.
   
**Skład obrazów dla komputerów**: Dla komputerów obrazy składają się z matryc pikseli. Każdy piksel ma wartości reprezentujące kolor, zwykle jako kombinację czerwonego, zielonego i niebieskiego (RGB).
   
**Tworzenie folderów i pobieranie obrazów**: Można użyć Pythona do utworzenia folderów używając `os.makedirs`. Pobranie obrazów wymaga API lub skryptu do skrobania danych z internetu. Użyj bibliotek takich jak `requests` do pobierania obrazów, a `PIL` do zmiany ich rozmiaru i zapisania w odpowiednich folderach.
   
**Znajdowanie i usuwanie uszkodzonych obrazów**: Można użyć Pythona z biblioteką `PIL` do otwarcia każdego obrazu i sprawdzenia, czy powoduje błędy. Uszkodzone obrazy można następnie usunąć lub przenieść do innego folderu.

**Tworzenie DataBlock i wyświetlanie partii obrazów**: W bibliotece `fastai`, `DataBlock` to sposób na przygotowanie danych do modelowania. Używa różnych bloków dla różnych typów danych i transformacji. Można wyświetlić partię obrazów używając metody `show_batch`.
   
**Budowanie i trenowanie modelu lokalnie**: Można zbudować model używając bibliotek takich jak `PyTorch` lub `TensorFlow`. Trenowanie wymaga przygotowania danych, definicji architektury modelu, ustawienia funkcji straty i optymalizatora, a następnie iteracyjnego trenowania modelu na danych.
   
**Klasyfikacja zdjęcia ptaka za pomocą modelu**: Użyj wytrenowanego modelu do klasyfikacji obrazów ptaków, przekazując zdjęcie do modelu i interpretując jego wyjście jako przewidywaną klasę.
  
**Szybki start z kodowaniem i modelami**: Aby zacząć pracę z kodami i modelami, można korzystać z interaktywnych środowisk, takich jak Jupyter Notebook, i skorzystać z dostępnych zasobów online, takich jak dokumentacja `fastai` lub kursy online.