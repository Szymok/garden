---

title: Znaczenie wektorów w zastosowaniach modeli językowych  
created: 2025-07-16  
status:  
category: Sztuczna Inteligencja  
difficulty: średni  
language: pl  
tags:

- AI
- LLM
- wektory
- NLP
- modele językowe
- wektorowe bazy danych  
aliases:
- wektory
- bazy danych
---
# 🎯 Definicja

**Wektory semantyczne** (embeddingi) to wielowymiarowe reprezentacje numeryczne tekstu (słów, zdań, dokumentów), używane przez modele językowe do przechwytywania znaczenia oraz kontekstowych zależności między elementami języka. Dzięki nim systemy sztucznej inteligencji — takie jak [[Base LLM|LLM]]-y ([[Base LLM|Large Language Models]]) — mogą lepiej zrozumieć i generować spójny tekst, a także efektywnie przeszukiwać informacje w oparciu o znaczenie, a nie tylko o dokładne dopasowanie słów kluczowych.

# 🔑 Kluczowe punkty

- Wektory odwzorowują semantykę języka naturalnego w przestrzeni matematycznej.
- Są centralnym mechanizmem działania [[Base LLM|LLM]] oraz nowoczesnych wyszukiwarek semantycznych (np. [[RAG]], embeddings search).
- Umożliwiają zastosowania takie jak chat z dokumentacją, rekomendacje, analizy podobieństwa.
- Przechowywane i przeszukiwane w bazach wektorowych (vector stores), np. FAISS, Pinecone, Weaviate.
- Pozwalają mierzyć kontekst, intencję i relacje między słowami, frazami i dokumentami.

# 📚 Szczegółowe wyjaśnienie

## Jak działają wektory w NLP i [[Base LLM|LLM]]?

Modele językowe, takie jak GPT, BERT czy PaLM, kodują tekst wejściowy do reprezentacji wektorowej — czyli listy liczb (embeddingu) — zachowującej informacje o znaczeniu, składni i kontekście. Te wektory powstają w wysokowymiarowej przestrzeni (często 384, 768, 1536 wymiarów), w której:

- blisko siebie leżą pojęcia semantycznie podobne,
- odległości odzwierciedlają podobieństwo znaczenia,
- można używać reguł geometrycznych (np. podobieństwo kosinusowe).

Przykład koncepcji:

> Wektor(„pies”) będzie bliższy wektorowi(„kot”) niż wektorowi(„samochód”)  
> M(„król”) - M(„mężczyzna”) + M(„kobieta”) ≈ M(„królowa”)

## Zastosowania praktyczne

### 💬 1. Zrozumienie kontekstu w dialogu (Conversational AI)

W chatbotach opartych na [[Base LLM|LLM]] wektory kodują historię rozmowy i znaczenie poszczególnych wypowiedzi. Umożliwia to generowanie adekwatnych i naturalnych odpowiedzi, niezależnie od długości dialogu czy wcześniejszych tematów.

### 🔎 2. Semantyczne wyszukiwanie (semantic search)

Zamiast dopasowywać kluczowe słowa, zapytania są przekształcane w embeddingi, które porównywane są z indeksem dokumentów w bazie wektorowej:

- użycie wektorów pozwala na „pytania znaczeniowe” (np. „pomóż mi znaleźć zasady RODO”),
- wspiera zastosowania typu [[RAG]] (Retrieval-Augmented Generation).

### 🎯 3. Rekomendacje

Wektory kodują preferencje użytkowników ([[Embedding]] profilu) oraz właściwości obiektów ([[Embedding]] produktów, filmów itd.). Bliskość wektorów pozwala polecać podobne zasoby:

- Użytkownik (wektor): preferencja = „thrillery psychologiczne z lat 80.”
- Silnik rekomendacyjny wyszukuje filmy o zbliżonych embeddingach.

### 🧠 4. Detecting analogie i relacje semantyczne

Embeddingi są wykorzystywane do:

- grupowania tematycznego (clustering),
- wyszukiwania semantycznie podobnych dokumentów (semantically similar retrieval),
- klasyfikacji tekstu/motywu/intencji (NLP tasks).

# 💡 Wektory w systemie [[RAG]] (Retrieval-Augmented Generation)

W klasycznym [[Base LLM|LLM]] odpowiedzi bazują wyłącznie na wiedzy modelu. W [[RAG]] zapytanie najpierw przekształca się w wektor i przeszukuje bazę dokumentów ([[Embedding]] [[index]]). Odpowiedź [[Base LLM|LLM]] jest generowana na podstawie odszukanych wyników — aktualnych, źródłowych i updejtowalnych.

Schemat:

```
Zapytanie → embedding → wyszukiwanie wektorowe → [top-k dokumentów] → Base Base LLM|LLM|Base LLM|LLM → odpowiedź
```

## Przykładowe bazy wektorowe

|[[Baza wektorowa]]|Cechy|
|---|---|
|FAISS|Open-source, Facebook, szybkie przeszukiwanie offline|
|Pinecone|Usługa SaaS o wysokiej wydajności|
|Weaviate|Wbudowane embeddingi + metadata store|
|Chroma|Lekka, lokalna baza, popularna w projektach [[RAG]]|
|Qdrant|Rust-performance, feature-rich|

# 📌 Źródła

- [From Bits to DataFrames – Jorge Leitao](https://microsites.databricks.com/sites/default/files/2022-07/Sound-Data-Engineering-in-Rust_From-Bits%20to-DataFrames.pdf)
- [Understanding Embeddings – OpenAI](https://platform.openai.com/docs/guides/embeddings)
- [Vector Databases Explained – Pinecone](https://www.pinecone.io/learn/vector-database/)
- [RAG Architecture – Microsoft](https://learn.microsoft.com/en-us/semantic-kernel/overview/rag)

# 👽 Brudnopis

- Wektory = mapa semantyczna tekstu → geometryczne odległości = „rozumienie”
- [[Embedding]] = [token → liczby → zbiory liczb → pozycja w przestrzeni]
- Podobieństwo kosinusowe, ANN indexing (FAISS, IVF, HNSW)
- [[Base LLM|LLM]] = dekoder + wektory kontekstu; wyszukiwanie = query [[Embedding]] + [[index]]
- AI as API = zapytanie tekstowe → wektor → wyniki + generacja → odpowiedź
- Użyteczność: semantic search w dokumentach, PDF-y, Slack, Notion, FAQ
- Ważne dla e‑commerce, GPT-Chatbotów, narzędzi typu Copilot, interaktywne interfejsy