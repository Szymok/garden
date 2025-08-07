---

title: Jak podpiąć większy dokument do modelu AI  
created: 2025-07-16  
status: Final  
category: LLM / Praktyka  
difficulty: średniozaawansowany  
language: pl  
tags:

- LLM
- przetwarzanie dokumentów
- prompting
- RAG
- chunking  
aliases:
- dokumenty AI
- podpinanie danych do modelu
- jak dołączyć dokument do LLM

---

# 🎯 Problem

Duże modele językowe ([[Base LLM|LLM]]), takie jak ChatGPT, Claude czy Mistral, zostały wytrenowane na ogromnych zbiorach danych, ale **nie mają dostępu do Twoich dokumentów**, chyba że je im podasz. Co jednak zrobić, gdy dokument jest zbyt długi, a liczba tokenów wejściowych modelu jest ograniczona (np. max 4k–100k tokenów)?

Rozwiązaniem jest **inteligentna integracja dokumentów** - tak, aby model był w stanie je przetworzyć w całości lub kontekstowo, bez halucynacji i bez obciążania promptu.

# 🔑 Kluczowe podejścia

## 1. Chunking + Prompt

**Chunking** polega na podziale dokumentu (PDF, DOCX, TXT, HTML…) na mniejsze fragmenty (np. akapity/sekcje po 400–1000 tokenów).

Natępnie wykonuje się:

- **manualne lub automatyczne streszczenie** każdej części
- lub **wejście do modelu etapami**, np. w kilku iteracjach typu:
    
    > Podsumuj ten fragment i zapamiętaj jego treść (jako kontekst): `[fragment 1]`
    

Model nie widzi naraz całego dokumentu, ale „uczy się” struktury częściami.

👉 Użyj narzędzi typu:

- [[LangChain]]/[[LLamaIndex]] (chunkowanie + routing promptu)
- Pojedynczy prompt z `###Section:` delimiters

## 2. [[RAG]] – [[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]]

**[[RAG]] ([[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]])** to podejście, w którym:

- Dokument konwertowany jest do embeddingów (wektorowa reprezentacja znaczenia).
- Wszystkie fragmenty dokumentu są wrzucane do **wektorowej bazy danych** (np. FAISS, Pinecone, Weaviate).
- Model analizuje zapytanie użytkownika, a wektorowa baza zwraca **tylko najbardziej trafne fragmenty dokumentu**, które są dołączane do promptu jako kontekst.

Dzięki temu model **odpowiada trafnie na pytania na podstawie realnych fragmentów tekstu**, bez potrzeby ładowania całego pliku do promptu.

👉 Narzędzia:

- [[LangChain]] + FAISS
- [[LlamaIndex]]
- Airbyte + OpenAI + Qdrant (pluginy open [[RAG]])
- Groq, Vectara, PrivateGPT

## 3. Metadata filtering & routing

Jeśli dokument zawiera sekcje oznaczone tagami, datami, tematami, można zbudować:

- system filtrujący chunk po tagach (np. „Regulamin 2023”, „Załącznik A”)
- próbki promptów kierujące zapytanie tylko do danego typu treści

# ⚙️ Praktyczne podejścia w kodzie

```python
from langchain.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.vectorstores import FAISS
from langchain.embeddings import OpenAIEmbeddings

# Załaduj dokument
loader = PyPDFLoader("umowa_przyklad.pdf")
pages = loader.load()

# Chunkowanie
splitter = RecursiveCharacterTextSplitter(chunk_size=800, chunk_overlap=100)
docs = splitter.split_documents(pages)

# Embedding i baza wektorowa
db = FAISS.from_documents(docs, OpenAIEmbeddings())

# Zapytanie
query = "Jakie są kary za odstąpienie od umowy?"
docs_matching = db.similarity_search(query)

# Teraz możesz przekazać docs_matching jako kontekst do promptu dla GPT
```

# 💡 Przykład zastosowania

Firma prawna analizuje nowy akt ustawowy liczący 120 stron. Zamiast przesyłać całość do ChatGPT, dzieli dokument na strony. Następnie zapytania typu „Jakie obowiązki ma pracodawca wobec zleceniobiorcy wg nowego prawa?” powodują, że wektorowy mechanizm zwraca konkretne strony dotyczące tego tematu. Odpowiedź modelu opiera się tylko na odnalezionych fragmentach — zgodnie z „grounded generation”.

# 📌 Źródła

- [https://docs.llamaindex.ai](https://docs.llamaindex.ai)
- [https://python.langchain.com/docs/use_cases/question_answering](https://python.langchain.com/docs/use_cases/question_answering)
- [https://huggingface.co/blog/augment-llm-with-documents](https://huggingface.co/blog/augment-llm-with-documents)
- [https://airbyte.com/blog/building-a-scalable-rag-pipeline](https://airbyte.com/blog/building-a-scalable-rag-pipeline)
- [https://arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401) (RAG paper)

## 👽 Brudnopis

- Jeśli dokument ma > max_context_size – nie ładuj na siłę, tylko zrób chunking
- Split na podstawie struktury: `###`, `\n\n`, `---`, metadane, spisy treści
- Można też kompresować: streszczenie każdej sekcji + metaprompt
- Prompt typu: „Na podstawie poniższych fragmentów odpowiedz”
- limit kontekstu [[GPT-4]]-turbo = ~128k tokenów (ale trzeba uważać na koszt i długość odpowiedzi)

---