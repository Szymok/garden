---
title: Convolutional Neural Network (CNN)
tags: 
aliases:
---
## Czym są CNN?

CNN są projektowane z myślą o przestrzennym przetwarzaniu informacji. Składają się z warstw konwolucyjnych, które przeszukują obraz w poszukiwaniu lokalnych wzorców, takich jak krawedzie, tekstury przy pomocy filtrów.

## Filtry

Czym są filtry?

## Budowanie osadzeń od podstaw

- Jak będzie wyglądać część 2? Dużo głębiej technicznie? Umiejętność czytania i wdrażania artykułów naukowych? Modele obejmują rzeczywiste sytuacje?
- Przegląd budowania sieci neuronowej od podstaw. Jak Pytorch tworzy sieć neuronową bez wysiłku? Jak Pytorch śledzi wagi modelu za pomocą `Module`? W jaki sposób `Module` przechowuje wagi za pomocą `nn.Parameter`? Jak sprawdzić wagi z modelu za pomocą `parameters()`?

![module-parameter](https://forums.fast.ai/uploads/default/optimized/3X/a/c/ac1eeab37f915183a24b24161bc98b737375ed3a_2_690x284.png)

- Możesz zbudować warstwę w Module z `nn.Linear` bez `nn.Parameter`, a Pytorch może również odczytać z niej wagi.

![module-layer](https://forums.fast.ai/uploads/default/optimized/3X/6/1/6169abe36ea65492da4795d59819c0a7711926f3_2_690x252.png)

- Jak utworzyć funkcję `Embedding` i całą warstwę `DotProductBias` w pytorch używając `create_params` od zera? Po wytrenowaniu można sprawdzić wytrenowane `movie_bias`. Kształt uprzedzenia można sprawdzić za pomocą `model.movie_bias.shape`.

![create-embedding](https://forums.fast.ai/uploads/default/optimized/3X/b/3/b3ad05b6e908f82d01ae5bb03833fd3d22cdd07a_2_690x216.png)

![DotProductBias-pytorch](https://forums.fast.ai/uploads/default/optimized/3X/d/4/d463560b5dac88fa6265df49f186581365b15cd7_2_690x266.png)

![movie-bias-trained](https://forums.fast.ai/uploads/default/optimized/3X/b/9/b9c387939d608287db55c4fe3f2fde20579da859_2_690x352.jpeg)

- Pytania: Co robi `Tensor.normal_`?

![Tensor.Normal_](https://forums.fast.ai/uploads/default/optimized/3X/a/8/a8cd719c1c9b49df72a7b63cc140c558462bc2ca_2_690x173.png)

![why-no-zeros](https://forums.fast.ai/uploads/default/optimized/3X/1/c/1c35d70ecfae6df4e054fecb879be854bbe5679a_2_690x74.png)

## Interpretacja embeddings

- Po treningu, co `movie_bias` może nam powiedzieć o każdym i wszystkich filmach? Co oznacza niski bias dla filmu? Co oznacza wysokie odchylenie dla filmu? Czy `user_bias` może nam powiedzieć, który użytkownik po prostu kocha filmy, nawet te kiepskie? To jest wizualizacja `movie_bias`

![interpreting-bias](https://forums.fast.ai/uploads/default/optimized/3X/3/8/38eba26268dc461437ffe433be538e73f74d60bf_2_690x329.png)

- Co możemy zinterpretować lub zrobić z ogromną macierzą o kształcie `(num_users, 50)`? Jak zmniejszyć 50 ukrytych czynników do zaledwie 3 najważniejszych za pomocą `pca`?

![shrink-by-pca](https://forums.fast.ai/uploads/default/optimized/3X/c/4/c456a152f3dd0f85b7d17e6eee93c0179bc942d6_2_690x227.png)

- Jak zinterpretować wykres PCA filmów ocenionych za pomocą tylko dwóch czynników PCA z 3 skompresowanych przez 50 czynników? W jaki sposób gust lub styl filmów jest skondensowany do dwóch czynników i wyświetlany i definiowany przez położenie dwuwymiarowego wykresu? Jest to wizualizacja movie_factors lub embeddings.

![compress-movie-taste-by-2-factors](https://forums.fast.ai/uploads/default/optimized/3X/4/e/4eac3d75cab2db567ac45fba7fbf0ef17b2c514d_2_587x500.jpeg)

- W jaki sposób fastai ułatwia całą powyższą pracę za pomocą tylko jednej linii kodu?

![fastai-make-things-easier](https://forums.fast.ai/uploads/default/optimized/3X/e/d/ed57496a25b591290deb15ac0a87bc09276e6ee7_2_559x500.jpeg)

- Jak fastai konstruuje wszystko pod maską `collab_learner`?

![collab_learner](https://forums.fast.ai/uploads/default/optimized/3X/4/a/4afaa7b7a3eb83460fb708c1038a4bb7636931ae_2_690x241.jpeg)

![EmbeddingDotBias](https://forums.fast.ai/uploads/default/optimized/3X/3/6/36b95732e07160818fc282f97a1ea26feebde957_2_690x291.png)

- Pytania: czy PCA jest przydatne w innych zastosowaniach? Gdzie znaleźć więcej informacji o PCA? Dlaczego warto wziąć udział w kursie Rachel's Computational Linear Algebra?
- Jak użyć odległości osadzania, aby znaleźć podobieństwa filmów?

![embedding-distance-similarities](https://forums.fast.ai/uploads/default/optimized/3X/3/5/3570ea9ea1d9e3d83fcb1fc79da041378c2ab6cb_2_690x205.jpeg)

- Przejdź do szybkiej książki na temat boostrappingu modelu filtrowania opartego na współpracy

## Deep learning for collaborative filtering

- Jak wykonać filtrowanie kolaboracyjne z głębokim uczeniem zamiast uzupełniania macierzy za pomocą powyższego iloczynu kropkowego? Jak zastosować architekturę modelu sieci neuronowej easist do tego przypadku filtrowania opartego na współpracy?

![deep-learning-colab-filter](https://forums.fast.ai/uploads/default/optimized/3X/2/e/2e3885bd3fec97240d61b1114ada57a770dddcac_2_690x273.jpeg)

- W jaki sposób fastai używa reguł kciuka, aby zalecić liczbę ukrytych czynników dla użytkowników i filmów?

![number-latent-factors](https://forums.fast.ai/uploads/default/optimized/3X/7/0/70613b67c9727ff47186d2323466a5ddb589497a_2_690x154.png)

- W jaki sposób fastai wykorzystuje głębokie uczenie do budowania modelu filtrowania kolaboracyjnego na dwa sposoby?

![dl-way-2](https://forums.fast.ai/uploads/default/optimized/3X/3/6/362b88b96fc4ec0055caf95a2be17003dee2e4fc_2_690x391.jpeg)

Dlaczego wersje głębokiego uczenia nie są tak dobre jak wersja DotProduct? Czy to dlatego, że DotProduct jest bardziej dostosowany do problemu? W jaki sposób firmy łączą obie wersje, aby wykonać filtrowanie kolaboracyjne? Czy w przypadku dużej ilości metadanych należy zastosować do nich głębokie uczenie? Jak wykorzystać metadane w modelu? - Pytania: Czy mniejsza liczba użytkowników i filmów może przytłoczyć wszystkich innych? np. mała grupa entuzjastów anime ogląda wiele filmów anime i wystawia bardzo wysokie oceny. Szczegóły, jak sobie z nimi radzić, nie będą tutaj omawiane - Jak zastosować macierz osadzania w modelu NLP za pomocą demo arkusza kalkulacyjnego? Jaka jest istota sieci neuronowej?

![embedding-nlp](https://forums.fast.ai/uploads/default/optimized/3X/1/0/1052d5774f1d716e988c005abce8939662b6a2a3_2_561x500.jpeg)

- Jak zastosować osadzanie do tabelarycznego zbioru danych i modeli? Jak zrozumieć źródło `TabularModel` i `tabular_learner`?
- Co dzieje się wewnątrz sieci neuronowej poprzez konkurs kaggle dotyczący przewidywania sprzedaży w sklepie i opublikowany na jego podstawie artykuł?

## Convolutions

- Do tej pory przyjrzeliśmy się temu, co wchodzi jako dane wejściowe i co wychodzi z modelu jako dane wyjściowe. Przyjrzeliśmy się również środkowi jako mnożeniu macierzy. Czym są konwolucje (szczególny rodzaj mnożenia macierzy w środku)? W jaki sposób jest to bardzo przydatne w CV? Dlaczego MNIST jest jednym z najbardziej znanych zbiorów danych CV? W jaki sposób Jeremy stosuje artykuł Fergusa i Zeilera do MNIST przy użyciu Excela i splotu?
- Jak rozumieć konwolucję? Co robi filtr i jak pomaga wykrywać poziome i pionowe krawędzie? Jak określić rozmiar filtra lub jądra (3x3, 5x5 lub dowolny)? conv1 oznacza pierwszą warstwę konwolucyjną.
- przejście do drugiej warstwy konwolucyjnej. Dwa filtry dają nam dwa kanały na pierwszej warstwie konwolucyjnej. Na drugiej warstwie konwolucyjnej tworzymy jeden filtr macierzowy 3D, który ma dwa filtry macierzowe do filtrowania/przetwarzania dwóch kanałów z pierwszej warstwy konwolucyjnej i kondensowania wartości. Możemy również utworzyć drugi kanał dla drugiej warstwy konwolucyjnej przy użyciu innego filtra 3D.
- Jak określić dane wyjściowe i użyć SGD do trenowania modelu i optymalizacji filtrów?
- Co to jest maxpooling? Jaki jest problem z maxpoolingiem? Ile danych tracimy? Dlaczego jest to dobra rzecz? Co to jest gęsta warstwa i do czego służy?
- Jak dziś nieco inaczej wykonujemy splot? Co to jest splot stride-two i jak działa? (koniec z maxpoolingiem) Następnie wykonujemy wiele splotów stride-two, aż rozmiar zmniejszy się do 7x7, a następnie wykonujemy `average_pooling` (koniec z gęstą warstwą). Co oznacza siatka 7x7 i uśrednienie? Jaki jest problem takiego podejścia? Kiedy jest dobry moment na użycie maxpool? W jaki sposób fastai ułatwił nam wypróbowanie obu poolingów, wymyślając technikę zwaną `concat_pooling` do maxpool i `average_pool` i łącząc je razem?
- Jak rozumieć splot w kontekście mnożenia macierzy?
- Co to jest dropout i jak go zrozumieć za pomocą programu Excel? Co to jest maska dropout? Jaki jest jej efekt wizualny w programie Excel? Jak rozumieć dropout jako rozszerzenie danych dla aktywacji? Jak pomaga uniknąć nadmiernego dopasowania? Jaka jest historia dropout i środowiska akademickiego?
- Dlaczego Jeremy nie poświęca zbyt wiele czasu funkcjom aktywacji? Widzieliśmy wiele funkcji dotyczących metryk, strat i aktywacji.
- Co dalej przed fastai part2? O czym jest książka Radka meta learning? Jakie są rzeczy do zrobienia w Write, Help, Gather i Build?
- Członek społeczności fastai opublikował aktywację mish używaną przez wiele najnowocześniejszych modeli.

## Jeremy AMA

- Jak nadążyć? Aby nadążyć, koncentrując się na poddziedzinie głębokiego uczenia się i koncentrując się na rzeczach, które niewiele się zmieniają, ponieważ fundamenty fastai nie zmieniły się zbytnio od 5 lat temu. Wszystko inne to tylko poprawki.
- Czy ogromne zbiory danych i obliczenia na GPU zastąpią nas małymi zbiorami danych i jednym procesorem graficznym? Zawsze istnieją mądrzejsze sposoby robienia rzeczy, np. zespół Fastai trenował na imagenet na standardowym GPU szybciej niż wszystkie firmy z ogromną ilością GPU. Wybierz obszary różnych dziedzin, w których mniejsze modele mogą pokonać aktualny stan wiedzy.
- Jak Jeremy uczy dzieci matematyki? Wszystkie dzieci mogą uczyć się algebry z dragonbox5+. Świetnie, Jeremy obiecał porozmawiać więcej o nauczaniu dzieci w późniejszym terminie.
- Plany na przyszłość
- Jak przekształcić model w biznes? Świetna wiadomość, Jeremy planuje stworzyć kurs na ten temat! Jaki jest początek biznesu? Jaki jest pierwszy krok? Jak stopniowo dowiedzieć się, czy Twój pomysł ma realną potrzebę ze strony ludzi?
- Jak Jeremy pozostaje tak wydajny w pracy? Skończyć coś ładnie, wytrwałość