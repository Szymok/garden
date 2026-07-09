---
title: LlamaIndex (Data Framework for LLM)
created: 2026-02-04
status: evergreen
category: AI Frameworks
difficulty: intermediate
language: pl
tags:
  - llamaindex
  - rag
  - python
  - data-ingestion
  - indexing
aliases:
  - GPT Index
  - Llama Index
---
# 🎯 Definicja
**LlamaIndex** (dawniej GPT Index) to narzędzie stworzone specjalnie do **łączenia LLM z Twoimi danymi**. O ile [[Langchain|LangChain]] to "scyzoryk do wszystkiego", LlamaIndex specjalizuje się w **[[RAG|RAG]]** (Retrieval-Augmented Generation) - czyli w tym, jak najlepiej pobrać dane z PDF-a, podzielić je, zindeksować i podać modelowi.

# 🔑 Kluczowe punkty
- **Data Connectors:** Gotowe "wtyczki" do czytania danych z Discorda, Notion, [[SQL|SQL]], PDF, Jira itd.
- **Indices:** Struktury danych (np. Vector Store Index, List Index, Tree Index) optymalizujące wyszukiwanie.
- **Query Engine:** Silnik, który zamienia pytanie ("Ile zarobiliśmy?") na serię kroków przeszukujących indeks.

# 📚 Szczegółowe wyjaśnienie
Główna różnica vs [[Langchain|LangChain]]:
LlamaIndex skupia się na **jakości danych**. Oferuje zaawansowane strategie chunkingu (dzielenia tekstu), rerankingu (ponownego oceniania wyników wyszukiwania, żeby najlepsze były na górze) i syntezy odpowiedzi.
Jeśli budujesz czatbota "Rozmawiaj ze swoimi dokumentami" - LlamaIndex jest często pierwszym wyborem.

# 💡 Przykład zastosowania
Masz 1000 artykułów naukowych. Chcesz napisać podsumowanie stanu wiedzy o "Lekach na raka".
LlamaIndex:
1. Wczyta artykuły.
2. Stworzy indeks wektorowy.
3. Na pytanie "Jakie są obiecujące leki?", znajdzie 50 fragmentów.
4. Użyje techniki "Tree Summarization" (drzewiaste podsumowanie), żeby skonsolidować wiedzę z tych fragmentów w jedną spójną odpowiedź.

## 📌 Źródła
- LlamaIndex Documentation.

## 👽 Brudnopis
- "[[Langchain|LangChain]] to architekt, LlamaIndex to bibliotekarz".