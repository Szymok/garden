---

title: Baza wektorowa  
created: 2025-07-16  
status: Final  
category: Sztuczna inteligencja / Infrastruktura danych  
difficulty: podstawowy  
language: pl  
tags:

- embedding
- wyszukiwanie semantyczne
- wektorowe bazy danych
- retrival augmented generation
- ai  
aliases:
- wektorowa baza danych
- vector db
- vector search engine

---

# 🎯 Definicja

**Baza wektorowa** (ang. _vector database_) to specjalny typ bazy danych przystosowany do **przechowywania, indeksowania i wyszukiwania danych w postaci reprezentacji wektorowych**, które powstały na przykład w wyniku zastosowania Embedding. W praktyce bazy te umożliwiają **wyszukiwanie semantyczne** – czyli odnajdywanie najbardziej podobnych znaczeniowo elementów, a nie tylko identycznych lub zgodnych z kluczem.

# 🔑 Kluczowe różnice: baza klasyczna vs wektorowa

|Cecha|Baza klasyczna (np. SQL, NoSQL)|Baza wektorowa|
|---|---|---|
|Typ danych|Tekst, liczby, daty, relacje|Wektory liczb (embeddingi)|
|Wyszukiwanie|Dokładne dopasowanie (exact match)|Podobieństwo semantyczne (nearest neighbors)|
|Klucz wyszukiwania|ID, tekst, warunki logiczne|Wektor zapytania (query embedding)|
|Zastosowania|CRUD, raporty, e-commerce, logika biznesowa|AI/LLM, RAG, NLP, semantyczne wyszukiwanie|
|Wydajność|Optymalizacja zapytań, indeksy B-Tree|Indeksy wektorowe: IVF, HNSW, FAISS|

# 📚 Szczegóły działania

## Reprezentacja danych

Zamiast strukturalnego tekstu czy tabel, baza przechowuje **embeddingi** – np. 384- lub 768-wymiarowe wektory liczbowe reprezentujące znaczenie tekstów, obrazów, audio lub kodu.

## Wyszukiwanie: podobieństwo kosinusowe lub euklidesowe

Gdy użytkownik zadaje pytanie lub podaje tekst, najpierw jest on konwertowany na **embedding (wektor)**, a następnie baza **zwraca wektory najbardziej podobne (nearest neighbors)** w bazie – na podstawie podobieństwa (ang. similarity):

```text
similarity = cos(ϑ) = (A · B) / (‖A‖‖B‖)
```

# 🧠 Przykłady użycia bazy wektorowej

- **Chatbot z RAG**: pytanie użytkownika → wektor zapytania → trafne dokumenty → odpowiedź zbudowana na znalezionych danych
- **System rekomendacji**: wektor profilu użytkownika vs produkty
- **Wyszukiwanie kodu, obrazów (reverse search), wiadomości, PDF**
- **Rozszerzanie kontekstu LLM**: semantyczne retrieval → context injection (`context-aware prompting`)

# 💡 Przykład: FAISS i Pinecone

Przechowanie wektorów w bazie FAISS:

```python
from sentence_transformers import SentenceTransformer
import faiss
import numpy as np

model = SentenceTransformer('all-MiniLM-L6-v2')
docs = ["To jest dokument o SQL", "Uczenie maszynowe i embeddingi", "Przewodnik po Kubernetesie"]
vectors = model.encode(docs)

index = faiss.IndexFlatL2(384)  # indeks euklidesowy
index.add(np.array(vectors))    # dodajemy wektory
```

Później zapytanie użytkownika przekształcamy w wektor i wykonujemy wyszukiwanie:

```python
query_vec = model.encode(["Czym jest Embedding?"])
D, I = index.search(np.array(query_vec), k=3)
```

## Znane silniki baz wektorowych

|Nazwa|Opis|
|---|---|
|**FAISS**|Facebook AI Similarity Search, szybki i lokalny|
|**Pinecone**|Platforma SaaS do wyszukiwania semantycznego|
|**Weaviate**|Baza z REST/GraphQL, AI-native, z wbudowanymi embeddingami|
|**Qdrant**|Wydajny silnik open-source napisany w Rust|
|**Milvus**|Skalowalna, wysokowydajna baza wektorowa|
|**Chroma**|Lekka, prosta do użycia baza na etapie prototypowania, działa lokalnie w Pythonie|

# ✅ Porównanie do klasycznych baz

|Czynność|Klasyczna baza|Baza wektorowa|
|---|---|---|
|Szukaj "analiza danych"|dopasuje frazę|znajdzie również "eksploracja danych", "analiza statystyczna", itp.|
|Klucz główny|`id`, `email`|`embedding_vector`, zwykle z `metadata`|
|Złożoność indeksu|B-tree/O(log n)|ANN – Approximate Nearest Neighbors, czasy ms|

# 📌 Źródła

- [https://platform.openai.com/docs/guides/embeddings](https://platform.openai.com/docs/guides/embeddings)
- [https://python.langchain.com/docs/modules/data_connection/vectorstores](https://python.langchain.com/docs/modules/data_connection/vectorstores)
- [https://faiss.ai](https://faiss.ai)
- [https://www.pinecone.io](https://www.pinecone.io)
- [https://qdrant.tech](https://qdrant.tech)
- [https://weaviate.io](https://weaviate.io)

## 👽 Brudnopis

- embedding → przejście z tekstu do przestrzeni semantycznej
- klasyczne SQL/inverted index ≠ zrozumienie sensu
- vdb = klucz dla RAG, NLP 2.0, semantycznych systemów asystujących
- łączenie bazy wektorowej z promptem jako kontekst, coraz popularniejsze

---