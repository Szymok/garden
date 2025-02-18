---
title: Modele from scratch
tags: 
aliases:
---
- Model tabelaryczny od podstaw
- Przegląd zestawu danych Titanic i dwóch modeli w programie Excel
- Od Excela do Pythona
- Czysta wersja notatnika
    - Jak wygląda czysta wersja notatnika?
- Uzyskanie komfortu w Paperspace Gradient
    - Jak pracować w trybie jupyterlab zamiast w trybie domyślnym?
    - Jak przełączać się między trybem jupyterlab i jupyter notebook?
    - Poznaj kilka przydatnych skrótów klawiaturowych
- Rzeczy do zrobienia z czystym notatnikiem
    - Jakie są kroki lub rzeczy, które powinniśmy zrobić z czystą wersją notatnika kursu?
    - Gdzie znajduje się nieoczyszczona wersja?
- Ten sam notatnik działa na Kaggle i wszędzie
    - Jak sprawdzić, czy notatnik działa na Kaggle czy gdzie indziej?
    - Jak odpowiednio pobrać dane i ich ścieżkę?
- Biblioteki i konfiguracja formatu
    - Ile powinniśmy wiedzieć o tych bibliotekach przed rozpoczęciem?
    - Jak sprawić, by wydrukowany wynik wyglądał ładniej w komórkach?
- Odczyt train.csv jako Dataframe
    - Jak odczytać i wyświetlić plik csv w formacie pandas dataframe?
- Znajdowanie i liczenie brakujących danych za pomocą pandas
    - Jak sprawdzić brakujące dane w każdej komórce/wierszu?
    - Jak zsumować brakujące dane w każdej kolumnie?
- Wybór wartości trybu dla brakujących danych
    - Jaki jest najczęstszy wybór do zastąpienia brakujących danych, niezależnie od tego, czy są to dane kategoryczne czy ciągłe? mode
    - Jak wybrać pierwszą wartość trybu, jeśli dla kolumny dostępne są dwa tryby?
- Bądź proaktywnie ciekawy
    - Dlaczego niepraktyczne jest, aby Jeremy wyjaśniał każdą wspólną funkcję każdej używanej biblioteki?
    - Co powinieneś z tym zrobić?
- Zastępowanie brakujących danych wartościami trybu
    - Jak uzupełnić brakujące dane wartościami trybu tych kolumn z lub bez tworzenia nowej ramki danych?
- Zachowaj prostotę tam, gdzie to możliwe
    - Dlaczego warto korzystać z najprostszego na świecie sposobu uzupełniania brakujących danych?
    - Czy ten najprostszy sposób działa przez większość czasu?
    - Czy zawsze wiemy, że skomplikowany sposób byłby pomocny?
- Nie wyrzucaj wierszy ani kolumn
    - Czy te wypełnione kolumny mają czasem duże znaczenie dla modelu?
    - Jak biblioteka fastai pomaga się o tym dowiedzieć?
- Opisz swoje dane lub kolumny
    - Jak uzyskać szybki przegląd/opis danych?
    - Czego szukamy w opisach?
- Zobacz swoje kolumny na histogramie
    - Co zrobić z interesującymi kolumnami?
    - Czego można się dowiedzieć z histogramu?
    - Co to jest rozkład długoogonowy kolumny? Jak on wygląda?
- Transformacja logarytmiczna kolumn z długim ogonem
    - Które modele nie lubią rozkładów z długim ogonem w danych? #data-describing
    - Jaki jest najprostszy sposób na przekształcenie rozkładu z długim ogonem w rozkład wyśrodkowany?
    - Gdzie znaleźć więcej informacji o logarytmie i krzywej logarytmicznej?
    - Co robi log w jednym zdaniu? 17:11
    - Jak uniknąć problemu log(0)? dodawanie 1
    - Jak wyglądają dane kolumnowe (histogram) po przekształceniu przez log?
