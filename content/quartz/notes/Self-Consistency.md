---
title: Self-Consistency
created: 2025-07-16
status: Final
category: Prompt Engineering
difficulty: zaawansowany
language: pl
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
  - LLM
aliases:
  - inżynieria LLM
  - self-consistent prompting
---

# 🎯 Definicja

**Self-Consistency** to zaawansowana technika inżynierii promptów wykorzystywana w kontekście **Chain-of-Thought Promptingu ([[Chain-of-Thought Prompting|CoT]])**. Polega na wygenerowaniu wielu niezależnych ścieżek rozumowania dla danego zadania i wybraniu najbardziej **spójnej odpowiedzi** (najczęściej pojawiającej się konkluzji). Zamiast polegać na pojedynczym, często heurystycznym wyniku, Self-Consistency zwiększa niezawodność i trafność odpowiedzi przez **agregację wielu próbek reasoningowych**.

# 🔑 Kluczowe punkty

- Technika opiera się na probabilistycznym próbkowaniu wielu odpowiedzi z użyciem [[Chain-of-Thought Prompting|CoT]] + sampling (np. temperature sampling).
- Finalna odpowiedź wybierana jest przez majority vote spośród wygenerowanych wyników.
- Zwiększa trafność odpowiedzi w zadaniach wymagających wieloetapowego rozumowania (np. arytmetyka, zdroworozsądkowa inferencja).
- Zastępuje deterministyczne podejście typu greedy decoding w promptach few-shot (lub zero-shot) [[Chain-of-Thought Prompting|CoT]].
- Efektywność rośnie przy większej liczbie próbek, ale też kosztem obliczeniowym.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Self-Consistency?

1. Tworzony jest **prompt typu few-shot Chain-of-Thought** z przykładami rozumowania krok po kroku.
2. Dla danego zapytania model generuje **wiele ścieżek rozumowania**, np. 5–20 odpowiedzi, poprzez sampling (np. przy użyciu Top-k lub temperatury > 0).
3. Analizowane są końcowe odpowiedzi z każdego przekładu reasoningowego.
4. Wybierana jest **najczęściej występująca odpowiedź końcowa** (majority vote).

### Porównanie z klasycznym [[Chain-of-Thought Prompting|CoT]]

| Cecha                     | [[Chain-of-Thought Prompting]]     | Self-Consistency              |
|---------------------------|--------------------------------|-------------------------------|
| Liczba odpowiedzi         | 1                              | N (np. 10–20)                 |
| Metoda wyboru             | Greedy decoding                | Sampling + voting             |
| Stabilność wyników        | Mniejsza (wrażliwy na perturbacje) | Większa – agregacja zagłusza błędy |
| Koszt obliczeniowy        | Niższy                        | Wyższy                        |
| Wyniki w benchmarkach     | Poprawa nawet o 20–25% dokładności| Szczególnie przy reasoning tasks |

## Gdzie sprawdza się najlepiej?

- Zadania arytmetyczne (np. matematyka, liczenie).
- Problemy z rozumowaniem logicznym / warunkowym.
- Testy zdroworozsądkowe (commonsense reasoning).
- Mniej przydatne dla zadań klasyfikacyjnych lub jednoetapowych.

# 💡 Przykład zastosowania

Zastosujmy Self-Consistency do zadania arytmetycznego:

**Pytanie:**  
„Kiedy miałem 6 lat, moja siostra była w połowie młodsza ode mnie. Teraz mam 70 lat. Ile lat ma moja siostra?”

**Błędny output (greedy decoding)**  
„35”

**Zastosowanie Self-Consistency – kilka wariantów reasoning:**

- Output 1: „Gdy miałem 6, siostra miała 3. Teraz mam 70, więc ona ma 67.”
- Output 2: „Wtedy różnica wynosiła 3 lata. Jeśli mam 70, ona ma 70 - 3 = 67.”
- Output 3: „Gdy miałem 6, siostra miała 3. Teraz 70 / 2 = 35.” **(błąd logiczny)**

Wybierana jest odpowiedź najczęściej powtarzająca się – tutaj **67**, która pojawiła się w co najmniej 2 z 3 wyników = **Self-Consistency vote**.

# 📌 Źródła

[1] Google Research – Self-Consistency Improves Chain of Thought Reasoning in Language Models: https://arxiv.org/abs/2203.11171  
[2] [[Prompt Engineering Guide]] – Self-Consistency Prompting: https://github.com/dair-ai/Prompt-Engineering-Guide  
[3] OpenAI Cookbook – Chain-of-thought examples: https://github.com/openai/openai-cookbook/blob/main/examples/How_to_generate_reasoning_with_Chain_of_Thought.ipynb

## 👽 Brudnopis

- Self-Consistency = sampling wielu reasoningów + voting.
- Lepsza niż pojedyncze greedy [[Chain-of-Thought Prompting|CoT]] – mniej wrażliwa na "fluke".
- Wymaga zwiększonego budżetu obliczeniowego.
- Sprawdza się w testach typu GSM8K, BigBench Reasoning.
- Sampling kluczowy – temperature ~0.75, Top-k ~40.
- Można zautomatyzować np. w pipeline Retrieval-Augmented [[Chain-of-Thought Prompting|CoT]].
