---
title: LangChain (Framework AI)
created: 2026-02-04
status: evergreen
category: AI Frameworks
difficulty: intermediate
language: pl
tags:
  - langchain
  - python
  - llm
  - agents
  - rag
aliases:
  - LangChain Framework
  - Łańcuchy LLM
---
# 🎯 Definicja
**LangChain** to "klej" dla aplikacji AI. Jest to biblioteka (Python/JS), która pozwala łatwo łączyć modele językowe (jak [[GPT-4|GPT-4]]) z innymi narzędziami: bazami danych, wyszukiwarką Google, kalkulatorem czy Twoimi plikami PDF.

# 🔑 Kluczowe punkty
- **Chains (Łańcuchy):** Sekwencja zdarzeń. Np. Krok 1: Przetłumacz maila. Krok 2: Napisz odpowiedź. Krok 3: Wyślij.
- **Agents:** AI, które samo decyduje, jakich narzędzi użyć (np. "Chcesz wiedzieć jaka jest pogoda? Użyję pluginu WeatherAPI").
- **Memory:** Daje modelowi "pamięć" rozmowy (Base GPT nie pamięta poprzedniego pytania; LangChain mu je "przypomina").

# 📚 Szczegółowe wyjaśnienie
Budowanie aplikacji na "gołym" API OpenAI jest trudne (musisz sam zarządzać historią czatu, formatować prompty). LangChain daje gotowe klocki:
- `PDFLoader` (wczytaj PDF).
- `RecursiveTextSplitter` (podziel na kawałki).
- `VectorStore` (wrzuć do Pinecone).
- `RetrievalQA` (zrób z tego czatbota).

# 💡 Przykład zastosowania
Chcesz zbudować "Asystenta Finansowego".
Używasz LangChain Agenta z dostępem do:
1. Twojej bazy [[SQL|SQL]] (żeby sprawdzić wydatki).
2. Internetu (żeby sprawdzić kurs dolara).
Pytasz: "Ile wydałem na kawę w przeliczeniu na dolary?".
Agent sam pisze [[SQL|SQL]] (`SELECT sum(cost) ...`), dostaje wynik, sprawdza kurs USD i mnoży.

## 📌 Źródła
- LangChain Documentation.

## 👽 Brudnopis
- LangChain stał się standardem przemysłowym, ale jest krytykowany za "nadmierną abstrakcję" (ukrywa, co się dzieje pod spodem). Alternatywy: [[LlamaIndex|LlamaIndex]] (lepsze do danych), DSPy.