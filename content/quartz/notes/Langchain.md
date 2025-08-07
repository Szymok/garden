---

title: LangChain  
created: 2025-07-16  
status: Final  
category: Frameworky AI  
difficulty: średniozaawansowany  
language: pl  
tags:

- LLM
- framework
- LangChain
- aplikacje promptowe
- agentowy LLM  
aliases:
- langchain framework
- łańcuchy LLM
- prompting z komponentami

---

# 🎯 Definicja

**LangChain** to framework open-source do tworzenia **aplikacji opartych na języku naturalnym i dużych modelach językowych ([[Base LLM|LLM]])**, który upraszcza integrację modeli z zewnętrznymi źródłami wiedzy, narzędziami i interfejsami. Pozwala budować aplikacje z wykorzystaniem **łańcuchów przetwarzania językowego**, które zapewniają podejście modularne i skalowalne do workflow opartego na promptach, kontekście i agentach.

# 🔑 Kluczowe punkty

- Framework do budowania aplikacji z [[Base LLM|LLM]] zamiast pojedynczych promptów.
- Obsługuje **kompozycję komponentów**: pamięć, wejścia, przetwarzanie, akcje, narzędzia.
- Integruje się z systemami zewnętrznymi: bazy wiedzy, wyszukiwarki, SQL, API REST, serwisy file storage.
- Wspiera **[[RAG]]**, **agentów razonujących**, **multi-step workflows**, **orchestration pipelines**.
- Posiada wersje dla Pythona (`langchain`) i JavaScript/TypeScript (`langchain.js`).

# 📚 Szczegółowe wyjaśnienie

## Architektura LangChain

|Warstwa|Funkcja|
|---|---|
|**[[Base LLM\|LLM]] Wrapper**|Obsługa wielu dostawców [[Base LLM\|LLM]]: OpenAI, HuggingFace, Cohere, Mistral itd.|
|**Prompting**|PromptTemplates, ChatPromptTemplates, FewShotPrompt|
|**Memory**|Utrzymywanie kontekstu rozmowy, np. ConversationBufferMemory|
|**Chains**|Łączenie elementów w sekwencje operacji (Input → Prompt → [[Base LLM\|LLM]] → Output)|
|**Tools & Agents**|Integracja z zewnętrznymi narzędziami (Google, GitHub, Wikipedia, SQL)|
|**Retrievers / [[RAG]]**|Łączenie z wektorowymi bazami danych (FAISS, Pinecone, Chroma)|

## Przykład działania prostego łańcucha

```python
from langchain import OpenAI, LLMChain
from langchain.prompts import PromptTemplate

llm = OpenAI(temperature=0.7)
prompt = PromptTemplate(input_variables=["subject"], template="Napisz zabawną wiadomość o {subject}")
chain = LLMChain(llm=llm, prompt=prompt)

response = chain.run("astronautach i serze")
print(response)
```

## Typy gotowych komponentów

- **LLMChain** – podstawowy łańcuch: prompt → [[Base LLM|LLM]] → output
- **SequentialChain** – wykonuje sekwencję zadań (output A → input B)
- **SimpleSequentialChain** – tylko wejście–wyjście bez zmiennych pośrednich
- **ConversationChain** – utrzymanie kontekstu dialogu
- **RetrieverQA** – fetching wiedzy z dokumentów ([[RAG]])

## Agentowość

LangChain obsługuje tzw. **agentów [[Base LLM|LLM]]**, którzy:

- Otrzymują cel (prompt) i kontekst
- Podejmują decyzję, jakich narzędzi użyć (np. wyszukiwarka, baza danych)
- Modyfikują działania na podstawie zwrotnych komunikatów

Przykład agenta:

```python
from langchain.agents import initialize_agent, Tool

tools = [Tool.from_function(web_search), Tool.from_function(sql_query_tool)]

agent = initialize_agent(tools, Base LLMllm, agent_type="zero-shot-ReAct Prompting|react-description")
result = agent.run("Ile meczów wygrał Real Madryt w 2023 roku?")
```

## Integracje

- Wektoryzacja: FAISS, Qdrant, Chroma, Weaviate
- Źródła dokumentów: PDF, Notion, Google Docs, Markdown
- Inne: SQL, Zapier, WolframAlpha, DuckDuckGo, WebScraper

# 💡 Przykład zastosowania

Firma wdraża aplikację do obsługi klienta opartą na wiedzy z dokumentów. Zamiast przesyłać cały kontekst w promptach, używa LangChain do:

- podziału dokumentacji na chunki i osadzenia ich ([[embedding]])
- wyszukiwania relewantnych fragmentów zapytań użytkownika (retriever)
- użycia [[Base LLM|LLM]] + prompt template + memory do wygenerowania odpowiedzi

Całość spięta jako [[RAG]] pipeline z ChatConversationalChain.

# ✅ Zalety

|Korzyść|Opis|
|---|---|
|Skalowalność promptów|Łatwo tworzyć i testować prompty modularnie|
|Integracja z zewnętrznymi danymi|gotowe narzędzia i retrievery|
|Modularność i elastyczność|Składanie aplikacji jak z klocków|
|Obsługa kontekstu dialogu|Memory i chat feedback|

# 📌 Źródła

- [https://www.langchain.com/](https://www.langchain.com/)
- [https://docs.langchain.com/docs/get-started/installation](https://docs.langchain.com/docs/get-started/installation)
- [https://github.com/langchain-ai/langchain](https://github.com/langchain-ai/langchain)
- [https://python.langchain.com/](https://python.langchain.com/)

## 👽 Brudnopis

- LangChain ≠ model → manager aplikacji AI
- alternatywa: [[LlamaIndex]] (focus na dokumentach), Haystack
- current best: `lc-serve`, agent-executor, [[RAG]] pipelines
- przykład: prompt chaining → retriever → tool → generation
- duży potencjał w AI automacji, [[Base LLM|LLM]] workflow management

---