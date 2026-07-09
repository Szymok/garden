---
title: Vector Databases in LLM (Wektorowe Bazy Danych)
created: 2026-02-04
status: evergreen
category: AI / Architecture
difficulty: intermediate
language: pl
tags:
  - vector-database
  - pinecone
  - weaviate
  - embeddings
  - semantic-search
aliases:
  - Bazy Wektorowe
  - Wyszukiwanie Semantyczne
---
# 🎯 Definicja
**Vector Database** to baza danych, która nie przechowuje "słów" (jak [[SQL|SQL]] `SELECT * FROM text WHERE content LIKE '%kot%'`), ale **znaczenia** (liczby, wektory).
Dzięki temu, gdy szukasz "mały tygrys", baza znajdzie "kot", mimo że nie ma tam wspólnych liter. Bo semantycznie leżą blisko siebie.

# 🔑 Kluczowe punkty
- **Embeddingi:** Tekst zamieniany jest na wektor (np. `[0.1, -0.5, 0.8...]`) przez model AI.
- **Wyszukiwanie:** Baza szuka wektorów, które są matematycznie najbliżej wektora zapytania (Cosine Similarity).
- **Pamięć LLM:** To "długoterminowa pamięć" dla modeli AI. Pozwala im pamiętać tysiące dokumentów.

# 📚 Szczegółowe wyjaśnienie
Popularne bazy:
- **Pinecone:** [[SaaS|SaaS]], łatwy w użyciu, drogi.
- **Weaviate:** Open-source, hybrydowy (keyword + vector).
- **Qdrant:** Szybki, Rust, popularny w on-premise.
- **Milvus:** Do ogromnych skal (miliardy wektorów).
- **pgvector:** Rozszerzenie do PostgreSQL (jeśli już masz Postgresa, zacznij od tego).

# 💡 Przykład zastosowania
Wyszukiwarka w sklepie meblowym.
Klient wpisuje: "Coś do siedzenia w salonie, żeby było miękko".
Zwykła baza ([[SQL|SQL]]): 0 wyników (brak słowa "siedzenia" w opisach foteli).
[[Baza wektorowa|Baza Wektorowa]]: Znajduje "Fotel welurowy", "Sofa narożna", "Pufa". Bo "siedzenie" i "miękko" wektorowo pasuje do opisów tych mebli.

## 📌 Źródła
- "Vector Databases for Beginners" (Pinecone Blog).

## 👽 Brudnopis
- Nie potrzebujesz bazy wektorowej do 100 dokumentów. Wystarczy, że załadujesz je do RAM (np. FAISS). Baza jest potrzebna, gdy masz miliony rekordów i musisz je aktualizować.
