---

title: Tokenizacja  
created: 2025-07-16  
status: Final  
category: Przetwarzanie języka naturalnego  
difficulty: podstawowy  
language: pl  
tags:

- NLP
- tokenizacja
- modele językowe
- przetwarzanie tekstu
- tekst na dane  
aliases:
- tokenizacja tekstu
- podział na tokeny
- tokeny w NLP

---

# 🎯 Definicja

**Tokenizacja** to proces dzielenia tekstu na mniejsze jednostki zwane **tokenami**, które mogą odpowiadać słowom, znakom interpunkcyjnym, lub (w kontekście dużych modeli językowych) — fragmentom słów czy sylab. Tokeny stanowią podstawową strukturę wejściową dla modeli NLP (ang. Natural Language Processing), takich jak BERT, GPT, czy RoBERTa.

# 🔑 Kluczowe punkty

- Tokeny to elementarne jednostki przetwarzane przez model językowy.
- Token może oznaczać np. słowo: _"kot"_, interpunkcję: _","_, kawałek słowa: _"pre"_, _"fix"_.
- Różne modele wykorzystują różne strategie tokenizacji.
- Tokenizacja jest **krok wstępnym** przed trenowaniem lub używaniem modelu NLP.
- Liczenie tokenów ma znaczenie dla limitów wejściowych w [[Base LLM|LLM]] (np. GPT: 4k–128k tokenów).

# 📚 Rodzaje tokenizacji

## 1. Tokenizacja słów (word-level)

- Najprostsza forma: dzielenie tekstu na słowa po spacjach.
- Używana w tradycyjnych systemach NLP, np. `["To", "jest", "przykład", "."]`

## 2. Tokenizacja znakowa (char-level)

- Każdy znak w tekście to odrębny token.
- Przydatna w modelach leksykalnych, ortograficznych lub językach bez separatorów (np. chiński).

## 3. Tokenizacja sub-słowna (subword)

- Dzieli tekst na części słów w oparciu o algorytmy, np. BPE (Byte Pair Encoding).
- Przykład: słowo `"unbelievable"` → `[ "un", "believ", "able" ]`
- Modele: GPT, T5, BERT

## 4. Tokenizacja oparta o bajty (byte-level)

- Tokenizacja niezależna od języka i alfabetu — koduje sekwencję bajtów.
- Wykorzystywana np. przez GPT-3.5/4 (`tiktoken`), BLOOM, T5x.

# 🧠 Przykład tokenizacji GPT

Słowo:

```text
"ChatGPT is amazing!"
```

Tokeny (dla GPT-3.5, za pomocą biblioteki `tiktoken`):

```
["Chat", "G", "PT", " is", " amazing", "!"]
```

Liczba tokenów: 6

Dla porównania:

- „To jest świetne!” może zająć 4–6 tokenów, w zależności od języka.
- Przekroczenie 4096 tokenów może obciąć tekst (dla GPT-3.5-turbo).

# 💡 Praktyczne zastosowanie

- **Modele tekstowe**: wejścia i wyjścia są mierzone w tokenach (nie znakach czy słowach).
- **Limity API**: np. OpenAI, Claude, Gemini określają limit w tokenach.
- **Koszt tokenów**: fakturowanie za GPT/Claude bazuje na ilości użytych tokenów.
- **Detekcja długości pętli rozmowy** w interfejsach konwersacyjnych.
- **Fine-tuning i przetwarzanie korpusów**.

# 🧰 Narzędzia i biblioteki

- Hugging Face Tokenizers: `tokenizers` (Rust/Python)
- OpenAI `tiktoken`: do GPT-3.5, [[GPT-4]]
- `spaCy`, `NLTK`
- `SentencePiece` (Google)
- `BPE`, `Unigram`, `WordPiece`

# 📌 Źródła

- [https://huggingface.co/docs/tokenizers](https://huggingface.co/docs/tokenizers)
- [https://github.com/openai/tiktoken](https://github.com/openai/tiktoken)
- [https://spacy.io/usage/linguistic-features#tokenization](https://spacy.io/usage/linguistic-features#tokenization)
- [https://nlp.stanford.edu/software/tokenizer.html](https://nlp.stanford.edu/software/tokenizer.html)
- [https://platform.openai.com/tokenizer](https://platform.openai.com/tokenizer)

## 👽 Brudnopis

- token ≠ słowo
- tokeny = wektory/indeksy → embeddingi
- modele [[Base LLM|LLM]] trenują na milionach tokenów, nie zdań
- tokenizer = preprocesor danych tekstowych → liczby
- przekroczenie limitu = ucięcie promptu lub błędy API

---