- Najprawdopodobniej dane z długim ogonem
    - Jakiego rodzaju dane najprawdopodobniej mają długi ogon i wymagają transformacji logarytmicznej?
- Opisywanie kolumn nienumerycznych
    - Jak opisać kolumny pozornie numeryczne, ale w rzeczywistości kategoryczne?
    - Jak opisać wszystkie kolumny nienumeryczne?
    - Jak wygląda taki opis? (czym różni się od opisu danych numerycznych)
- Stosowanie współczynników do kolumn kategorycznych
    - Jak zastosować współczynniki do kolumn kategorycznych?
    - Co oznacza zastosowanie zmiennych fikcyjnych do kolumn kategorycznych?
    - Jakie są dwa sposoby uzyskiwania zmiennych fikcyjnych i jakie jest zdanie Jeremy'ego na ich temat?
    - Jak wygląda transformacja zmiennych fikcyjnych zmiennych kategorycznych?
- Sekretna moc kolumny nazw
    - Czy model zbudowany tylko na podstawie kolumny z nazwiskami może zająć pierwsze miejsce w konkursie Titanic?
    - Gdzie znaleźć więcej informacji na ten temat?
    - Ta technika nie jest omawiana w tym wykładzie
- Tensor
    - Dlaczego warto skupić się na pytorch zamiast numpy?
    - Jakiego formatu danych wymaga pytorch? Jak przeprowadzić konwersję formatu danych?
    - Co to jest tensor? Skąd się wziął?
    - Jak przekształcić wszystkie niezależne kolumny w jeden duży tensor?
    - Jakiego typu liczb potrzebuje tensor? float
    - Jak sprawdzić kształt tensora? (liczba wierszy i kolumn)
    - Jak sprawdzić rangę/wymiary/oś tensora? Co to jest ranga?
    - Jaka jest ranga wektora, tablicy/macierzy lub zera?
- Tworzenie losowych współczynników
    - Dlaczego nie potrzebujemy tutaj stałej jak w Excelu?
    - Ile współczynników potrzebujemy? Jak to obliczyć?
    - Jak utworzyć wektor liczb losowych dla współczynników?
    - Jak wyśrodkować wartość współczynników? Dlaczego jest to ważne (odpowiedź później)
- Powtarzalność współczynników
    - Jak utworzyć ten sam zestaw liczb losowych dla współczynników przy każdym uruchomieniu komórki?
    - Kiedy używać, a kiedy nie używać losowych nasion, aby wynik był powtarzalny?
    - W jaki sposób nieużywanie losowych nasion może pomóc w intuicyjnym zrozumieniu modelu?
- Rozgłaszanie: operacje na danych * współczynnikach na GPU
    - Czym jest rozgłaszanie? Czy nie jest to po prostu mnożenie macierzy i wektorów?
    - Skąd się wzięło?
    - Jakie są korzyści z używania rozgłaszania?
    - prosty kod w porównaniu z dużą ilością boilerplate
    - kodowanie i optymalizacja w języku C pod kątem obliczeń na GPU
    - Jaka jest zasada broadcastingu i gdzie znaleźć więcej informacji na ten temat?
    - świetny wpis na blogu pomagający zrozumieć broadcasting
- Normalizacja: ten sam zakres wartości dla każdej kolumny
    - Co by się stało, gdyby wartości kolumny były znacznie większe niż wartości innych kolumn?
    - Dlaczego każda kolumna danych ma mieć ten sam zakres wartości?
    - Jak uzyskać ten sam zakres dla wszystkich wartości kolumn?
    - Jakie są dwa główne sposoby normalizacji?
    - Czy Jeremy faworyzuje jeden z nich?
- Sumowanie w celu uzyskania prognoz
    - Jak zsumować mnożenie każdego wiersza przez współczynniki i zrobić to dla wszystkich wierszy?
    - Czy zsumowana liczba jest prognozą dla każdej osoby/wiersza danych?
