---
title: Pliki Pickle (.pkl)
created: 2026-02-04
status: evergreen
category: Python / Serialization
difficulty: basic
language: pl
tags:
  - python
  - serialization
  - machine-learning
  - security
aliases:
  - Pickle
  - Serializacja obiektów
---
# 🎯 Definicja
**Pickle** to format binarny w Pythonie służący do "zamrażania" obiektów. Możesz wziąć skomplikowany model [[Machine Learning|Machine Learning]] (który uczył się 5 godzin), zapisać go do pliku `.pkl` (zamrozić), a potem odczytać w sekundę na innym komputerze (odmrozić) i używać.

# 🔑 Kluczowe punkty
- **Serializacja:** Zamiana obiektu w pamięci RAM na ciąg bajtów na dysku.
- **Python-specific:** Działa tylko w Pythonie. Nie otworzysz tego w Javie czy C++.
- **Niebezpieczeństwo:** ⚠️ Nigdy nie otwieraj plików `.pkl` od nieznajomych. Mogą zawierać złośliwy kod, który wykona się przy otwarciu!

# 📚 Szczegółowe wyjaśnienie
W Data Science używa się Pickle do zapisywania wytrenowanych modeli (np. Scikit-Learn).
Alternatywą jest format **ONNX** (bezpieczniejszy i przenośny między językami) lub **Joblib** (lepszy dla dużych tablic [[NumPy|NumPy]]).

# 💡 Przykład zastosowania
Trenujesz sieć neuronową.
Po 100 epokach zapisujesz: `pickle.dump(model, open('model.pkl', 'wb'))`.
Wrzucasz plik na serwer produkcyjny.
Serwer wczytuje: `model = pickle.load(open('model.pkl', 'rb'))`.
Serwer może od razu przewidywać wyniki, bez ponownego treningu.

## 📌 Źródła
- Python Documentation `library/pickle`.

## 👽 Brudnopis
- "Pickle is not secure". To mantra każdego inżyniera bezpieczeństwa ML.
