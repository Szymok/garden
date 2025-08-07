---

title: Tree of Thoughts (ToT)  
created: 2025-07-16  
status:  
category: Sztuczna Inteligencja  
difficulty: zaawansowany  
language: pl  
tags:

- prompt
- AI
- LLM
- chain-of-thought
- reasoning  
aliases:
- ToT
- Tree-of-Thought Prompting

---

# 🎯 Definicja

**Tree of Thoughts (ToT)** to metoda strukturalnego rozumowania przy użyciu modeli językowych ([[Base LLM|LLM]]), która rozszerza klasyczne techniki podpowiadania, takie jak chain-of-thought, o możliwość eksploracji wielu alternatywnych ścieżek rozumowania na różnych etapach. Wprowadza drzewa myśli (sekwencji logicznych) i łączy zdolność [[Base LLM|LLM]] do generowania i oceniania hipotez z algorytmami wyszukiwania takimi jak BFS, DFS czy beam search.

ToT jest zaprojektowane z myślą o zadaniach wymagających planowania, eksploracji stanów i złożonego wnioskowania (np. łamigłówki, planowanie działań, kodowanie, pytania wieloetapowe).

# 🔑 Kluczowe punkty

- **Myślenie rozgałęzione:** [[Base LLM|LLM]] rozważa wiele alternatywnych myśli (ścieżek), zamiast jednej liniowej sekwencji.
- **Myśli jako węzły drzewa:** Każda myśl to potencjalnie wartościowy krok ku rozwiązaniu — może być rozwinięta dalej lub odrzucona.
- **Metoda oceny:** [[Base LLM|LLM]] samo ocenia trafność wygenerowanych myśli: „pewny / możliwy / niemożliwy”.
- **Integracja z wyszukiwaniem (BFS, DFS):** Możemy kontrolować eksplorację i backtracking.
- **Możliwości rozszerzenia za pomocą RL:** Propozycja Longa uwzględnia „kontroler ToT” uczący się reguł nawigacji po drzewie.

# 📚 Szczegółowe wyjaśnienie

## Główna różnica względem chain-of-thought ([[Chain-of-Thought Prompting|CoT]])

|Cecha|Chain of Thought|Tree of Thoughts|
|---|---|---|
|Struktura|Liniowa sekwencja myśli|Drzewo możliwych ścieżek rozumowania|
|Eksploracja|Jedna droga|Eksploracja wielu możliwości (lookahead)|
|Ocena|Brak|Samoocena myśli pośrednich przez [[Base LLM\|LLM]]|
|Algorytmika|Prosta generacja|BFS / DFS / beam + ocena heurystyczna|
|Zastosowanie|Zadania zero-shot/[[Chain-of-Thought Prompting\|coT]]|Problemy z eksploracją, planowaniem, kodowaniem|

## Jak działa Tree of Thoughts?

1. **Problem** (np. matematyczny, decyzyjny) jest przekładany na serię rozwijalnych „myśli” — kroków logicznych prowadzących ku rozwiązaniu.
2. **[[Base LLM|LLM]] generuje k myśli** na danym „poziomie” rozumowania — np. alternatywne działania, rozwiązania częściowe.
3. **Każda myśl jest oceniana** przez [[Base LLM|LLM]] wg prostego schematu:
    - ✅ „pewny” — warto rozwijać
    - ❓ „możliwy” — warto zostawić
    - ❌ „niemożliwy” — odrzucić
4. **System eksploruje dalej** za pomocą algorytmu BFS/DFS/beam search, rozwijając tylko sensowne ścieżki.
5. Finalnie zostaje wybrana najlepsza ścieżka rozumowania prowadząca do rozwiązania.

📌 Przykładowe konfiguracje:

- **d** – liczba kroków (głębokość drzewa),
- **k** – liczba alternatywnych myśli per krok,
- **b** – beam width (maks. liczba ścieżek do rozwinięcia na kolejnym poziomie).

## Dalsze rozszerzenia

### Tree of Thought + RL (propozycja Longa)

- Zamiast sztywnych heurystyk (BFS/DFS), RL uczy się jak eksplorować efektywnie drzewo.
- „Kontroler ToT” może wycofać się kilka poziomów, eksplorować agresywnie lub zachowawczo – jak AlphaGo.
- Pozwala adaptować się do danych/problemów – możliwe uczenie przez samodzielną grę lub feedback.
- [[Base LLM|LLM]] pełni wtedy funkcje: generująco-oceniającą, a kontroler – taktyczną.

## Tree-of-Thought Prompting (wersja uproszczona)

Hulbert zaproponował ToT jako jednopromptową strategię:

```text
Imagine three different experts are answering this question.
All experts will write down 1 step of their thinking, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
The question is...
```

Ten format zmusza [[Base LLM|LLM]] do równoległego rozważenia wielu punktów widzenia i ścieżek → efekt przypomina wielokierunkowe drzewo, ale bez algorytmu eksploracyjnego.

# 💡 Przykład: Game of 24

Gra polega na tym, by z 4 cyfr i działań arytmetycznych ułożyć wyrażenie dające wynik 24.

1. [[Base LLM|LLM]] generuje 5 alternatywnych **myśli 1. poziomu** (np. możliwe pierwsze działania).
2. Każda jest oceniona wg zasad (too high / good / impossible).
3. System eksploruje dalej tylko sensem – reszta zostaje odcięta.
4. Po trzech krokach jedna ścieżka prowadzi do rozwiązania.

# 📌 Źródła

- [Tree of Thoughts – Yao et al. 2023 (arXiv)](https://arxiv.org/abs/2305.10601)
- [Tree-of-Thought Prompting – S. Hulbert (GitHub)](https://github.com/kyegomez/tree-of-thought-prompting)
- [Reinforcement Fine-Tuning in ToT (Long et al.)](https://arxiv.org/abs/2308.09687)
- [[[Prompt Engineering Guide]] – ToT Section](https://github.com/dair-ai/Prompt-Engineering-Guide#tree-of-thought)

# 👽 Brudnopis

- Chain-of-thought → Tree-of-thought: linia → rozgałęzienie (jak w grach)
- Można łączyć ToT z [[RAG]], [[self-consistency]], majority vote
- Beam search = pozwala tylko np. top-5 ścieżek w przód
- Końcowy wybór ścieżki można uzależnić od heurystyki, [[Base LLM|LLM]] vote lub kontrolera
- ToT pozwala lepiej rozwiązywać problemy, w których ważne są kilkakrokowe struktury
- Aplikacje: kodowanie, zadania z eksploracją, reasoning wieloetapowy, planowanie dialogów