---
title: SQL Server 2025 — Wbudowane funkcje AI i wyszukiwanie wektorowe
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: średni
language: pl
tags:
  - sql-server
  - vector-search
  - rag
  - ai
  - t-sql
aliases:
  - SQL Server AI Features
---
## 🎯 Definicja

[[SQL|SQL]] Server 2025 wprowadza natywne wsparcie dla sztucznej inteligencji, integrując **wyszukiwanie wektorowe** i mechanizmy **[[RAG|RAG]] (Retrieval-Augmented Generation)** bezpośrednio z silnikiem [[Bazy danych|bazy danych]]. Umożliwia to programistom wykonywanie zapytań semantycznych (opartych na znaczeniu, a nie słowach kluczowych) przy użyciu Transact-[[SQL|SQL]] (T-[[SQL|SQL]]) na danych przechowywanych lokalnie (on-premise).

## 🔑 Kluczowe punkty

- Wprowadzenie **natywnego typu danych `vector`** oraz indeksu **`DiskANN`** do ultra-szybkiego, semantycznego przeszukiwania wektorowego.
    
- Możliwość budowania **rozwiązań [[RAG|RAG]]** (Retrieval-Augmented Generation) bezpośrednio w [[SQL|SQL]] Server, pozwalając na zadawanie pytań w języku naturalnym do lokalnych danych.
    
- Integracja z T-[[SQL|SQL]]: Wyszukiwanie wektorowe jest dostępne z poziomu standardowych zapytań [[SQL|SQL]], co eliminuje potrzebę przepisywania istniejących aplikacji (np. na Pythona).
    
- Elastyczność modeli: Możliwość łączenia się z modelami embeddingowymi w chmurze (np. przez Azure AI Foundry) lub **używania modeli lokalnych** (np. Llama), co zapewnia pełną suwerenność danych.
    
- Pełna integracja z istniejącymi funkcjami **bezpieczeństwa [[SQL|SQL]] Server** (Row-Level Security, szyfrowanie, dynamiczne maskowanie, audyt).
    

## 📚 Szczegółowe wyjaśnienie

Tradycyjne wyszukiwanie tekstowe w [[SQL|SQL]] (np. za pomocą operatora `LIKE`) jest nieefektywne i bazuje na dopasowaniu bajtów, a nie na faktycznym znaczeniu tekstu. Full-Text Search jest lepszy, ale nadal ograniczony do słów kluczowych. [[SQL|SQL]] Server 2025 rozwiązuje ten problem, wprowadzając koncepcje znane z modeli GenAI.

Podstawą są **embeddingi** (wektoryzacja). Proces ten polega na przekształceniu dowolnych danych (tekstu, obrazu) za pomocą modelu LLM w wektor – wielowymiarową reprezentację liczbową jego znaczenia. Dwa teksty o podobnym znaczeniu, nawet jeśli używają różnych słów, będą miały podobne wektory w tej przestrzeni.

Aby błyskawicznie przeszukiwać miliony takich wektorów, Microsoft zaimplementował nowy typ indeksu o nazwie **`DiskANN`**. Jest to struktura opracowana przez Microsoft Research, zoptymalizowana pod kątem dysków SSD, która pozwala na bardzo szybkie znajdowanie wektorów "najbliższych" (najbardziej podobnych) do wektora zapytania. Podobieństwo mierzone jest zazwyczaj za pomocą **miary cosinusowej** (cosine similarity).

Architektura [[RAG|RAG]] działa wewnątrz [[SQL|SQL]] Server. Gdy użytkownik zadaje pytanie w języku naturalnym (np. "szukam odzieży sportowej"), jest ono najpierw przekształcane w wektor ([[Embedding|embedding]]) za pomocą wybranego modelu (lokalnego lub w chmurze). Następnie indeks `DiskANN` jest używany do błyskawicznego znalezienia najbardziej podobnych semantycznie rekordów (wektorów) w bazie danych. Na koniec te rekordy są zwracane jako wynik zapytania T-[[SQL|SQL]]. Co ważne, **to nie jest "trenowanie" modelu** – jest to zaawansowane, inteligentne wyszukiwanie.

## 💡 Przykład zastosowania

Chcemy stworzyć semantyczną wyszukiwarkę produktów w sklepie internetowym, która rozumie intencje użytkownika.

1. **Struktura:** Do tabeli `Products` dodajemy nową kolumnę `DescriptionVector vector(1536)`. Rozmiar `1536` jest typowy dla modeli takich jak `text-embedding-ada-002` od OpenAI.
    
2. **[[Embedding|Embedding]]:** Tworzymy proces (np. trigger lub zadanie wsadowe), który dla każdego produktu wysyła jego opis (`Description`) do modelu embeddingowego. Zwrócony wektor zapisuje w kolumnie `DescriptionVector`.
    
3. **Indeks:** Tworzymy indeks wektorowy na tej kolumnie:
    
```sql
CREATE VECTOR INDEX idx_vector_desc 
ON Products(DescriptionVector) 
WITH (ALGORITHM = DISKANN, METRIC = COSINE);
```
**Zapytanie:** Użytkownik wpisuje w wyszukiwarkę frazę "coś na wycieczkę w góry". Aplikacja tworzy [[Embedding|embedding]] dla tej frazy (`@query_vector`) i wykonuje zapytanie T-[[SQL|SQL]], które wyszukuje najbardziej podobne produkty.