---

title: Bazy danych oparte na dokumentach  
created: 2025-07-16  
status:  
category: Bazy danych / AI  
difficulty: średni  
language: pl  
tags:

- AI
- Sztuczna-Inteligencja
- llm
- bazy-danych  
aliases:
- wektory
- bazy danych

---

# 🎯 Definicja

**Bazy danych oparte na dokumentach z osadzeniami** to systemy przechowujące teksty lub dokumenty w postaci osadzeń wektorowych. Pozwalają one na szybkie i skuteczne indeksowanie oraz wyszukiwanie treści bazujących na semantyce całych dokumentów, a nie tylko na dopasowaniach słów kluczowych.

# 🔑 Kluczowe punkty

- Przechowują _reprezentacje wektorowe_ dokumentów, umożliwiając semantyczne przeszukiwanie dużych zbiorów tekstów.
- Indeksują i organizują osadzenia tak, aby maksymalizować wydajność przeszukiwania (np. przez k-NN, HNSW).
- Pozwalają wyszukiwać dokumenty nie tylko po wyrażeniach, ale według podobieństwa znaczeniowego – np. podobnych tematów, kontekstu czy powiązań.
- Wspierają integrację z dużymi modelami językowymi ([[Base LLM|LLM]]) przez wyszukiwanie kontekstowe na podstawie promptów użytkownika.
- Popularne w architekturach [[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]] ([[RAG]]), chatbotach, wyszukiwarkach wiedzy i systemach rekomendacyjnych.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania

1. **Oszacowanie dokumentu**  
    Dokumenty są przekształcane na wektory, używając takich technik jak:
    
    - TF-IDF (worki słów)
    - LDA (Latent Dirichlet Allocation)
    - n-gramy
    - Doc2Vec (osadzenia akapitów)
    - Sentence Transformers/BERT dla głębszej semantyki
2. **Indeksowanie**  
    Wektory dokumentów są indeksowane w specjalnie zoptymalizowanych strukturach (np. HNSW, IVFFlat, Annoy), by umożliwić szybkie wyszukiwanie podobieństwa (k-nearest neighbors).
    
3. **Wyszukiwanie**  
    Nowy prompt użytkownika jest również zamieniany na osadzenie. Następnie baza danych zwraca dokumenty najbardziej zbliżone wektorowo (czyli semantycznie) do promptu.
    
4. **Optymalizacja pod [[RAG]] i AI**  
    Przy integracji z [[Base LLM|LLM]], wyniki wyszukiwania trafiają do modelu generatywnego, który może na ich podstawie udzielić wzbogaconej, spersonalizowanej odpowiedzi.
    

## Najpopularniejsze silniki i narzędzia

|System|Typ osadzeń|Kluczowe cechy|
|---|---|---|
|**Pinecone**|dowolne|API SaaS, wsparcie dla [[Base LLM\|LLM]], szybki k-NN|
|**Weaviate**|dowolne|Open-source, wbudowane modele do embedowania tekstu|
|**Elasticsearch**|TF-IDF/BERT|Klasyczne wyszukiwanie + pluginy vector search|
|**Milvus**|wszelkie wektory|Skalowalność, wysokiej jakości ANN|
|**ChromaDB**|dowolne|Prosty interfejs i integracja z [[RAG]]|

## Przykłady zastosowań

- **Chatboty i asystenci [[Base LLM|LLM]]:** Otrzymują zapytanie, embedują je i wyszukują kontekst, by lepiej odpowiadać na pytania użytkownika.
- **Wyszukiwarki wiedzy:** Pozwalają znaleźć instrukcje czy procedury naprawcze na bazie znaczenia zapytania (nie tylko fraz).
- **Systemy rekomendacyjne:** Podsuwają dokumenty powiązane tematycznie, nawet jeśli nie mają wspólnych słów kluczowych.

# 💡 Przykład architektury

1. Użytkownik wpisuje pytanie (np. „Jak zresetować hasło w SAP?”)
2. System embeduje pytanie (np. za pomocą Sentence-BERT)
3. Przeszukiwana jest baza osadzeń dokumentów (manuali, instrukcji, FAQ)
4. Najbardziej zbliżone odpowiedzi są zwracane lub przekazywane do [[Base LLM|LLM]] do sformułowania pełnej odpowiedzi

# 📌 Źródła

- [https://pinecone.io/learn/vector-database/](https://pinecone.io/learn/vector-database/)
- [https://www.milvus.io/docs/embeded_vector_database.md](https://www.milvus.io/docs/embeded_vector_database.md)
- [https://weaviate.io/developers/weaviate/current/vector_index/indexes.html](https://weaviate.io/developers/weaviate/current/vector_index/indexes.html)
- [https://www.elastic.co/guide/en/elasticsearch/reference/current/dense-vector.html](https://www.elastic.co/guide/en/elasticsearch/reference/current/dense-vector.html)
- [https://chroma.readthedocs.io/en/latest/](https://chroma.readthedocs.io/en/latest/)

# 👽 Brudnopis

- [[Embedding]] = wektorowy opis znaczenia dokumentu/tekstu
- Najprostsze: TF-IDF, n-gram, LDA; zaawansowane: BERT, Doc2Vec, [[RAG]]-specific embeddings
- Indeksy HNSW, IVFFlat – szybkie k-NN "nearest neighbor" na miliardach rekordów
- Integracja z [[Base LLM|LLM]]: zapytanie użytkownika → [[embedding]] → wyszukiwanie → prompt do [[Base LLM|LLM]] z kontekstem
- Przykładowe silniki: Pinecone, Milvus, Weaviate, ChromaDB, Elasticsearch vector search
- Typowe use-case: asystenci AI, duże wyszukiwarki dokumentów, wsparcie helpdesk, [[RAG]]