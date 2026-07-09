---

title: Rola wektorowych baz danych w zastosowaniach modeli językowych  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: średni  
language: pl  
tags:

- AI
- LLM
- wektory
- vector databases
- bazy danych
- embeddings  
aliases:
- wektorowe bazy danych
- wektory
- wyszukiwanie semantyczne

---

# 🎯 Definicja

**Wektorowe [[Bazy danych|bazy danych]] (Vector Databases)** to wyspecjalizowane systemy bazodanowe zaprojektowane do przechowywania, indeksowania i szybkiego wyszukiwania wektorów (embeddingów) – czyli wielowymiarowych reprezentacji numerycznych danych (tekstów, obrazów, audio itp.). W kontekście dużych modeli językowych ([[Base LLM|LLM]]), stanowią podstawową strukturę do realizacji semantycznego wyszukiwania, zadawania pytań do dokumentów ([[RAG]]), filtrowania danych i porównań kontekstowych.

# 🔑 Kluczowe punkty

- Przechowują wysokowymiarowe dane wektorowe (np. 384D, 768D) wygenerowane przez modele językowe.
- Umożliwiają operacje podobieństwa (k-NN, cosine similarity, ANN) zoptymalizowane do miliardów punktów.
- Wspierają semantyczne wyszukiwanie (semantic search), rekomendacje, [[RAG]] i systemy QA.
- Integrują się bezpośrednio z narzędziami [[Base LLM|LLM]] (np. [[Langchain]], Haystack, OpenAI plugins).
- Stosują zaawansowane struktury indeksujące (HNSW, FAISS, IVF, PQ) dla ekstremalnej wydajności.

# 📚 Szczegółowe wyjaśnienie

## Jak działają?

Po przekształceniu tekstu przez model (np. OpenAI [[Embedding]] API, BERT-as-service, SentenceTransformers) — tekst zostaje zakodowany jako wektor. Baza:

1. Indeksuje nowy wektor w przestrzeni wielowymiarowej.
2. Pozwala zadawać zapytania również jako wektor.
3. Kalkuluje podobieństwo (np. kosinusowe) pomiędzy zapytaniem a zapisanymi reprezentacjami.
4. Zwraca top-k najbardziej semantycznie zbliżonych wyników.

## Główne komponenty:

- **Storage** – przechowywanie dużych przestrzeni embeddingów
- **Vector Indexing** – przyspieszony dostęp (HNSW, Flat, IVFPQ, ScaNN)
- **API Query Layer** – wyszukiwanie top-k najbardziej podobnych punktów
- **Hybrid Search** – łączenie wyszukiwania wektorowego z klasycznym (tekst, tagi, pola metadanych)

## Przykłady zastosowań:

- **[[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]] ([[RAG|RAG]])** – uzupełnianie kontekstu [[Base LLM|LLM]] o najbardziej dopasowane treści
- **Rekomendacje kontekstowe** – dobierane wg podobieństwa semantycznego, a nie tylko reguł biznesowych
- **Wyszukiwanie semantyczne** – np. „pokaż mi faktury związane z opóźnioną dostawą laptopów”
- **Wirtualni asystenci AI** – dostęp do wiedzy firmowej zapisanej w embeddingach (PDF-y, strony, bazy wiedzy)

## Popularne bazy wektorowe

|Baza|Główne cechy|
|---|---|
|**Pinecone**|Usługa [[SaaS|SaaS]], skalowalna, klasy enterprise-ready|
|**FAISS**|Open-source od Meta AI – szybka, lokalna, wspiera wiele algorytmów ANN|
|**Weaviate**|Open-source z wbudowanym NLP, tagami - [[SQL|SQL]]-like query DSL|
|**Qdrant**|Napisana w Rust, wysoka szybkość i dokładność|
|**ChromaDB**|Lekka lokalna, idealna dla Chatbotów [[RAG]] offline|
|**Milvus**|Rozproszona, wspiera miliardy wektorów, dobra do big-scale scenariuszy|

# 💡 Przykład zastosowania

Firma konsultingowa tworzy [[Base LLM|LLM]]-asystenta do przeszukiwania dokumentacji projektowej (PDF, Word, email).

- Dokumenty są przekształcane przez Sentence-BERT w embeddingi i ładowane do bazy Weaviate.
- Użytkownik wpisuje zapytanie: "Jakie były ryzyka wykryte podczas wdrożenia SAP we Francji?"
- Zapytanie zamieniane jest na [[Embedding]], Weaviate zwraca 3 najbliższe wektory (fragmenty dokumentów).
- [[Base LLM|LLM]] (np. GPT) generuje odpowiedź na podstawie tych kontekstów ([[RAG]] pipeline).
- Dzięki temu asystent udziela logicznej, cytowalnej, precyzyjnej odpowiedzi „na źródłach”, z zachowaniem aktualnej wiedzy.

## 📌 Źródła

- [Pinecone – Czym jest ___BLOCK_PLACEHOLDER_13___?](https://www.pinecone.io/learn/vector-database/)
- [FAISS – Facebook AI Similarity Search](https://github.com/facebookresearch/faiss)
- [Weaviate – vector database explained](https://weaviate.io/developers/weaviate)
- [Qdrant – Introduction and benchmark](https://qdrant.tech/documentation/)
- [[[LangChain]] – Integracja z vector stores](https://docs.[[Langchain|langchain]].com/docs/integrations/vectorstores/)

## 👽 Brudnopis

- wektor = reprezentacja tekstu w N-wymiarze → porównywanie przez similarity
- zastosowanie: [[RAG]], semantyczne QA, podobieństwo → dla [[Base LLM|LLM]]
- Różnica w stosunku do klasycznego search (np. Elastic): nie zależy od miejsca słów, tylko od znaczenia
- Integracja [[Base LLM|LLM]] + vector store ≈ nowoczesna pamięć kontekstowa
- typowy flow: input → [[Embedding]] → top-k retrieval → prompt → output
- coraz bardziej podstawowy komponent każdej wartwej architektury AI opartej na dokumentach / wiedzy domainowej