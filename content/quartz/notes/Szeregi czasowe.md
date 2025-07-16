---

title: Szeregi czasowe  
created: 2025-07-16  
status:  
category: Data Science  
difficulty: średni  
language: pl  
tags:

- analiza danych
- szeregi czasowe
- time series
- prognozowanie
- machine learning  
aliases:
- time series
- prognoza czasowa

---

# 🎯 Definicja

**Szereg czasowy** to uporządkowany zbiór danych, w którym obserwacje są zarejestrowane w kolejnych odstępach czasu. Analiza szeregów czasowych koncentruje się na zrozumieniu trendów, sezonowości i zależności czasowych w danych w celu przewidywania przyszłych wartości.

# 🔑 Kluczowe zastosowania

Szeregi czasowe są kluczowym elementem wielu dziedzin:

- 📈 **Prognozy gospodarcze** – np. PKB, inflacja, stopy procentowe
- 🛒 **Prognozy sprzedaży** – analiza popytu, planowanie zapasów
- 💹 **Rynki finansowe** – analiza giełdowa, surowce, kryptowaluty
- 🌾 **Rolnictwo** – prognozy plonów, zużycie nawozów
- 🔌 **Energetyka** – przewidywanie zużycia gazu, prądu, obciążeń
- 🛠️ **Utrzymanie ruchu (predictive maintenance)** – monitorowanie parametrów sprzętu w czasie

# 📚 Kluczowe cechy analizy szeregów czasowych

- **Autokorelacja** – obecna wartość zależy od przeszłych wartości
- **Trend** – długoterminowa tendencja wzrostowa lub spadkowa
- **Sezonowość** – cykliczność o znanych odstępach (np. tygodniowa, roczna)
- **Stacjonarność** – rozkład prawdopodobieństwa nie zmienia się w czasie
- **Szok** – nagłe, trudne do przewidzenia zmiany (np. pandemia, wojna)

# 🛠️ Metody modelowania

### 🔹 Modele statystyczne

- **ARIMA / SARIMA** – klasyczne modele autoregresji z uogólnieniem na sezonowość
- **Exponential Smoothing (ETS)** – ważenie starszych obserwacji mniej niż nowszych
- **Prophet (Facebook)** – model dekonstrukcyjny (trend + sezonowość + święta)

### 🔹 Modele ML/DL

- **XGBoost / LightGBM** – z funkcjami opóźnień/lags
- **Random Forest z cechami czasowymi**
- **LSTM / GRU (RNN)** – sieci neuronowe do sekwencji danych
- **CNN / Transformer** – zaawansowane podejście z modelowaniem czasowo-przestrzennym

⚠️ Modele ML lepiej przewidują, ale są często trudniejsze do wyjaśnienia (czarne skrzynki). Z pomocą przychodzi np. **Permutation Importance**, SHAP, PDP.

# ¶ Naiwna prognoza

Najprostszy punkt odniesienia:

> „Jutro będzie tak samo jak dzisiaj”  
> Model typu „naive”:

```python
ŷ(t+1) = y(t)
```

To przydatna wartość bazowa — jeśli model „inteligentny” działa gorzej niż naiwna baza, coś jest nie tak 📉

# ⚠️ Walidacja w szeregach czasowych

W odróżnieniu od klasycznych danych:

❌ **Nie działa klasyczna walidacja krzyżowa (KFold)** – bo miesza dane z przyszłości do trenowania!

✅ Zastosuj **TimeSeriesSplit** lub ręczne dzielenie danych w porządku czasowym:

```plaintext
TRAIN                  TEST
[---train---]          [---]
[------train------]    [---]
```

Sukcesywny układ chronologiczny pozwala przewidywać przyszłość bez przecieku danych.

![Time Series Split]([https://miro.medium.com/v2/resize:fit:700/format:webp/1*CckZCtB1tkIvzEIV8AH️](https://miro.medium.com/v2/resize:fit:700/format:webp/1*CckZCtB1tkIvzEIV8AH%EF%B8%8F) Zalety i ograniczenia

## ✅ Zalety

- ⏩ Umożliwiają prognozowanie przyszłości na podstawie przeszłości
- 🎯 Modelują zachowania cykliczne (np. święta, sezonowość)
- 📈 Silne fundamenty statystyczne i możliwość interpretacji trendów

## ❌ Wady

- ⚠️ Modele ML trudne do wyjaśnienia (brak przejrzystości)
- 📊 Duża ilość danych + inżynieria cech = spore zasoby obliczeniowe
- 🔁 Często występują nieliniowe, zmienne w czasie zależności (konieczność adaptacji modelu)
- ❌ Wysoka podatność na przerwy w danych, zmiany w sezonowości, regresje covidowe/wojenne

# 💡 Praktyczny przykład

Zespół prognozowania zużycia energii gromadzi historię pomiarów z 15-minutowych interwałów z liczników. Wyciągają lag features (opóźnienia), rolling averages (średnie kroczące), oznaczenia świąt i pór roku. Testowany jest model XGBoost z 30-dniowym oknem lookback. Wyniki walidowane przez rolling window. Model deployed w Airflow z monitoringiem MAPE i retraining co 7 dni.

## 📌 Źródła

- [Elements of Time Series in Python – Jason Brownlee](https://machinelearningmastery.com/time-series-forecasting/)
- [Facebook Prophet (docs)](https://facebook.github.io/prophet/)
- [ARIMA Explained – Hyndman](https://otexts.com/fpp2/arima.html)
- [Time Series Cross Validation Guide – sklearn](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.TimeSeriesSplit.html)

# 👽 Brudnopis

- szereg = wartości z etykietą czasową
- Trend ↑↓, Sezonowość ♻️, Lag ⬅️
- rolling, expanding, shift()
- klasyka: ARIMA → teraz ML (XGB + lag features)
- Ramię CIops: aktualizacja modelu, drift detection, walidacja on-line
- nie shuffle! chronologia to wszystko
- taski: forecasting, detection (anomalie), klasyfikacja (post-label)
- Prophet → szybki, elastyczny, mityczny default w firmach 👼
- Dobre KPI: MAE, RMSE, MAPE (%) → porównanie do naïve = sanity check