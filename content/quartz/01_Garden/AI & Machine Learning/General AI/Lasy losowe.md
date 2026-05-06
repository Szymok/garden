---
title: Lasy Losowe (Random Forest)
created: 2026-02-04
status: evergreen
category: Machine Learning
difficulty: intermediate
language: pl
tags:
  - ml
  - decision-trees
  - ensemble
  - classification
  - regression
aliases:
  - Random Forest
  - Bagging
---
# 🎯 Definicja
**Las Losowy** to algorytm uczenia maszynowego, który działa jak "demokratyczna rada ekspertów". Zamiast polegać na jednym Drzewie Decyzyjnym (które może się mylić), buduje 100 drzew i każe im głosować. Wynikiem jest najczęściej wybierana odpowiedź.

# 🔑 Kluczowe punkty
- **Ensemble Learning:** Łączenie wielu słabych modeli w jeden silny.
- **Bagging:** Każde drzewo uczy się na innej, losowej części danych.
- **Feature Randomness:** Każde drzewo widzi tylko losową część kolumn (cech).
- **Zaleta:** Bardzo trudno go "przeuczyć" (Overfitting) w porównaniu do pojedynczego drzewa.

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie, że chcesz ocenić, czy film jest dobry.
Pytasz jednego kolegę (Drzewo). Może mieć specyficzny gust (Bias).
Pytasz 100 losowych osób (Las). Ich średnia ocena będzie znacznie bliższa prawdy.
Losowość (Random) w nazwie jest kluczowa: drzewa muszą być **różne**, żeby ich błędy się wzajemnie znosiły.

# 💡 Przykład zastosowania
Bank ocenia zdolność kredytową (Dać kredyt / Nie dać).
Las Losowy analizuje tysiące wniosków. Jedno drzewo patrzy głównie na wiek, inne na zarobki, inne na historię spłat.
Jeśli 80 na 100 drzew mówi "Nie dać", system odrzuca wniosek.

## 📌 Źródła
- "The Elements of Statistical Learning".

## 👽 Brudnopis
- Random Forest to "szwajcarski scyzoryk" ML. Działa dobrze "prosto z pudełka" (bez długiego strojenia parametrów).
- Następcą RF jest **XGBoost** (Gradient Boosting), który jest zazwyczaj dokładniejszy, ale trudniejszy w obsłudze.