---

title: Few-Shot Prompting  
created: 2025-07-16  
status:  
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- prompt-techniques  
aliases:
- tworzenie-promptów

---

# 🎯 Definicja

**Few-Shot Prompting** to technika podpowiadania, w której dostarczamy dużemu modelowi językowemu (LLM) kilka demonstracyjnych przykładów zadania w samym promptcie. Te demonstracje pełnią rolę wzorców, na podstawie których model generuje odpowiedzi na nowe, nieznane przypadki – bez potrzeby dodatkowego uczenia.

# 🔑 Kluczowe punkty

- Model uczy się „w kontekście” – wystarczy od 1 do kilku przykładów (tzw. 1-shot, 3-shot, 5-shot... prompting).
- Format i spójność demonstracji istotnie wpływają na skuteczność – nawet losowe etykiety przy zachowaniu formatu pomagają modelowi zorientować się w zadaniu.
- Few-shot pozwala na dynamiczną specjalizację modelu bez potrzeby kosztownego fine-tuningu.
- Wydajność few-shot rośnie wraz ze skalą modelu – technika stała się efektywna dzięki dużym LLM.
- Ma ograniczenia w zadaniach wymagających wieloetapowego rozumowania lub skomplikowanej logiki.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Few-Shot Prompting?

Model LLM otrzymuje prompt zawierający kilka demonstracji wejście–wyjście (input–output):

```
A "whatpu" is a small, furry animal native to Tanzania.
An example of a sentence that uses the word whatpu is:
We were traveling in Africa and we saw these very cute whatpus.

To do a "farduddle" means to jump up and down really fast.
An example of a sentence that uses the word farduddle is:
```

Model domyśla się, że powinien wstawić w odpowiedzi zdanie z poprawnym użyciem „farduddle”.

## Wskazówki i dobre praktyki

- **Wybierz przykłady pokrywające różne przypadki etykiet** – lepsze pokrycie dystrybucji wejść i etykiet przekłada się na skuteczność.
- **Zachowaj spójny format wejść i wyjść** – nawet jeśli etykiety są losowe!
- **Nowsze modele są bardziej odporne na niespójności i losowe oznaczenia** – choć klasyczne podejście (jeden format) jest wciąż najbezpieczniejsze.
- **Zwiększ liczbę „shots” dla trudniejszych zadań** – im trudniejsze zadanie, tym więcej przykładów może być potrzebnych (ale za dużo może zapchać kontekst modelu).

**Przykład z losową etykietą – nadal działa:**

```
This is awesome! // Negative
This is bad! // Positive
Wow that movie was rad! // Positive
What a horrible show! //
```

Model przewiduje: `Negative`

## Ograniczenia Few-Shot Prompting

- **Nie radzi sobie z wieloetapowym rozumowaniem** – model może popełnić błędy logiczne nawet przy licznych przykładach.
- **Format i jakość demonstracji kluczowa** – niespójność formatu lub chaotyczne przykłady mogą pogorszyć wyniki.
- **W zadaniach wymagających wyjaśnienia procesu (reasoning)** lepsze efekty daje Chain-of-Thought Prompting (CoT).

**Przykład ograniczeń:**

```
The odd numbers in this group add up to an even number: 15, 32, 5, 13, 82, 7, 1. A: 
```

Model poprawia odpowiedź dopiero po dołączeniu serii przykładów, a i tak nie zawsze skutecznie – konieczne rozbicie na etapy (CoT).

|Technika|Plusy|Minusy|
|---|---|---|
|Few-Shot Prompting|Prostota, brak fine-tune, szybkie wdrożenie|Słabiej działa przy złożonych zadaniach|
|Chain-of-Thought Prompting|Lepsze reasoning, wieloetapowe zadania|Większy prompt, wyższy koszt obliczeniowy|

# 💡 Przykład zastosowania

**Analityk chce sklasyfikować sentyment zdań:**

Prompt:

```
This is amazing! // Positive
I did not enjoy that. // Negative
Absolutely loving it! // Positive
Such a disappointing experience. //
```

Model generuje: `Negative`

**W praktyce:**  
W data science Few-Shot Prompting pozwala szybko testować nowe zadania na LLM (np. klasyfikacja, parafrazowanie, generowanie przykładów, ekstrakcja informacji) – wystarczy kilka dobrze dobranych demonstracji zamiast czasochłonnego uczenia modelu.

# 📌 Źródła

- [https://arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)
- [https://platform.openai.com/docs/guides/few-shot-learning](https://platform.openai.com/docs/guides/few-shot-learning)
- [https://promptingguide.ai/techniques/few-shot](https://promptingguide.ai/techniques/few-shot)
- [https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/)
- [https://huggingface.co/learn/nlp-course/chapter6/6](https://huggingface.co/learn/nlp-course/chapter6/6)

# 👽 Brudnopis

- Few-shot = prompty wzorcowe, wysoka elastyczność
- Im większy model, tym lepsza generalizacja (skala ważna, efekt Touvron/Min)
- Losowe etykiety i formaty coraz mniej szkodzą – odporność nowoczesnych LLM
- Ograniczenie reasoning – konieczność przejścia na CoT lub inne techniki
- Praktyczne use-case: rozpoznawanie sentymentu, Q&A eksperckie, ekstrakcja encji, tłumaczenie z przykładów