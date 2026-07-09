---
title: Chain-of-Thought Prompting (CoT)
created: 2026-02-04
status: evergreen
category: AI/Prompt Engineering
difficulty: intermediate
language: pl
tags:
  - prompting
  - reasoning
  - cot
  - llm
aliases:
  - Myślenie łańcuchowe
  - CoT
  - Let's think step by step
---
# 🎯 Definicja
**Chain-of-Thought (CoT)** to technika promptowania, która wymusza na modelu LLM generowanie "pośrenich kroków rozumowania" przed podaniem ostatecznej odpowiedzi. Dzięki temu model rozbija duży problem na małe kawałki, co drastycznie zwiększa poprawność w zadaniach logicznych i matematycznych.

# 🔑 Kluczowe punkty
- **Magiczne zdanie:** Często wystarczy dodać *"Let's think step by step"* (Zero-Shot CoT), aby poprawić wynik.
- **Few-Shot CoT:** Najlepsze efekty daje pokazanie modelowi przykładu, gdzie człowiek rozwiązuje zadanie krok po kroku.
- **Redukcja halucynacji:** Gdy model "głośno myśli", łatwiej wyłapać błąd w logice, zanim poda błędny wynik.

# 📚 Szczegółowe wyjaśnienie
Modele językowe są z natury probabilistyczne i "gadane", a nie logiczne. Jeśli zapytasz *"Ile to 23 * 14?"*, model może zgadywać.
Jeśli wymusisz CoT, model wygeneruje:
*"Najpierw policzmy 20 * 14 = 280. Potem 3 * 14 = 42. Dodajmy 280 + 42 = 322."*
Dzięki rozpisaniu tego na tokeny, model "widzi" swoje obliczenia i ma większą szansę trafić.

# 💡 Przykład zastosowania
Zadanie logiczne: *"Janek ma 5 jabłek. Zjadł 2, a potem kupił 3 razy więcej niż mu zostało. Ile ma jabłek?"*
Bez CoT (Model może się pomylić): *11* (zgaduje).
Z CoT:
1. Janek ma 5 jabłek.
2. Zjadł 2, więc zostało mu 5 - 2 = 3.
3. Kupił 3 razy więcej niż mu zostało, czyli 3 * 3 = 9.
4. Teraz ma te co mu zostały (3) plus te co kupił (9).
5. 3 + 9 = 12.
Odpowiedź: 12.

## 📌 Źródła
- Wei et al., "Chain-of-Thought Prompting Elicits Reasoning in Large Language Models".

## 👽 Brudnopis
- [[Tree of Thoughts|Tree of Thoughts]] (ToT) - ewolucja CoT, gdzie model generuje wiele ścieżek rozumowania i wybiera najlepszą.
- System 1 vs System 2 (Kahneman) - CoT to próba wymuszenia na AI "wolnego myślenia" (System 2).