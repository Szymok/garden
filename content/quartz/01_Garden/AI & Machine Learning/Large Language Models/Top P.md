---
title: Top P (Nucleus Sampling)
created: 2026-02-04
status: evergreen
category: AI / Generation
difficulty: intermediate
language: pl
tags:
  - top-p
  - nucleus-sampling
  - generation
aliases:
  - Nucleus Sampling
---
# 🎯 Definicja
**Top-P** (Nucleus Sampling) to bardziej inteligentna wersja [[Top K]].
Zamiast brać "Sztywne 50 słów" (K), bierze tyle słów, by ich suma prawdopodobieństwa przekroczyła próg **P** (np. 90%).

# 🔑 Kluczowe punkty
- **Dynamiczność:** Jeśli model jest pewny ("Stolicą Polski jest..."), to jedno słowo "Warszawa" ma 99%. Top-P weźmie tylko to jedno.
- Jeśli model nie jest pewny ("Ulubiony kolor to..."), to rozkład jest płaski. Top-P weźmie 100 słów, które razem dają 90%.
- Daje lepszy balans między spójnością a kreatywnością niż Top-K.

# 📚 Szczegółowe wyjaśnienie
Parametr P (zwykle 0.9):
Model sumuje prawdopodobieństwa od góry, aż dojdzie do 0.9.
1. "Tak" (0.5) -> Suma=0.5
2. "Nie" (0.3) -> Suma=0.8
3. "Może" (0.15) -> Suma=0.95 (STOP).
Reszta słów jest odcinana. Losowanie następuje tylko między tymi trzema.

# 💡 Przykład zastosowania
Większość nowoczesnych LLM (Claude, GPT) domyślnie używa `Top-P=1.0` (brak odcięcia) lub `Top-P=0.9`.
Zaleca się nie zmieniać `Top-K` i `Top-P` na raz. Zmień jedno albo drugie.

## 📌 Źródła
- The Curious Case of Neural Text Degeneration (Holtzman et al.).

## 👽 Brudnopis
- Top-P jest bardziej "adaptacyjne". Kiedy model wie co mówić, Top-P go nie ogranicza. Kiedy model nie wie, Top-P pozwala mu szukać szeroko.
