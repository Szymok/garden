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
## ðŸŽ¯ Definicja

SQL Server 2025 wprowadza natywne wsparcie dla sztucznej inteligencji, integrujÄ…c **wyszukiwanie wektorowe** i mechanizmy **RAG (Retrieval-Augmented Generation)** bezpoÅ›rednio z silnikiem bazy danych. UmoÅ¼liwia to programistom wykonywanie zapytaÅ„ semantycznych (opartych na znaczeniu, a nie sÅ‚owach kluczowych) przy uÅ¼yciu Transact-SQL (T-SQL) na danych przechowywanych lokalnie (on-premise).

## ðŸ”‘ Kluczowe punkty

- Wprowadzenie **natywnego typu danych `vector`** oraz indeksu **`DiskANN`** do ultra-szybkiego, semantycznego przeszukiwania wektorowego.
    
- MoÅ¼liwoÅ›Ä‡ budowania **rozwiÄ…zaÅ„ RAG** (Retrieval-Augmented Generation) bezpoÅ›rednio w SQL Server, pozwalajÄ…c na zadawanie pytaÅ„ w jÄ™zyku naturalnym do lokalnych danych.
    
- Integracja z T-SQL: Wyszukiwanie wektorowe jest dostÄ™pne z poziomu standardowych zapytaÅ„ SQL, co eliminuje potrzebÄ™ przepisywania istniejÄ…cych aplikacji (np. na Pythona).
    
- ElastycznoÅ›Ä‡ modeli: MoÅ¼liwoÅ›Ä‡ Å‚Ä…czenia siÄ™ z modelami embeddingowymi w chmurze (np. przez Azure AI Foundry) lub **uÅ¼ywania modeli lokalnych** (np. Llama), co zapewnia peÅ‚nÄ… suwerennoÅ›Ä‡ danych.
    
- PeÅ‚na integracja z istniejÄ…cymi funkcjami **bezpieczeÅ„stwa SQL Server** (Row-Level Security, szyfrowanie, dynamiczne maskowanie, audyt).
    

## ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

Tradycyjne wyszukiwanie tekstowe w SQL (np. za pomocÄ… operatora `LIKE`) jest nieefektywne i bazuje na dopasowaniu bajtÃ³w, a nie na faktycznym znaczeniu tekstu. Full-Text Search jest lepszy, ale nadal ograniczony do sÅ‚Ã³w kluczowych. SQL Server 2025 rozwiÄ…zuje ten problem, wprowadzajÄ…c koncepcje znane z modeli GenAI.

PodstawÄ… sÄ… **embeddingi** (wektoryzacja). Proces ten polega na przeksztaÅ‚ceniu dowolnych danych (tekstu, obrazu) za pomocÄ… modelu LLM w wektor â€“ wielowymiarowÄ… reprezentacjÄ™ liczbowÄ… jego znaczenia. Dwa teksty o podobnym znaczeniu, nawet jeÅ›li uÅ¼ywajÄ… rÃ³Å¼nych sÅ‚Ã³w, bÄ™dÄ… miaÅ‚y podobne wektory w tej przestrzeni.

Aby bÅ‚yskawicznie przeszukiwaÄ‡ miliony takich wektorÃ³w, Microsoft zaimplementowaÅ‚ nowy typ indeksu o nazwie **`DiskANN`**. Jest to struktura opracowana przez Microsoft Research, zoptymalizowana pod kÄ…tem dyskÃ³w SSD, ktÃ³ra pozwala na bardzo szybkie znajdowanie wektorÃ³w "najbliÅ¼szych" (najbardziej podobnych) do wektora zapytania. PodobieÅ„stwo mierzone jest zazwyczaj za pomocÄ… **miary cosinusowej** (cosine similarity).

Architektura RAG dziaÅ‚a wewnÄ…trz SQL Server. Gdy uÅ¼ytkownik zadaje pytanie w jÄ™zyku naturalnym (np. "szukam odzieÅ¼y sportowej"), jest ono najpierw przeksztaÅ‚cane w wektor (embedding) za pomocÄ… wybranego modelu (lokalnego lub w chmurze). NastÄ™pnie indeks `DiskANN` jest uÅ¼ywany do bÅ‚yskawicznego znalezienia najbardziej podobnych semantycznie rekordÃ³w (wektorÃ³w) w bazie danych. Na koniec te rekordy sÄ… zwracane jako wynik zapytania T-SQL. Co waÅ¼ne, **to nie jest "trenowanie" modelu** â€“ jest to zaawansowane, inteligentne wyszukiwanie.

## ðŸ’¡ PrzykÅ‚ad zastosowania

Chcemy stworzyÄ‡ semantycznÄ… wyszukiwarkÄ™ produktÃ³w w sklepie internetowym, ktÃ³ra rozumie intencje uÅ¼ytkownika.

1. **Struktura:** Do tabeli `Products` dodajemy nowÄ… kolumnÄ™ `DescriptionVector vector(1536)`. Rozmiar `1536` jest typowy dla modeli takich jak `text-embedding-ada-002` od OpenAI.
    
2. **Embedding:** Tworzymy proces (np. trigger lub zadanie wsadowe), ktÃ³ry dla kaÅ¼dego produktu wysyÅ‚a jego opis (`Description`) do modelu embeddingowego. ZwrÃ³cony wektor zapisuje w kolumnie `DescriptionVector`.
    
3. **Indeks:** Tworzymy indeks wektorowy na tej kolumnie:
    
```sql
CREATE VECTOR INDEX idx_vector_desc 
ON Products(DescriptionVector) 
WITH (ALGORITHM = DISKANN, METRIC = COSINE);
```
**Zapytanie:** UÅ¼ytkownik wpisuje w wyszukiwarkÄ™ frazÄ™ "coÅ› na wycieczkÄ™ w gÃ³ry". Aplikacja tworzy embedding dla tej frazy (`@query_vector`) i wykonuje zapytanie T-SQL, ktÃ³re wyszukuje najbardziej podobne produkty.