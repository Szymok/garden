---
title: Few-Shot Prompting (Uczenie na Przykładach)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: intermediate
language: pl
tags:
  - few-shot
  - context-learning
  - examples
  - llm-patterns
aliases:
  - Few-Shot
  - Promptowanie z przykładami
  - 1-shot
  - 5-shot
---
# 🎯 Definicja
**Few-Shot Prompting** to technika, w której podajemy modelowi językowemu kilka przykładów (shotów) zadania, które ma wykonać, zanim poprosimy go o zrobienie tego samego z nowym danymi. Dzięki temu model "uczy się w kontekście" (In-Context Learning) oczekiwanego formatu i logiki, bez potrzeby trenowania (Fine-Tuning).

# 🔑 Kluczowe punkty
- **Zasada:** Pokaż, nie tylko opisz (Show, don't just tell).
- **Skuteczność:** Drastycznie poprawia jakość odpowiedzi, szczególnie w klasyfikacji i formatowaniu JSON/XML.
- **Warianty:** 
    - **Zero-Shot:** Brak przykładów (tylko instrukcja).
    - **One-Shot:** Jeden przykład.
    - **Few-Shot:** Kilka przykładów (zazwyczaj 3-5).

# 📚 Szczegółowe wyjaśnienie
Modele LLM są doskonałymi maszynami do rozpoznawania wzorców.
Jeśli dasz mu wzorzec:
`Input: A -> Output: B`
`Input: C -> Output: D`
`Input: E -> Output: ?`
Model z dużym prawdopodobieństwem zgadnie, że `?` to `F` (zgodnie z logiką transformacji).

# 💡 Przykład zastosowania
Zadanie: Klasyfikacja sentymentu tweetów.
**Prompt (Few-Shot):**
```text
Tweet: "Kocham ten produkt!" -> Sentyment: Pozytywny
Tweet: "Dostawa spóźniona o 3 dni." -> Sentyment: Negatywny
Tweet: "To jest po prostu okej." -> Sentyment: Neutralny
Tweet: "Najgorszy serwis w historii." -> Sentyment:
```
Model uzupełni tylko: `Negatywny`.

## 📌 Źródła
- "Language Models are Few-Shot Learners" (GPT-3 Paper).

## 👽 Brudnopis
- Ważne: Przykłady powinny być różnorodne i zbalansowane (żeby model nie pomyślał np., że każda odpowiedź ma być "Pozytywna").
- To najtańszy sposób na "specjalizację" modelu.