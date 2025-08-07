---

title: LlamaIndex  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- llamaindex
- rag
- llm
- dane
- open source  
aliases:
- llama_index
- llama index

---

# 🎯 Definicja

**LlamaIndex** to otwartoźródłowa ramka programistyczna, umożliwiająca integrację dużych modeli językowych ([[Base LLM|LLM]]) z prywatnymi lub domenowymi źródłami danych. Pozwala programistom i firmom na budowanie aplikacji, które mogą bezpośrednio pobierać, strukturyzować, przeszukiwać oraz analizować własne dane w połączeniu z mocą [[Base LLM|LLM]] — zarówno lokalnie jak i w chmurze. Dostępny jest dla Pythona i Typescripta, a jego architektura ułatwia tworzenie i wdrażanie rozwiązań klasy [[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]] ([[RAG]]).

# 🔑 Kluczowe punkty

- Umożliwia łatwe i szybkie tworzenie aplikacji [[RAG]] ([[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]]) — łączących [[Base LLM|LLM]] z własną bazą wiedzy.
- Obsługuje wiele źródeł danych: pliki, bazy SQL/NoSQL, API, S3, strony WWW i inne repozytoria.
- Zawiera pięć podstawowych modułów: konektory danych, indeksy, silniki, agenty oraz integracje z aplikacjami.
- Pozwala budować zarówno proste chatboty, jak i zaawansowane wyszukiwarki oraz półautonomiczne systemy analityczne.
- Dostępne są zarówno wysokopoziomowe, jak i niskopoziomowe API — elastyczność dla początkujących i zaawansowanych.

# 📚 Szczegółowe wyjaśnienie

## Do czego wykorzystujemy LlamaIndex?

LlamaIndex wykorzystywany jest do rozwiązywania kluczowego problemu: jak połączyć duży model językowy z własnymi, aktualnymi danymi firmowymi lub prywatnymi? Dzięki temu [[Base LLM|LLM]] podczas generowania odpowiedzi może korzystać nie tylko ze swojej "wiedzy wbudowanej", ale także z najnowszych, zewnętrznych informacji, znajdujących się w dokumentach, bazach lub plikach użytkownika. Typowe zastosowania to:

- Budowanie chatbotów i asystentów wspieranych własną bazą wiedzy
- Automatyzacja raportowania, generowanie podsumowań, ekstrakcja insightów z dokumentów
- Systemy Q&A i przeszukiwanie semantyczne
- Integracja wiedzy domenowej z [[Base LLM|LLM]] w narzędziach biznesowych
- Budowa agentów wykonujących półautonomiczne zadania analityczne

## Jak zbudowane jest LlamaIndex?

LlamaIndex składa się z pięciu warstw/modułów, które ze sobą współpracują:

1. **Konektory danych (Data connectors):** Narzędzia pozwalające pobierać dane z różnych środowisk (pliki, bazy, API, chmura).
2. **Indeksy danych (Data indexes):** Warstwy umożliwiające tworzenie indeksów — zarówno klasycznych (np. full-text), jak i wektorowych (embeddingi). Indeksowanie ułatwia szybkie odszukiwanie potrzebnych fragmentów danych.
3. **Silniki (Engines):** Komponenty odpowiadające za wyszukiwanie, ranking i „retrieval” dopasowanych informacji z indeksów.
4. **Agenci danych (Data agents):** Warstwa logiki biznesowej; pozwala realizować bardziej złożone zadania, orchestrację zapytań, analiz oraz działań.
5. **Integracje aplikacyjne (App integrations):** Interfejsy do łatwej implementacji i rozbudowy własnych aplikacji, także z użyciem narzędzi frontendowych.

Wysokopoziomowe API LlamaIndex pozwalają zbudować kompletną aplikację do pobierania, indeksowania i zadawania pytań do danych nawet w pięciu linijkach kodu. Bardziej zaawansowani użytkownicy mogą dostosować każde ogniwo — np. własne embeddingi, customowe silniki retrievalowe i agenty.

# 💡 Przykład zastosowania

Firma prawnicza implementuje własnego chatbota, który potrafi odpowiadać na pytania klientów w oparciu o archiwa pism sądowych, przepisy i wewnętrzną dokumentację. LlamaIndex pozwala na zintegrowanie tych danych (PDF, Word, bazy danych) z [[Base LLM|LLM]], stworzenie indeksu wektorowego i implementację wyszukiwania semantycznego. Prawnicy mogą zadawać pytania wyszukując konkretne sprawy czy interpretacje, a [[Base LLM|LLM]] generuje odpowiedzi w oparciu o rzeczywiste firmowe dane, a nie tylko publiczną wiedzę modelu.

## 📌 Źródła

- [https://www.llamaindex.ai/docs/](https://www.llamaindex.ai/docs/)
- [https://github.com/run-llama/llama_index](https://github.com/run-llama/llama_index)
- [https://sebastianraschka.com/blog/2023/llamaindex-rag.html](https://sebastianraschka.com/blog/2023/llamaindex-rag.html)

## 👽 Brudnopis

- LlamaIndex = warstwa pośrednia pomiędzy prywatną bazą wiedzy a [[Base LLM|LLM]]
- Moduły: konektory (input), indeksy (retrieval), silniki (wyszukiwanie), agenci (logika/zadania), integracje (aplikacje/aplikacje low-code)
- Główne API: simple query, download, indexing, retrieval, advanced agents
- Może korzystać z Pinecone, FAISS, OpenSearch, lokalnych baz
- Łatwe prototypowanie, wsparcie dla [[RAG]], automatyzacja workflow
- Przykład: chatbot lub Q&A na własnym repozytorium dokumentów (np. umowy, case studies)