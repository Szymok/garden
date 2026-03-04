---
title: Vector Importance in LLMs (Znaczenie wektorów)
created: 2026-02-04
status: evergreen
category: AI / Fundamentals
difficulty: intermediate
language: pl
tags:
  - vectors
  - embeddings
  - semantics
  - llm
  - nlp
aliases:
  - Znaczenie wektorów
  - Reprezentacja wektorowa
---
# 🎯 Definicja
**Wektory (Embeddings)** to język, w którym "myślą" komputery.
Dla komputera słowo "Król" to ciąg liczb (np. `[0.1, 0.5, -0.9]`).
Wektory sprawiają, że słowa o podobnym znaczeniu ("Król" i "Królowa") mają podobne liczby (leżą blisko siebie w przestrzeni).

# 🔑 Kluczowe punkty
- **Semantyka:** Wektory chwytają znaczenie, a nie literki.
- **Matematyka słów:** Możesz liczyć na słowach. `Król - Mężczyzna + Kobieta = Królowa`.
- **Fundament LLM:** ChatGPT nie "czyta" tekstu. Zamienia tekst na wektory, mieli liczby i zamienia wynik z powrotem na tekst.

# 📚 Szczegółowe wyjaśnienie
Tradycyjne wyszukiwanie (Keyword Search) szukało ciągu znaków "K-O-T". Nie znajdowało "K-O-C-U-R", bo litery są inne.
Wyszukiwanie Wektorowe (Semantic Search) zamienia "Kot" na wektor. "Kocur" na wektor. Wektory są blisko. System wie, że to o to samo chodzi.
To podstawa systemów [[RAG]] (Retrieval Augmented Generation).

# 💡 Przykład zastosowania
Wyszukiwarka w sklepie.
Wpisujesz "Czerwony napój gazowany".
Opis produktu: "Coca-Cola puszka".
Zero wspólnych słów.
Ale wektor "Czerwony napój" i wektor "Cola" są blisko. Wyszukiwarka pokazuje Colę.

## 📌 Źródła
- Word2Vec paper (Google).

## 👽 Brudnopis
- Bez wektorów nie byłoby współczesnego AI. To sposób na zmapowanie ludzkiego, nieprecyzyjnego języka na precyzyjną matematykę.
