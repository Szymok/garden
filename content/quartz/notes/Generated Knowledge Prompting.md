---
title: Generated Knowledge Prompting
created: 2025-07-16
status: 
category: LLM
difficulty: średni
language: pl
tags:
  - prompt
  - GKP
aliases:
---

# 🎯 Definicja

**Generated Knowledge Prompting (GKP)** to zaawansowana technika podpowiadania, w której model językowy (LLM) najpierw generuje pomocne, kontekstowe informacje (wiedzę), a dopiero potem wykorzystuje je jako część promptu do sformułowania właściwej odpowiedzi na zadanie. Celem GKP jest wzbogacenie procesu rozumowania modelu przez jawne tworzenie i integrację "wiedzy" – faktów, definicji, przykładów lub uwarunkowań istotnych dla danego pytania lub problemu.

# 🔑 Kluczowe punkty

- **Dwuetapowe podejście:** Najpierw LLM generuje wiedzę związaną z problemem, następnie wykorzystuje ją do wygenerowania odpowiedzi.
- **Wzrost trafności i głębi odpowiedzi:** W zadaniach wymagających rozumowania ogólnego (commonsense reasoning) GKP istotnie podnosi jakość odpowiedzi, zwiększając skuteczność z ok. 64% do ponad 70% w testach takich jak CommonsenseQA.
- **Możliwość stosowania w formacie single- lub dual-prompt:** Wiedza i odpowiedź mogą być generowane razem (single prompt) albo w dwóch krokach (dual prompt).
- **Ujawnianie i korygowanie ograniczeń modelu:** GKP pozwala modelowi skorygować błędne intuicje lub domyślne halucynacje, przez eksplicytne odniesienia do wiedzy dziedzinowej.
- **Technika skalowalna i uniwersalna:** Wprowadza automatyzację tworzenia "wskazówek" i pozwala objąć szerszy zakres tematyczny bez ręcznego programowania promptów.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania

1. **Generowanie wiedzy**
    
    - Model proszony jest o zbudowanie kilku faktów, definicji, zasad lub przykładów na temat danego zagadnienia, pytania czy problemu (np. "Podaj kilka faktów o golfie" albo "Wygeneruj definicję 'ekosystemu'").
    - W zadaniach typu commonsense reasoning – model generuje tło wiedzy, której mu brakuje do prawidłowego rozwiązania, co pomaga uniknąć typowych halucynacji.
2. **Integracja wiedzy z promptem**
    
    - Wygenerowana wiedza stanowi jawny kontekst – jest dołączana do głównego promptu lub pytania ("Knowledge: ...").
    - Model przechodzi do rozwiązania zadania i podaje odpowiedź, korzystając wykładniczo zwiększonej ilości eksplicytnej informacji.

**Przykład – zadanie logiczne (QA):**

Prompt:

```
Part of golf is trying to get a higher point total than others. Yes or No?
```

Model (bez wiedzy):  
`Yes.` (błąd)

GKP:  
Najpierw generuje wiedzę:

```
Knowledge: Celem golfa jest ukończenie pola w możliwie najmniejszej liczbie uderzeń. Wyższy wynik oznacza więcej uderzeń, co jest mniej korzystne.
```

Łączy z pytaniem:

```
Question: Part of golf is trying to get a higher point total than others. Yes or No?
Knowledge: ...
Explain and Answer:
```

Odpowiedź:

```
Nie, w golfie chodzi o możliwie najniższy wynik. Zwycięża gracz z najmniejszą liczbą punktów (uderzeń), a nie największą.
```

## Format: single-prompt vs. dual-prompt

- **Single prompt:** Model generuje zarówno wiedzę, jak i końcową odpowiedź w jednej interakcji.
- **Dual prompt:** Najpierw model generuje wiedzę, a w kolejnym kroku zarówno model, jak i użytkownik używają tej wiedzy jako kontekstu do udzielenia odpowiedzi.

## Korzyści i ograniczenia

|Zalety|Ograniczenia|
|---|---|
|Wzrost trafności|Jakość automatycznie wygenerowanej wiedzy może być nierówna|
|Skalowalność|Zależność od jakości bazowej wiedzy w modelu|
|Różnorodność podejść|Ryzyko powielania biasów zakorzenionych w modelu|
|Możliwość audytu (jawność wiedzy)|Potrzeba walidacji generowanych faktów|

# 💡 Przykład zastosowania

**Use case: Rozszerzanie promptów w AI do quizów naukowych**  
Model najpierw generuje fakty (np. o dinozaurach), a potem odpowiada na dokładne pytanie – podnosząc czytelność, wiarygodność i trafność odpowiedzi w zadaniach edukacyjnych.

**Use case: Tworzenie bloga lub raportu na bazie wiedzy** Prompt:

```
Wygeneruj 4 fakty o wilkach, a następnie użyj ich do opracowania krótkiego akapitu o wilkach w ekosystemie.
```

Output:

```
1. Wilki są drapieżnikami szczytowymi...
2. Żyją w stadach...
3. ... itd.

Akapit: Wilki odgrywają kluczową rolę...
```

# 📌 Źródła

- [https://resources.codefriends.net/en/ai/fundamentals/in-action/chapter-2/generated-knowledge-prompting](https://resources.codefriends.net/en/ai/fundamentals/in-action/chapter-2/generated-knowledge-prompting)
- [https://www.promptingguide.ai/techniques/knowledge](https://www.promptingguide.ai/techniques/knowledge)
- [https://www.codefriends.net/courses/ai-prompt-engineering-basics/chapter-2/generated-knowledge](https://www.codefriends.net/courses/ai-prompt-engineering-basics/chapter-2/generated-knowledge)
- [https://aclanthology.org/2022.acl-long.225.pdf](https://aclanthology.org/2022.acl-long.225.pdf)
- [https://www.codefriends.net/courses/ai-fundamentals-in-action/chapter-2/generated-knowledge-prompting](https://www.codefriends.net/courses/ai-fundamentals-in-action/chapter-2/generated-knowledge-prompting)
- [https://fr.linkedin.com/pulse/generate-knowledge-prompting-une-nouvelle-approche-du-gr%C3%A9gory-jeandot-0xsuf](https://fr.linkedin.com/pulse/generate-knowledge-prompting-une-nouvelle-approche-du-gr%C3%A9gory-jeandot-0xsuf)
- [https://promptengineering.org/knowledge-generation-prompting/](https://promptengineering.org/knowledge-generation-prompting/)

# 👽 Brudnopis

- GKP = najpierw generuj wiedzę, potem twórz odpowiedź – explicit knowledge injection
- Mechanizm: dwuetapowy prompt (fakty + zadanie) / single-prompt (oba naraz)
- Wpływ: znacząco wyższa trafność na zadaniach logiczno-faktograficznych (np. CommonsenseQA, ScienceQA)
- Jakość zależna od zdolności LLM do generowania relewantnych faktów
- Kaskadowe wykorzystanie wiedzy = lepsza interpretowalność, łatwiejszy audyt, wyciągnięcie efektów "na wierzch"
- Ograniczenie: ryzyko halucynacji błędnych "faktów"; nie zawsze powstają wartościowe uzupełnienia