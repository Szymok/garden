---
title: Filtrowanie kolaboracyjne
tags: 
aliases:
---
- We wcześniejszych wykładach zbadaliśmy najprostszą sieć neuronową z w pełni połączonymi warstwami liniowymi. W tym wykładzie skupimy się na tweakowaniu pierwszej i ostatniej warstwy, a w kolejnych tygodniach na tweakowaniu środkowej części sieci neuronowej.
- Przegląd notatnika _Road to Top część 2_ i gratulacje dla studentów fastai, którzy pokonali Jeremy'ego na 1. i 2. miejscu.
- Jakie są korzyści z używania większych modeli? Jakie są problemy z większymi modelami? (zużycie pamięci GPU, ponieważ GPU nie jest tak sprytny jak CPU, aby znaleźć sposoby na uwolnienie się; więc duży model wymaga bardzo drogiego GPU) Co możemy zrobić, gdy GPU zabraknie pamięci? najpierw, aby ponownie uruchomić notebook; następnie Jeremy ma zamiar pokazać nam sztuczkę, która pozwoli nam trenować bardzo duże modele na Kaggle, Wow!
- Jak duży jest procesor graficzny Kaggle? Czy czasami trzeba uruchamiać notebooki na Kaggle, na przykład w konkursach kodu? Dlaczego używanie notebooka Kaggle do wygrywania w rankingach jest dobre i uczciwe?
- W jaki sposób Jeremy użył procesora graficznego 24G, aby dowiedzieć się, co może zrobić procesor graficzny 16G? W jaki sposób Jeremy dowiedział się, ile pamięci GPU wykorzysta dany model? W jaki sposób Jeremy wybrał najmniejszą podgrupę obrazów jako zestaw treningowy? Czy dłuższe trenowanie modelu zajmie więcej pamięci? (Nie) Tak więc, najmniejszy zestaw treningowy + 1 epokowy trening może szybko powiedzieć nam, ile pamięci potrzebuje model.
- Następnie Jeremy wytrenował różne modele, aby sprawdzić, ile pamięci zużywają. Ile pamięci zajmuje model convnext-small? Której linii kodu używa Jeremy, aby dowiedzieć się, ile pamięci GPU zajmuje model? Których dwóch linii kodu używa Jeremy, aby zwolnić niepotrzebnie zajętą pamięć GPU, tak aby nie trzeba było ponownie uruchamiać jądra w celu uruchomienia następnego modelu?