- Domyślny wybór funkcji straty
    - Jak ulepszyć model? Zejście gradientowe
    - Co jest potrzebne do zejścia gradientowego? Funkcja straty
    - Co robi funkcja straty? Mierzy wydajność współczynników
    - Jaki jest domyślny/ulubiony wybór Jeremy'ego dla funkcji straty?
    - Dlaczego Jeremy zawsze zapisuje funkcję straty ręcznie podczas eksperymentowania?
- Aby notatnik był czytelny/zrozumiały w przyszłości
    - Kiedy zawrzeć wszystkie kroki eksploracyjne w kilku funkcjach?
    - Dlaczego wszystkie kroki eksploracyjne powinny być dostępne (nie należy ich usuwać)?
- Aktualizowanie współczynników za pomocą metody gradientowej w Pytorch
    - Jak poprosić PyTorch o wykonanie gradientów na współczynnikach?
    - Jak poprosić Pytorch o aktualizację wartości na tym samym tensorze współczynników (a nie tworzenie nowego)?
    - Co robi funkcja straty poza podawaniem wartości straty? Co przechowuje?
    - Jaką funkcję uruchomić z funkcją straty, aby obliczyć gradienty współczynników?
    - Jak uzyskać dostęp do gradientów współczynników i jak je interpretować?
    - Jak zdecydować, czy należy odjąć, czy dodać gradienty do współczynnika?
    - Jak wybrać szybkość uczenia?
    - Jak obliczyć zaktualizowaną stratę z odnowionymi współczynnikami?
- Podział zbioru danych
    - Dlaczego Jeremy losowo podzielił zestaw treningowy i walidacyjny dla zbioru danych Titanic?
    - Dlaczego warto używać funkcji losowego podziału fastai?
    - Jak utworzyć zestaw treningowy i walidacyjny za pomocą funkcji splitter?
- Enkapsulacja funkcji do uczenia modeli
    - W jaki sposób Jeremy tworzy funkcje takie jak init_coeffs, update_coeffs, one_epoch, train_model na podstawie powyższych kroków eksploracyjnych?
    - Jak użyć funkcji train_model, aby sprawdzić, jak dobrze działa model?
- Zestaw danych Titanic to dobry plac zabaw
    - Dlaczego?
- Wyświetlanie współczynników
    - Jak wyświetlić końcowe współczynniki?
    - Jak je interpretować?
    - Czy możemy nadać sens wartościom znajdującym się w środku?
- Dokładność jako metryka
    - Dlaczego nie używać dokładności jako funkcji straty?
    - Do czego możemy użyć funkcji dokładności?
    - Jakiego progu użył Jeremy dla przetrwania?
    - Jak obliczyć dokładność i umieścić ją w funkcji?
