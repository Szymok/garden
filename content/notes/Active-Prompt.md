---
title: Active-Prompt
tags: 
aliases:
---
# Active-Prompt

[Chain-of-thought (CoT)](Chain-of-thought (CoT) opierają się na stałym zestawie przykładów z adnotacjami człowieka. Problem polega na tym, że przykłady mogą nie być najbardziej efektywnymi przykładami dla różnych zadań. Aby temu zaradzić, Diao zaproponowal niedawno nowe podejście do podpowiadania o nazwie [Active-Prompt](Active-Prompt), aby dostosować [LLM](LLM) do różnych przykładowych promptów specyficznych dla zadania (z adnotacjami dotyczącymi rozumowania CoT zaprojektowanego przez człowieka).

Poniżej znajduje się ilustracja tego podejścia. Pierwszym krokiem jest zapytanie [LLM](LLM) z lub bez kilku przykładów CoT. *k* możliwych odpowiedzi jest generowanych dla zestawu pytań szkoleniowych. [Metryka niepewności](Metryka%20niepewności) jest obliczana na podstawie *k* odpowiedzi (wykorzystywana jest różnica zdań). Najbardziej niepewne pytania są wybierane do adnotacji przez ludzi. Nowe przykłady z adnotacjami są następnie wykorzystywane do wnioskowania o każdym pytaniu.

![[images/Pasted image 20230923211523.png]][Diao et al., (2023)](https://arxiv.org/pdf/2302.12246.pdf)