![gc](https://forums.fast.ai/uploads/default/optimized/3X/1/8/1873321e4fc2c4572c625303180eec7843967dbb_2_690x210.png)

- Co zrobić, jeśli model powoduje awarię cuda z powodu braku pamięci? Co to jest GradientAccumulation? Co to jest dzielenie liczb całkowitych? (`//`).

![gradientaccumulation](https://forums.fast.ai/uploads/default/optimized/3X/2/6/26d7b272d6e0d5a3a2802981037cba31124bdd43_2_690x230.jpeg)

- Jaki jest problem z używaniem mniejszego rozmiaru partii? (mniejszy rozmiar partii, większa zmienność współczynnika uczenia i wag) Jak możemy sprawić, aby model trenował w mniejszym rozmiarze partii, tak jakby był w dużym rozmiarze partii? Jak wyjaśnić metodę GradientAccumulation w kodzie?

![training-loop-without-gradientaccumulation](https://forums.fast.ai/uploads/default/optimized/3X/5/f/5f5de3dc9a36ce6ef7bb0413df0816afad42742f_2_690x158.png)

![gradientaccumulation-explained](https://forums.fast.ai/uploads/default/optimized/3X/f/9/f9daf4e38da769cb3de7a0c8cdf20c74fd8d18b7_2_690x210.jpeg)

- Jakie są konsekwencje korzystania z GradientAccumulation? Jak duża jest różnica w wyniku liczbowym między użyciem GradientAccumulation a nie? Jaka jest główna przyczyna tej różnicy?
- Więcej pytań: w powyższym kodzie powinno być `count &gt;= 64` podczas wykonywania GradientAccumulation; `lr_find` używa rozmiaru partii z DataLoadera;
- Dlaczego po prostu nie użyć mniejszego rozmiaru partii zamiast GradientAccumulation? Jaka jest praktyczna zasada wybierania wielkości partii? Jak dostosować szybkość uczenia się do wielkości partii?
- W jaki sposób Jeremy użył GradientAccumulation, aby dowiedzieć się, ile `accum` jest potrzebne do uruchomienia tych dużych modeli na 16G GPU Kaggle? (`accum=1` zawsze zabraknie pamięci, ale `accum=2` działa dla wszystkich dużych modeli).

![gradientaccumulation-large-models](https://forums.fast.ai/uploads/default/optimized/3X/c/c/cc4d36bc34d4f4d1c313b96cdf252b9e6c9ac33d_2_690x81.png)

## Tworzenie ensemble

- W jaki sposób Jeremy połączył wszystkie modele i ich ustawienia w celu późniejszego eksperymentowania? Czy na razie musimy używać rozmiaru specyfikacji modelu, a co z przyszłością?

![models-testing](https://forums.fast.ai/uploads/default/optimized/3X/2/b/2bac3e816fa5bb631ba278430031a9561b3fffbc_2_665x500.jpeg)

![training-set-images](https://forums.fast.ai/uploads/default/optimized/3X/2/a/2a249910c04e58ec006290f08688e7b0f8aeea81_2_690x56.png)

- Jak uruchomić wszystkie modele ze specyfikacjami bez wyczerpania pamięci?

![run-all-models-without-out-memory](https://forums.fast.ai/uploads/default/optimized/3X/a/e/ae921c0da2bf64fe0e3d890f7cf3effe0e8369d5_2_690x304.jpeg)

- Dlaczego Jeremy nie używa tutaj `seed=42` w treningu? Jaki jest tego efekt?
- Czym jest ensemble lub bagging różnych dobrych architektur głębokiego uczenia? Dlaczego jest to przydatne?
- Jak stworzyć zespół różnych modeli głębokiego uczenia?

![ensemble1](https://forums.fast.ai/uploads/default/optimized/3X/e/2/e2960f76f91dcb5e888127e89ce267d08a6eb1bb_2_690x349.jpeg)

![ensemble2](https://forums.fast.ai/uploads/default/optimized/3X/4/3/43a6e2e47b5d49d201353fff1b15279f149b8d08_2_690x295.jpeg)

![ensemble3](https://forums.fast.ai/uploads/default/optimized/3X/4/5/45548cc497f861df5b5c4a1234bc17aee41d7cee_2_690x317.jpeg)

![ensemble4](https://forums.fast.ai/uploads/default/optimized/3X/5/1/51f580a36eab28daedbb68779840e1963c85f03b_2_690x183.png)

- Dlaczego powinniśmy codziennie ulepszać i zgłaszać się do Kaggle? W jaki sposób historia zgłoszeń może pomóc w śledzeniu rozwoju i ulepszania modeli?
- Więcej pytań: Co to jest k-krotna walidacja krzyżowa i jak można ją zastosować w tym przypadku? Dlaczego Jeremy jej nie używa?
- Czy są jakieś wady GradientAccumulation? Jakieś rekomendacje dotyczące GPU?
- W części 2 Jeremy może omówić, jak trenować mniejszy model, aby radził sobie dobrze, jak w dużych modelach, aby szybciej wnioskować

## Multi-target model

- Jak ustawić podział danych oraz transformacje pozycji i partii?

![datablock-2-labels](https://forums.fast.ai/uploads/default/optimized/3X/6/7/6708adef38cb0f664442d2e9e3f846fda75a045d_2_690x235.png)

- Jak utworzyć model do przewidywania zarówno chorób, jak i odmian? Czy możemy zobaczyć przewidywanie zarówno choroby, jak i odmiany w kategoriach przewidywania 20 rzeczy, 10 dla choroby, 10 dla odmiany?
- Czego potrzebuje teraz nowy model (i nowi dostawcy danych), aby przewidywać choroby?

![new-disease-error-rate-loss](https://forums.fast.ai/uploads/default/optimized/3X/4/8/48c068723f1b2f8c4205d02c96d9f5d6e2d65189_2_690x254.jpeg)

![new-model](https://forums.fast.ai/uploads/default/optimized/3X/4/e/4ee51a1545b8b3f3d8ea0a0b485d45dddc1a2a90_2_690x159.png)

- Kiedy i jak zapewnić własną funkcję straty? fastai może wykryć odpowiednią stratę dla twoich modeli danych i użyć jej domyślnie w prostych przypadkach. W tym szczególnym przypadku, w jaki sposób możemy utworzyć i użyć naszej niestandardowej straty dla nowego modelu?

## Entropia krzyżowa i softmax

- Co dokładnie robi `F.cross_entropy`? Ta funkcja należy do pierwszej i ostatniej warstwy, dlatego musimy je zrozumieć. Jaki jest surowy wynik modelu przewidywania 5 rzeczy?

![softmax1](https://forums.fast.ai/uploads/default/optimized/3X/5/6/563e70daa1930078e47617c7c2db3897446f3848_2_544x500.jpeg)

- Jaka jest formuła softmax i jak ją obliczyć w arkuszu kalkulacyjnym?

![softmax-calculated](https://forums.fast.ai/uploads/default/optimized/3X/0/b/0bee952ff080de7e7b050fa9e81dd483414da494_2_645x500.jpeg)

- Na czym polega problem softmax? Jak to się dzieje, że podając obraz kota do klasyfikatora niedźwiedzi, softmax dokonuje oczywistej błędnej prognozy?
- Co możemy zrobić z powyższym problemem softmax? (wszystkie prawdopodobieństwa predykcji nie sumują się do 1). Kiedy używać softmax, a kiedy nie?
- Jaka jest pierwsza część wzoru na stratę cross_entropy?

![part1-crossentropy](https://forums.fast.ai/uploads/default/optimized/3X/6/1/613442943a389b25d30f73afe94a2172da533018_2_690x495.jpeg)

- Jak obliczyć entropię krzyżową z softmax?

![calc-cross-entropy](https://forums.fast.ai/uploads/default/optimized/3X/8/5/8546446e26005bcfb41f2dbea8f094ea6044c9cf_2_620x500.jpeg)

- Jak obliczyć binarną entropię krzyżową? Jak zrozumieć jego formułę w przewidywaniu, czy jest to obraz kota, czy nie? Jak ostatecznie uzyskać stratę binarnej entropii krzyżowej dla partii 5 obrazów?

![binary-cross-entropy-calc](https://forums.fast.ai/uploads/default/optimized/3X/d/7/d7194a9f6353d643b0a9472756fa076dfd335597_2_690x473.jpeg)

- Jakie są dwie wersje entropii krzyżowej w pytorch i kiedy używać każdej z nich? Której wersji używamy tutaj?

![cross-entropy-v1](https://forums.fast.ai/uploads/default/optimized/3X/2/2/2245e4c140536aad1ef5b72a9543afda38ac65a5_2_690x264.jpeg)

![cross-entropy-v2](https://forums.fast.ai/uploads/default/optimized/3X/2/a/2ab6375dd73126e7635687a7fd3110b305eedded_2_690x114.png)

## Aktywacje wielu celów

- Ponieważ dataloader ma dwa cele, nasz nowy model musi zostać poinformowany, jaka dokładnie jest funkcja straty, metryka i rozmiar danych wyjściowych?

![model-specifications](https://forums.fast.ai/uploads/default/optimized/3X/2/2/222cd9dc5c842f4a39c8046b85ac640c65664f82_2_690x182.jpeg)

- Jak utworzyć model uczący się do przewidywania dwóch celów lub 20 elementów? W jaki sposób uczący się wykorzystuje straty związane z chorobami i odmianami, aby wiedzieć, które 10 elementów to prognozy dotyczące chorób, a które 10 to prognozy dotyczące odmian? Jak połączyć ze sobą dwie funkcje strat? Jak zrozumieć połączoną stratę?

![model-output-20](https://forums.fast.ai/uploads/default/optimized/3X/a/8/a877afc66e453b40fd4194e9070c33505470975e_2_690x127.png)

![loss-disease](https://forums.fast.ai/uploads/default/optimized/3X/6/6/665c97da404c8608e3d198db8812c895e5c93660_2_690x151.png)

![loss-variety](https://forums.fast.ai/uploads/default/optimized/3X/7/b/7b91f907777aa2cb90cf68c1878c903c444694f1_2_690x139.png)

![combine-loss](https://forums.fast.ai/uploads/default/optimized/3X/a/6/a61748d386d2c9bcbcd6f2555a88f3d058529bcf_2_690x132.png)

- Jak obliczyć poziom błędu dla typów chorób i odmian? Jak je połączyć i wyświetlić podczas treningu?

![metrics-all-together](https://forums.fast.ai/uploads/default/optimized/3X/9/0/90658b962d8ec66766ed27c63af27424cabe6613_2_690x279.jpeg)

- Jak stworzyć nowy model uczący się i jak przebiegało jego szkolenie? Dlaczego model wielozadaniowy nie poprawił się, a nawet był nieco gorszy od poprzedniego modelu? Dlaczego dłuższe trenowanie modelu wielozadaniowego może poprawić dokładność przewidywania chorób? Dlaczego przewidywanie drugiej rzeczy razem może pomóc poprawić przewidywanie pierwszej rzeczy? Korzystanie z modelu wielozadaniowego poprawiło wynik w konkursie Kaggle dotyczącym przewidywania ryb, który Jeremy przeprowadził wcześniej. Jakie są powody lub korzyści z tworzenia modeli wielozadaniowych?

![train-combined-loss-metrics-all](https://forums.fast.ai/uploads/default/optimized/3X/0/f/0f18c85770f6737745434ab2b4812fc73854baa1_2_690x138.png)

![result-little-worse](https://forums.fast.ai/uploads/default/optimized/3X/a/0/a0ce75a163a66d0c5f00875347ea1abdb3379fb7_2_690x363.jpeg)

Jak sprawić, by modelowanie wielozadaniowe było mniej mylące? (build a multi-task for Titanic dataset from scratch; explore and experiment this notebook) by Chris Said of binary-cross-entropy?

## Collaborative filtering

- Głębokie nurkowanie w filtrowaniu kolaboratywnym jako rozdział 8 bez zmian. Jaki jest używany zbiór danych? Której wersji danych używamy? Jak odczytać plik tsv za pomocą pand? Jak odczytać/zrozumieć zawartość/kolumny zbioru danych? Branża systemów rekomendacji i Radek. Jak Jeremy woli widzieć dane? (Dlaczego obraz, na którym Jeremy mówi o swoim preferowanym sposobie wyświetlania danych, ma tak mało pustych lub brakujących danych?

![zbiór danych](https://forums.fast.ai/uploads/default/optimized/3X/e/c/ec8cf3b5f0af012bc4fca4cf1b82f55fab674aae_2_690x219.jpeg)

![read-tsv](https://forums.fast.ai/uploads/default/optimized/3X/a/9/a97bf7cf60d140f3b43748d771fd6a4fedb1cf3b_2_690x332.jpeg)

![Jeremy-see-this-way](https://forums.fast.ai/uploads/default/optimized/3X/6/4/64d971d762156b93315e3fd15e9f49cb0987f0e8_2_690x313.jpeg)

- Jak uzupełnić brakujące dane lub luki w zestawieniu tabelarycznym? Jak dowiedzieć się, czy nowemu użytkownikowi spodoba się konkretny film, którego wcześniej nie oglądał? Czy możemy dowiedzieć się, jakiego rodzaju/gatunku jest konkretny film, o którym tutaj mówimy? Jak wygląda prawdopodobieństwo typu filmu? Jak wygląda prawdopodobieństwo preferencji użytkownika? Jeśli dopasujemy te dwa zestawy prawdopodobieństw, czy możemy wiedzieć, jak bardzo użytkownik lubi film? Jak to obliczyć?

![types-movie](https://forums.fast.ai/uploads/default/optimized/3X/5/9/592b2fdb4fb49e0dc932863c8035b5016cbf4425_2_690x188.jpeg)

![user-preference-sum](https://forums.fast.ai/uploads/default/optimized/3X/4/f/4f5531e5b7200f92d3a9af4247df3f504d1024af_2_690x292.jpeg)

![lower-value](https://forums.fast.ai/uploads/default/optimized/3X/c/0/c00851f68905b8243d3b73658463e979ac2ee73b_2_690x304.png)

- Jak dotąd dobrze, jaki jest problem z podejściem polegającym na wykonaniu iloczynu kropkowego między prawdopodobieństwami preferencji użytkownika i prawdopodobieństwami typu filmu w celu ustalenia oceny filmu przez naszego nowego użytkownika (nie znamy żadnego z prawdopodobieństw)? Jak poradzimy sobie z tym problemem? Czy możemy stworzyć takie prawdopodobieństwo typu filmu, nie znając nawet typów?
- Czym są czynniki ukryte? Jeśli nie wiem nic o filmach, czy możemy użyć SGD (stochastic gradient descent), aby je znaleźć? Czy możemy utworzyć losowe 5 liczb jako 5 ukrytych czynników filmu, aby opisać typy filmu i dowiedzieć się ich później? Czy możemy również utworzyć ukryte czynniki dla każdego użytkownika? Jak obliczyć prawdopodobieństwo, że użytkownik polubi film? (suma lub iloczyn kropkowy między dwiema grupami ukrytych czynników).

![latent-factors-movie](https://forums.fast.ai/uploads/default/optimized/3X/3/2/329b0259a8e6b1d8e4bd225dbf378efe9e189be0_2_690x456.jpeg)

![latent-factor-for-all-movies](https://forums.fast.ai/uploads/default/optimized/3X/d/c/dc1b0d2e8e766a0750c94881c77bad576fee0fdd_2_690x386.jpeg)

![latent-factors-user](https://forums.fast.ai/uploads/default/original/3X/0/4/043d85eca9ca0e2198ba5f1b6fa629ba470cebfe.jpeg)

![matrix-multiply-dot-product](https://forums.fast.ai/uploads/default/optimized/3X/7/6/7628a9b85d34d0383be3c904f3a7c0c49e9a2484_2_690x405.jpeg)

- Teraz iloczyn macierzy i kropek może dać nam przewidywania dotyczące tego, jak bardzo użytkownik lubi film, więc możemy porównać przewidywania z prawdziwą etykietą. Co zrobić, gdy brakuje etykiety lub danych? (czynimy prognozę pustą lub zerową). Czy możemy użyć SGD, aby poprawić ukryte czynniki, porównując przewidywania z etykietami za pomocą funkcji straty? Jak użyć solvera Excela do aktualizacji czynników ukrytych przy użyciu SGD i straty?

![missing-data-empty](https://forums.fast.ai/uploads/default/optimized/3X/e/f/ef6ab1294f1093259e4c5df1c921703361fdd384_2_670x500.jpeg)

![make-missing-zero](https://forums.fast.ai/uploads/default/optimized/3X/0/4/04fbaa36a4c360959c0a826caba9592b0b5514c9_2_523x500.jpeg)

![the-loss-pred-label](https://forums.fast.ai/uploads/default/optimized/3X/7/5/755438b324e3799f6ce766c713c6b5036ae8bf81_2_690x362.jpeg)

![excel-solver](https://forums.fast.ai/uploads/default/optimized/3X/0/1/0159ecab4e53556ebdad0b406b13b73805ad6616_2_690x427.jpeg)

Dlaczego excel tak wolno oblicza gradienty nawet przy małych zbiorach danych? Na czym opiera się filtrowanie kolaboracyjne? (jeśli wiemy, że A lubi (a, b, c), a B lubi (a, b, c), to jeśli A lubi (d, e), to może B też lubi (d, e)). - Czy cosinus kąta między dwoma wektorami jest tym samym, co iloczyn skalarny? - Jak zrobić powyższe rzeczy w pytorch, ponieważ mają one inny format danych niż excel? Jak wygląda zestaw danych w pytorch?

![collab-dataset-pytorch](https://forums.fast.ai/uploads/default/optimized/3X/b/a/ba1b5333c95a803967c9b6b3b5922f6200aec599_2_690x326.jpeg)

## Embeddings

- Co to jest osadzanie? Co to jest macierz osadzania, osadzanie użytkowników i osadzanie filmów? (embeddings = wyszukiwanie czegoś w tablicy). Im bardziej onieśmielające słowa są tworzone w polu, tym mniej onieśmielające jest to pole.

![embeddings](https://forums.fast.ai/uploads/default/optimized/3X/2/c/2c3081a4e2471d0dc86d6a4e76751662ebb27739_2_690x279.jpeg)

- Jak wygląda nasz zbiór danych przed utworzeniem na nim dataloadera? Jak utworzyć dataloaders do filtrowania kolaboracyjnego przy użyciu `CollabDataloaders.from_df`? Jak wygląda jego `show_batch`? Jak utworzyć czynniki ukryte użytkownika i filmu?

![dataset-movie-dataloader](https://forums.fast.ai/uploads/default/optimized/3X/7/5/758eb7bc56f1562e7dbe2525c359cc80ae55cc23_2_610x500.jpeg)

![build-dataloader-cf](https://forums.fast.ai/uploads/default/optimized/3X/8/f/8f28b35c026c563c233282bbe7393cb9af0d4b67_2_690x172.jpeg)

![cf-show-batch](https://forums.fast.ai/uploads/default/optimized/3X/a/9/a9d0bdf31e8734a7c0ed40edd1ef3e36e53c2298_2_690x397.jpeg)

![create-latent-factors](https://forums.fast.ai/uploads/default/optimized/3X/7/8/7838f8430473f724a2e3e5156a25f7d6bda54b72_2_690x211.png)

- Jak wybrać liczbę ukrytych czynników w fastai?
- Jak zrozumieć, że szukanie w Excelu ukrytych czynników i robienie iloczynu kropkowego z osadzeniami one-hot to w rzeczywistości to samo? Czy możemy myśleć o zagnieżdżeniach jako o obliczeniowym skrócie do pomnożenia czegoś przez wektor zakodowany jednym rzutem? Czy możemy myśleć o osadzaniu jako o sztuczce matematycznej kucharza polegającej na przyspieszeniu mnożenia macierzy za pomocą zmiennych fikcyjnych (bez tworzenia zmiennych fikcyjnych ani wektora zakodowanego na jeden strzał)?

![look-up-dot-product](https://forums.fast.ai/uploads/default/optimized/3X/1/f/1f254bae3830f4f79cc07b6c16a0511ac63bbfaf_2_690x345.png)

![one-hot-encoding-look-up](https://forums.fast.ai/uploads/default/optimized/3X/6/c/6c1dd2073754edda0a1bfe7acc38db80506396ba_2_690x243.jpeg)

![mmultiplication](https://forums.fast.ai/uploads/default/optimized/3X/b/0/b0b6205134341c68799a9739bf55c105edc870dd_2_690x373.jpeg)

## Programowanie obiektowe

- Jak zbudować model filtrowania kolaboracyjnego od podstaw? Jak utworzyć klasę (skoro model jest klasą)? Jak zainicjować obiekt klasy przez `__init__`? Czy `__init__` mówi nam, jakie parametry należy podać, aby utworzyć instancję klasy? Jak działa funkcja klasy `say`? Czym jest superklasa? Gdzie ją umieszczamy podczas tworzenia klasy? Co ona nam daje? Jaka jest nadklasa (moduł), której pytorch i fastai używają podczas tworzenia klasy? Jak wygląda klasa `DotProduct`?

![learn-create-class](https://forums.fast.ai/uploads/default/optimized/3X/f/3/f39bb45a2a9aeec4c50c2230dbe546bbbd8ef903_2_690x244.jpeg)

![class-example](https://forums.fast.ai/uploads/default/optimized/3X/5/2/52e85a3c36db128d42865dbb4714073ae54b1415_2_690x157.png)

![super-class](https://forums.fast.ai/uploads/default/optimized/3X/9/5/958dd964f8d2dc24382de7a0799e03c960a6e43a_2_690x302.jpeg)

![Dot-product-class](https://forums.fast.ai/uploads/default/optimized/3X/4/9/49d96bdbc7ea8dc9621aba7e72e9a901de712307_2_690x215.jpeg)

- Jak rozumieć funkcję `forward` w klasie `DotProduct`? Co oznacza `.sum(dim=1)` (suma każdego wiersza)?

![forward-understanding](https://forums.fast.ai/uploads/default/optimized/3X/7/b/7befe31f450692edb4c008b80ea0b59b2d54b2b8_2_690x220.jpeg)

## Improving collaborative filtering

- Jak utworzyć kolaboracyjnego ucznia i rozpocząć szkolenie? Trening jest bardzo szybki nawet na CPU.

![one-batch-look-like](https://forums.fast.ai/uploads/default/optimized/3X/4/2/426c364888d12db84268e7fa5f3feac9babb2d55_2_690x175.png)

![collab-learner](https://forums.fast.ai/uploads/default/optimized/3X/9/8/980f8b59b9e8339f4b22f4786d9eb3f8c1c6f627_2_690x262.jpeg)

- Dlaczego powyższy model współpracy nie jest świetny? (ludzie, którzy wystawiają oceny, to ludzie, którzy kochają filmy, nie rzadko dają 1, ale wiele wysokich ocen. Podczas gdy przewidywania mają wiele okazji z ocenami powyżej 5). Przejrzyj użycie sigmoidy. Jak możemy wykonać transformację sigmoidalną do prognoz? Jak działa ta sigmoida? Dlaczego używamy górnej granicy zakresu `5.5` zamiast `5`? Czy dodanie sigmoidy zawsze poprawia wynik?

![sigmoid-transform](https://forums.fast.ai/uploads/default/optimized/3X/e/a/ea31571a3891e95cfc3ce1b1b52007dff4b7a94b_2_690x245.jpeg)

- Jakie interesujące rzeczy zaobserwował Jeremy na podstawie zbioru danych? (niektórzy użytkownicy lubią wystawiać wysokie oceny wszystkim filmom, inni mają tendencję do nielubienia wszystkich filmów). Czy możemy dodać jedną wartość stronniczości do ukrytych czynników użytkownika i filmu, aby wyjaśnić tę interesującą obserwację? Jak używać czynników bias w modelu collab?

![user-tendency](https://forums.fast.ai/uploads/default/optimized/3X/b/b/bbb126f8323ca2c266f1c1867b57c7acb46f4bcd_2_690x282.jpeg)

![bias-factor](https://forums.fast.ai/uploads/default/optimized/3X/8/8/88b82221d76673d397e4f1e605f2d80134e344c4_2_690x448.jpeg)

![adding-biases-to-prediction](https://forums.fast.ai/uploads/default/optimized/3X/0/d/0d68c8c1c93606101295312c8c9e96aaf69f308d_2_690x319.jpeg)

- Dlaczego ulepszony model z biasem pogorszył się? (nadmierne dopasowanie).

![overfitting-collab](https://forums.fast.ai/uploads/default/optimized/3X/1/5/15be1b4b512651c13de6f325e98ab67837020696_2_690x268.jpeg)

## Weight decay

- Czym jest weight decay i w jaki sposób pomaga? Jak rozumieć rozkład wagi w rozwiązywaniu problemu nadmiernego dopasowania?

![weight-decay](https://forums.fast.ai/uploads/default/optimized/3X/2/b/2ba175a248170dc42de2cb2a3e49a8a3c1afa777_2_690x290.jpeg)

- Jak właściwie używać weight decay w kodzie fastai? Czy fastai ma dobre ustawienia domyślne dla filtrowania kolaboracyjnego, takiego jak CV? W jaki sposób Jeremy sugeruje znalezienie odpowiedniej wartości `wd` dla własnego zbioru danych?

![weight-decay2](https://forums.fast.ai/uploads/default/optimized/3X/2/d/2d240b5fcf7b6b92643497067176a390d41778d7_2_690x268.jpeg)

![weight-decay3](https://forums.fast.ai/uploads/default/optimized/3X/e/7/e728e7640b79a3ead582d8feefe518e1e8b999d5_2_690x260.jpeg)

- Co to jest regularyzacja? Co jest nie tak, gdy wagi mają wysokie lub niskie wartości? W jaki sposób rozkład wag pomaga zrównoważyć wyniki?
- Więcej pytań: czy istnieją inne zasady poza regułą kciuka Jeremy'ego dotyczącą liczby ukrytych czynników, a rekomendacja na podstawie średniej oceny jest opłacalna tylko wtedy, gdy istnieje wiele metadanych.
