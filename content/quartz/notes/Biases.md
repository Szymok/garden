---
title: Biases
tags: 
aliases:
---
Modele LLM mogą generować problematyczne generacje, które mogą być potencjalnie szkodliwe i wykazywać tendencyjność, która może pogorszyć wydajność modelu w dalszych zadaniach. Niektóre z nich można złagodzić za pomocą skutecznych strategii podpowiedzi, ale mogą one wymagać bardziej zaawansowanych rozwiązań, takich jak moderacja i filtrowanie.

### Dystrybucja przykładów

Czy podczas uczenia metodą kilku strzałów rozkład przykładów wpływa na wydajność modelu lub w jakiś sposób go zniekształca? Możemy tutaj przeprowadzić prosty test.

_Prompt:_

```
Q: I just got the best news ever!A: PositiveQ: We just got a raise at work!A: PositiveQ: I'm so proud of what I accomplished today.A: PositiveQ: I'm having the best day ever!A: PositiveQ: I'm really looking forward to the weekend.A: PositiveQ: I just got the best present ever!A: PositiveQ: I'm so happy right now.A: PositiveQ: I'm so blessed to have such an amazing family.A: PositiveQ: The weather outside is so gloomy.A: NegativeQ: I just got some terrible news.A: NegativeQ: That left a sour taste.A:
```

_Output:_

```
Negative
```

W powyższym przykładzie wydaje się, że rozkład przykładów nie wpływa na model. To dobrze. Wypróbujmy inny przykład z trudniejszym tekstem do sklasyfikowania i zobaczmy, jak radzi sobie model:

_Prompt:_

```
Q: The food here is delicious!A: Positive Q: I'm so tired of this coursework.A: NegativeQ: I can't believe I failed the exam.A: NegativeQ: I had a great day today!A: Positive Q: I hate this job.A: NegativeQ: The service here is terrible.A: NegativeQ: I'm so frustrated with my life.A: NegativeQ: I never get a break.A: NegativeQ: This meal tastes awful.A: NegativeQ: I can't stand my boss.A: NegativeQ: I feel something.A:
```

_Output:_

```
Negative
```

Chociaż ostatnie zdanie jest nieco subiektywne, odwróciłem rozkład i zamiast tego użyłem 8 pozytywnych przykładów i 2 negatywnych przykładów, a następnie ponownie wypróbowałem to samo zdanie. Zgadnij, jaka była odpowiedź modelu? Odpowiedział "pozytywnie". Model może mieć dużą wiedzę na temat klasyfikacji sentymentu, więc trudno będzie sprawić, by wyświetlał stronniczość dla tego problemu. Zaleca się tutaj unikanie wypaczania rozkładu i zamiast tego zapewnienie bardziej zrównoważonej liczby przykładów dla każdej etykiety. W przypadku trudniejszych zadań, o których model nie ma zbyt dużej wiedzy, prawdopodobnie będzie miał większe trudności.

### Kolejność przykładów

Czy podczas uczenia metodą kilku strzałów kolejność wpływa na wydajność modelu lub w jakiś sposób go zniekształca?

Możesz wypróbować powyższe przykłady i sprawdzić, czy możesz sprawić, że model będzie tendencyjny w kierunku etykiety, zmieniając kolejność. Zaleca się losowe uporządkowanie przykładów. Na przykład unikaj umieszczania wszystkich pozytywnych przykładów jako pierwszych, a następnie negatywnych przykładów jako ostatnich. Problem ten jest jeszcze bardziej nasilony, jeśli rozkład etykiet jest wypaczony. Zawsze upewnij się, że dużo eksperymentujesz, aby zmniejszyć ten rodzaj stronniczości.