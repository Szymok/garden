---
title: Time Series (Szeregi Czasowe)
created: 2026-02-04
status: evergreen
category: Data Science / Analysis
difficulty: intermediate
language: pl
tags:
  - time-series
  - forecasting
  - trends
  - seasonality
  - arima
aliases:
  - Szeregi czasowe
  - Prognozowanie
---
# 🎯 Definicja
**Szereg Czasowy** to dane, w których kolejność (Czas) ma kluczowe znaczenie.
To nie jest worek losowych liczb. To historia.
Przykłady: Cena akcji, Temperatura co godzinę, Sprzedaż dzienna.

# 🔑 Kluczowe cechy
- **Trend:** Czy rośnie/spada w długim okresie? (Np. Globalne ocieplenie - trend rosnący).
- **Sezonowość:** Czy powtarza się w cyklach? (Np. Sprzedaż lodów rośnie latem).
- **Szum:** Losowe wahania.

# 📚 Szczegółowe wyjaśnienie
Analiza szeregów czasowych (Forecasting) służy do przewidywania przyszłości.
Metody:
1.  **Klasyczne:** ARIMA, Exponential Smoothing. (Dobre dla prostych trendów).
2.  **ML:** XGBoost (wymaga "Lag Features" - dodania kolumn `sprzedaż_wczoraj`, `sprzedaż_tydzień_temu`).
3.  **Deep Learning:** LSTM, Transformers, Prophet (Facebooka).

# 💡 Przykład zastosowania
Piekarnia chce wiedzieć, ile chleba upiec jutro.
Analizuje sprzedaż z ostatnich 3 lat.
Model widzi:
1.  W soboty sprzedaż jest +50% (Sezonowość tygodniowa).
2.  W Grudniu sprzedaż rośnie (Sezonowość roczna).
3.  Od roku sprzedaż ogólnie rośnie o 2% miesięcznie (Trend).
Model wypluwa liczbę: 500 bochenków. Piekarnia nie marnuje jedzenia.

## 📌 Źródła
- Forecasting: Principles and Practice (Hyndman).

## 👽 Brudnopis
- Uważaj na "Data Leakage" przy walidacji! Nie możesz używać `train_test_split` losowo. Musisz uciąć czasowo: Trenuj na 2020-2022, testuj na 2023. Nie wolno mieszać przyszłości z przeszłością w treningu.
