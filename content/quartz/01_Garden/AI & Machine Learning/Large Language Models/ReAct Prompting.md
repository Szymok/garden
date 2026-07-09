---
title: ReAct Prompting (Reason + Act)
created: 2026-02-04
status: evergreen
category: Prompt Engineering / Agents
difficulty: advanced
language: pl
tags:
  - react
  - agents
  - reasoning
  - tools
  - langchain
aliases:
  - ReAct
  - Myśl i Działaj
---
# 🎯 Definicja
**ReAct** to technika, która zmienia LLM z "gadatliwego bota" w "działającego agenta". Model nie tylko odpowiada na pytania, ale potrafi używać narzędzi (Wyszukiwarka, Kalkulator, API), żeby zdobyć informacje potrzebne do odpowiedzi.

# 🔑 Kluczowe punkty
- **Pętla:** Myśl (Thought) -> Działanie (Action) -> Obserwacja Wyniku (Observation) -> Myśl...
- **Autonomia:** Model sam decyduje, kiedy użyć narzędzia.
- **Fundament Agentów:** To podstawa działania AutoGPT czy [[Langchain|LangChain]] Agents.

# 📚 Szczegółowe wyjaśnienie
Zamiast pytać modelu: "Jaka jest pogoda w Warszawie?", gdzie model zgaduje.
Używasz ReAct. Model myśli:
1.  *Thought:* Nie znam pogody. Muszę użyć wyszukiwarki.
2.  *Action:* `Search("Pogoda Warszawa")`
3.  *Observation:* (System zwraca: "15 stopni, słonecznie").
4.  *Thought:* Mam informację. Mogę odpowiedzieć.
5.  *Answer:* "W Warszawie jest 15 stopni i słońce."

# 💡 Przykład zastosowania
Asystent Zakupowy.
Użytkownik: "Znajdź mi najtańszy iPhone 15."
Agent ReAct:
1.  `Search("iPhone 15 cena Ceneo")`
2.  `Search("iPhone 15 cena Allegro")`
3.  *Thought:* Ceneo ma za 3500, Allegro za 3600.
4.  *Answer:* "Najtańszy znalazłem na Ceneo za 3500 zł."

## 📌 Źródła
- "ReAct: Synergizing Reasoning and Acting in Language Models".

## 👽 Brudnopis
- ReAct łączy zalety [[Chain-of-Thought Prompting]] (rozumowanie) z dostępem do świata zewnętrznego.
