---

title: PAL (Program-Aided Language Models)  
created: 2025-07-16  
status:  
category: LLM  
difficulty: średni  
language: pl  
tags:

- PAL
- program-aided language models
- code generation
- LLM
- reasoning  
aliases:
- PAL
---
# 🎯 Definicja

**PAL (Program-Aided Language Models)** to technika rozwiązywania problemów przez duże modele językowe, w której model zamienia pytanie w języku naturalnym na fragment kodu (np. w Pythonie), komentując kolejne kroki za pomocą naturalnego języka w formie komentarzy. Zamiast przeprowadzać pełne rozumowanie w języku naturalnym (jak w Chain-of-Thought), LLM generuje program, który jest następnie wykonywany przez interpreter, a wynik działania programu stanowi odpowiedź.

# 🔑 Kluczowe punkty

- **Rozdzielenie ról:** LLM koncentruje się na interpretacji problemu i generowaniu kodu, a samo rozwiązywanie problemu (obliczenia, logika) realizuje interpreter programistyczny.
- **Wyższa dokładność logiczna:** W porównaniu do modelu, który sam generuje wyniki krok po kroku, PAL pozwala uniknąć typowych błędów rachunkowych i logicznych, które są częste w klasycznym chain-of-thought.
- **Synergia NLP i programowania:** PAL wykorzystuje NLP do zrozumienia zadanego problemu, a kod Python do precyzyjnej realizacji kroków rozwiązania.
- **Możliwość automatyzacji:** Wynikiem działania modelu jest kod gotowy do wykonania, co pozwala na szybkie wdrażanie automatycznych agentów rozwiązujących złożone, algorytmiczne zadania.
- **Wysoka skuteczność:** PAL przewyższa nawet większe modele z klasycznym CoT w zadaniach BIG-Bench Hard i GSM8K — jest obecnie stanem sztuki w reasoning code-based.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania PAL

1. **Prompt** — użytkownik podaje pytanie (np. arytmetyka, manipulacja datami), często wzbogacone o przykłady kodu rozwiązującego podobne zagadnienia.
2. **Interpretacja przez LLM** — model rozbija problem na etapy, generując kolejne linie kodu i opatrując je logicznymi komentarzami (każdy krok ma opis po polsku lub angielsku, poprzedzony "#").
3. **Wygenerowany kod** — fragment kodu (najczęściej Python) zawiera całą sekwencję rozumowania oraz końcowe wykonanie (np. poprzez `.strftime` dla dat).
4. **Wykonanie kodu** — interpreter Python wykonuje kod, zwraca wynik — to końcowa odpowiedź.

### Przykład

Dla pytania:

> Today is 27 February 2023. I was born exactly 25 years ago. What is the date I was born in MM/DD/YYYY?

PAL generuje i zwraca:

```python
# If today is 27 February 2023 and I was born exactly 25 years ago, then I was born 25 years before.
today = datetime(2023, 2, 27)
# I was born 25 years before,
born = today - relativedelta(years=25)
# The answer formatted with %m/%d/%Y is
born.strftime('%m/%d/%Y')
```

Wywołanie tego kodu w interpreterze daje odpowiedź: **02/27/1998**.

### Kluczowa różnica z Chain-of-Thought (CoT)

|Technika|Sposób rozumowania|Sposób uzyskania odpowiedzi|
|---|---|---|
|CoT|krok po kroku, tekstowo|model sam prowadzi rozumowanie i generuje odpowiedź|
|**PAL**|generacja kodu z komentarzami|model generuje kod, który następnie wykonuje interpreter|

- **PAL** minimalizuje ryzyko błędów logicznych i arytmetycznych, które często pojawiają się przy czysto tekstowym rozumowaniu (CoT).

# 💡 Przykład zastosowania

Załóżmy, że budujesz agenta w LangChain, który ma odpowiadać na niestandardowe zapytania dotyczące dat lub algorytmiki. PAL pozwala:

- Modelowi LLM zamienić pytanie w kod z logicznymi komentarzami.
- Kod wykonywany jest automatycznie, np. przez interpreter Pythona w środowisku LangChain.
- Odpowiedź stanowi wynik działania kodu — zawsze zgodny z programową logiką.

**Efekt:** Złożone zadania matematyczne, manipulacje datami, operacje na strukturach danych rozwiązywane są precyzyjnie — model nie popełnia typowych błędów LLM dzięki delegowaniu obliczeń do kodu.

# 📌 Źródła

[https://proceedings.mlr.press/v202/gao23f.html](https://proceedings.mlr.press/v202/gao23f.html)  
[https://www.coursera.org/articles/program-aided-language-models](https://www.coursera.org/articles/program-aided-language-models)  
[https://arxiv.org/pdf/2211.10435.pdf](https://arxiv.org/pdf/2211.10435.pdf)  
[https://www.promptingguide.ai/techniques/pal](https://www.promptingguide.ai/techniques/pal)  
[https://learnprompting.org/docs/agents/pal](https://learnprompting.org/docs/agents/pal)

# 👽 Brudnopis

- PAL = hybryda NLP + programowania + interpreter (ekzekucja kodu).
- Każdy etap rozumowania zapisywany jako komentarz (“docstring approach”).
- Superiority nad CoT (błąd arytmetyczny/logiczy vs. deterministyczność kodu).
- Idealny dla agentów, automatycznego rozwiązywania zadań z algorytmami.
- Wymaga środowiska do egzekucji kodu (Python najczęściej, ale nie tylko).
- LLM nie musi “znać” całego rozwiązania — przekłada problem na kod.