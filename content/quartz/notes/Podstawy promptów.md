---
title: Podstawy promptów
tags:
  - prompt
  - basic
aliases:
  - wiadomość
---
Za pomocą prostych promptów można wiele osiągnąć, ale jakość wyników zależy od tego, ile informacji zostanie przekazanych i jak dobrze zostaną one opracowane. Prompt może zawierać informacje, takie jak instrukcja lub pytanie, które przekazujesz modelowi i zawierać inne szczegóły, takie jak kontekst, dane wejściowe lub przykłady. Możesz użyć tych elementów, aby lepiej poinstruować model i w rezultacie uzyskać lepsze wyniki.

Zacznijmy od omówienia podstawowego przykładu prostego promptu:

_Prompt_

```
The sky is
```

_Output:_

```
blueThe sky is blue on a clear day. On a cloudy day, the sky may be gray or white.
```

Jak widać, model językowy generuje kontynuację ciągów, które mają sens w kontekście "The sky is". Wynik może być nieoczekiwany lub daleki od zadania, które chcesz wykonać.

Ten podstawowy przykład podkreśla również konieczność zapewnienia szerszego kontekstu lub instrukcji dotyczących tego, co konkretnie chcesz osiągnąć.

Spróbujmy to trochę poprawić:

_Prompt:_

```
Complete the sentence: The sky is
```

_Output:_

```
so  beautiful today.
```

Czy nie lepiej? Cóż, kazałeś modelowi dokończyć zdanie, więc wynik wygląda o wiele lepiej, ponieważ podąża dokładnie za tym, co kazałeś mu zrobić ("dokończ zdanie"). Takie podejście polegające na projektowaniu optymalnych promptów w celu poinstruowania modelu do wykonania zadania jest określane mianem [inżynierii promptów](Prompt%20Engineering%20Guide).

Powyższy przykład jest podstawową ilustracją tego, co jest możliwe w dzisiejszych modelach [LLM](LLM). Dzisiejsze modele [LLM](LLM) są w stanie wykonywać wszelkiego rodzaju zaawansowane zadania, od podsumowywania tekstu, przez rozumowanie matematyczne, po generowanie kodu.

## Formatowanie promtów

Powyżej wypróbowałeś bardzo prosty prompt. Standardowa zachęta ma następujący format:

```
<Question>?
```

or

```
<Instruction>
```

Można to sformatować w formacie odpowiedzi na pytanie (QA), który jest standardem w wielu zbiorach danych QA, w następujący sposób:

```
Q: <Question>?
A:
```

Gdy prompting odbywa się w powyższy sposób, jest to również określane jako [Zero-Shot Prompting](Zero-Shot%20Prompting), tj. bezpośrednio podsuwasz modelowi odpowiedź bez żadnych przykładów lub demonstracji dotyczących zadania, które chcesz wykonać. Niektóre duże modele językowe [LLM](LLM) mają zdolność do wykonywania [Zero-Shot Prompting](Zero-Shot%20Prompting), ale zależy to od złożoności i wiedzy na temat danego zadania.

Biorąc pod uwagę powyższy standardowy format, jedną z popularnych i skutecznych technik promptingu jest [Few-Shot Prompting](Few-Shot%20Prompting), w którym dostarczasz przykłady (tj. demonstracje). Możesz sformatować kilka podpowiedzi w następujący sposób:

```
<Question>?
<Answer>
<Question>?
<Answer>
<Question>?
<Answer>
<Question>?
```

Wersja w formacie QA wyglądałaby następująco:

```
Q: <Question>?
A: <Answer>
Q: <Question>?
A: <Answer>
Q: <Question>?
A: <Answer>
Q: <Question>?
A:
```

Należy pamiętać, że korzystanie z formatu QA nie jest wymagane. Format podpowiedzi zależy od wykonywanego zadania. Na przykład możesz wykonać proste zadanie klasyfikacji i podać przykłady, które demonstrują zadanie w następujący sposób:

_Prompt:_

```
This is awesome! // Positive
This is bad! // Negative
Wow that movie was rad! // Positive
What a horrible show! //
```

_Output:_

```
Negative
```

Kilka podpowiedzi umożliwia uczenie się w kontekście, czyli zdolność modeli językowych do uczenia się zadań na podstawie kilku demonstracji.

