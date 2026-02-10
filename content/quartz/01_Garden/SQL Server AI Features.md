---
title: SQL Server AI Features (Funkcje AI w SQL Server 2025)
created: 2026-02-04
status: evergreen
category: Database / AI
difficulty: intermediate
language: pl
tags:
  - sql-server
  - ai
  - vector-search
  - rag
  - diskann
aliases:
  - SQL Server 2025 AI
  - Wyszukiwanie Wektorowe SQL
---
# 🎯 Definicja
**SQL Server 2025** wprowadza natywną obsługę **AI** i **Wektorów**.
To rewolucja: Możesz robić "Seamantic Search" (wyszukiwanie po znaczeniu) bezpośrednio w bazie SQL, używając zwykłego języka T-SQL. Nie potrzebujesz osobnej bazy wektorowej (jak Pinecone).

# 🔑 Kluczowe punkty
- **Typ `VECTOR`:** Nowy typ danych do przechowywania embeddingów (np. `vector(1536)`).
- **Indeks `DiskANN`:** Super-szybki indeks opracowany przez Microsoft do przeszukiwania wektorów (działa na dysku SSD, nie musi być cały w RAMie).
- **RAG w bazie:** Możesz budować systemy RAG (Retrieval Augmented Generation), trzymając dane firmowe bezpiecznie w SQL Serverze on-premise.

# 📚 Szczegółowe wyjaśnienie
Wcześniej, aby dodać AI do aplikacji, musiałeś:
1.  Wyciągnąć dane z SQL.
2.  Wysłać do Pinecone/Weaviate.
3.  Tam szukać.
Teraz robisz to w jednym zapytaniu SQL:
`SELECT * FROM Products ORDER BY VECTOR_DISTANCE(description_vector, @my_query_vector)`.

# 💡 Przykład zastosowania
Sklep internetowy. Klient wpisuje: "Coś ciepłego na zimę w góry".
Stary SQL (`LIKE '%góry%'`): Znajduje "Rower górski" (Błąd).
Nowy SQL (Vector Search): Znajduje "Kurtka puchowa", "Czapka wełniana". (Bo semantycznie pasują do "zimę w góry").

## 📌 Źródła
- Microsoft SQL Server 2025 Release Notes.

## 👽 Brudnopis
- To odpowiedź Microsoftu na pgvector w PostgreSQL. Bazy relacyjne wchłaniają funkcje baz wektorowych.
