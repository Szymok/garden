---
title: Zero-Shot Prompting
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
  - llm
aliases:
  - tworzenie promptów
---
Dzisiejsze duże maszyny [LLM](LLM), takie jak GPT-3, są przystosowane do wykonywania instrukcji i są szkolone na dużych ilościach danych, dzięki czemu są w stanie wykonywać niektóre zadania "od zera".

W poprzedniej sekcji wypróbowaliśmy kilka przykładów [zero-shot](Zero-Shot%20Prompting). Oto jeden z przykładów, których użyliśmy:

_Prompt:_

```
Classify the text into neutral, negative or positive. Text: I think the vacation is okay.Sentiment:
```

_Output:_

```
Neutral
```

Zwróć uwagę, że w powyższym promptcie nie dostarczyliśmy modelowi żadnych przykładów tekstu wraz z ich klasyfikacją, [LLM](LLM) już rozumie "sentyment" - to właśnie możliwości [zero-shot](Zero-Shot%20Prompting) ujęcia w pracy.

Wykazano, że dostrajanie promptów poprawia uczenie się od zera. Dostrajanie promptów jest zasadniczo koncepcją dostrajania modeli na zestawach danych opisanych za pomocą instrukcji. Co więcej, [RLHF](RLHF) (uczenie ze wzmocnieniem na podstawie ludzkich informacji zwrotnych) zostało przyjęte w celu skalowania dostrajania instrukcji, w którym model jest dostosowywany, aby lepiej pasował do ludzkich preferencji. Ten ostatni rozwój zasila modele takie jak [ChatGPT](ChatGPT). Omówimy wszystkie te podejścia i metody w kolejnych sekcjach.

Gdy [zero-shot](Zero-Shot%20Prompting) nie działa, zaleca się dostarczenie demonstracji lub przykładów w promptcie, co prowadzi do [Few-Shot Prompting](few-shot%20prompting). 
