---
title: Funkcje Promptów (Prompt Functions)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: advanced
language: pl
tags:
  - modularity
  - programming
  - templates
  - dry
aliases:
  - Prompt Functions
  - Modular Prompting
---
# 🎯 Definicja
**Funkcje Promptów** to technika traktowania promptów jak funkcji w programowaniu: zdefiniowanych bloków tekstu, które przyjmują argumenty (zmienne) i zwracają wynik. Zamiast pisać cały prompt od zera, składasz go z gotowych, przetestowanych klocuszków.

# 🔑 Kluczowe punkty
- **Modularność:** Raz napisany prompt ("Tłumacz na polski") używasz w wielu miejscach.
- **Zmienne:** `{input_text}`, `{tone}`, `{language}` wstawiane dynamicznie.
- **Biblioteki:** [[Langchain|LangChain]], Semantic Kernel – to frameworki zbudowane wokół tej idei.

# 📚 Szczegółowe wyjaśnienie
Zamiast:
"Przetłumacz poniższy tekst na polski w stylu formalnym: Hello World."
Definiujesz szablon (Template):
`TranslateToPolish(text, style) = "Przetłumacz poniższy tekst na polski w stylu {style}: {text}"`
W kodzie (Python) wywołujesz tylko:
`chain.run(text="Hello World", style="formalnym")`.

To pozwala zarządzać setkami promptów w dużej aplikacji, wersjonować je i optymalizować niezależnie od kodu aplikacji.

# 💡 Przykład zastosowania
Aplikacja e-commerce generująca opisy produktów.
Funkcja `GenerateDescription(features, category)`.
Dla butów: `GenerateDescription(["skóra", "wodoodporne"], "Buty Zimowe")`.
Dla laptopa: `GenerateDescription(["16GB RAM", "i7"], "Elektronika")`.
Prompt pod spodem "instruuje" model, jak zachować się dla danej kategorii, ale programista widzi tylko czystą funkcję.

## 📌 Źródła
- [[Langchain|LangChain]] Documentation.

## 👽 Brudnopis
- Podejście to jest kluczowe w **LLM Ops**.
- Prompty stają się kodem (Prompt-as-Code).