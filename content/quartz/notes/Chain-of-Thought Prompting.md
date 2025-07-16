---

title: Chain-of-Thought Prompting  
created: 2025-07-16  
status:  
category: LLM  
difficulty: średni  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- prompt-techniques  
aliases:
- CoT

---

# 🎯 Definicja

**Chain-of-Thought Prompting (CoT)** to technika podpowiadania, która prowadzi model językowy przez sekwencję logicznych kroków rozumowania, zanim zostanie udzielona ostateczna odpowiedź. W przeciwieństwie do klasycznych promptów, CoT zachęca model do „myślenia na głos” w stylu krok po kroku. Umożliwia to rozwiązywanie bardziej złożonych zadań wymagających logicznych operacji i wieloetapowego wnioskowania.

# 🔑 Kluczowe punkty

- **Rozumowanie krok po kroku:** Model jest proszony o przeprowadzenie analizy lub przeliczeń przed sformułowaniem odpowiedzi.
- **Efekt emergentny dużych modeli:** Skuteczność techniki CoT pojawia się dopiero w modelach LLM o odpowiedniej skali (zwykle powyżej 100 miliardów parametrów).
- **Połączenie z few-shot i zero-shot:** CoT może być wykorzystywane zarówno w promptach z kilkoma przykładami (few-shot), jak i bez żadnych przykładów (`zero-shot-CoT`), tylko z dodatkiem frazy aktywującej (“Let's think step by step”).
- **Podnosi trafność odpowiedzi** w zadaniach arytmetycznych, logicznych, wyboru wielokrotnego, QA i reasoning.
- **Auto-CoT** automatyzuje proces tworzenia łańcuchów myślowych przy użyciu modelu wstępnie pobudzanego heurystyką.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Chain-of-Thought Prompting?

Model językowy nie tylko otrzymuje pytanie, ale także zostaje zachęcony do wygenerowania pośrednich etapów rozumowania. Dzięki temu może eksplorować głębsze aspekty zadania i unikać typowych „halucynacji domyślnych”.

### Przykład standardowy

**Prompt:**

```
The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A:
```

**Output z CoT:**

```
Adding all the odd numbers (15, 5, 13, 7, 1) gives 41. The answer is False.
```

## Zero-shot Chain-of-Thought

Zamiast przykładów używa się klasycznego polecenia typu “Let's think step by step.”

**Prompt:**

```
I went to the market and bought 10 apples. I gave 2 to the neighbor and 2 to the repairman. I then bought 5 more and ate 1. How many apples did I remain with? Let's think step by step.
```

**Output:**

```
10 – 2 – 2 = 6, +5 = 11, –1 = 10. Answer: 10 apples.
```

Ten prosty dodatek może znacząco poprawić dokładność odpowiedzi.

## Automatic Chain-of-Thought (Auto-CoT)

Auto-CoT automatyzuje tworzenie przykładów pokazujących sekwencję rozumowania:

- **Etap 1: klastrowanie pytań** ze zbioru danych (np. wg długości, tematyki, trudności).
- **Etap 2: wybór reprezentatywnych pytań i generowanie CoT** za pomocą heurystyki (np. długość pytania, minimalna liczba kroków logicznych).

Wygenerowane demonystracje mogą być następnie używane jako prompty few-shot do szerszego wnioskowania.

# 💡 Przykład zastosowania

CoT znajduje zastosowanie m.in. w:

- **QA testach (np. ScienceQA, CommonsenseQA):** "Which substance is denser: iron or water?"
- **Zadaniach z matematyki:** "What is the next prime after 83?"
- **Złożonych logikach i grach słownych:** "If John is taller than Mary, and Mary is taller than Tom, who is the shortest?"

Model odpowiada skuteczniej, gdy użyje serii przemyśleń, a nie zgaduje od razu.

# 📌 Źródła

- [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](https://arxiv.org/abs/2201.11903)
- [Zero-shot CoT Prompting](https://arxiv.org/abs/2205.11916)
- [Auto-CoT](https://arxiv.org/abs/2210.03057)
- [PromptingGuide.ai - CoT](https://promptingguide.ai/techniques/chain-of-thought)

# 👽 Brudnopis

- CoT działa tylko w naprawdę dużych modelach – efekt emergentny.
- Dobrym triggerem często okazuje się jedno zdanie: “Let's think step by step.”
- Można budować demonstracje: (Treść pytania + przykład obliczenia + odpowiedź).
- Auto-CoT = skalowalne generowanie przykładów do few-shot-CoT.
- CoT = większy koszt tokenów, ale wyższa jakość reasoning + interpretowalność.