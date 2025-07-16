---

title: Embedding  
created: 2025-07-16  
status: Final  
category: Sztuczna inteligencja / NLP  
difficulty: średniozaawansowany  
language: pl  
tags:

- embedding
- reprezentacje wektorowe
- uczenie maszynowe
- NLP
- AI  
aliases:
- reprezentacja wektorowa
- osadzanie danych
- embeddingi tekstowe

---

# 🎯 Definicja

**Embedding** to sposób reprezentowania danych — zwłaszcza tekstowych — w postaci **wektorów liczb** w przestrzeni o ustalonym wymiarze. Te reprezentacje w postaci embeddingów odzwierciedlają **semantyczne podobieństwa** i relacje między słowami, zdaniami lub dokumentami, co umożliwia ich przetwarzanie przez modele uczenia maszynowego.

Embeddingi są kluczowe w takich zadaniach jak: wyszukiwanie semantyczne, klasyfikacja tekstów, klasteryzacja, rekomendacje, RAG (Retrieval Augmented Generation) i modele językowe.

# 🔑 Kluczowe punkty

- Dane tekstowe są przekształcane w **wektory o stałej długości** reprezentujące znaczenie.
- Im bliżej dwa embeddingi w przestrzeni wektorowej, tym bardziej **semantycznie podobne** są źródła danych.
- Embeddingi mogą być obliczane dla:
    - pojedynczych słów (**Word Embedding**)
    - całych zdań lub akapitów (**Sentence Embedding**)
    - obrazów, kodu, dokumentów itp.
- Trening embeddingów można przeprowadzić **samodzielnie**, ale częściej stosuje się modele pretrenowane (np. `Word2Vec`, `BERT`, `OpenAI Embeddings`, `Specter`, `SentenceTransformers`).

# 🧠 Word Embedding

**Word embedding** to metoda przedstawienia pojedynczych słów w postaci **gęstych wektorów cech**. Każde słowo otrzymuje współrzędne, które niosą informacje semantyczne.

### Przykład: Word2Vec

- Model trenuje reprezentacje, w których np.  
    `vec("king") - vec("man") + vec("woman") ≈ vec("queen")`
- Popularne podejścia:
    - `Word2Vec` (CBOW, skip-gram)
    - `GloVe` (Global Vectors)
    - `FastText` (obsługa prefiksów/sufiksów)

### Ograniczenia

- Reprezentacja słowa jest **statyczna** — brak zależności od kontekstu zdania.
- Nieodporne na wieloznaczność ("bank" może oznaczać instytucję lub brzeg rzeki).

# 🧩 Sentence Embedding

**Sentence embedding** to sposób reprezentowania **całych zdań lub dokumentów** w formie pojedynczego wektora, który uwzględnia **kontekst i relacje między słowami**.

### Modele

- `BERT`, `RoBERTa`, `DistilBERT` + warstwa agregująca (`CLS`, mean pooling, concat)
- `Sentence-BERT` – dostrojony do tworzenia sensownych reprezentacji zdań
- Embeddingi OpenAI (np. `text-embedding-ada-002`) – do semantycznego wyszukiwania i RAG
- `Universal Sentence Encoder` (Google)

### Zalety

- Kontekstualne — embeddingi słowa różnią się w zależności od zdania
- Idealne do porównań podobieństwa, klasyfikacji, analizy sentymentu, wyszukiwania semantycznego

### Przykład podobieństwa semantycznego:

```python
from sentence_transformers import SentenceTransformer, util

model = SentenceTransformer('all-MiniLM-L6-v2')
emb1 = model.encode("Słońce świeci dziś jasno", convert_to_tensor=True)
emb2 = model.encode("Dzisiejszy dzień jest bardzo słoneczny", convert_to_tensor=True)

similarity = util.cos_sim(emb1, emb2)
print(f"Podobieństwo kosinusowe: {similarity.item():.2f}")
```

# 💡 Przykład zastosowania

W systemie przeszukiwania dokumentacji technicznej zapytania użytkownika są zamieniane na embedding (wektor) i porównywane z embeddingami rozdziałów dokumentów. Następnie wybrane materiały o największym podobieństwie są zwracane użytkownikowi lub dołączane jako kontekst do modelu językowego (RAG).

# 📌 Źródła

- [https://radimrehurek.com/gensim/models/word2vec.html](https://radimrehurek.com/gensim/models/word2vec.html)
- [https://www.sbert.net/](https://www.sbert.net/)
- [https://platform.openai.com/docs/guides/embeddings](https://platform.openai.com/docs/guides/embeddings)
- [https://ai.googleblog.com/2018/05/advances-in-semantic-textual-similarity.html](https://ai.googleblog.com/2018/05/advances-in-semantic-textual-similarity.html)
- [https://huggingface.co/sentence-transformers](https://huggingface.co/sentence-transformers)

## 👽 Brudnopis

- embedding = "znaczenie jako liczby"
- Używane w wyszukiwarkach semantycznych, Matchers, klasyfikatorach
- Wektory = dense, np. 384-elementowe → np. cosine similarity
- W NLP = fundament nowoczesnych modeli w pytaniu/odpowiedzi
- RAG, Vectordb (Qdrant, Pinecone) opierają się na embeddingach
- Open source: Hugginface Transformers, sentence-transformers

---