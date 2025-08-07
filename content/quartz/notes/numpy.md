---

title: NumPy  
created: 2025-07-16  
status:  
category: programowanie  
difficulty: podstawowy  
language: pl  
tags:

- python
- numpy
- analiza danych
- biblioteka
- obliczenia numeryczne  
aliases:
- numpy
- NumPy

---

# 🎯 Definicja

**NumPy** (Numerical Python) to podstawowa biblioteka Pythona służąca do obliczeń naukowych i numerycznych. Udostępnia szybkie, wielowymiarowe struktury danych (głównie macierze – `ndarray`) oraz szeroki zestaw funkcji matematycznych do operacji na tych strukturach.

# 🔑 Kluczowe punkty

- 📦 Dostarcza potężny obiekt: **np.ndarray** – n-wymiarowe tablice z obsługą operacji wektorowych.
- ⚡ Wydajność – operacje wykonywane są w C pod maską (dużo szybsze od klasycznych pętli Pythona).
- 🧪 Często używana jako fundament bibliotek takich jak **[[pandas]]**, **scipy**, **scikit-learn**, **tensorflow** i **pytorch**.
- ➗ Obsługuje operacje macierzowe, algebrę liniową, statystyki, transformaty Fouriera i inne przekształcenia numeryczne.

# 📚 Przykłady zastosowania

## Import i podstawowa tablica

```python
import numpy as np

a = np.array([1, 2, 3])
print(a)  # [1 2 3]
```

## Podstawowe operacje

```python
b = np.array([[1, 2], [3, 4]])
print(b.shape)     # (2, 2)
print(b.T)         # transpozycja
print(b.mean())    # średnia
```

## Operacje wektorowe

```python
a = np.array([1, 2, 3])
b = np.array([1, 0, -1])

print(a + b)       # [2 2 2]
print(a * b)       # [1 0 -3]
print(np.dot(a, b)) # iloczyn skalarny
```

## Tworzenie tablic

```python
np.zeros((2, 3))         # tablica zer
np.ones((3, 3))          # tablica jedynek
np.eye(4)                # macierz jednostkowa
np.arange(0, 10, 2)      # [0 2 4 6 8]
np.linspace(0, 1, 5)     # [0.   0.25 0.5  0.75 1.  ]
```

## Broadcasting

```python
a = np.array([[1], [2], [3]])
b = np.array([10, 20, 30])
print(a + b)
# [[11 21 31]
#  [12 22 32]
#  [13 23 33]]
```

# 💡 Przykład zastosowania

**[[Uczenie maszynowe]] / przetwarzanie danych:**

- Normalizacja danych wejściowych (`(x - mean) / std`)
- Obliczanie metryk (MAE, MSE, RMSE) z macierzy błędów
- Symulacje matematyczne, dane czasowe, przetwarzanie obrazów

# 🪛 Główne funkcje w NumPy

|Funkcja|Opis|
|---|---|
|`np.array()`|Tworzy tablicę NumPy|
|`np.reshape()`|Zmienia kształt tablicy|
|`np.mean()`, `np.std()`|Statystyki|
|`np.dot()`, `np.matmul()`|Mnożenie macierzowe|
|`np.random.rand()`|Generuje losowe liczby|
|`np.linalg.inv()`|Odwracanie macierzy|
|`np.save()`, `np.load()`|Zapis i odczyt tablic|

# 📌 Źródła

- Oficjalna dokumentacja: [https://numpy.org/doc/](https://numpy.org/doc/)
- Kurs NumPy na Real Python: [https://realpython.com/numpy-array-programming/](https://realpython.com/numpy-array-programming/)
- Numpy cheatsheet: [https://github.com/rougier/numpy-100](https://github.com/rougier/numpy-100)

# 👽 Brudnopis

- NumPy = „język numeryczny Pythona” – szybka macierzowa matematyka
- rdzeń naukowego środowiska danych w Pythonie → wszystko opiera się na ndarray
- warto znać: broadcasting, slicing, tablice logiczne, filtrowanie, maski
- integracja z C, Fortranem, czy cythonem — superwydajność