---
title: Tokenization (Tokenizacja)
created: 2026-02-04
status: evergreen
category: AI / Concepts
difficulty: basic
language: pl
tags:
  - tokenization
  - nlp
  - bpe
  - tiktoken
  - context-window
aliases:
  - Tokeny
  - Podział tekstu
---
# 🎯 Definicja
**[[Tokenizacja|Tokenizacja]]** to tłumaczenie tekstu (zrozumiałego dla ludzi) na liczby (zrozumiałe dla modelu).
Model nie widzi słowa "Kot". Widzi liczbę `1532`.
Tekst jest cięty na kawałki (Tokeny).

# 🔑 Kluczowe punkty
- **To nie są słowa:** Token to często ~0.75 słowa (w angielskim). Krótkie słowa to 1 token. Długie to 2-3 tokeny.
- **Koszt:** Płacisz za tokeny (wejściowe i wyjściowe).
- **Limit:** Model ma "Context Window" (np. 128k tokenów). Nic więcej się nie zmieści.

# 📚 Szczegółowe wyjaśnienie
Najpopularniejszy algorytm to **BPE (Byte Pair Encoding)**.
Szuka najczęstszych par znaków i łączy je w token.
Przykład: "[[Tokenizacja|Tokenizacja]]" może być pocięta na `Token` + `i` + `zacja`.
Dla języka polskiego [[Tokenizacja|tokenizacja]] jest często mniej wydajna (zużywa więcej tokenów na to samo zdanie) niż dla angielskiego, bo słowa są bardziej skomplikowane gramatycznie.

# 💡 Przykład zastosowania
Liczysz koszt użycia API [[GPT-4|GPT-4]].
Tekst: "Napisz mi raport." (3 słowa).
Tokeny:
1. `Napisz`
2. ` mi`
3. ` raport`
4. `.`
Razem 4-5 tokenów.
Wchodzisz na [OpenAI Tokenizer](https://platform.openai.com/tokenizer) i sprawdzasz.

## 📌 Źródła
- Hugging Face Tokenizers Doc.

## 👽 Brudnopis
- Problemy z tokenizacją powodują śmieszne błędy LLM. Np. model może nie umieć przeliterować słowa "Lollipop" od tyłu, bo widzi je jako jeden token `Lollipop` i nie wie, z jakich liter się składa.
