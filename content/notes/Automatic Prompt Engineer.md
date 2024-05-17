---
title: Automatic Prompt Engineer
tags:
- prompt
- AI
- Sztuczna-Inteligencja
- ZhouEtAl
- InstructionGeneration
- NaturalLanguageGeneration
- BlackBoxOptimization
- LLM
aliases:
  - APE
---
![[images/Pasted image 20230922001247.png]]
Zhou et al., stworzyl strukturę do automatycznego generowania i selekcji instrukcji. Problem generowania instrukcji jest ujęty w ramy syntezy języka naturalnego jako [problem optymalizacji czarnej skrzynki](Problem%20Optymalizacji%20Czarnej%20Skrzynki) przy użyciu [LLM](LLM) do generowania i przeszukiwania kandydujących rozwiązań.

Pierwszy krok obejmuje duży model językowy (jako model wnioskowania), który otrzymuje demonstracje wyjściowe w celu wygenerowania kandydatów na instrukcje dla zadania. Te kandydujące rozwiązania poprowadzą procedurę wyszukiwania. Instrukcje są wykonywane przy użyciu modelu docelowego, a następnie wybierana jest najbardziej odpowiednia instrukcja na podstawie obliczonych wyników oceny.

[APE](Automatic%20Prompt%20Engineer) odkrywa lepszy prompt [CoT](Chain-of-Thought%20Prompting) typu zero-shot niż zaprojektowany przez człowieka prompt "Pomyślmy krok po kroku".

Prompt "Opracujmy to krok po kroku, aby upewnić się, że mamy właściwą odpowiedź." wywołuje rozumowanie łańcuchowe i poprawia wydajność w testach porównawczych MultiArith i GSM8K:

![[images/Pasted image 20230922001102.png]]


[AutoPrompt](AutoPrompt) - proponuje podejście do automatycznego tworzenia promptów dla zróżnicowanego zestawu zadań w oparciu o [gradient-guided search](gradient-guided%20search).
[Prefix Tuning](Prefix%20Tuning) - lekka alternatywa dla dostrajania, która dodaje ciągły prefiks dla zadań NLG.
[Prompt Tuning](Prompt%20Tuning) - proponuje mechanizm uczenia się miękkich promptów poprzez wsteczną propagację.
