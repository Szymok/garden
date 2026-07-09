---
title: Directional Stimulus Prompting (DSP)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: advanced
language: pl
tags:
  - prompting
  - llm
  - optimization
  - steering
aliases:
  - DSP
  - Sterowanie Bodźcem
---
# 🎯 Definicja
**Directional Stimulus Prompting (DSP)** to zaawansowana technika sterowania [[Base LLM|modelami językowymi]], w której zamiast ręcznie pisać instrukcję ("Zrób X"), używamy małego, trenowalnego modelu (Policy Model), który generuje "wskazówki" (Stimulus) dla dużego modelu. Wskazówki te naprowadzają duży model na pożądany wynik (np. konkretny styl podsumowania).

# 🔑 Kluczowe punkty
- **Black Box:** Duży model (np. [[GPT-4|GPT-4]]) jest "zamrożony" (nie trenujemy go).
- **Policy Model:** Trenujemy mały model (np. T5-small), żeby generował dobre podpowiedzi dla dużego.
- **Cel:** Uzyskanie lepszych wyników niż przy zwykłym promptingu, ale taniej niż przy pełnym finetuningu dużego modelu.

# 📚 Szczegółowe wyjaśnienie
Schemat działania:
Input -> **Policy Model** -> generuje *Directional Stimulus* (np. słowa kluczowe, plan wypowiedzi).
Input + *Stimulus* -> **Large LLM** -> Output.
Policy Model jest uczony metodą Reinforcement Learning (RL), aby generować takie bodźce, które sprawią, że duży model da najlepszą odpowiedź.

# 💡 Przykład zastosowania
Zadanie: Podsumowanie artykułu.
Policy Model czyta artykuł i generuje Stimulus: "Skup się na inflacji i cenie paliw".
Duży Model dostaje artykuł + instrukcję "Skup się na inflacji...".
Wynik: Podsumowanie dokładnie o tym, o co chodziło, bez potrzeby ręcznego pisania promptu dla każdego artykułu.

## 📌 Źródła
- "Directional Stimulus Prompting for Policy Optimization of LLMs" (Arxiv).

## 👽 Brudnopis
- To krok w stronę "automatycznego Prompt Engineeringu".
- Podobne do [[Active-Prompt]], ale tutaj mamy oddzielny model sterujący.