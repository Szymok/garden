---
title: RAG (Retrieval-Augmented Generation)
created: 2026-02-04
status: evergreen
category: AI / Architecture
difficulty: intermediate
language: pl
tags:
  - rag
  - llm
  - vector-database
  - context
  - architecture
aliases:
  - Retrieval Augmented Generation
  - Wyszukiwanie Semantyczne
---
# 🎯 Definicja
**RAG** to technika "ściągania na egzaminie" dla AI.
Model LLM (student) dostaje pytanie. Zamiast zmyślać z głowy, najpierw zagląda do podręcznika (Twojej bazy dokumentów), znajduje odpowiedni fragment i na jego podstawie pisze odpowiedź.

# 🔑 Kluczowe punkty
- **Aktualność:** [[GPT-4|GPT-4]] nie wie, co się stało wczoraj. RAG pozwala mu to wiedzieć (jeśli dodasz wczorajsze newsy do bazy).
- **Prywatność:** Możesz używać bezpiecznego modelu (np. Llama 3 on-premise) i karmić go tajnymi dokumentami firmy przez RAG.
- **Brak Halucynacji:** Model opiera się na faktach, które mu dostarczysz.

# 📚 Szczegółowe wyjaśnienie
Architektura RAG składa się z 3 kroków:
1.  **Retrieval (Wyszukiwanie):** Szukasz w bazie wektorowej (np. Pinecone) fragmentów tekstów podobnych do pytania użytkownika.
2.  **Augmentation (Wzbogacanie):** Wklejasz te fragmenty do promptu ("Użyj poniższego tekstu, by odpowiedzieć: ...").
3.  **Generation (Generowanie):** Model pisze odpowiedź na bazie kontekstu.

# 💡 Przykład zastosowania
Chatbot HR.
Pracownik pyta: "Ile mam dni urlopu?"
Tradycyjny LLM: "Nie wiem, kim jesteś."
RAG:
1.  System wyszukuje w Regulaminie Pracy fragmenty o urlopach.
2.  Wyszukuje w bazie HR liczbę dni pracownika.
3.  Prompt do LLM: "Regulamin mówi X. Pracownik ma Y dni. Napisz odpowiedź."
4.  LLM: "Zgodnie z regulaminem przysługuje Ci 26 dni, z czego wykorzystałeś 10."

## 📌 Źródła
- "Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks".

## 👽 Brudnopis
- RAG to obecnie standard w Enterprise AI. Fine-tuning jest drogi i trudny. RAG jest tani i skuteczny.