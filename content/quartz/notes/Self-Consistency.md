---
title: Self-Consistency
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
aliases:
  - inżynieria LLM
---
Być może jedną z bardziej zaawansowanych technik inżynierii podpowiedzi jest [Self-Consistency](Self-Consistency). [Self-Consistency](Self-Consistency) ma na celu "zastąpienie naiwnego zachłannego dekodowania stosowanego w podpowiedziach typu [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting)". Pomysł polega na próbkowaniu wielu różnych ścieżek rozumowania za pomocą kilku [Few-Shot CoT](Few-Shot%20CoT) i wykorzystaniu generacji do wybrania najbardziej spójnej odpowiedzi. Pomaga to zwiększyć wydajność [CoT Promptingu](CoT%20Prompting) w zadaniach obejmujących arytmetykę i zdroworozsądkowe rozumowanie.

Wypróbujmy następujący przykład dla rozumowania arytmetycznego:

_Prompt:_

```
When I was 6 my sister was half my age. NowI’m 70 how old is my sister?
```

_Output:_

```
35
```

Wynik jest błędny! Jak możemy to poprawić za pomocą [Self-Consistency](Self-Consistency)? Wypróbujmy to.

_Prompt:_

```
Q: There are 15 trees in the grove. Grove workers will plant trees in the grove today. After they are done,there will be 21 trees. How many trees did the grove workers plant today?A: We start with 15 trees. Later we have 21 trees. The difference must be the number of trees they planted.So, they must have planted 21 - 15 = 6 trees. The answer is 6.Q: If there are 3 cars in the parking lot and 2 more cars arrive, how many cars are in the parking lot?A: There are 3 cars in the parking lot already. 2 more arrive. Now there are 3 + 2 = 5 cars. The answer is 5.Q: Leah had 32 chocolates and her sister had 42. If they ate 35, how many pieces do they have left in total?A: Leah had 32 chocolates and Leah’s sister had 42. That means there were originally 32 + 42 = 74chocolates. 35 have been eaten. So in total they still have 74 - 35 = 39 chocolates. The answer is 39.Q: Jason had 20 lollipops. He gave Denny some lollipops. Now Jason has 12 lollipops. How many lollipopsdid Jason give to Denny?A: Jason had 20 lollipops. Since he only has 12 now, he must have given the rest to Denny. The number oflollipops he has given to Denny must have been 20 - 12 = 8 lollipops. The answer is 8.Q: Shawn has five toys. For Christmas, he got two toys each from his mom and dad. How many toys doeshe have now?A: He has 5 toys. He got 2 from mom, so after that he has 5 + 2 = 7 toys. Then he got 2 more from dad, soin total he has 7 + 2 = 9 toys. The answer is 9.Q: There were nine computers in the server room. Five more computers were installed each day, frommonday to thursday. How many computers are now in the server room?A: There are 4 days from monday to thursday. 5 computers were added each day. That means in total 4 * 5 =20 computers were added. There were 9 computers in the beginning, so now there are 9 + 20 = 29 computers.The answer is 29.Q: Michael had 58 golf balls. On tuesday, he lost 23 golf balls. On wednesday, he lost 2 more. How manygolf balls did he have at the end of wednesday?A: Michael initially had 58 balls. He lost 23 on Tuesday, so after that he has 58 - 23 = 35 balls. OnWednesday he lost 2 more so now he has 35 - 2 = 33 balls. The answer is 33.Q: Olivia has $23. She bought five bagels for $3 each. How much money does she have left?A: She bought 5 bagels for $3 each. This means she spent $15. She has $8 left.Q: When I was 6 my sister was half my age. Now I’m 70 how old is my sister?A:
```

_Output 1:_

```
When I was 6 my sister was half my age, so she was 3. Now I am 70, so she is 70 - 3 = 67. The answer is 67.
```

_Output 2:_

```
When the narrator was 6, his sister was half his age, which is 3. Now that the narrator is 70, his sister would be 70 - 3 = 67 years old. The answer is 67.
```

_Output 3:_

```
When I was 6 my sister was half my age, so she was 3. Now I am 70, so she is 70/2 = 35. The answer is 35.
```

Obliczenie ostatecznej odpowiedzi obejmuje kilka kroków, ale dla uproszczenia możemy zobaczyć, że już pojawiła się odpowiedź większościowa, więc zasadniczo stałaby się ona ostateczną odpowiedzią.

