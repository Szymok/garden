---

title: "Notacja Big-O"  
created: 2025-07-16  
status: Final  
category: Algorytmy i Złożoność  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- algorytmy
- notacja asymptotyczna
- złożoność obliczeniowa  
aliases:
- big o
- big o notation
- górne ograniczenie

---

# 🎯 Definicja

**Notacja Big-O (O-notation)** to jedno z podstawowych narzędzi służących do określania **złożoności czasowej i pamięciowej algorytmu**. Mierzy **górne ograniczenie** ("upper bound") tempa wzrostu funkcji – tzn. ile operacji (lub jednostek zasobu) algorytm może maksymalnie wykonać dla danych wejściowych o rozmiarze `n`.

# 🔑 Kluczowe punkty

- Big-O reprezentuje najgorszy przypadek (worst-case) działania algorytmu.
- Pomaga w porównywaniu efektywności różnych algorytmów niezależnie od konkretnej implementacji czy maszyny.
- Umożliwia oszacowanie skali problemu: jak czas/działania rosną względem przyrostu wejścia (`n`).
- Wzrost może być: stały O(1), liniowy O(n), logarytmiczny O(log n), kwadratowy O(n²), wykładniczy O(2ⁿ) itd.

# 📚 Szczegółowe wyjaśnienie

## Zasady zapisu i interpretacji

Dla funkcji O(g(n)) definiujemy:

$$ O(g(n)) = { f(n): \exists c > 0, n_0 > 0, \text{takie że} ; f(n) \leq c \cdot g(n) ; \forall n \geq n_0 } $$

Jest to formalnie zbiór funkcji rosnących nie szybciej niż `g(n)` – czyli **ograniczenie z góry**.

## Przykłady złożoności

|Przykładowa funkcja|Klasa złożoności|Opis|
|---|---|---|
|`return x + y`|O(1)|Stała liczba operacji|
|`for i in range(n): ...`|O(n)|Liniowa, zależna od `n`|
|`for i in range(n): for j in range(n): ...`|O(n²)|Kwadratowa, podwójna pętla|
|`binarySearch(arr, x)`|O(log n)|Logarytmiczne – np. wyszukiwanie|
|`fibonacci(n)` (rekurencja)|O(2ⁿ)|Wykładnicza – złożona rekurencja|

## Kluczowe obserwacje

- **Pomijamy stałe** (np. O(2n) → O(n))
- **Pomijamy niższe rzędy** (np. O(n² + n) → O(n²))
- Oceniamy dominującą część funkcji – to ona zadecyduje o skalowaniu dla dużych `n`.

# 💡 Przykład zastosowania

Sortowanie typu Bubble Sort ma złożoność O(n²), co czyni go nieefektywnym dla dużych zbiorów danych. Dla danych 10 000 elementów Bubble Sort może potrzebować aż 100 000 000 operacji. Z kolei Merge Sort (O(n log n)) poradzi sobie znacznie szybciej.

W praktyce oznacza to, że wybór odpowiedniego algorytmu — ocenianego właśnie przy pomocy notacji Big-O — ma bezpośredni wpływ na skalowalność i wydajność aplikacji.

## 📌 Więcej informacji

- [Geeks for Geeks – Asymptotic Notations](https://www.geeksforgeeks.org/analysis-of-algorithms-set-3asymptotic-notations/)
- [Big-O Analysis Guide](https://www.geeksforgeeks.org/analysis-algorithms-big-o-analysis/)
- [CS50 – Harvard: Lecture on Algorithms](https://cs50.harvard.edu/x/2024/weeks/3/)

## 👽 Brudnopis

- Big-O = górna granica złożoności ("najgorszy przypadek")
- O(1) zawsze przewidywalny czas, niezależnie od rozmiaru danych
- O(n log n) traktowany jako "praktycznie szybki" (QuickSort, MergeSort)
- uważaj na "hidden cost": duża stała w O(1) może sprawiać problemy
- Notacje powiązane: Ω (minimum), Θ (dokładny wzrost)

---