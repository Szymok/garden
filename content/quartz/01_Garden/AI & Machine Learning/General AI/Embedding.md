---
title: Embedding (Osadzanie / Reprezentacja Wektorowa)
created: 2026-02-04
status: evergreen
category: AI/ML
difficulty: intermediate
language: pl
tags:
  - embedding
  - vector
  - semantic-search
  - nlp
aliases:
  - Wektory
  - Osadzanie
  - Vector Embeddings
---
# 🎯 Definicja
**Embedding** to proces zamiany tekstu (lub obrazu, dźwięku) na długi ciąg liczb (wektor), np. `[0.12, -0.98, 0.55, ...]`. Te liczby reprezentują **znaczenie semantyczne**. Dzięki temu komputer "rozumie", że słowu "pies" jest bliżej matematycznie do słowa "zwierzę" niż do słowa "samochód".

# 🔑 Kluczowe punkty
- **Matematyka znaczenia:** Podobne pojęcia mają podobne wektory (leżą blisko siebie w przestrzeni wielowymiarowej).
- **Zastosowanie:** Wyszukiwarki (Semantic Search), Systemy rekomendacji, [[RAG]].
- **Modele:** OpenAI `text-embedding-3`, BERT, Word2Vec.

# 📚 Szczegółowe wyjaśnienie
W klasycznym wyszukiwaniu (Słowa kluczowe), szukając "auto", nie znajdziesz dokumentu ze słowem "samochód" (bo literki są inne).
W Embeddingach: Wektor słowa "auto" i wektor słowa "samochód" są prawie identyczne (wysokie Cosine Similarity). System znajdzie dokument, mimo braku wspólnych słów.

# 💡 Przykład zastosowania
Chatbot firmowy.
Użytkownik pyta: "Jak wziąć wolne?".
Baza wiedzy ma dokument: "Procedura urlopowa".
Embedding pytania i embedding tytułu dokumentu są bliskie.
System wyciąga ten dokument i przekazuje do LLM, aby udzielił odpowiedzi.

## 📌 Źródła
- "Efficient Estimation of Word Representations in Vector Space" (Word2Vec paper).
- OpenAI Embeddings API Docs.

## 👽 Brudnopis
- Popularne bazy wektorowe do trzymania embeddingów: Pinecone, Weaviate, Qdrant, pgvector.
- Wymiarowość (np. 1536 dla OpenAI) określa, jak wiele niuansów znaczeniowych potrafi zakodować model.