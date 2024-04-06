---
title: Few-Shot Prompting
tags:
  - prompt
  - AI
  - Sztuczna-Inteligencja
  - prompt-techniques
aliases:
  - tworzenie-promptów
---
Podczas gdy duże modele językowe [LLM](LLM) wykazują niezwykłe możliwości w zakresie [Zero-Shot Prompting](Zero-Shot%20Prompting), nadal nie radzą sobie z bardziej złożonymi zadaniami przy użyciu ustawienia zero-shot. [Few-Shot Prompting](Few-Shot%20Prompting) moze być wykorzystywane jako technika umożliwiająca uczenie się w kontekście, w którym zapewniamy demonstracje w podpowiedzi, aby kierować modelem w celu uzyskania lepszej wydajności. Demonstracje służą jako warunki dla kolejnych przykładów, w których chcielibyśmy, aby model wygenerował odpowiedź.

Według Touvron właściwości few-shot pojawiły się po raz pierwszy, gdy modele zostały przeskalowane do wystarczającego rozmiaru.

Zademonstrujmy [Few-Shot Prompting](Few-Shot%20Prompting) na przykładzie, w ktorym zadaniem jest poprawne użycie nowego słowa w zdaniu.

_Prompt:_

```
A "whatpu" is a small, furry animal native to Tanzania. An example of a sentence that usesthe word whatpu is:We were traveling in Africa and we saw these very cute whatpus.To do a "farduddle" means to jump up and down really fast. An example of a sentence that usesthe word farduddle is:
```

_Output:_

```
When we won the game, we all started to farduddle in celebration.
```

Możemy zaobserwować, że model w jakiś sposób nauczył się wykonywać zadanie, dostarczając mu tylko jeden przykład (tj. 1-shot). W przypadku trudniejszych zadań możemy eksperymentować ze zwiększaniem liczby demonstracji (np. 3-shots, 5-shots, 10-shots itd.).

Zgodnie z ustaleniami Min, oto kilka dodatkowych wskazówek dotyczących demonstracji/przykładów podczas wykonywania [Few-Shot Promptingu](Few-Shot%20Prompting):

- "przestrzeń etykiet i dystrybucja tekstu wejściowego określonego przez demonstracje są ważne (niezależnie od tego, czy etykiety są poprawne dla poszczególnych danych wejściowych)".
- używany format również odgrywa kluczową rolę w wydajności, nawet jeśli używasz tylko losowych etykiet, jest to znacznie lepsze niż brak etykiet w ogóle.
- Dodatkowe wyniki pokazują, że wybór losowych etykiet z prawdziwego rozkładu etykiet (zamiast rozkładu jednostajnego) również pomaga.

Wypróbujmy kilka przykładów. Najpierw wypróbujmy przykład z losowymi etykietami (co oznacza, że etykiety Negative i Positive są losowo przypisywane do wejść):

_Prompt:_

```
This is awesome! // Negative
This is bad! // Positive
Wow that movie was rad! // Positive
What a horrible show! //
```

_Output:_

```
Negative
```

Nadal otrzymujemy poprawną odpowiedź, mimo że etykiety zostały losowo zmienione. Zwróć uwagę, że zachowaliśmy również format, co również pomaga. W rzeczywistości, wraz z dalszymi eksperymentami, wydaje się, że nowsze modele GPT, z którymi eksperymentujemy, stają się coraz bardziej odporne nawet na losowe formaty. Przykład:

_Prompt:_

```
Positive This is awesome!
This is bad! Negative
Wow that movie was rad!Positive
What a horrible show! --
```

_Output:_

```
Negative
```

Powyższy format nie jest spójny, ale model nadal przewidywał prawidłową etykietę. Musimy przeprowadzić dokładniejszą analizę, aby potwierdzić, czy dotyczy to różnych i bardziej złożonych zadań, w tym różnych wariantów podpowiedzi.

## Ograniczenia [Few-shot Prompting](Few-shot%20Prompting)

Standardowe kilkuzdaniowe podpowiedzi sprawdzają się dobrze w wielu zadaniach, ale nadal nie są doskonałą techniką, szczególnie w przypadku bardziej złożonych zadań rozumowania. Zademonstrujmy, dlaczego tak jest. Pamiętasz poprzedni przykład, w którym przedstawiliśmy następujące zadanie:

```
The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A: 
```
Jeśli spróbujemy ponownie, model wyświetli następujące wyniki:

```
Yes, the odd numbers in this group add up to 107, which is an even number.
```

Nie jest to prawidłowa odpowiedź, która nie tylko podkreśla ograniczenia tych systemów, ale także potrzebę bardziej zaawansowanej inżynierii promptów.

Spróbujmy dodać kilka przykładów, aby zobaczyć, czy [Few-Shot Prompting](Few-Shot%20Prompting) poprawia wyniki.

_Prompt:_

```
The odd numbers in this group add up to an even number: 4, 8, 9, 15, 12, 2, 1.A: The answer is False.The odd numbers in this group add up to an even number: 17,  10, 19, 4, 8, 12, 24.A: The answer is True.The odd numbers in this group add up to an even number: 16,  11, 14, 4, 8, 13, 24.A: The answer is True.The odd numbers in this group add up to an even number: 17,  9, 10, 12, 13, 4, 2.A: The answer is False.The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A: 
```

_Output:_

```
The answer is True.
```

To nie zadziałało. Wygląda na to, że [Few-Shot Prompting](Few-Shot%20Prompting) nie wystarczą, by uzyskać wiarygodne odpowiedzi w tego typu zadaniach. Powyższy przykład zawiera podstawowe informacje na temat zadania. Jeśli przyjrzeć się bliżej, typ zadania, który wprowadziliśmy, obejmuje kilka dodatkowych kroków rozumowania. Innymi słowy, pomocne może być podzielenie problemu na etapy i zademonstrowanie tego modelowi. W ostatnim czasie podpowiedzi typu [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting) zostały spopularyzowane w celu rozwiązywania bardziej złożonych zadań arytmetycznych, zdroworozsądkowych i symbolicznych.

Ogólnie rzecz biorąc, wydaje się, że dostarczanie przykładów jest przydatne w rozwiązywaniu niektórych zadań. Gdy typu [Few-Shot Prompting](Few-Shot%20Prompting) i [Zero-Shot Prompting](Zero-Shot%20Prompting) nie są wystarczające, może to oznaczać, że to, czego nauczył się model, nie wystarczy, by dobrze poradzić sobie z zadaniem. Od tego momentu zaleca się rozpoczęcie myślenia o dopracowaniu modeli lub eksperymentowaniu z bardziej zaawansowanymi [Prompting Techniques](Prompting%20Techniques). Następnie omówimy jedną z popularnych technik prompting, zwaną [Chain-of-Thought Prompting](Chain-of-Thought%20Prompting), która zyskała dużą popularność.

