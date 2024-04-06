---
title: Factuality
tags: 
aliases:
---
LLM mają tendencję do generowania odpowiedzi, które brzmią spójnie i przekonująco, ale czasami mogą być zmyślone. Poprawa podpowiedzi może pomóc ulepszyć model w celu generowania dokładniejszych/faktycznych odpowiedzi i zmniejszyć prawdopodobieństwo generowania niespójnych i zmyślonych odpowiedzi.

Niektóre rozwiązania mogą obejmować:

- zapewnienie podstawowej prawdy (np. powiązanego akapitu artykułu lub wpisu w Wikipedii) jako części kontekstu, aby zmniejszyć prawdopodobieństwo, że model wygeneruje zmyślony tekst.
- skonfigurowanie modelu tak, aby generował mniej zróżnicowane odpowiedzi poprzez zmniejszenie parametrów prawdopodobieństwa i poinstruowanie go, aby przyznał się (np. "Nie wiem"), gdy nie zna odpowiedzi.
- podać w podpowiedzi kombinację przykładów pytań i odpowiedzi, o których model może wiedzieć i nie wiedzieć

Spójrzmy na prosty przykład:

_Prompt:_

```
Q: What is an atom? A: An atom is a tiny particle that makes up everything. Q: Who is Alvan Muntz? A: ? Q: What is Kozar-09? A: ? Q: How many moons does Mars have? A: Two, Phobos and Deimos. Q: Who is Neto Beto Roberto? 
```

_Output:_

```
A: ?
```

Wymyśliłem nazwę "Neto Beto Roberto", więc model jest poprawny w tym przypadku. Spróbuj nieco zmienić pytanie i sprawdź, czy to zadziała. Istnieją różne sposoby na ulepszenie tego zadania w oparciu o wszystko, czego nauczyłeś się do tej pory.