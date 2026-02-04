---
title: Bazy Wektorowe (Vector Databases)
created: 2026-02-04
status: evergreen
category: AI/Infrastructure
difficulty: intermediate
language: pl
tags:
  - vector-db
  - embeddings
  - rag
  - search
aliases:
  - Vector DB
  - Wyszukiwanie wektorowe
  - Pinecone
  - Weaviate
---
# 🎯 Definicja
**Baza wektorowa** to system bazy danych zoptymalizowany do przechowywania i przeszukiwania **embeddingów** (wektorów liczb reprezentujących znaczenie tekstu/obrazu). Umożliwia wyszukiwanie semantyczne ("znajdź teksty o podobnym znaczeniu"), a nie tylko po słowach kluczowych.

# 🔑 Kluczowe punkty
- **ANN (Approximate Nearest Neighbor):** Algorytmy takie jak HNSW pozwalają znaleźć "najbliższe" wektory w milisekundy, nawet wśród miliardów rekordów.
- **Wyszukiwanie semantyczne:** Zapytanie "zgubiłem klucze" znajdzie dokument "procedura wyrabiania duplikatu klucza", mimo braku wspólnych słów.
- **RAG:** Fundamentalny element systemów Retrieval-Augmented Generation (pamięć długoterminowa dla LLM).

# 📚 Szczegółowe wyjaśnienie
Klasyczna baza (SQL/Elasticsearch) szuka słów: `WHERE content LIKE '%klucze%'`.
Baza wektorowa liczy kąt między wektorami (Cosine Similarity). Jeśli kąt jest mały, znaczenia są bliskie.
Architektura:
- **Encoder:** Model (np. OpenAI `text-embedding-3`) zamienia tekst na wektor (np. 1536 liczb).
- **Indexer:** Baza (Pinecone, Milvus, Qdrant) układa te wektory w przestrzeni.
- **Query:** Użytkownik pyta -> Encoder zamienia pytanie na wektor -> Baza zwraca najbliższe sąsiady.

# 💡 Przykład zastosowania
Sklep internetowy "Fashion AI".
Użytkownik wgrywa zdjęcie czerwonej sukienki.
System zamienia zdjęcie na wektor (CLIP model).
Baza wektorowa znajduje 50 sukienek o "podobnym wektorze" (podobny styl, kolor, krój) i wyświetla je jako "Podobne produkty". Słowa kluczowe nie biorą w tym udziału.

## 📌 Źródła
- [Pinecone Learning Center](https://www.pinecone.io/learn/)

## 👽 Brudnopis
- HNSW (Hierarchical Navigable Small World) - standardowy algorytm indeksowania.
- Hybrydowe wyszukiwanie: Wektory (znaczenie) + Słowa kluczowe (precyzja, np. nazwy własne).