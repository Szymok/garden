---
title: Automatic Reasoning and Tool-use (ART)
tags:
- AI
- prompt-techniques
- llm
- ChainOfThoughtPrompting
- LLM
- DemonstrationCreation
- FrozenLLM
- IntermediateReasoning
aliases:
  - ART
---
Połączenie [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting) i narzędzi w sposób przeplatany okazało się być silnym i solidnym podejściem do rozwiązywania wielu zadań z [LLM](LLM). Podejścia te zazwyczaj wymagają ręcznego tworzenia demonstracji specyficznych dla zadania i starannie oskryptowanego przeplatania generacji modeli z użyciem narzędzi. Paranjape proponują nową strukturę, która wykorzystuje [frozen LLM](frozen%20LLM) do automatycznego generowania pośrednich kroków rozumowania jako programu.

[ART](ART) działa w następujący sposób:

- biorąc pod uwagę nowe zadanie, wybiera demonstracje wieloetapowego rozumowania i użycia narzędzi z biblioteki zadań
- w czasie testu wstrzymuje generowanie za każdym razem, gdy wywoływane są narzędzia zewnętrzne i integruje ich wyniki przed wznowieniem generowania.

[ART](ART) zachęca model do uogólniania na podstawie demonstracji w celu dekomponowania nowego zadania i używania narzędzi w odpowiednich miejscach, w sposób [zero-shot](zero-shot). Ponadto [ART](ART) jest rozszerzalny, ponieważ umożliwia również ludziom naprawianie błędów w krokach rozumowania lub dodawanie nowych narzędzi poprzez prostą aktualizację bibliotek zadań i narzędzi. Proces ten został przedstawiony poniżej:

![[images/Pasted image 20230922001355.png]]

[ART](ART) znacznie przewyższa [Few-Shot Prompting](Few-Shot%20Prompting) i automatyczny [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting) w niewidocznych zadaniach w benchmarkach [BigBench](BigBench) i [MMLU](MMLU), a także przewyższa wydajność ręcznie tworzonych [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting), gdy włączona jest informacja zwrotna od człowieka.

Poniżej znajduje się tabela przedstawiająca wydajność ART w zadaniach BigBench i MMLU:

![[images/Pasted image 20230922001408.png]]