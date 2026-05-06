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

# ðŸŽ¯ Definicja

**Pliki pickle** to pliki wykorzystywane w Pythonie do serializacji (zapisu) i deserializacji (odczytu) obiektÃ³w â€” czyli konwersji struktur danych Pythona do formatu bajtowego umoÅ¼liwiajÄ…cego ich zapis do pliku i pÃ³Åºniejsze odzyskanie w oryginalnej postaci. Format ten oparty jest na wbudowanym module `pickle`.

# ðŸ”‘ Kluczowe punkty

- ðŸ”„ Serializacja: konwersja obiektu (np. sÅ‚ownika, listy, modelu [[Uczenie Maszynowe|ML]]) do postaci binarnej.
- ðŸ“¦ Deserializacja: odtworzenie oryginalnego obiektu z pliku `.pkl` lub bajtowego strumienia danych.
- ðŸ’¾ UmoÅ¼liwia trwaÅ‚e zapisywanie obiektÃ³w do pliku â€” np. po treningu modelu [[Uczenie Maszynowe|ML]].
- âš ï¸ Nie jest bezpieczny dla niezaufanych ÅºrÃ³deÅ‚ â€” moÅ¼e wykonywaÄ‡ zÅ‚oÅ›liwy kod przy Å‚adowaniu.
- ðŸ Standardowy sposÃ³b przechowywania danych i modeli w ekosystemie Pythona i scikit-learn.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Serializacja â€“ zapis do pliku `.pkl`

```python
import pickle

my_data = {'name': 'Alice', 'age': 30}

with open('data.pkl', 'wb') as f:
    pickle.dump(my_data, f)
```

- `wb` â€“ tryb zapisu binarnego.
- `pickle.dump()` â€“ zapisuje obiekt do pliku.

## Deserializacja â€“ odczyt z pliku `.pkl`

```python
with open('data.pkl', 'rb') as f:
    loaded_data = pickle.load(f)

print(loaded_data)  # {'name': 'Alice', 'age': 30}
```

## Typowe zastosowania

- Zapisywanie wytrenowanych modeli [[Uczenie Maszynowe|ML]] (np. z wykorzystaniem `scikit-learn`, `xgboost`)
- Przechowywanie cacheâ€™u danych
- Serializacja wyszukiwarek (np. wektorowych) lub sÅ‚ownikÃ³w NLP
- Transport danych miÄ™dzy funkcjami/skryptami bez ponownego przeliczania

# ðŸ’¡ PrzykÅ‚ad zastosowania: zapis modelu

```python
from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier().fit(X_train, y_train)

with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)

# pÃ³Åºniej:
with open('model.pkl', 'rb') as f:
    loaded_model = pickle.load(f)
```

# âš ï¸ OstrzeÅ¼enie bezpieczeÅ„stwa

Pliki pickle mogÄ… zawieraÄ‡ dowolny kod Pythona i wykonywaÄ‡ go po zaÅ‚adowaniu. Nigdy nie uÅ¼ywaj `pickle.load()` na plikach z nieznanych/niesprawdzonych ÅºrÃ³deÅ‚.

Alternatywy dla bezpieczeÅ„stwa i interoperacyjnoÅ›ci:

- `joblib` â€“ lepsza dla duÅ¼ych obiektÃ³w numerycznych (np. modele sklearn)
- `json` â€“ jeÅ›li dane sÄ… czysto tekstowe lub liczbowe
- `protobuf`, `avro`, `parquet` â€“ w Å›rodowiskach o wysokich wymaganiach interoperacyjnych i bezpieczeÅ„stwa

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.python.org/3/library/pickle.html](https://docs.python.org/3/library/pickle.html)
- [https://scikit-learn.org/stable/model_persistence.html](https://scikit-learn.org/stable/model_persistence.html)
- [https://realpython.com/python-pickle-module/](https://realpython.com/python-pickle-module/)
- [https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/](https://machinelearningmastery.com/save-load-machine-learning-models-python-scikit-learn/)

# ðŸ‘½ Brudnopis

- pickle â‰  JSON â€“ obsÅ‚uguje caÅ‚Ä… klasÄ™ obiektÃ³w, w tym modele i klasy niemoÅ¼liwe do serializacji w JSON
- ObsÅ‚uga klas wÅ‚asnych i zagnieÅ¼dÅ¼eÅ„, ale brak interoperacyjnoÅ›ci miÄ™dzy jÄ™zykami
- "rb" / "wb": read/write binary â€“ waÅ¼ne!
- `.pkl`, `.pickle` â€“ rozszerzenia standardowe
- Szybki zapis/odczyt do cache/pomiÄ™dzy notatnikami w Å›rodowisku [[Uczenie Maszynowe|ML]]