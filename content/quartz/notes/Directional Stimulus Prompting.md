---
title: Directional Stimulus Prompting
tags: 
aliases:
---
Li  proponuje nową technikę podpowiedzi, aby lepiej pokierować LLM w generowaniu pożądanego podsumowania.

W celu wygenerowania bodźca/podpowiedzi szkolony jest LM o regulowanej polityce. Większe wykorzystanie RL do optymalizacji LLM.

Poniższy rysunek pokazuje, jak Directional Stimulus Prompting wypada w porównaniu ze standardowym podpowiadaniem. Polityka LM może być niewielka i zoptymalizowana pod kątem generowania podpowiedzi, które kierują zamrożonym LLM typu "czarna skrzynka".

![[images/Pasted image 20230924185313.png]]

