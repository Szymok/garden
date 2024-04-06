---
title: Base LLM
tags:
  - Sztuczna-Inteligencja
  - llm
aliases:
  - large language models
---
Przewiduje następne słowo na podstawie tekstowych danych szkoleniowych. 
Duże modele językowe, takie jak GPT-4, wykorzystują [[notes/Sieci neuronowe|sieci neuronowe]] do przetwarzania języka naturalnego. **W prostych słowach — uczą się mówić.** Co więcej, u podstaw treningu sieci do realizacji takiego zadania leży absurdalnie prosta idea **przewidywania kolejnego fragmentu wypowiedzi** poprzez nieustanne odpowiadanie na pytanie: **"Biorąc pod uwagę ten tekst, co powinno być dalej?"**.
## Zastosowania

- **Wcielanie się w różne role niczym kameleon**, co jednocześnie nadaje kontekst interakcji, dzięki któremu uwaga modelu skupia się na wybranym zagadnieniu (np. definicje występujące w różnych dziedzinach są dzięki określeniu roli asystenta postrzegane jednoznacznie).

- **Transformacje dostarczonych treści**, np. tłumaczenia, korekty, analizy i podsumowania, uwzględniające kontekst przetwarzanych dokumentów.

- **Parsowanie danych** uwzględniając zadania, które są bardzo trudne do zrealizowania programistycznie, np. za pomocą wyrażeń regularnych.

- **Odpowiadanie na pytania i generowanie treści** na podstawie danych przekazanych jako kontekst zapytania.

- **Zadania związane z programowaniem** uwzględniają tworzenie, modyfikowanie, wyjaśnianie, oraz debugowanie kodu.

- **Integracja z kodem aplikacji** i zastosowanie biznesowe czynią LLMi użytecznymi narzędziami, które pozwalają realizować zadania związane z przetwarzaniem języka naturalnego (eng. Natural Language Processing, NLP).

- **Posługiwanie się API**, w szczególności w kontekście [Function Calling](https://openai.com/blog/function-calling-and-other-api-updates), oraz wersji modeli OpenAI wyspecjalizowanych w wyborze funkcji i generowaniu do nich parametrów.

### Niedeterministyczna natura


## Ograniczenia

Wymagają ogromnych zbiorów danych podczas treningu, co może prowadzić do przetworzenia uprzedzeń zawartych w tych początkowych, treningowych zbiorach danych. Dla przykładu jeżeli model został wytrenowany na literaturze z przed kilku dekad - może nie rozpoznać aktualnego slangu. 

Modele Językowe projektowane są z myślą o tworzeniu treści na podstawie wejściowych danych oraz podążaniem za instrukcjami (zwykle) w kontekście czatu. W wyniku (prawdopodobnie) ogromnej skali danych wykorzystywanych do trenowania dużych modeli językowych, mamy do czynienia ze zjawiskiem tzw. **emergencji** związanym z [pojawianiem się zachowań nieobecnych w przypadku mniejszych modeli](https://arxiv.org/abs/2206.07682). Przykładem może być zdolność do tłumaczeń z jednego języka na inny, pomimo tego, że model nie był dokładnie do tego trenowany (ale oczywiście miał kontakt z tymi językami).
Obecność emergencji w LLMach może wyraźnie sugerować, że **wszystkie możliwości modeli, z którymi obecnie mamy do czynienia, nie są nam jeszcze znane**. Tym bardziej że mówimy tutaj o zachowaniach, które mogą zaskakiwać także twórców OpenAI. Przykładem jest fragment [GPT-4 Technical Report](https://cdn.openai.com/papers/gpt-4.pdf), omawiający **nieoczekiwany wzrost skuteczności w zadaniach "Hindsight Neglect"** związanych z odróżnianiem przewidywania od faktycznej odpowiedzi w obliczu znajomości rezultatu.

### Ograniczenie długości kontekstu

Obecne LLM-y opierają się na architekturze modelu Transformer, zaprezentowanej po raz pierwszy przez Google w 2017 roku w publikacji [Attention Is All You Need](https://arxiv.org/abs/1706.03762). Wiąże się z nią zarówno szereg możliwości, jak i ograniczeń. Jednym z nich jest limit długości treści przetwarzanej w danej chwili, obejmujący zarówno **dane wejściowe, jak i te generowane przez model**, który określa się jako tzw. "Token Window".

Z długością kontekstu wiążą się jeszcze trzy dodatkowe wyzwania, z którymi będziesz się mierzyć podczas pracy z dużymi modelami językowymi. Są to:

- **Koszty** związane z przetwarzaniem i generowaniem tokenów, które szybko rosną, nawet na stosunkowo małej skali.

- **Wydajność**, która w dużym stopniu jest uzależniona od liczby tokenów w ramach zapytania.

- **Skuteczność**, która według publikacji [Lost In The Middle](https://arxiv.org/pdf/2307.03172.pdf), spada w przypadku jednorazowego przetwarzania dłuższych treści.
### Problem [halucynacji](notes/Halucynacje)

Modele LLM mogą generować odpowiedzi, które brzmią przekonywująco, ale są po prostu błędne.

