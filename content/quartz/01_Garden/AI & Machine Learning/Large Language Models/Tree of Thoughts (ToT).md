---

title: Tree of Thoughts (ToT)  
created: 2025-07-16  
status: 🌱 draft
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

# ðŸŽ¯ Definicja

**Tree of Thoughts (ToT)** to metoda strukturalnego rozumowania przy uÅ¼yciu modeli jÄ™zykowych ([[Base LLM|LLM]]), ktÃ³ra rozszerza klasyczne techniki podpowiadania, takie jak chain-of-thought, o moÅ¼liwoÅ›Ä‡ eksploracji wielu alternatywnych Å›cieÅ¼ek rozumowania na rÃ³Å¼nych etapach. Wprowadza drzewa myÅ›li (sekwencji logicznych) i Å‚Ä…czy zdolnoÅ›Ä‡ [[Base LLM|LLM]] do generowania i oceniania hipotez z algorytmami wyszukiwania takimi jak BFS, DFS czy beam search.

ToT jest zaprojektowane z myÅ›lÄ… o zadaniach wymagajÄ…cych planowania, eksploracji stanÃ³w i zÅ‚oÅ¼onego wnioskowania (np. Å‚amigÅ‚Ã³wki, planowanie dziaÅ‚aÅ„, kodowanie, pytania wieloetapowe).

# ðŸ”‘ Kluczowe punkty

- **MyÅ›lenie rozgaÅ‚Ä™zione:** [[Base LLM|LLM]] rozwaÅ¼a wiele alternatywnych myÅ›li (Å›cieÅ¼ek), zamiast jednej liniowej sekwencji.
- **MyÅ›li jako wÄ™zÅ‚y drzewa:** KaÅ¼da myÅ›l to potencjalnie wartoÅ›ciowy krok ku rozwiÄ…zaniu â€” moÅ¼e byÄ‡ rozwiniÄ™ta dalej lub odrzucona.
- **Metoda oceny:** [[Base LLM|LLM]] samo ocenia trafnoÅ›Ä‡ wygenerowanych myÅ›li: â€žpewny / moÅ¼liwy / niemoÅ¼liwyâ€.
- **Integracja z wyszukiwaniem (BFS, DFS):** MoÅ¼emy kontrolowaÄ‡ eksploracjÄ™ i backtracking.
- **MoÅ¼liwoÅ›ci rozszerzenia za pomocÄ… RL:** Propozycja Longa uwzglÄ™dnia â€žkontroler ToTâ€ uczÄ…cy siÄ™ reguÅ‚ nawigacji po drzewie.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## GÅ‚Ã³wna rÃ³Å¼nica wzglÄ™dem chain-of-thought ([[Chain-of-Thought Prompting|CoT]])

|Cecha|Chain of Thought|Tree of Thoughts|
|---|---|---|
|Struktura|Liniowa sekwencja myÅ›li|Drzewo moÅ¼liwych Å›cieÅ¼ek rozumowania|
|Eksploracja|Jedna droga|Eksploracja wielu moÅ¼liwoÅ›ci (lookahead)|
|Ocena|Brak|Samoocena myÅ›li poÅ›rednich przez [[Base LLM\|LLM]]|
|Algorytmika|Prosta generacja|BFS / DFS / beam + ocena heurystyczna|
|Zastosowanie|Zadania zero-shot/[[Chain-of-Thought Prompting\|coT]]|Problemy z eksploracjÄ…, planowaniem, kodowaniem|

## Jak dziaÅ‚a Tree of Thoughts?

1. **Problem** (np. matematyczny, decyzyjny) jest przekÅ‚adany na seriÄ™ rozwijalnych â€žmyÅ›liâ€ â€” krokÃ³w logicznych prowadzÄ…cych ku rozwiÄ…zaniu.
2. **[[Base LLM|LLM]] generuje k myÅ›li** na danym â€žpoziomieâ€ rozumowania â€” np. alternatywne dziaÅ‚ania, rozwiÄ…zania czÄ™Å›ciowe.
3. **KaÅ¼da myÅ›l jest oceniana** przez [[Base LLM|LLM]] wg prostego schematu:
    - âœ… â€žpewnyâ€ â€” warto rozwijaÄ‡
    - â“ â€žmoÅ¼liwyâ€ â€” warto zostawiÄ‡
    - âŒ â€žniemoÅ¼liwyâ€ â€” odrzuciÄ‡
