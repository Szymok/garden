---
title: Eta Mirostat (Parametr Sterujący LLM)
created: 2026-02-04
status: evergreen
category: LLM Tuning
difficulty: advanced
language: pl
tags:
  - sampling
  - mirostat
  - llm
  - entropy
  - generation-parameters
aliases:
  - Eta Parameter
  - Parametr Eta
---
# 🎯 Definicja
**Eta (η)** to parametr w algorytmie samplingu **Mirostat**, który kontroluje "siłę reakcji" (learning rate) algorytmu na odchylenia od założonego poziomu zaskoczenia (Perplexity/Surprisal). Mówiąc prościej: Eta decyduje, jak szybko i agresywnie model koryguje swój styl wypowiedzi, by utrzymać stałą "ciekawość" tekstu.

# 🔑 Kluczowe punkty
- **Mirostat:** Algorytm, który próbuje utrzymać stałą jakość/złożoność tekstu (zamiast losowej temperatury).
- **Wysokie Eta:** Szybka, szarpana korekta. Może prowadzić do niestabilności.
- **Niskie Eta:** Powolna, płynna adaptacja. Model może długo "wracać na tor" po błędzie.
- **Związek z Tau:** Tau ustawia cel (jaki poziom chaosu chcemy), Eta ustawia, jak szybko tam dążymy.

# 📚 Szczegółowe wyjaśnienie
Algorytm Mirostat działa w pętli dla każdego wygenerowanego tokena:
1.  Mierzy "zaskoczenie" (Surprisal) ostatniego słowa.
2.  Porównuje z celem (Target Surprisal).
3.  Oblicza błąd.
4.  Koryguje parametr `k` (maksimum N słów do wyboru) wzorem: `k_new = k_old - Eta * error`.

# 💡 Przykład zastosowania
Generujesz opowiadanie.
Ustawiasz Tau=5.0 (kreatywne).
Jeśli Eta=0.1: Model powoli rozkręca się do kreatywności.
Jeśli Eta=0.8: Model natychmiast skacze po tematach, reagując na każde nudniejsze słowo gwałtowną zmianą słownictwa.
Zalecane wartości to zazwyczaj 0.1 - 0.2.

## 📌 Źródła
- "Mirostat: A Neural Text Decoding Algorithm that Directly Controls Perplexity" (Arxiv).

## 👽 Brudnopis
- Jest to alternatywa dla `Temperature` i `Top-P`. W Mirostat nie ustawiasz temperatury, algorytm sam nią steruje w locie.
- Często używane w `llama.cpp` i modelach lokalnych (GGUF).