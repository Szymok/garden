---
title: Cechy Wektorowych Baz Danych
created: 2026-02-04
status: evergreen
category: Databases / AI
difficulty: intermediate
language: pl
tags:
  - vector-db
  - hnsw
  - ann
  - performance
  - scalability
aliases:
  - Możliwości baz wektorowych
  - Vector DB Features
  - Indeksowanie wektorowe
---
# 🎯 Definicja
Wektorowe [[Bazy danych|bazy danych]] różnią się od klasycznych [[SQL|SQL]] (relacyjnych) i NoSQL (dokumentowych) sposobem indeksowania. Zamiast B-Tree (drzew), używają algorytmów takich jak **HNSW** (Hierarchical Navigable Small World), aby błyskawicznie znajdować punkty "blisko siebie" w przestrzeni wielowymiarowej.

# 🔑 Kluczowe punkty
1.  **ANN (Approximate Nearest Neighbor):** Wyszukiwanie jest "przybliżone" (99% pewności), ale bardzo szybkie. Dokładne przeszukanie miliarda wektorów trwałoby godziny, ANN robi to w milisekundach.
2.  **Wysoka wymiarowość:** Obsługują wektory mające setki, a nawet tysiące wymiarów (np. model OpenAI `text-embedding-3-small` ma 1536 wymiarów).
3.  **Filtrowanie metadanych:** "Znajdź dokumenty podobne do X, ale tylko te opublikowane w 2024 roku".

# 📚 Szczegółowe wyjaśnienie
Dlaczego [[SQL|SQL]] się nie nadaje? Bazy [[SQL|SQL]] są świetne w szukaniu "dokładnym" (`WHERE id = 5`). Wektory nigdy nie są "równe", są tylko "podobne". Obliczanie odległości (Euklidesowej lub Cosine) dla każdego rekordu w bazie [[SQL|SQL]] (Full Scan) zabija wydajność przy dużej skali.
Bazy wektorowe budują graf połączeń (jak sieć neuronowa), co pozwala "przeskakiwać" w okolice szukanego punktu w kilku krokach.

# 💡 Przykład zastosowania
Rozpoznawanie twarzy na lotnisku.
Kamera robi zdjęcie -> zamienia na wektor.
Baza (miliard twarzy) szuka "najbliższego sąsiada".
Jeśli odległość < 0.2 -> To jest poszukiwany przestępca.

## 📌 Źródła
- "Billion-scale similarity search with GPUs" (Facebook AI Research / FAISS).

## 👽 Brudnopis
- Liderzy rynku: Pinecone ([[SaaS|SaaS]]), Milvus (Open Source), Weaviate, Qdrant.
- Klasyczne bazy (Postgres z pgvector, ElasticSearch) też dodały obsługę wektorów, goniąc trend.
