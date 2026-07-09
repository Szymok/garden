---
title: Function Calling (Tool Use)
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: zaawansowany
language: pl
tags:
  - function-calling
  - tool-use
  - llm
  - api
  - agents
aliases:
  - Tool Use
  - Tool Calling
  - Wywoływanie funkcji
---

# 🎯 Definicja

**Function Calling** (Tool Use) to mechanizm, w którym [[LLM Settings|model językowy]] zamiast generować tekst bezpośrednio, decyduje o wywołaniu zewnętrznej funkcji lub API — zwraca ustrukturyzowany JSON z nazwą funkcji i parametrami, które aplikacja następnie wykonuje.

# 🔑 Kluczowe punkty

- Model **nie wykonuje** funkcji — tylko decyduje kiedy i z jakimi argumentami ją wywołać
- Odpowiedź modelu to JSON, nie tekst narracyjny
- Fundament architektury [[LLM Agents|agentów AI]]
- Natywnie wspierane przez: [[GPT-4|GPT-4]], Claude 3+, Gemini, Llama 3.1+
- Pozwala LLM na: czytanie danych, zapis, wywoływanie API, uruchamianie kodu

# 📚 Szczegółowe wyjaśnienie

## Przepływ

```
1. Użytkownik: "Jaka jest jakość tabeli customers?"
2. Aplikacja wysyła: prompt + definicje narzędzi (JSON Schema)
3. LLM odpowiada: {"tool": "get_data_quality", "args": {"table": "customers"}}
4. Aplikacja wykonuje funkcję, dostaje wynik
5. Wynik trafia z powrotem do LLM jako kolejna wiadomość
6. LLM generuje ostateczną odpowiedź użytkownikowi
```

## Definicja narzędzia (JSON Schema)

```python
tools = [
    {
        "type": "function",
        "function": {
            "name": "get_data_quality_score",
            "description": "Pobiera wynik jakości danych dla wskazanej tabeli z Ataccama ONE",
            "parameters": {
                "type": "object",
                "properties": {
                    "table_name": {
                        "type": "string",
                        "description": "Nazwa tabeli w formacie schema.table"
                    },
                    "metric": {
                        "type": "string",
                        "enum": ["completeness", "accuracy", "consistency"],
                        "description": "Metryka jakości do sprawdzenia"
                    }
                },
                "required": ["table_name"]
            }
        }
    }
]
```

## Parallel Tool Calls

Modele mogą wywołać wiele funkcji jednocześnie:

```
Model: [call get_schema("customers"), call get_dq_score("customers")]
→ oba wywołania wykonują się równolegle
→ wyniki trafiają do modelu w jednym batchu
```

# 💡 Przykład zastosowania

**Chatbot do [[Ataccama|Ataccama]]**: użytkownik pyta "pokaż mi reguły DQ dla tabeli `orders`". Model wywołuje `get_dq_rules(table="orders")` → aplikacja odpytuje [[Ataccama ONE Platform Components|Ataccama API]] → wyniki wracają do modelu → model prezentuje je w czytelnej formie. Bez Function Calling model mógłby tylko halucynować o regułach.

# 📌 Źródła

- [[LLM Agents]]
- [[ReAct Prompting]]
- [[Prompting Applications]]

# 👽 Brudnopis
