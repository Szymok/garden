---
title: Temperature in AI (Temperatura)
created: 2026-02-04
status: evergreen
category: AI / LLM Configuration
difficulty: basic
language: pl
tags:
  - temperature
  - creativity
  - randomness
  - softmax
  - prompting
aliases:
  - Temperatura w AI
  - Parametry modelu
---
# 🎯 Definicja
**Temperatura** to suwak "Kreatywności" (a dokładniej: Losowości) modelu AI.
Zakres: 0.0 - 1.0 (czasem 2.0).
- **0.0:** Robot. Zawsze ta sama odpowiedź. Najbardziej prawdopodobna. (Deterministyczny).
- **1.0:** Artysta. Wymyśla, ryzykuje, czasem bredzi. (Losowy).

# 🔑 Kluczowe punkty
- **Niska Temp (0.0 - 0.3):** Kodowanie, Fakty, Klasyfikacja, Wyciąganie danych. Tu błąd jest niedopuszczalny.
- **Wysoka Temp (0.7 - 1.0):** Pisanie wierszy, Brainstorming, Kreatywne pisanie. Tu różnorodność jest zaletą.

# 📚 Szczegółowe wyjaśnienie
Model LLM na wyjściu daje prawdopodobieństwa dla każdego słowa w słowniku.
Np. Po słowie "Mam", prawdopodobieństwa:
- "psa" (50%)
- "kota" (30%)
- "ochotę" (10%)
Przy Temp 0.0: ZAWSZE wybierze "psa" (max).
Przy Temp 1.0: "Wypłaszcza" rozkład. Ma większą szansę wylosować "kota" lub "ochotę".

# 💡 Przykład zastosowania
Chcesz wygenerować JSONa z faktury.
Ustawiasz `Temperature=0`.
Dlaczego? Bo JSON musi mieć sztywną strukturę. Jak model postanowi być "kreatywny" i doda przecinek w złym miejscu, JSON się popsuje.
Chcesz wymyślić imię dla kota.
Ustawiasz `Temperature=0.9`. Wciskasz "Generuj" 10 razy i dostajesz 10 różnych pomysłów.

## 📌 Źródła
- OpenAI API Guides - Temperature.

## 👽 Brudnopis
- Często mylone z `Top-P` (Nucleus Sampling). Zaleca się zmieniać albo jedno, albo drugie, nie oba na raz.
