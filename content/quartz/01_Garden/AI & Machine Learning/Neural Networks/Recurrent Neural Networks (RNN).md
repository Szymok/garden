---
title: Recurrent Neural Networks (RNN)
created: 2026-02-04
status: evergreen
category: Deep Learning / Architectures
difficulty: intermediate
language: pl
tags:
  - rnn
  - lstm
  - sequence-processing
  - nlp
  - time-series
aliases:
  - Sieci Rekurencyjne
  - Sieci RNN
---
# 🎯 Definicja
**RNN** to [[Sieci neuronowe|sieci neuronowe]], które mają "pamięć". Zostały stworzone do przetwarzania sekwencji (tekstu, dźwięku, cen giełdowych), gdzie kolejność ma znaczenie.
W przeciwieństwie do zwykłych sieci, które przetwarzają każdy obrazek osobno, RNN przetwarza słowo "ma", pamiętając, że wcześniej było słowo "Ala".

# 🔑 Kluczowe punkty
- **Pętla:** Wyjście z poprzedniego kroku wraca jako wejście do następnego.
- **Zastosowanie:** Tłumaczenie tekstów, rozpoznawanie mowy, przewidywanie pogody.
- **Problem:** Krótka pamięć (Vanishing [[Gradient|Gradient]]). RNN słabo radzi sobie z długimi tekstami. (Dlatego powstało [[Long Short-term Memory Network (LSTM)|LSTM]]).

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie czytanie książki. Rozumiesz zdanie na stronie 10, bo pamiętasz, co działo się na stronie 1. Tak działa RNN.
Jednak w praktyce "czyste" RNN pamięta tylko kilka ostatnich słów. Przy długich zdaniach gubi kontekst. Dlatego w NLP zostały wyparte przez **Transformery** (które widzą całe zdanie naraz dzięki Attention).

# 💡 Przykład zastosowania
Autouzupełnianie w telefonie.
Piszesz: "Idę do".
RNN analizuje sekwencję. Pamięta "Idę" i "do".
Przewiduje: "domu" (lub "sklepu").

## 📌 Źródła
- "The Unreasonable Effectiveness of Recurrent [[Neural Networks|Neural Networks]]" (Andrej Karpathy).

## 👽 Brudnopis
- Dziś RNN używa się rzadziej w NLP (wygrał LLM/Transformer), ale nadal są świetne w prostych szeregach czasowych ([[Time Series|Time Series]]) i na małych urządzeniach (IoT), bo są lekkie.