---

title: Active-Prompt  
created: 2025-07-15  
status:  
category: LLM, Prompt Engineering  
difficulty: średni  
language: pl  
tags:

- Active-Prompt
- Chain-of-Thought
- LLM
- Uncertainty Metric  
aliases:
- Active Prompt
- ActivePrompt

---

# 🎯 Definicja

**Active-Prompt** to adaptacyjne podejście do tworzenia promptów dla dużych modeli językowych ([[Base LLM|LLM]]), w którym dobór przykładów [[Chain-of-Thought Prompting|CoT]] (chain-of-thought) jest aktywnie dostosowywany w oparciu o dynamiczną analizę niepewności. Kluczowy element tej techniki polega na wybieraniu przez model tych pytań, które sprawiają mu największą trudność, i wskazywaniu ich do adnotacji przez człowieka. Pozwala to poprawić skuteczność rozumowania modelu przy minimalnym nakładzie pracy ludzkiej.

# 🔑 Kluczowe punkty

- **Eliminacja sztywnego zestawu przykładów** – wybierane są najbardziej „niepewne” przypadki, które najlepiej ulepszają prompt.
- **Automatyczna selekcja poprzez metrykę niepewności** – model sam wskazuje pytania wymagające adnotacji ludzkiej, skracając czas szkolenia.
- **Dynamiczne wzbogacanie promptów** – nowo oznaczone przypadki są włączane do zestawu przykładowego, poprawiając skuteczność reasoning w [[Base LLM|LLM]] na niewidzianych zadaniach.
- **Skuteczność potwierdzona badaniami** – metoda pokazuje wyższą efektywność niż klasyczne chain-of-thought i inne inactive prompting approaches.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania Active-Prompt

1. **Generowanie wielu odpowiedzi [[Base LLM|LLM]]**  
    Model generuje _k_ różnych odpowiedzi na każde z pytań treningowych, przy wykorzystaniu obecnego zestawu przykładów [[Chain-of-Thought Prompting|CoT]] (lub bez przykładów).
    
2. **Obliczanie metryki niepewności**  
    Analizowana jest rozbieżność wśród uzyskanych odpowiedzi – różnice w logice, wynikach końcowych lub szczegółach wywodu. Najczęściej stosuje się prostą metrykę: liczbę unikalnych końcowych odpowiedzi wśród _k_ generacji (im więcej wariantów, tym większa niepewność).
    
3. **Wybór pytań do adnotacji**  
    Pytań o najwyższej niepewności są wskazywane do ręcznej adnotacji przez eksperta (adnotacja [[Chain-of-Thought Prompting|CoT]] dla danego zadania).
    
4. **Aktualizacja promptu i powtarzanie cyklu**  
    Nowe przykłady są włączane do promptu, a proces powtarza się do uzyskania oczekiwanego poziomu skuteczności reasoning [[Base LLM|LLM]] lub wyczerpania budżetu adnotacji.
    

### Zalety podejścia

- **Oszczędność pracy adnotatorów:** Annotuje się tylko kluczowe, „trudne” przypadki zwiększające efektywność promptu.
- **Znacząca poprawa skuteczności dla nowych zadań:** Prompt zostaje „dostosowany” do tego, co stanowi wyzwanie dla modelu w konkretnej domenie.
- **Realizacja idei active learning:** Dobór przypadków prowadzony jest „od dołu” przez model, nie przez projektanta promptów.

## Miejsce w ekosystemie [[Base LLM|LLM]] i reasoning

Active-Prompt uzupełnia i rozszerza klasyczną metodę promptowania z [[Chain-of-Thought Prompting|CoT]] poprzez stworzenie zamkniętej pętli uczenia (feedback loop), w ramach której [[Base LLM|LLM]] samodzielnie wskazuje na obszary wymagające doprecyzowania lub wzbogacenia. Metoda ta wpisuje się w szerszy nurt prac nad samoewaluacją modeli generatywnych, metapromptingiem oraz active learning dla AI.

# 💡 Przykład zastosowania

Zespół [[Uczenie Maszynowe|ML]] chce dostosować [[Base LLM|LLM]] do rozwiązywania egzaminów matematycznych. Na początku model regresyjnie generuje odpowiedzi, ale jest niepewny co do wybranych typów zadań (duża rozbieżność końcowych wyników w _k_ generacjach). Te przypadki zostają oznaczone przez eksperta (krok po kroku), nowy prompt jest budowany, a skuteczność reasoning modelu na nieznanych zadaniach matematycznych istotnie wzrasta przy niewielkim zwielokrotnieniu liczby przykładów.

## 📌 Źródła

- Diao et al., "Active-Prompt: Prompting [[Base LLM|Large Language Models]] to be More Accurate with Less Human Annotation", arXiv:2302.12246
- [BARD – The Next Generation of Prompt Engineering?](https://arxiv.org/abs/2302.12246)
- [Active-Prompt codebase – GitHub](https://github.com/chaozhang-ml/active-prompt)

# 👽 Brudnopis

- Active-Prompt = adaptacyjne chain-of-thought z aktywną selekcją przykładów
- Model generuje k odpowiedzi → ocena niepewności → pytania do adnotacji przez człowieka
- Tylko najtrudniejsze niepewne przypadki trafiają do puli CoT → szybki wzrost skuteczności reasoning
- Ideowy związek z active learning / data programming / prompt engineering
- Praktycznie: można szybciej i taniej dostroić [[Base LLM|LLM]] do zadania niż przez masową adnotację [[Chain-of-Thought Prompting|CoT]]
- Przykład: domena matematyczna, reasoning, prompt tuning na nowy typ zagadnienia

: [https://arxiv.org/abs/2302.12246](https://arxiv.org/abs/2302.12246)