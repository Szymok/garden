---
title: Chain-of-Thought Prompting
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
aliases:
  - CoT
---
![[images/Pasted image 20230922002358.png]]

Podpowiedzi typu chain-of-thought (CoT) umożliwiają złożone rozumowanie poprzez pośrednie etapy rozumowania. Można je połączyć z [Few-Shot Prompting](Few-Shot%20Prompting), aby uzyskać lepsze wyniki w bardziej złożonych zadaniach, które wymagają rozumowania przed udzieleniem odpowiedzi.

_Prompt:_

```
The odd numbers in this group add up to an even number: 4, 8, 9, 15, 12, 2, 1.A: Adding all the odd numbers (9, 15, 1) gives 25. The answer is False.The odd numbers in this group add up to an even number: 17,  10, 19, 4, 8, 12, 24.A: Adding all the odd numbers (17, 19) gives 36. The answer is True.The odd numbers in this group add up to an even number: 16,  11, 14, 4, 8, 13, 24.A: Adding all the odd numbers (11, 13) gives 24. The answer is True.The odd numbers in this group add up to an even number: 17,  9, 10, 12, 13, 4, 2.A: Adding all the odd numbers (17, 9, 13) gives 39. The answer is False.The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A:
```

_Output:_

```
Adding all the odd numbers (15, 5, 13, 7, 1) gives 41. The answer is False.
```

Wow! Widzimy doskonały wynik, gdy podaliśmy krok rozumowania. W rzeczywistości możemy rozwiązać to zadanie, podając jeszcze mniej przykładów, tj. wystarczy jeden przykład:

_Prompt:_

```
The odd numbers in this group add up to an even number: 4, 8, 9, 15, 12, 2, 1.A: Adding all the odd numbers (9, 15, 1) gives 25. The answer is False.The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A:
```

_Output:_

```
Adding all the odd numbers (15, 5, 13, 7, 1) gives 41. The answer is False.
```

Należy pamiętać, że autorzy twierdzą, że jest to zdolność emergentna, która pojawia się przy wystarczająco dużych modelach językowych [LLM](LLM).

## [Zero-shot COT Prompting](Zero-shot%20COT%20Prompting)

![[images/Pasted image 20230922002447.png]]

Jednym z najnowszych pomysłów, który pojawił się niedawno, jest idea [zero-shot CoT](Zero-Shot%20CoT), która zasadniczo polega na dodaniu "Pomyślmy krok po kroku" do oryginalnego prompta. Wypróbujmy prosty problem i zobaczmy, jak działa model:

_Prompt:_

```
I went to the market and bought 10 apples. I gave 2 apples to the neighbor and 2 to the repairman. I then went and bought 5 more apples and ate 1. How many apples did I remain with?
```

_Output:_

```
11 apples
```

Odpowiedź jest nieprawidłowa! Spróbujmy teraz ze specjalnym promptem.

_Prompt:_

```
I went to the market and bought 10 apples. I gave 2 apples to the neighbor and 2 to the repairman. I then went and bought 5 more apples and ate 1. How many apples did I remain with?Let's think step by step.
```

_Output:_

```
First, you started with 10 apples.You gave away 2 apples to the neighbor and 2 to the repairman, so you had 6 apples left.Then you bought 5 more apples, so now you had 11 apples.Finally, you ate 1 apple, so you would remain with 10 apples.
```

To imponujące, że ten prosty prompt jest skuteczny w tym zadaniu. Jest to szczególnie przydatne, gdy nie masz zbyt wielu przykładów do wykorzystania w prompcie.

## [Automatic Chain-of-Thought (Auto-CoT)](Automatic%20Chain-of-Thought%20(Auto-CoT))

Podczas stosowania [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting) z demonstracjami, proces obejmuje ręczne tworzenie skutecznych i różnorodnych przykładów. Ten ręczny wysiłek może prowadzić do nieoptymalnych rozwiązań. Proponowane podejście mające na celu wyeliminowanie ręcznego wysiłku poprzez wykorzystanie LLM z podpowiedzią "Pomyślmy krok po kroku" do generowania łańcuchów rozumowania dla demonstracji jeden po drugim. Ten automatyczny proces może jednak prowadzić do błędów w generowanych łańcuchach. Aby złagodzić skutki błędów, ważna jest różnorodność demonstracji. W tej pracy zaproponowano [Auto-CoT](Auto-CoT), który próbuje pytania z różnorodnością i generuje łańcuchy rozumowania w celu skonstruowania demonstracji.

[Auto-CoT(Auto-CoT)] składa się z dwóch głównych etapów:

- Etap 1): **grupowanie pytań**: podział pytań z danego zbioru danych na kilka klastrów.
- Etap 2): **próbkowanie demonstracji**: wybór reprezentatywnego pytania z każdego klastra i wygenerowanie jego łańcucha rozumowania przy użyciu [Zero-Shot-CoT](Zero-Shot-CoT) z prostą heurystyką

Prostą heurystyką może być długość pytania (np. 60 tokenów) i liczba kroków w uzasadnieniu (np. 5 kroków rozumowania). Zachęca to model do korzystania z prostych i dokładnych demonstracji.

Proces został zilustrowany poniżej:

![[images/Pasted image 20230922002546.png]]