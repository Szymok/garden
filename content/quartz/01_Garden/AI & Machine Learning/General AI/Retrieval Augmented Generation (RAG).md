---

title: Retrieval Augmented Generation (RAG)  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- RAG
- AI
- LLM
- wektorowe bazy danych
- LangChain
- Chatboty  
aliases:
- Generowanie z uzupełnieniem przez wyszukiwanie
- Retrieval-augmented generation

---

# 🎯 Definicja

**Retrieval Augmented Generation ([[RAG]])** to architektura łącząca dużych modeli językowych ([[Base LLM|LLM]]) z mechanizmem wyszukiwania zewnętrznych informacji w celu generowania bardziej precyzyjnych, aktualnych i spójnych odpowiedzi. Zamiast polegać tylko na statycznej wiedzy zakodowanej w parametrach modelu, [[RAG]] dynamizuje generację poprzez pobranie kontekstu z zewnętrznego źródła wiedzy (np. wektorowej [[Bazy danych|bazy danych]], dokumentacji, encyklopedii, baz firmowych) i dołączenie go do promptu wejściowego.

# 🔑 Kluczowe punkty

- [[RAG]] rozdziela wiedzę „statyczną” (w [[Base LLM|LLM]]) od wiedzy „zewnętrznej/dynamicznej” (z retrievera).
- Pozwala aktualizować bazę wiedzy bez trenowania lub fine-tuningowania modelu.
- Chroni przed halucynacjami poprzez podanie sprawdzalnych źródeł do podpisanego kontekstu.
- Umożliwia zadawanie pytań na podstawie firmowych dokumentów, PDF-ów, baz danych lub intranetów.
- Standardowy komponent nowoczesnych chatbotów domenowych (np. [[Langchain]], [[LlamaIndex]], RasaLLM).

# 📚 Szczegółowe wyjaśnienie

## Architektura [[RAG]] – krok po kroku

1. **Wejście użytkownika:** użytkownik zadaje pytanie (prompt).
2. **Extractor → Retriever:** pytanie jest przekształcane ([[Embedding]]) i używane do przeszukiwania bazy wektorowej lub innego retrievera (np. Elastic, BM25).
3. **Pobranie kontekstu:** pobierane są najbardziej istotne fragmenty dokumentów (top-k), np. z PDF, bazy Notion, Confluence, [[SQL|SQL]] itp.
4. **Kontekst + Pytanie → [[Base LLM|LLM]]:** zapytanie jest rozszerzane o dołączony kontekst, a następnie przekazywane do modelu [[Base LLM|LLM]].
5. **[[Base LLM|LLM]] generuje odpowiedź** z wykorzystaniem zewnętrznych danych bez konieczności trenowania na nowo.

## Kluczowe komponenty architektury

|Komponent|Opis|
|---|---|
|Loader|Załadowanie danych (pliki, API, bazy) jako dokumenty (LlamaHub, [[Langchain]] loaders)|
|Indexing|Tworzenie osadzeń ([[Embedding]]) i zapis do vector store (FAISS, Pinecone)|
|Retriever|Wyszukiwanie podobnych dokumentów do zapytania (Search + Ranking)|
|Generator ([[Base LLM\|LLM]])|Tworzenie końcowej odpowiedzi w oparciu o prompt + retrieved context|
|Evaluator|Mierzenie jakości odpowiedzi – spójność, wiarygodność, cytowalność|

## Typowe narzędzia i biblioteki wspierające [[RAG]]

- **[[Langchain]]** – framework Python do budowania agentów + [[RAG]] + retrieverów
- **[[LlamaIndex]]** – strukturalna warstwa integrująca lokalne dokumenty z [[Base LLM|LLM]]
- **Haystack (deepset)** – do budowania QA + semantic pipelines
- **Pinecone / Weaviate / Qdrant** – wektorowe bazy do indeksowania kontekstu
- **OpenAI / Cohere / HuggingFace** – modele embeddingów i generacji

## Kiedy i dlaczego stosować [[RAG]]?

🔎 Potrzebujesz najnowszych danych — parametryczny [[Base LLM|LLM]] nie zna zmian po dacie trenowania.  
📄 Pracujesz na dokumentach PDF, bazach firmowych itp.  
📉 Model [[Base LLM|LLM]] halucynuje lub niepewnie odpowiada – [[RAG]] skraca ryzyko.  
🔏 Chcesz cytowalną odpowiedź – [[RAG]] umożliwia wyświetlanie źródeł.

## Typowe przypadki użycia

|Obszar|Przykład|
|---|---|
|Wsparcie klienta|Chatbot z dostępem do dokumentacji, baz wiedzy, polityk firmy|
|Research platform|Odpowiedzi [[RAG|RAG]] na zapytania naukowe z bazy publikacji (PubMed, ArXiv)|
|BI agent|Agent pytany o dane finansowe z arkuszy i [[SQL|SQL]]|
|QA system|Dodawanie kontekstu z własnych danych do ChatGPT lub Claude AI|

# 💡 Przykład zastosowania

Firma wdraża chatbota do obsługi zapytań w wewnętrznym środowisku bankowym. Dokumentacja regulacyjna, zapytania [[SQL|SQL]], raporty roczne i wiki produktowa są wczytywane i przekształcane w embeddingi z SentenceTransformers, zapisane w Pinecone ([[Baza wektorowa|vector DB]]).  
Zapytanie użytkownika „Jakie są limity AML dla rynku niemieckiego?” jest zamieniane na [[Embedding]] i porównywane z dokumentami. Top 3 odpowiedzi z dokumentacji dostarczane są do prompta, [[Base LLM|LLM]] (OpenAI [[GPT-4]] turbo) generuje odpowiedź z odniesieniem do źródła i daty dokumentu.

## 📌 Źródła

1. [Meta AI — Retrieval-Augmented Generation (RAG)](https://ai.facebook.com/blog/retrieval-augmented-generation-streamlining-the-creation-of-intelligent-natural-language-processing-models/)
2. [LangChain docs – Vector DB QA](https://python.langchain.com/docs/use_cases/question_answering/how_to/vector_db_qa)
3. [LlamaIndex docs – RAG Concepts](https://docs.llamaindex.ai/en/stable/)
4. [RAG paper (Lewis et al.) – arXiv](https://arxiv.org/abs/2005.11401)

## 👽 Brudnopis

- [[RAG]] = wyszukaj → dołącz kontekst → wygeneruj 📚📤🧠
- Łatwa adaptacja do danych firmowych – zero retrain
- [[RAG]] = dynamiczna warstwa wiedzy vs statyczny [[Base LLM|LLM]]
- Pipeline: load > chunk > embed > store > retrieve > augment > generate
- Eval: faithfulness, hallucination rate, rouge, citation recall
- self-hosted (FAISS) vs managed (Pinecone) – zależnie od prywatności
- przyszłość AI = [[RAG]] + memory + agents = cyfrowi asystenci systemowi