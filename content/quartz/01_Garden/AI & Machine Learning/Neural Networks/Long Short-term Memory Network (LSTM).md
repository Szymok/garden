---
title: LSTM (Long Short-Term Memory)
created: 2026-02-04
status: evergreen
category: Deep Learning / Neural Networks
difficulty: advanced
language: pl
tags:
  - rnn
  - time-series
  - deep-learning
  - nlp
  - history
aliases:
  - Sieci rekurencyjne
  - Long Short-Term Memory
---
# 🎯 Definicja
**LSTM** to rodzaj sieci neuronowej stworzony do analizy **sekwencji** (czasu, tekstu, dźwięku). W odróżnieniu od zwykłych sieci, LSTM posiada "pamięć", dzięki czemu rozumie, że to, co dzieje się teraz, zależy od tego, co działo się 100 kroków temu.

# 🔑 Kluczowe punkty
- **Problem:** Zwykłe sieci RNN zapominały początek zdania, zanim dotarły do końca ("Vanishing [[Gradient|Gradient]] Problem").
- **Rozwiązanie:** LSTM ma mechanizm "bramek" (Gates), które decydują, co zapamiętać, a co zapomnieć.
- **Zastosowanie:** Tłumaczenie języków, przewidywanie cen akcji, rozpoznawanie mowy.

# 📚 Szczegółowe wyjaśnienie
Architektura LSTM składa się z komórek, które mają 3 bramki:
1.  **Forget Gate:** "Czy ta stara informacja jest jeszcze ważna? Jeśli nie, usuń ją".
2.  **Input Gate:** "Czy ta nowa informacja jest ważna? Jeśli tak, zapisz ją".
3.  **Output Gate:** "Co mam teraz powiedzieć na podstawie mojej pamięci?".

Dziś LSTM są wypierane przez architekturę **Transformer** (ChatGPT), która radzi sobie lepiej z długimi tekstami dzięki mechanizmowi Atencji (Attention), ale LSTM nadal jest świetne w prostszych szeregach czasowych ([[Time Series|Time Series]]).

# 💡 Przykład zastosowania
Prognoza pogody.
LSTM analizuje temperaturę z ostatnich 30 dni. Pamięta, że 2 tygodnie temu było nagłe ochłodzenie (wzorzec sezonowy) i na tej podstawie przewiduje temperaturę na jutro, ignorując jednodniowy skok temperatury wczoraj (szum).

## 📌 Źródła
- "Understanding LSTM Networks" (Colah's Blog).

## 👽 Brudnopis
- LSTM powstało w 1997 roku! To "dziadek" nowoczesnego AI, który przetrwał próbę czasu.