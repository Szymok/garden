---

title: Szeregi czasowe  
created: 2025-07-16  
status: 🌱 draft
category: Data Science  
difficulty: Å›redni  
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

# ðŸŽ¯ Definicja

**Szereg czasowy** to uporzÄ…dkowany zbiÃ³r danych, w ktÃ³rym obserwacje sÄ… zarejestrowane w kolejnych odstÄ™pach czasu. Analiza szeregÃ³w czasowych koncentruje siÄ™ na zrozumieniu trendÃ³w, sezonowoÅ›ci i zaleÅ¼noÅ›ci czasowych w danych w celu przewidywania przyszÅ‚ych wartoÅ›ci.

# ðŸ”‘ Kluczowe zastosowania

Szeregi czasowe sÄ… kluczowym elementem wielu dziedzin:

- ðŸ“ˆ **Prognozy gospodarcze** â€“ np. PKB, inflacja, stopy procentowe
- ðŸ›’ **Prognozy sprzedaÅ¼y** â€“ analiza popytu, planowanie zapasÃ³w
- ðŸ’¹ **Rynki finansowe** â€“ analiza gieÅ‚dowa, surowce, kryptowaluty
- ðŸŒ¾ **Rolnictwo** â€“ prognozy plonÃ³w, zuÅ¼ycie nawozÃ³w
- ðŸ”Œ **Energetyka** â€“ przewidywanie zuÅ¼ycia gazu, prÄ…du, obciÄ…Å¼eÅ„
- ðŸ› ï¸ **Utrzymanie ruchu (predictive maintenance)** â€“ monitorowanie parametrÃ³w sprzÄ™tu w czasie

# ðŸ“š Kluczowe cechy analizy szeregÃ³w czasowych

- **Autokorelacja** â€“ obecna wartoÅ›Ä‡ zaleÅ¼y od przeszÅ‚ych wartoÅ›ci
- **Trend** â€“ dÅ‚ugoterminowa tendencja wzrostowa lub spadkowa
- **SezonowoÅ›Ä‡** â€“ cyklicznoÅ›Ä‡ o znanych odstÄ™pach (np. tygodniowa, roczna)
- **StacjonarnoÅ›Ä‡** â€“ rozkÅ‚ad prawdopodobieÅ„stwa nie zmienia siÄ™ w czasie
- **Szok** â€“ nagÅ‚e, trudne do przewidzenia zmiany (np. pandemia, wojna)

# ðŸ› ï¸ Metody modelowania

### ðŸ”¹ Modele statystyczne

- **ARIMA / SARIMA** â€“ klasyczne modele autoregresji z uogÃ³lnieniem na sezonowoÅ›Ä‡
- **Exponential Smoothing (ETS)** â€“ waÅ¼enie starszych obserwacji mniej niÅ¼ nowszych
- **Prophet (Facebook)** â€“ model dekonstrukcyjny (trend + sezonowoÅ›Ä‡ + Å›wiÄ™ta)

### ðŸ”¹ Modele [[Uczenie Maszynowe|ML]]/[[Deep Learning|DL]]

- **XGBoost / LightGBM** â€“ z funkcjami opÃ³ÅºnieÅ„/lags
- **[[Lasy losowe|Random Forest]] z cechami czasowymi**
- **LSTM / GRU (RNN)** â€“ [[Sieci neuronowe]] do sekwencji danych
- **CNN / Transformer** â€“ zaawansowane podejÅ›cie z modelowaniem czasowo-przestrzennym

âš ï¸ Modele [[Uczenie Maszynowe|ML]] lepiej przewidujÄ…, ale sÄ… czÄ™sto trudniejsze do wyjaÅ›nienia (czarne skrzynki). Z pomocÄ… przychodzi np. **Permutation Importance**, SHAP, PDP.

# Â¶ Naiwna prognoza

Najprostszy punkt odniesienia:

> â€žJutro bÄ™dzie tak samo jak dzisiajâ€  
> Model typu â€žnaiveâ€:

```python
Å·(t+1) = y(t)
```

To przydatna wartoÅ›Ä‡ bazowa â€” jeÅ›li model â€žinteligentnyâ€ dziaÅ‚a gorzej niÅ¼ naiwna baza, coÅ› jest nie tak ðŸ“‰

