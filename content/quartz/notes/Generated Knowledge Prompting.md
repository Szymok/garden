---
title: Generated Knowledge Prompting
tags:
  - prompt
  - prompt-techniques
aliases:
  - GKP
---
![[images/Pasted image 20230922002008.png]]

Modele [LLM](LLM) są wciąż ulepszane, a jedna z popularnych technik obejmuje możliwość uwzględnienia wiedzy lub informacji, aby pomóc modelowi w dokonywaniu dokładniejszych prognoz.

Korzystając z podobnego pomysłu, czy model może być również wykorzystywany do generowania wiedzy przed dokonaniem prognozy? To właśnie jest próbą w artykule Liu et al. 2022(otwiera się w nowej karcie) - generowanie wiedzy, która ma być wykorzystana jako część [promptu](Prompt). W szczególności, jak pomocne jest to w zadaniach takich jak rozumowanie zdroworozsądkowe?

Wypróbujmy prosty prompt:

Prompt:

```
Part of golf is trying to get a higher point total than others. Yes or No?
```

_Output:_

```
Yes.
```

Ten rodzaj błędu ujawnia ograniczenia [LLM](LLM) w wykonywaniu zadań wymagających większej wiedzy o świecie. Jak możemy to poprawić dzięki generowaniu wiedzy?

Po pierwsze, generujemy troche "wiedzy":

_Prompt:_

```
Input: Greece is larger than mexico.
Knowledge: Greece is approximately 131,957 sq km, while Mexico is approximately 1,964,375 sq km, making Mexico 1,389% larger than Greece.
Input: Glasses always fog up.
Knowledge: Condensation occurs on eyeglass lenses when water vapor from your sweat, breath, and ambient humidity lands on a cold surface, cools, and then changes into tiny drops of liquid, forming a film that you see as fog. Your lenses will be relatively cool compared to your breath, especially when the outside air is cold.
Input: A fish is capable of thinking.
Knowledge: Fish are more intelligent than they appear. In many areas, such as memory, their cognitive powers match or exceed those of ’higher’ vertebrates including non-human primates. Fish’s long-term memories help them keep track of complex social relationships.
Input: A common effect of smoking lots of cigarettes in one’s lifetime is a higher than normal chance of getting lung cancer.
Knowledge: Those who consistently averaged less than one cigarette per day over their lifetime had nine times the risk of dying from lung cancer than never smokers. Among people who smoked between one and 10 cigarettes per day, the risk of dying from lung cancer was nearly 12 times higher than that of never smokers.
Input: A rock is the same size as a pebble.
Knowledge: A pebble is a clast of rock with a particle size of 4 to 64 millimetres based on the Udden-Wentworth scale of sedimentology. Pebbles are generally considered larger than granules (2 to 4 millimetres diameter) and smaller than cobbles (64 to 256 millimetres diameter).
Input: Part of golf is trying to get a higher point total than others.
Knowledge:
```

_Knowledge 1:_

```
The objective of golf is to play a set of holes in the least number of strokes. A round of golf typically consists of 18 holes. Each hole is played once in the round on a standard golf course. Each stroke is counted as one point, and the total number of strokes is used to determine the winner of the game.
```

_Knowledge 2:_

```
Golf is a precision club-and-ball sport in which competing players (or golfers) use many types of clubs to hit balls into a series of holes on a course using the fewest number of strokes. The goal is to complete the course with the lowest score, which is calculated by adding up the total number of strokes taken on each hole. The player with the lowest score wins the game.
```

Następnym krokiem jest zintegrowanie wiedzy i uzyskanie prognozy. Przeformatowałem pytanie do formatu QA, aby ukierunkować format odpowiedzi.

_Prompt:_

```
Question: Part of golf is trying to get a higher point total than others. Yes or No?
Knowledge: The objective of golf is to play a set of holes in the least number of strokes. A round of golf typically consists of 18 holes. Each hole is played once in the round on a standard golf course. Each stroke is counted as one point, and the total number of strokes is used to determine the winner of the game.
Explain and Answer: 
```

_Answer 1 (confidence very high):_

```
No, the objective of golf is not to get a higher point total than others. Rather, the objective is to play a set of holes in the least number of strokes. The total number of strokes is used to determine the winner of the game, not the total number of points.
```

```
Question: Part of golf is trying to get a higher point total than others. Yes or No?
Knowledge: Golf is a precision club-and-ball sport in which competing players (or golfers) use many types of clubs to hit balls into a series of holes on a course using the fewest number of strokes. The goal is to complete the course with the lowest score, which is calculated by adding up the total number of strokes taken on each hole. The player with the lowest score wins the game.
Explain and Answer:
```

_Answer 2 (confidence is a lot lower):_

```
Yes, part of golf is trying to get a higher point total than others. Each player tries to complete the course with the lowest score, which is calculated by adding up the total number of strokes taken on each hole. The player with the lowest score wins the game.
```

W tym przykładzie wydarzyło się kilka naprawdę interesujących rzeczy. W pierwszej odpowiedzi model był bardzo pewny siebie, ale w drugiej już nie tak bardzo. Uprościłem ten proces dla celów demonstracyjnych, ale jest jeszcze kilka szczegółów, które należy wziąć pod uwagę przy uzyskiwaniu ostatecznej odpowiedzi. Więcej informacji można znaleźć w artykule.

[Liu et al. 2022 (opens in a new tab)](https://arxiv.org/pdf/2110.08387.pdf)