- Funkcja sigmoidalna: optymalizacja współczynników łatwości
    - Co widzisz w przewidywaniach, które sprawiają, że myślisz o użyciu funkcji sigmoidalnej?
    - Dlaczego funkcja sigmoidalna może naprawdę ułatwić optymalizację modelu?
    - Dlaczego płaskowyż o dwóch końcach funkcji jest dobry do optymalizacji? (aby tolerować bardzo duże i małe wartości przewidywań, zamiast zmuszać każdą prognozę do zbliżenia się do 1 lub 0).
    - Dlaczego prostoliniowa środkowa część wykresu funkcji jest również tym, czego chcemy? 48:58
    - Jak wykreślić dowolną funkcję za pomocą jednej linii kodu? Co to za biblioteka? sympy
    - Jak łatwo zaktualizować funkcję calc_preds funkcją sigmoidalną w Jupyter? 50:52
    - Dlaczego warto wyśrodkować prognozy na 0 przed funkcją sigmoidalną? (odpowiedź Jeremy'ego)
    - Czy pamiętasz, co zrobił Jeremy, aby przewidywania były wyśrodkowane na 0? (zobacz, jak definiowane są początkowe współczynniki, link do komórki na Kaggle)
    - Dlaczego pozwolenie, aby przewidywania były duże lub małe, może ułatwić optymalizację wag? (odpowiedź Jeremy'ego)
    - W jaki sposób Python i Jupyter ułatwiają pracę eksploracyjną?
    - Jak to się dzieje, że współczynnik uczenia skacze z 0,1 przed sigmoidą do 2 po użyciu sigmoidy? 51:57
    - Kiedy lub jak często (z reguły) należy używać funkcji sigmoid do przewidywania? 52:23
    - Czy biblioteki HF określają, czy używają sigmoid, czy nie? (prawdopodobnie inne też nie)
    - To, na co należy zwrócić uwagę przy optymalizacji, to na razie wejście i wyjście, a nie środek. Dlaczego tak jest? 53:13
- Co jeśli testowy zbiór danych ma dodatkowe kolumny?
    - Jakie byłyby tego normalne konsekwencje?
    - Jak fastai radzi sobie z tym na dobre?
- Prześlij do Kaggle
    - Jak i dlaczego Jeremy zastąpił brakującą wartość Fare wartością 0?
    - Jak zastosować powyższe kroki czyszczenia danych do zestawu testowego?
    - Jak przygotować kolumnę wyjściową oczekiwaną przez Kaggle?
    - Jak utworzyć plik zgłoszenia oczekiwany przez Kaggle?

## Kluczowe kroki od modelu liniowego do neuralnet

- val_indep * coeffs vs val_indep @ coeffs
    - Co wiemy o wartości val_indep * coeffs? Czy jest to element-wise? Czy jest to mnożenie macierzy i wektorów?
    - Co wiemy o val_indep @ coeffs? Czy jest to mnożenie macierz-macierz?
    - Czy (val_indep * coeffs).sum(axis=1) jest równe val_indep @ coeffs?
    - Co powinniśmy o nich wiedzieć, aby prawidłowo je rozróżniać?
    - Czy w val_indep @ coeffs, gdy coeffs jest macierzą, musimy określić jej kształt? 59:50
    - Jak zainicjować współczynniki jako macierz jednokolumnową zamiast wektora?
- Przekształcanie istniejących wektorów w macierze
    - Jak przekształcić trns_dep i vald_dep z istniejących wektorów w macierze odpowiadające macierzy coeffs?

## Budowanie sieci neuronowej

- Porównywanie wyników modelu liniowego i sieci neuronowej
    - Jak utworzyć warstwę wewnątrz wielu ukrytych warstw (lub macierz współczynników zamiast wektora współczynników)?
    - Po co dzielić współczynniki wielu ukrytych warstw przez liczbę warstw (lub macierz współczynników przez liczbę kolumn)?
    - Czy ma to na celu upewnienie się, że wyniki sieci neuronowej i poprzedniego modelu liniowego są porównywalne?
- Budowanie warstwy wyjściowej
    - Jak zbudować współczynniki warstwy wyjściowej o prawidłowym kształcie, która łączy się z poprzednią warstwą?
    - Jak zdecydować o liczbie wyjść tej warstwy wyjściowej?
- Spróbuj rozpocząć szkolenie
    - Dlaczego Jeremy ustawia współczynniki warstwy wyjściowej na minus 0.3?
    - Co to znaczy, że minus 0,3 może rozpocząć szkolenie?
    - (Myślę, że Jeremy może najpierw spróbować -0,5, eksperymentuj, aby się tego dowiedzieć).
- Dodawanie stałej czy nie?
    - Dlaczego nie potrzebujemy stałej dla warstwy 1 (pomyśl o stałej modelu liniowego)?
    - Dlaczego musimy mieć stałą dla warstwy 2?
    - Czy współczynniki warstwy 1, warstwy 2 i stałe muszą mieć zainicjowane własne gradienty?
- Budowanie modelu
    - Co to jest krotka i jak jest używana do grupowania i oddzielania trzech współczynników?
    - Jak skonstruować funkcję predykcji, wysyłając dane przez warstwę 1 i warstwę 2, a następnie dodając stałe?
- Sieć neuronowa zrobiona, ale bardzo skomplikowana
    - Jak zaktualizować wszystkie trzy współczynniki w pętli?
    - Czy zauważyłeś, że szybkość uczenia ponownie się zmieniła? (1,4, ostatnio było 2, wcześniej 0,1)
    - Co Jeremy powiedział, że uruchomienie tego modelu było bardzo skomplikowane?

## Od sieci neuronowej (1 warstwa ukryta) do głębokiego uczenia z 2 warstwami ukrytymi

- Inicjalizacja współczynników wszystkich warstw ukrytych i stałych
    - Jak zainicjować współczynniki 2 warstw ukrytych i 1 warstwy wyjściowej oraz stałe, a także przygotować gradienty dla nich wszystkich w jednej kompaktowej funkcji?
    - Jaki jest kształt każdej macierzy współczynników?
- Budowanie modelu z 2 warstwami ukrytymi
    - Czym są funkcje aktywacji?
    - Jakie są funkcje aktywacji dla 2 warstw ukrytych?
    - Jaka jest funkcja aktywacji dla warstwy wyjściowej?
    - Jaki jest najczęstszy błąd w stosowaniu funkcji aktywacji do ostatniej warstwy?
- Trenowanie modelu
    - Nie zapomnij zaktualizować gradientów
    - Które liczby Jeremy musi jeszcze poprawić?
    - Czy ten model głębokiego uczenia poprawił stratę i dokładność?
- Analizowanie i eksperymentowanie z dużymi funkcjami
    - Jak eksperymentować na dużej funkcji, takiej jak init_coeffs, dzieląc ją na małe części i uruchamiając je?
- Tabelaryczne zbiory danych: gdzie głębokie uczenie się nie świeci
    - Jak powinniśmy myśleć o tym, że zarówno sieci neuronowe, jak i modele głębokiego uczenia nie są lepsze?
    - Co to znaczy, że starannie zaprojektowane algorytmy pokonały wszystkie modele głębokiego uczenia w konkursie Titanic?
    - W jakich zestawach danych uczenie głębokie generalnie radzi sobie lepiej?

## Framework: DL without super fiddling notebook

- Dlaczego warto używać frameworka zamiast budować go od zera?
    - Dlaczego powinieneś używać frameworków bibliotecznych w prawdziwym życiu, a nie budować samemu, jak powyżej?
    - Kiedy robić to od zera?
    - Co framework może dla nas zrobić?
    - Czy może zautomatyzować oczywiste rzeczy, takie jak inicjalizacja, szybkość uczenia się, zmienna fikcyjna, normalizacja itp.
    - Czy nadal mogę podejmować decyzje dotyczące nie tak oczywistych rzeczy?
- Inżynieria funkcji z pandami
    - Jak wygląda inżynieria funkcji z pandami?
    - Jak i gdzie Jeremy sugeruje kopanie w pandach?
- Automatyzacja rzeczy oczywistych podczas przygotowywania zbioru danych
    - Jak zautomatyzować kategoryzację danych, uzupełnianie brakujących danych, normalizację?
    - Jak określić kolumnę zależną jako kategorię?
- Tworzenie wielu ukrytych warstw za pomocą jednej linii kodu
    - Jak określić kształty dwóch ukrytych warstw za pomocą tylko dwóch liczb?
    - Czy wystarczy określić dokładność bez martwienia się o straty i aktywacje?
- Automatyzacja wyszukiwania najlepszego współczynnika uczenia
    - W jaki sposób fastai pomaga znaleźć zakres, w którym znajduje się najlepszy współczynnik uczenia?
    - Jak wybrać współczynnik uczenia z tego zakresu?

## Przewidywanie i przesyłanie z łatwością[](https://course.fast.ai/Lessons/Summaries/lesson5.html#predict-and-submit-with-ease)

- Zautomatyzuj transformację zestawu testowego w jednym wierszu kodu
    - Jak automatycznie zastosować wszystkie transformacje wykonane na zestawach treningowych i walidacyjnych do zestawu testowego?

## Eksperyment z Ensembling[](https://course.fast.ai/Lessons/Summaries/lesson5.html#experiment-with-ensembling)

- Ensemble jest łatwy z fastai
    - Czy framework pozwala zaoszczędzić tak wiele czasu, że eksperymentowanie z zaawansowanymi pomysłami staje się łatwiejsze?
    - Czym jest ensembling?
    - Czy jest to łączenie wielu modeli i łączenie ich prognoz?
- Najprostszy ensemble
    - Jak wygląda prosty ensemble?
    - Jak z łatwością zbudować, uruchomić i prognozować za pomocą 5 modeli?
    - Jak różne są te 5 modeli? (tylko początkowe współczynniki są różne)
    - Jak połączyć ich prognozy?
    - Jak dużą poprawę daje nam ten prosty zestaw?
- Sposoby łączenia prognoz
    - Dlaczego nie użyć trybu, ale średniej?
    - Jakie są 3 sposoby łączenia prognoz?
    - Czy któryś z nich jest lepszy od pozostałych?
    - Jaka jest sugestia Jeremy'ego?

## Jak naprawdę działa Random Forest[](https://course.fast.ai/Lessons/Summaries/lesson5.html#how-random-forest-really-work)

- Czy to dobre miejsce do nauki pand i numpy?
- Dlaczego Random Forest
    - Jaka jest historia Random Forest i Jeremy'ego?
    - Co Jeremy sądzi o random forest?
    - Dlaczego losowy las jest o wiele łatwiejszy i lepszy?
    - Dlaczego pozornie prosta regresja logistyczna jest tak łatwa do pomylenia?
- Funkcja kategoryczna Pandas
    - Jak zaimportować wszystkie potrzebne biblioteki na raz?
    - Jak zrobić fillna z pandas i log z numpy?
    - Co robi dla nas funkcja kategoryczna pandy?
    - Jaki jest przyjazny wyświetlacz po zastosowaniu funkcji?
    - Jaka jest rzeczywista transformacja danych pod maską?
    - Kluczowe punkty do zrobienia: Brak zmiennych fikcyjnych, Pclass nie muszą być już postrzegane jako kategorie
- Podziały binarne: podstawy lasu losowego
- Binarny podział na płeć
- Zbuduj binarny model podziału na płeć za pomocą sklearn
- Zbuduj binarny model podziału na ceny biletów za pomocą sklearn
- Zbuduj maszynę wyników na podziałach binarnych, niezależnie od tego, czy są kategoryczne czy ciągłe
    - Co to jest dobry podział?
    - Czy to dobrze, że w każdej grupie ich wartości zależne są podobne?
    - Jak zmierzyć podobieństwo wartości w grupie? std
    - Jak odpowiednio porównać odchylenia standardowe między dwiema grupami? (pomnóż przez rozmiar)
    - Jak obliczyć wynik do oceny podziałów na podstawie wartości połączonego odchylenia standardowego dwóch grup?
- Zautomatyzuj maszynę wyliczającą wynik na wszystkich kolumnach
    - Jak znaleźć najlepsze podziały binarne, wypróbowując wszystkie możliwe punkty podziału kolumny?
- Model 1R jako punkt odniesienia
    - Co to jest las losowy? i co to jest las losowy?
    - Co to jest model 1R?
    - Jak dobry był w latach 90. w świecie ML?
    - Czy zawsze powinniśmy wybierać skomplikowane modele?
    - Czy zawsze powinniśmy zaczynać od modelu 1R jako modelu bazowego dla naszego problemu?

[
](https://course.fast.ai/Lessons/Summaries/lesson4.html)