---

title: Prompting Techniques  
created: 2025-07-16  
status: Final  
category: Prompt Engineering  
difficulty: średniozaawansowany  
language: pl  
tags:

- prompt
- techniki promptowania
- prompt engineering
- llm  
aliases:
- tworzenie-promptów
- techniki tworzenia podpowiedzi
- strategie promptowe

---

# 🎯 Definicja

**Prompting Techniques** (Techniki tworzenia promptów) to zbiory strategii i wzorców stosowanych do skutecznego komunikowania się z dużymi modelami językowymi ([[Base LLM|LLM]], np. [[GPT-4]], Claude, Mistral, Llama) w celu uzyskania dokładnych, spójnych i przydatnych odpowiedzi. Właściwie zaprojektowany prompt definiuje nie tylko intencję, ale także kontekst, styl i format działania modelu.

# 🔑 Kluczowe koncepcje

- Odpowiednie zaprojektowanie promtu prowadzi do lepszego i bardziej użytecznego działania [[Base LLM|LLM]].
- [[Prompt techniques|Techniki promptowania]] pozwalają:
    - poprawić trafność odpowiedzi,
    - zwiększyć kreatywność lub kontrolę,
    - rozbić złożone zadania na kroki,
    - wymusić określoną strukturę wyjściową.
- W zależności od przypadku użycia — inne techniki będą skuteczniejsze.

# 🧠 [[Prompt techniques|Techniki promptowania]]

|Technika|Opis|
|---|---|
|**[[Zero-shot prompting]]**|Model otrzymuje tylko instrukcję — bez przykładów|
|**[[Few-shot prompting]]**|Dodanie kilku przykładów, by „nauczyć” model struktury i kontekstu|
|**Chain-of-Thought ([[Chain-of-Thought Prompting\|CoT]])**|Model generuje odpowiedź krok po kroku jako proces rozumowania|
|**Reframing promptów**|Zmiana perspektywy pytania (np. jako ekspert, nauczyciel)|
|**[[Roles\|Role]] prompting**|Wyznaczenie roli modelu ("Zachowuj się jak psycholog...")|
|**Instruction + context**|Jasna komenda oraz dołączony materiał/kontekst do analizy|
|**Refleksja / self-correction**|Proszenie modelu o analizę lub poprawienie własnej odpowiedzi|
|**Multi-turn (chained prompts)**|Podzielone zadanie na wiele kroków i iteracyjna analiza|

# 📚 Przykłady zastosowania

## 1. [[Zero-shot Prompting]]

„Przeanalizuj sentyment zdania: »To jest najlepsze, co mnie dzisiaj spotkało!«”

→ ✅ model rozpozna pozytywny sentyment mimo braku przykładów.

## 2. [[Few-shot Prompting]]

```text
Tekst: "Nie podobał mi się ten produkt."  
Etykieta: Negatywny  
Tekst: "Uwielbiam ten sklep!"  
Etykieta: Pozytywny  
Tekst: "Było w porządku."  
Etykieta:
```

→ model uczy się formatu i stylu klasyfikacji.

## 3. Chain-of-Thought

```text
Pytanie: Anna ma 3 jabłka, kupiła jeszcze 2. Każde kosztowało 1 zł. Ile wydała?  
Odpowiedź: Po pierwsze, Anna miała 3 jabłka. Kupiła jeszcze 2, więc ma łącznie 5. Kupiła 2 → wydała 2 zł.
```

## 4. [[Roles|Role]] Prompt

„Jesteś ekspertem ds. bezpieczeństwa IT. Przeanalizuj poniższy atak i doradź jak się bronić.”

## 5. Prompt chaining

- Prompt 1: „Znajdź 3 problemy w tym tekście.”
- Prompt 2: „Dla każdego problemu zaproponuj poprawkę.”
- Prompt 3: „Zredaguj cały tekst z uwzględnieniem poprawionych fragmentów.”

# 💡 Dobre praktyki

|Praktyka|Rekomendacja|
|---|---|
|Zwięzłość i jednoznaczność|Jasno określ żądane działanie i wynik|
|Wyraźne formatowanie|Stosuj delimitery typu `###`, `JSON`, `Markdown`, by ułatwić rozbiór|
|Testowanie różnych wersji|Sprawdzaj warianty promptu — zmiany pojedynczych słów mają znaczenie|
|Iteracyjne ulepszanie|Tweakuj, analizuj i poprawiaj prompt po analizie wyników|

# ✅ Podsumowanie

- Prompty są jak programy — ich składnia i struktura wpływają na wynik.
- Z pomocą technik promptowania zwiększasz kontrolę i precyzję wyników z [[Base LLM|LLM]].
- Najlepsze zastosowania obejmują NLP, analitykę, interfejsy dialogowe, kodowanie i wiele innych.

# 📌 Źródła

- [https://www.promptingguide.ai](https://www.promptingguide.ai)
- [https://github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)
- [https://openai.com/docs/guides/gpt](https://openai.com/docs/guides/gpt)
- [https://huggingface.co/blog/prompt-templates](https://huggingface.co/blog/prompt-templates)
- [https://towardsdatascience.com/few-shot-prompting-explained-5e70b625223e](https://towardsdatascience.com/few-shot-prompting-explained-5e70b625223e)

## 👽 Brudnopis

- prompt engineering = UX dla [[Base LLM|LLM]]
- prompt chaining = pipeline logiczny → toolformer style
- tricki: quote, canonical form, instrukcja + dane wejściowe
- [[Chain-of-Thought Prompting|CoT]] = must przy reasoning, code, math
- Warto dodać: scoring promptów, feedback loop

---