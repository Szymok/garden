---
title: Wektorowe Bazy Danych a LLM
created: 2026-02-04
status: evergreen
category: Databases / AI
difficulty: intermediate
language: pl
tags:
  - vector-db
  - llm
  - memory
  - semantic-search
  - rag
aliases:
  - Vector DB use cases
  - Bazy wektorowe w AI
---
# 🎯 Definicja
**Wektorowe Bazy Danych** (np. Pinecone, Weaviate, Milvus) działają jako **pamięć długoterminowa** dla modeli językowych. Pozwalają LLM-om "pamiętać" informacje spoza ich treningu (np. Twoje prywatne maile, dokumentację firmy) poprzez wyszukiwanie semantyczne.

# 🔑 Kluczowe punkty
- **Semantic Search:** Szukanie po *znaczeniu*, nie po słowach kluczowych (np. szukając "smutny film" znajdzie "Dramat", mimo że słowa są inne).
- **Embeddingi:** Teksty zamienione na ciągi liczb (wektory). Podobne teksty są blisko siebie w przestrzeni matematycznej.
- **RAG:** Baza wektorowa karmi LLM wiedzą w czasie rzeczywistym.

# 📚 Szczegółowe wyjaśnienie
Jak to działa?
1.  Użytkownik wysyła pytanie.
2.  System zamienia pytanie na wektor (Embedding).
3.  Baza danych szuka wektorów "najbliższych" temu pytaniu (kosinusowe podobieństwo).
4.  Znalezione fragmenty tekstów są doklejane do promptu LLM.
5.  LLM odpowiada, korzystając z tej wiedzy.

# 💡 Przykład zastosowania
Chatbot obsługi klienta.
Zamiast trenować model na nowo (co kosztuje miliony), wrzucasz instrukcje PDF do bazy wektorowej. Gdy klient pyta o "zwrot towaru", baza znajduje odpowiedni fragment regulaminu i chatbot go cytuje.

## 📌 Źródła
- "Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks".

## 👽 Brudnopis
- Bazy wektorowe rozwiązały problem "nieaktualnej wiedzy" w modelach (GPT-4 wiedział tylko rzeczy do 2023 roku; z bazą wektorową wie to, co wrzuciłeś przed chwilą).