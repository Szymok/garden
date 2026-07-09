---
title: Explainable AI (XAI - Wyjaśnialna Sztuczna Inteligencja)
created: 2026-02-04
status: evergreen
category: AI Ethics/Governance
difficulty: intermediate
language: pl
tags:
  - xai
  - shap
  - lime
  - interpretability
  - trust
aliases:
  - XAI
  - Interpretowalność modeli
---
# 🎯 Definicja
**Explainable AI (XAI)** to dziedzina sztucznej inteligencji skupiona na tworzeniu modeli, których decyzje mogą być zrozumiane przez człowieka. Przeciwieństwem XAI są modele typu "Black Box" (np. głębokie [[Sieci neuronowe|sieci neuronowe]]), gdzie trudno ustalić, dlaczego system podjął taką, a nie inną decyzję.

# 🔑 Kluczowe punkty
- **Zaufanie:** Biznes i regulatorzy (AI Act) wymagają wiedzy, dlaczego AI odrzuciło kredyt.
- **Debugowanie:** Pomaga inżynierom znaleźć błędy w rozumowaniu modelu (np. model patrzy na tło obrazka zamiast na obiekt).
- **Metody:** LIME, SHAP, Feature Importance.

# 📚 Szczegółowe wyjaśnienie
Dwa podejścia do XAI:
1.  **Interpretable by Design:** Używanie prostych modeli (Drzewa decyzyjne, Regresja Liniowa), gdzie widać wagi i zasady.
2.  **Post-hoc Explainability:** Używanie skomplikowanych modeli ([[Deep Learning|Deep Learning]]) i dokładanie do nich "tłumacza" (np. SHAP), który bada, jak zmiana wejścia wpływa na wyjście.

# 💡 Przykład zastosowania
System medyczny diagnozuje raka na podstawie zdjęcia RTG.
Model XAI nie tylko mówi "Rak (99%)", ale też podświetla obszar na zdjęciu (Heatmap), który o tym zadecydował. Lekarz może zweryfikować: "Tak, to faktycznie guz", albo "Nie, model zaznaczył znacznik rentgenowski, to błąd".

## 📌 Źródła
- "Interpretable [[Machine Learning|Machine Learning]]" - Christoph Molnar.

## 👽 Brudnopis
- Regulacje UE (AI Act) wymuszają "Prawo do wyjaśnienia" dla systemów wysokiego ryzyka.
- SHAP wartości (Shapley Values) pochodzą z teorii gier.
- XAI jest kluczowe w walce z Biasem (uprzedzeniami modelu).