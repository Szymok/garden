---
title: Tree of Thoughts (ToT)
tags:
  - prompt
  - AI
  - prompt-techniques
aliases:
  - ToT
---
W przypadku złożonych zadań, które wymagają eksploracji lub strategicznego wybiegania w przyszłość, tradycyjne lub proste techniki podpowiadania są niewystarczające. Yao et el. i Long zaproponowali niedawno [Tree of Thoughts (ToT)](Tree%20of%20Thoughts%20(ToT)), strukturę, która uogólnia [chain-of-thought](chain-of-thought%20Prompting) i zachęca do eksploracji myśli, które służą jako kroki pośrednie do ogólnego rozwiązywania problemów za pomocą modeli językowych.

ToT utrzymuje Tree of Thoughts, gdzie myśli reprezentują spójne sekwencje językowe, które służą jako pośrednie kroki w kierunku rozwiązania problemu. Podejście to umożliwia LM samoocenę postępu, jaki myśli pośrednie czynią w kierunku rozwiązania problemu poprzez celowy proces rozumowania. Zdolność LM do generowania i oceniania myśli jest następnie łączona z algorytmami wyszukiwania (np. [breadth-first search](breadth-first%20search)), aby umożliwić systematyczną eksplorację myśli z wyprzedzeniem i cofaniem.

Struktura ToT została zilustrowana poniżej:

![[images/Pasted image 20230922001632.png]]
[Yao et el. (2023) (opens in a new tab)](https://arxiv.org/abs/2305.10601)
Podczas korzystania z ToT różne zadania wymagają zdefiniowania liczby kandydatów i liczby myśli/kroków. Na przykład, jak pokazano w artykule, Game of 24 jest używana jako zadanie rozumowania matematycznego, które wymaga rozłożenia myśli na 3 kroki, z których każdy obejmuje równanie pośrednie. Na każdym etapie przechowywanych jest b=5 najlepszych kandydatów.

Aby wykonać BFS w ToT dla zadania Game of 24, LM jest proszony o ocenę każdego kandydata na myśl jako "pewny/możliwy/niemożliwy" w odniesieniu do osiągnięcia 24. Jak stwierdzili autorzy, "celem jest promowanie poprawnych rozwiązań częściowych, które można zweryfikować w ciągu kilku prób lookahead, i wyeliminowanie niemożliwych rozwiązań częściowych opartych na zdrowym rozsądku "zbyt duży/mały", a resztę "być może" zostawic. Wartości są próbkowane 3 razy dla każdej myśli. Proces ten zilustrowano poniżej:

![[images/Pasted image 20230922001646.png]]

Z wyników przedstawionych na poniższym rysunku wynika, że ToT znacznie przewyższa inne metody podpowiadania:

![[images/Pasted image 20230922001702.png]]

Na wysokim poziomie, główne idee Yao et el. i Long są podobne. Oba zwiększają zdolność LLM do rozwiązywania złożonych problemów poprzez przeszukiwanie drzewa za pomocą wielorundowej konwersacji. Jedną z głównych różnic jest to, że Yao et el. wykorzystuje wyszukiwanie [DFS](DFS)/[BFS](BFS)/[beam](beam) , podczas gdy strategia przeszukiwania drzewa (tj. kiedy cofać się i o ile poziomów itd.) zaproponowana w Longa jest sterowana przez "[kontroler ToT](kontroler%20ToT)" wyszkolony poprzez [uczenie ze wzmocnieniem](Reinforcement%20learning). DFS/BFS/Beam search to ogólne strategie wyszukiwania rozwiązań bez adaptacji do konkretnych problemów. Dla porównania, kontroler ToT wyszkolony za pomocą RL może być w stanie uczyć się z nowych zestawów danych lub poprzez samodzielną grę (AlphaGo vs. wyszukiwanie siłowe), a zatem system ToT oparty na RL może nadal ewoluować i uczyć się nowej wiedzy nawet przy stałym LLM.

Hulbert zaproponował [Tree-of-Thought Prompting](Tree-of-Thought%20Prompting), który stosuje główną koncepcję z ram ToT jako prostą technikę podpowiadania, zmuszając [LLM](LLM) do oceny pośrednich myśli w pojedynczym podpowiedzi. Przykładowy prompt ToT to:

```
Imagine three different experts are answering this question.
All experts will write down 1 step of their thinking,then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
The question is...
```