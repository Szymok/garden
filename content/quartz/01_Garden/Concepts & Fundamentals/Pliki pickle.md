---

title: Pliki pickle  
created: 2025-07-16  
status: 🌱 draft
category: programowanie  
difficulty: podstawowy  
language: pl  
tags:

- pickle
- python
- serializacja
- pliki danych
- programowanie  
aliases:
- pickle
- pliki .pkl
- serializacja python

---

# 🎯 Definicja

**Pliki pickle** to pliki wykorzystywane w Pythonie do serializacji (zapisu) i deserializacji (odczytu) obiektów — czyli konwersji struktur danych Pythona do formatu bajtowego umożliwiającego ich zapis do pliku i późniejsze odzyskanie w oryginalnej postaci. Format ten oparty jest na wbudowanym module `pickle`.

# 🔑 Kluczowe punkty

- 🔄 Serializacja: konwersja obiektu (np. słownika, listy, modelu [[Uczenie Maszynowe|ML]]) do postaci binarnej.
- 📦 Deserializacja: odtworzenie oryginalnego obiektu z pliku `.pkl` lub bajtowego strumienia danych.
- 💾 Umożliwia trwałe zapisywanie obiektów do pliku — np. po treningu modelu [[Uczenie Maszynowe|ML]].
- ⚠️ Nie jest bezpieczny dla niezaufanych źródeł — może wykonywać złośliwy kod przy ładowaniu.
- 🐍 Standardowy sposób przechowywania danych i modeli w ekosystemie Pythona i scikit-learn.

# 📚 Szczegółowe wyjaśnienie

## Serializacja – zapis do pliku `.pkl`

```python
import pickle

my_data = {'name': 'Alice', 'age': 30}

with open('data.pkl', 'wb') as f:
    pickle.dump(my_data, f)
```

- `wb` – tryb zapisu binarnego.
- `pickle.dump()` – zapisuje obiekt do pliku.

## Deserializacja – odczyt z pliku `.pkl`

```python
with open('data.pkl', 'rb') as f:
    loaded_data = pickle.load(f)

print(loaded_data)  # {'name': 'Alice', 'age': 30}
```

## Typowe zastosowania

- Zapisywanie wytrenowanych modeli [[Uczenie Maszynowe|ML]] (np. z wykorzystaniem `scikit-learn`, `xgboost`)
- Przechowywanie cache’u danych
- Serializacja wyszukiwarek (np. wektorowych) lub słowników NLP
- Transport danych między funkcjami/skryptami bez ponownego przeliczania

# 💡 Przykład zastosowania: zapis modelu

```python
from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier().fit(X_train, y_train)

with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)

# później:
with open('model.pkl', 'rb') as f:
    loaded_model = pickle.load(f)
```

# ⚠️ Ostrzeżenie bezpieczeństwa

Pliki pickle mogą zawierać dowolny kod Pythona i wykonywać go po załadowaniu. Nigdy nie używaj `pickle.load()` na plikach z nieznanych/niesprawdzonych źródeł.

Alternatywy dla bezpieczeństwa i interoperacyjności:

- `joblib` – lepsza dla dużych obiektów numerycznych (np. modele sklearn)
- `json` – jeśli dane są czysto tekstowe lub liczbowe
- `protobuf`, `avro`, `parquet` – w środowiskach o wysokich wymaganiach interoperacyjnych i bezpieczeństwa

# 📌 Źródła

- [https://docs.python.org/3/library/pickle.html](https://docs.python.org/3/library/pickle.html)
- [https://scikit-learn.org/stable/model_persistence.html](https://scikit-learn.org/stable/model_persistence.html)
- [https://realpython.com/python-pickle-module/](https://realpython.com/python-pickle-module/)
- [https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/](https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/)

# 👽 Brudnopis

- pickle ≠ JSON – obsługuje całą klasę obiektów, w tym modele i klasy niemożliwe do serializacji w JSON
- Obsługa klas własnych i zagnieżdżeń, ale brak interoperacyjności między językami
- "rb" / "wb": read/write binary – ważne!
- `.pkl`, `.pickle` – rozszerzenia standardowe
- Szybki zapis/odczyt do cache/pomiędzy notatnikami w środowisku [[Uczenie Maszynowe|ML]]