---
title: Prompt Engineering Guide (Przewodnik)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: intermediate
language: pl
tags:
  - prompting
  - guide
  - resources
  - learning
aliases:
  - Przewodnik Promptingu
  - Base Prompting Guide
---
# 🎯 Definicja
**Prompt Engineering Guide** to zbiór wiedzy o tym, jak rozmawiać z modelami AI. To nowa dyscyplina inżynierii, która zajmuje się optymalizacją tekstowych wejść (promptów) w celu uzyskania najlepszych wyjść z modeli LLM.

# 🔑 Główne Techniki
1.  **Zero-Shot:** "Zrób to".
2.  **Few-Shot:** "Patrz, tu są przykłady. Teraz Ty zrób to samo".
3.  **Chain-of-Thought:** "Wyjaśnij swój tok myślenia".
4.  **Role Playing:** "Jesteś lekarzem".

# 📚 Strategia Nauki
Nie ucz się "gotowych promptów na pamięć". Ucz się **zasad działania modelu**.
Zrozum, że model to "zgadywacz kolejnego słowa". Jeśli prompt jest niejasny, zgadywanie będzie losowe ([[Halucynacje|halucynacje]]). Jeśli prompt jest precyzyjny (posiada **Constraint**, **Context**, **Format**), zgadywanie będzie deterministyczne.

# 💡 Przykład Ewolucji
1.  **Junior:** "Napisz kod w Pythonie."
2.  **Mid:** "Napisz funkcję w Pythonie do liczenia ciągu Fibonacciego."
3.  **Senior:** "Jesteś Senior Python Developerem. Napisz zoptymalizowaną (iteracyjną, nie rekurencyjną) funkcję obliczającą n-ty wyraz ciągu Fibonacciego. Dodaj Type Hinting i Docstring w stylu Google. Zwróć tylko kod."

## 📌 Źródła
- [PromptingGuide.ai](https://www.promptingguide.ai/) (Biblia tematu).
- OpenAI Cookbook.

## 👽 Brudnopis
- Prompt Engineering to prawdopodobnie "przejściowa" umiejętność. Za 5 lat modele będą tak sprytne, że zrozumieją intencję z półsłówka ("Intent-Based systems"). Ale dziś to klucz do produktywności.