4. **System eksploruje dalej** za pomocÄ… algorytmu BFS/DFS/beam search, rozwijajÄ…c tylko sensowne Å›cieÅ¼ki.
5. Finalnie zostaje wybrana najlepsza Å›cieÅ¼ka rozumowania prowadzÄ…ca do rozwiÄ…zania.

ðŸ“Œ PrzykÅ‚adowe konfiguracje:

- **d** â€“ liczba krokÃ³w (gÅ‚Ä™bokoÅ›Ä‡ drzewa),
- **k** â€“ liczba alternatywnych myÅ›li per krok,
- **b** â€“ beam width (maks. liczba Å›cieÅ¼ek do rozwiniÄ™cia na kolejnym poziomie).

## Dalsze rozszerzenia

### Tree of Thought + RL (propozycja Longa)

- Zamiast sztywnych heurystyk (BFS/DFS), RL uczy siÄ™ jak eksplorowaÄ‡ efektywnie drzewo.
- â€žKontroler ToTâ€ moÅ¼e wycofaÄ‡ siÄ™ kilka poziomÃ³w, eksplorowaÄ‡ agresywnie lub zachowawczo â€“ jak AlphaGo.
- Pozwala adaptowaÄ‡ siÄ™ do danych/problemÃ³w â€“ moÅ¼liwe uczenie przez samodzielnÄ… grÄ™ lub feedback.
- [[Base LLM|LLM]] peÅ‚ni wtedy funkcje: generujÄ…co-oceniajÄ…cÄ…, a kontroler â€“ taktycznÄ….

## Tree-of-Thought Prompting (wersja uproszczona)

Hulbert zaproponowaÅ‚ ToT jako jednopromptowÄ… strategiÄ™:

```text
Imagine three different experts are answering this question.
All experts will write down 1 step of their thinking, then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
The question is...
```

Ten format zmusza [[Base LLM|LLM]] do rÃ³wnolegÅ‚ego rozwaÅ¼enia wielu punktÃ³w widzenia i Å›cieÅ¼ek â†’ efekt przypomina wielokierunkowe drzewo, ale bez algorytmu eksploracyjnego.

# ðŸ’¡ PrzykÅ‚ad: Game of 24

Gra polega na tym, by z 4 cyfr i dziaÅ‚aÅ„ arytmetycznych uÅ‚oÅ¼yÄ‡ wyraÅ¼enie dajÄ…ce wynik 24.

1. [[Base LLM|LLM]] generuje 5 alternatywnych **myÅ›li 1. poziomu** (np. moÅ¼liwe pierwsze dziaÅ‚ania).
2. KaÅ¼da jest oceniona wg zasad (too high / good / impossible).
3. System eksploruje dalej tylko sensem â€“ reszta zostaje odciÄ™ta.
4. Po trzech krokach jedna Å›cieÅ¼ka prowadzi do rozwiÄ…zania.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [Tree of Thoughts â€“ Yao et al. 2023 (arXiv)](https://arxiv.org/abs/2305.10601)
- [Tree-of-Thought Prompting â€“ S. Hulbert (GitHub)](https://github.com/kyegomez/tree-of-thought-prompting)
- [Reinforcement Fine-Tuning in ToT (Long et al.)](https://arxiv.org/abs/2308.09687)
- [[[Prompt Engineering Guide]] â€“ ToT Section](https://github.com/dair-ai/Prompt-Engineering-Guide#tree-of-thought)

# ðŸ‘½ Brudnopis

- Chain-of-thought â†’ Tree-of-thought: linia â†’ rozgaÅ‚Ä™zienie (jak w grach)
- MoÅ¼na Å‚Ä…czyÄ‡ ToT z [[RAG]], [[Self-Consistency]], majority vote
- Beam search = pozwala tylko np. top-5 Å›cieÅ¼ek w przÃ³d
- KoÅ„cowy wybÃ³r Å›cieÅ¼ki moÅ¼na uzaleÅ¼niÄ‡ od heurystyki, [[Base LLM|LLM]] vote lub kontrolera
- ToT pozwala lepiej rozwiÄ…zywaÄ‡ problemy, w ktÃ³rych waÅ¼ne sÄ… kilkakrokowe struktury
- Aplikacje: kodowanie, zadania z eksploracjÄ…, reasoning wieloetapowy, planowanie dialogÃ³w