---
title: LangChain
created: 2026-07-10
status: 🌱 draft
category: AI & Machine Learning
difficulty: średni
language: pl
tags:
  - langchain
  - llm
  - framework
  - ai-agents
aliases:
  - LangChain
---
# 🎯 Definicja
**LangChain** to otwarty framework programistyczny (dostępny w Pythonie i JavaScript) zaprojektowany w celu ułatwienia tworzenia aplikacji wykorzystujących wielkie modele językowe (LLM). Pozwala programistom na łączenie modeli językowych z zewnętrznymi źródłami danych, bazami wiedzy, interfejsami API oraz na budowanie agentów podejmujących autonomiczne decyzje.

# 🔑 Kluczowe punkty
*   **Chains (Łańcuchy):** Sekwencyjne łączenie różnych komponentów (np. pobierz dane -> sformatuj prompt -> wyślij do LLM -> przetwórz wynik).
*   **Memory (Pamięć):** Zarządzanie stanem i historią konwersacji w interakcjach z modelami LLM (np. zachowanie kontekstu czatu).
*   **Agents (Agenci):** Mechanizmy decyzyjne, w których LLM wybiera i wykonuje odpowiednie akcje przy użyciu zewnętrznych narzędzi (np. wyszukiwanie w Google, uruchomienie kodu).
*   **Retrieval (RAG):** Integracja z wektorowymi bazami danych w celu selektywnego pobierania dokumentów i rozszerzania wiedzy modelu na żądanie.

# 📚 Szczegółowe wyjaśnienie
Same modele LLM są "statycznymi" kalkulatorami probabilistycznymi o ograniczonej wiedzy. LangChain przekształca je w dynamiczne systemy poprzez ustandaryzowanie podstawowych abstrakcji:

1.  **Model I/O:** Ujednolicony interfejs dla różnych modeli (OpenAI, Hugging Face, Cohere, Llama) oraz zarządzanie promptami i ich szablonami.
2.  **Retrieval:** Narzędzia do dzielenia tekstu (text splitters), generowania osadzeń (embeddings) i integracji z bazami wektorowymi (Chroma, Pinecone, Qdrant).
3.  **Chains:** Logiczne sekwencje operacji. Najprostszy łańcuch bierze wejście użytkownika, formatuje je w szablon promptu i przesyła do LLM.
4.  **Agents:** Agenci korzystają z LLM jako "rozumu", który decyduje o kolejności wykonywania działań i narzędzi (Tools), takich jak kalkulator, baza SQL czy wyszukiwarka internetowa.

# 💡 Przykład zastosowania
Budowa bota odpowiadającego na pytania o dokumentację techniczną firmy:
1.  LangChain ładuje pliki PDF z dokumentacją.
2.  Dzieli je na mniejsze fragmenty i generuje wektory (Embeddings).
3.  Zapisuje je w [[Rola wektorowych baz danych w zastosowaniach modeli językowych|wektorowej bazie danych]].
4.  Gdy użytkownik zadaje pytanie, LangChain wyszukuje podobne fragmenty dokumentów w bazie wektorowej, buduje z nich prompt kontekstowy i wysyła do LLM, aby ten wygenerował precyzyjną odpowiedź.

## 📌 Źródła
*   [LangChain Official Documentation](https://python.langchain.com/)
*   [[Podstawy promptów|Zasady promptowania i inżynieria promptów]]