# âš ï¸ Walidacja w szeregach czasowych

W odrÃ³Å¼nieniu od klasycznych danych:

âŒ **Nie dziaÅ‚a klasyczna walidacja krzyÅ¼owa (KFold)** â€“ bo miesza dane z przyszÅ‚oÅ›ci do trenowania!

âœ… Zastosuj **TimeSeriesSplit** lub rÄ™czne dzielenie danych w porzÄ…dku czasowym:

```plaintext
TRAIN                  TEST
[---train---]          [---]
[------train------]    [---]
```

Sukcesywny ukÅ‚ad chronologiczny pozwala przewidywaÄ‡ przyszÅ‚oÅ›Ä‡ bez przecieku danych.

![Time Series Split]([https://miro.medium.com/v2/resize:fit:700/format:webp/1*CckZCtB1tkIvzEIV8AHï¸](https://miro.medium.com/v2/resize:fit:700/format:webp/1*CckZCtB1tkIvzEIV8AH%EF%B8%8F) Zalety i ograniczenia

## âœ… Zalety

- â© UmoÅ¼liwiajÄ… prognozowanie przyszÅ‚oÅ›ci na podstawie przeszÅ‚oÅ›ci
- ðŸŽ¯ ModelujÄ… zachowania cykliczne (np. Å›wiÄ™ta, sezonowoÅ›Ä‡)
- ðŸ“ˆ Silne fundamenty statystyczne i moÅ¼liwoÅ›Ä‡ interpretacji trendÃ³w

## âŒ Wady

- âš ï¸ Modele [[Uczenie Maszynowe|ML]] trudne do wyjaÅ›nienia (brak przejrzystoÅ›ci)
- ðŸ“Š DuÅ¼a iloÅ›Ä‡ danych + inÅ¼ynieria cech = spore zasoby obliczeniowe
- ðŸ” CzÄ™sto wystÄ™pujÄ… nieliniowe, zmienne w czasie zaleÅ¼noÅ›ci (koniecznoÅ›Ä‡ adaptacji modelu)
- âŒ Wysoka podatnoÅ›Ä‡ na przerwy w danych, zmiany w sezonowoÅ›ci, regresje covidowe/wojenne

# ðŸ’¡ Praktyczny przykÅ‚ad

ZespÃ³Å‚ prognozowania zuÅ¼ycia energii gromadzi historiÄ™ pomiarÃ³w z 15-minutowych interwaÅ‚Ã³w z licznikÃ³w. WyciÄ…gajÄ… lag features (opÃ³Åºnienia), rolling averages (Å›rednie kroczÄ…ce), oznaczenia Å›wiÄ…t i pÃ³r roku. Testowany jest model XGBoost z 30-dniowym oknem lookback. Wyniki walidowane przez rolling window. Model deployed w [[Apache Airflow|Airflow]] z monitoringiem MAPE i retraining co 7 dni.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [Elements of Time Series in Python â€“ Jason Brownlee](https://machinelearningmastery.com/time-series-forecasting/)
- [Facebook Prophet (docs)](https://facebook.github.io/prophet/)
- [ARIMA Explained â€“ Hyndman](https://otexts.com/fpp2/arima.html)
- [Time Series Cross Validation Guide â€“ sklearn](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.TimeSeriesSplit.html)

# ðŸ‘½ Brudnopis

- szereg = wartoÅ›ci z etykietÄ… czasowÄ…
- Trend â†‘â†“, SezonowoÅ›Ä‡ â™»ï¸, Lag â¬…ï¸
- rolling, expanding, shift()
- klasyka: ARIMA â†’ teraz [[Uczenie Maszynowe|ML]] (XGB + lag features)
- RamiÄ™ CIops: aktualizacja modelu, drift detection, walidacja on-line
- nie shuffle! chronologia to wszystko
- taski: forecasting, detection (anomalie), klasyfikacja (post-label)
- Prophet â†’ szybki, elastyczny, mityczny default w firmach ðŸ‘¼
- Dobre [[KPI]]: MAE, RMSE, MAPE (%) â†’ porÃ³wnanie do naÃ¯ve = sanity check