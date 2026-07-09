---
title: Tree of Thoughts (ToT)
created: 2026-02-04
status: evergreen
category: AI / Prompt Engineering
difficulty: advanced
language: pl
tags:
  - tot
  - reasoning
  - chain-of-thought
  - planning
  - search-algorithms
aliases:
  - Drzewo myśli
  - ToT Prompting
---
# 🎯 Definicja
**Tree of Thoughts (ToT)** to zaawansowana technika promptowania, która każe modelowi myśleć "drzewiasto", a nie liniowo.
Model generuje kilka możliwych kroków, ocenia je, wybiera najlepszy i idzie dalej (jak algorytm szachowy).
To ewolucja [[Chain-of-Thought Prompting]].

# 🔑 Kluczowe punkty
- **Eksploracja:** Model rozważa alternatywy ("A co, jeśli zrobię X? A co, jeśli Y?").
- **Ocena:** Model sam ocenia swoje pomysły ("Pomysł X jest słaby, pomysł Y rokuje").
- **Backtracking:** Jeśli ścieżka prowadzi donikąd, model może się cofnąć (w implementacji programistycznej).

# 📚 Szczegółowe wyjaśnienie
W zwykłym [[Chain-of-Thought Prompting]] model pisze jedno rozwiązanie ciurkiem. Jak popełni błąd na początku, brnie w niego.
W ToT model działa jak algorytm przeszukiwania (BFS/DFS):
1.  Krok 1: Wygeneruj 3 pomysły.
2.  Oceń je. Odrzuć 1, zostaw 2.
3.  Krok 2: Dla obu zostawionych, wygeneruj kolejne kroki...
Wymaga to zazwyczaj skryptu (Python) sterującego modelem, lub bardzo sprytnego prompta.

# 💡 Przykład zastosowania
"Gra w 24" (Użyj liczb 4, 9, 10, 13 by uzyskać 24).
ToT:
1.  "Mogę dodać 4+9 (13)... Mogę pomnożyć 4*9 (36)..." (Generuje gałęzie).
2.  "36 to za dużo, trudno będzie zejść do 24. 13 jest obiecujące." (Ocena).
3.  Idzie ścieżką 13...
Zwykły [[GPT-4|GPT-4]] często "strzela" i się myli. ToT rozwiązuje to systematycznie.

## 📌 Źródła
- "Tree of Thoughts: Deliberate Problem Solving with Large Language Models" (Yao et al., 2023).

## 👽 Brudnopis
- ToT zamienia LLM z "improwizującego poety" w "rozważnego planistę".
