---
title: LLM Agents (Agenci AI)
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: zaawansowany
language: pl
tags:
  - llm-agents
  - ai-agents
  - tool-use
  - agentic-ai
  - autonomy
aliases:
  - AI Agents
  - Agenci AI
  - Agentic AI
---

# 🎯 Definicja

**LLM Agent** to system, w którym [[LLM Settings|model językowy]] nie tylko generuje tekst, ale podejmuje decyzje, wywołuje narzędzia (tools) i wykonuje wieloetapowe zadania autonomicznie — zamiast odpowiedzieć jedną odpowiedzią, agent planuje, działa, obserwuje wynik i powtarza cykl aż do osiągnięcia celu.

# 🔑 Kluczowe punkty

- **Cykl ReAct**: Reason → Act → Observe → powtórz
- **Tools (narzędzia)**: agent może wywoływać funkcje, API, [[Bazy danych|bazy danych]], wyszukiwarki
- **Memory**: krótkoterminowa (kontekst konwersacji) i długoterminowa ([[Baza wektorowa|vector store]])
- **Planning**: agent rozkłada złożone zadanie na podzadania
- **Multi-agent**: kilka agentów współpracuje — orchestrator + wyspecjalizowane sub-agenty
- **Frameworks**: [[Langchain]], [[LlamaIndex]], AutoGen, CrewAI, LangGraph

# 📚 Szczegółowe wyjaśnienie

## Anatomia agenta

```
┌─────────────────────────────────┐
│           LLM (mózg)            │
│  planuje, decyduje, interpretuje│
└──────┬──────────────────────────┘
       │ wywołuje
┌──────▼──────────────────────────┐
│         Tool Registry           │
│  search_web | run_sql | read_file│
│  send_email | call_api | ...    │
└──────┬──────────────────────────┘
       │ wynik wraca do LLM
┌──────▼──────────────────────────┐
│           Memory                │
│  short-term: prompt context     │
│  long-term: vector DB           │
└─────────────────────────────────┘
```

## Typy agentów

| Typ | Opis | Przykład |
|---|---|---|
| **ReAct** | Naprzemienne rozumowanie i działanie | Szukaj → przeczytaj → odpowiedz |
| **Plan & Execute** | Planuje cały task, potem wykonuje | Piszę raport: kroki 1-5 |
| **Multi-agent** | Hierarchia agentów z różnymi rolami | Orchestrator + Researcher + Writer |
| **Tool-calling** | Prosty agent z zestawem narzędzi | Chatbot z dostępem do [[SQL|SQL]] |

## [[Function Calling|Function Calling]]

Nowoczesne LLM ([[GPT-4|GPT-4]], Claude, Gemini) mają natywne wsparcie dla tool use:

```python
tools = [
    {
        "name": "run_sql_query",
        "description": "Wykonuje zapytanie SQL na bazie danych",
        "parameters": {
            "query": {"type": "string", "description": "Zapytanie SQL"}
        }
    }
]
# Model sam decyduje kiedy i jak wywołać narzędzie
```

## Agenci w [[Data Governance|Data Governance]]

[[Ataccama|Ataccama]] ONE eksperymentuje z agentami AI (patrz notatki webinarowe) do:
- automatycznego sugerowania reguł jakości danych
- proponowania właścicieli danych
- generowania opisów terminu w Słowniku Biznesowym

# 💡 Przykład zastosowania

**[[Data Quality|Data Quality]] Agent**: agent otrzymuje zadanie "sprawdź jakość tabeli `customers`". Autonomicznie: (1) pobiera schemat tabeli z [[Data Catalog|katalogu danych]], (2) uruchamia profilowanie, (3) identyfikuje anomalie, (4) sprawdza reguły DQ w [[Ataccama.md|Ataccama]], (5) generuje raport z rekomendacjami — bez ingerencji człowieka.

# 📌 Źródła

- [[Retrieval Augmented Generation (RAG)]]
- [[Baza wektorowa]]
- [[Langchain]]
- [[LlamaIndex]]
- [[ReAct Prompting]]
- [[Ollama]]

# 👽 Brudnopis
