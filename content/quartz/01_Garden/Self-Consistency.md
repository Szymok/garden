---
title: Self-Consistency (Prompting)
created: 2026-02-04
status: evergreen
category: Prompt Engineering / Advanced
difficulty: advanced
language: en
tags:
  - prompting
  - chain-of-thought
  - reliability
  - voting
  - reasoning
aliases:
  - Spójność Wewnętrzna
  - Majority Voting
---
# 🎯 Definicja
**Self-Consistency** to technika "głosowania" w AI.
Zamiast prosić model o jedną odpowiedź (która może być błędna przez przypadek), prosisz go o rozwiązanie problemu 10 razy.
Następnie wybierasz odpowiedź, która pojawiała się najczęściej (Majority Vote).

# 🔑 Kluczowe punkty
- **Wymaga CoT:** Działa najlepiej z [[Chain-of-Thought Prompting]], gdzie model pokazuje tok rozumowania.
- **Koszt:** Zużywasz 10x więcej tokenów (pieniędzy), ale drastycznie zwiększasz poprawność w matematyce i logice.
- **Ensembling:** To prosta forma ensemblingu (łączenia modeli), ale na jednym modelu.

# 📚 Szczegółowe wyjaśnienie
Dlaczego to działa?
Modele LLM są probabilistyczne. Czasem "skręcą w lewo" w rozumowaniu i dojdą do złego wyniku.
Ale jeśli zadanie jest rozwiązywalne, większość ścieżek rozumowania powinna prowadzić do poprawnego wyniku. Błędy są "szumem", poprawna odpowiedź to "sygnał".

# 💡 Przykład zastosowania
Zadanie: "Ile to jest 123 * 45?"
Promptujesz model 5 razy.
Wyniki:
1. "5535" (Poprawna)
2. "5535" (Poprawna)
3. "5435" (Błąd rachunkowy)
4. "5535" (Poprawna)
5. "5500" (Halucynacja)
System wybiera "5535", bo wystąpiło 3 razy.

## 📌 Źródła
- "Self-Consistency Improves Chain of Thought Reasoning in Language Models" (Wang et al., 2022).

## 👽 Brudnopis
- Używaj temperatury > 0 (np. 0.7), żeby wymusić różnorodność w generowanych odpowiedziach. Przy temp=0 dostaniesz 10 razy to samo.
