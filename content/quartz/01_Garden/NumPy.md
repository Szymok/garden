---
title: NumPy (Numerical Python)
created: 2026-02-04
status: evergreen
category: Python / Data Science
difficulty: intermediate
language: pl
tags:
  - python
  - numpy
  - math
  - arrays
  - linear-algebra
aliases:
  - Numerical Python
  - Biblioteka NumPy
---
# 🎯 Definicja
**NumPy** to fundament obliczeń numerycznych w Pythonie. Bez NumPy nie byłoby [[Pandas]], Scikit-Learn ani PyTorch. Jego sercem jest obiekt `ndarray` - tablica, która jest 50x szybsza niż zwykła lista w Pythonie, bo pod spodem działa w języku C.

# 🔑 Kluczowe punkty
- **Wektoryzacja:** Zamiast pisać pętle `for`, wykonujesz operacje na całych tablicach naraz (`array1 + array2`).
- **Broadcasting:** Magia, która pozwala dodawać liczbę (skalar) do macierzy bez ręcznego kopiowania.
- **Algebra Liniowa:** Mnożenie macierzy, transpozycja, rozkłady - wszystko wbudowane.

# 📚 Szczegółowe wyjaśnienie
Dlaczego Python (wolny język) dominuje w Data Science? Właśnie dzięki bibliotekom takim jak NumPy, które są tylko "wrapperem" na superszybki kod w C/Fortranie.
Kiedy robisz `np.sum(array)`, Python tylko wydaje rozkaz, a ciężką pracę wykonuje C.

# 💡 Przykład zastosowania
Masz milion ocen filmów. Chcesz je podnieść o 10%.
W czystym Pythonie:
```python
nowe_oceny = [x * 1.1 for x in oceny] # Wolne! Pętla w Pythonie.
```
W NumPy:
```python
nowe_oceny = oceny * 1.1 # Szybkie! Wektoryzacja w C.
```

## 📌 Źródła
- NumPy Documentation.

## 👽 Brudnopis
- Jeśli pracujesz z tabelami danych (Excel-like), używasz [[Pandas]] (który jest zbudowany na NumPy). Jeśli pracujesz z obrazami, dźwiękiem lub surowymi macierzami - używasz czystego NumPy.