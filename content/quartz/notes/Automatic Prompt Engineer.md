---

title: Automatic Prompt Engineer  
created: 2025-07-16  
status:  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- ZhouEtAl
- InstructionGeneration
- NaturalLanguageGeneration
- BlackBoxOptimization
- LLM  
aliases:
- APE

---

# 🎯 Definicja

**Automatic Prompt Engineer (APE)** to framework opracowany przez Zhou et al., który automatyzuje proces generowania, selekcji i optymalizacji instrukcji (promptów) dla dużych modeli językowych ([[Base LLM|LLM]]). Problem doboru promptu postrzegany jest tu jako zadanie syntezy języka naturalnego rozwiązywane metodami optymalizacji czarnej skrzynki — [[Base LLM|LLM]] generuje i testuje setki/kandydatów instrukcji na podstawie demonstracji, a następnie wybiera najskuteczniejszy wariant na bazie wyników oceny modelu docelowego.

# 🔑 Kluczowe punkty

- **Automatyzacja inżynierii promptów:** APE samodzielnie generuje, ocenia i optymalizuje prompty na podstawie dostarczonych demonstracji wejść i oczekiwanych wyjść, bez udziału człowieka.
- **Optymalizacja czarnej skrzynki:** Proces traktowany jest jak black-box optimization — [[Base LLM|LLM]] generuje kandydatów, które następnie są testowane przez ten sam lub inny model, a wyniki porównywane pod kątem zadanych metryk (np. trafność, prawdziwość, zgodność z oczekiwaną odpowiedzią).
- **Wyższa efektywność niż prompty projektowane ręcznie:** Instrukcje wygenerowane przez APE przewyższają lub dorównują tym tworzonym przez człowieka (zeroshot, fewshot, chain-of-thought) w zadaniach NLP i reasoning na wielu benchmarkach.
- **Iteracyjna poprawa promptu:** [[Base LLM|LLM]] tworzy kolejne wariacje promptów na bazie wzorców i oceny, wielokrotnie udoskonalając wybrane rozwiązanie.
- **Elastyczność i skalowalność:** Framework może być stosowany do różnych zadań (QA, reasoning, [[generowanie kodu]], ekstrakcja informacji) i łatwo adaptuje się do nowych tasków i wersji modeli.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Automatic Prompt Engineer (APE)?

1. **Input:** System otrzymuje pary wejście–wyjście (demonstracje) wskazujące, czego oczekuje się od modelu.
2. **Generowanie kandydatów:** [[Base LLM|LLM]] (prompt generator) generuje wiele wariantów promptu/instrukcji, analizując dane wyjściowe oraz specyfikę zadania.
3. **Ewaluacja:** Kandydackie prompty są testowane przy użyciu docelowego [[Base LLM|LLM]] (content generator), który rozwiązuje zadanie na większym zbiorze testowym.
4. **Ocena i selekcja:** Każdy prompt jest oceniany według wybranych metryk (dokładność odpowiedzi, zgodność, prawdziwość, informatywność). Najlepszy prompt jest iteracyjnie udoskonalany przez generowanie wariantów najbardziej skutecznych instrukcji.
5. **Wdrożenie:** Najlepszy prompt jest wykorzystywany do rzeczywistej pracy modelu, znacząco podnosząc skuteczność AI bez ręcznej inżynierii promptów.

### Przykładowe wdrożenie

- Dla zadań chain-of-thought ([[Chain-of-Thought Prompting|CoT]]), APE samodzielnie opracował prompt lepszy niż klasyczny “Let's think step by step”, a sformułowanie typu “Opracujmy to krok po kroku, żeby upewnić się, że mamy właściwą odpowiedź” dało lepsze wyniki na benchmarkach MultiArith i GSM8K.

## Zalety i zastosowania

|Klasyczna inżynieria promptu|Automatic Prompt Engineer (APE)|
|---|---|
|Czasochłonne iteracje ręczne|Szybkie generowanie i automatyczna selekcja|
|Ograniczona liczba wariantów|Setki tysięcy promptów przetestowanych w locie|
|Zmienna jakość promptu|Standaryzowana optymalizacja pod task/score|
|Awaryjna adaptacja do zmian|Automatyczne dostosowanie do nowych zadań/modeli|

# 💡 Przykład zastosowania

**System QA dla nowych dziedzin wiedzy:**  
W przypadku wdrażania [[Base LLM|LLM]] do nowych zastosowań (np. specyficzny chatbot techniczny), APE przetwarza przykładowe wejścia/odpowiedzi i sam wybiera prompt “wyjaśniający” najlepiej stymulujący model do oczekiwanych odpowiedzi — zabezpieczając system przed niedoborami ręcznej inżynierii i chroniąc przed regresją jakości po update platformy.

# 📌 Źródła

[https://www.promptingguide.ai/techniques/ape](https://www.promptingguide.ai/techniques/ape)  
[https://arxiv.org/abs/2211.01910](https://arxiv.org/abs/2211.01910)  
[https://sites.google.com/view/automatic-prompt-engineer](https://sites.google.com/view/automatic-prompt-engineer)  
[https://www.learnprompt.pro/docs/advanced-prompting/automated-prompt-engineer/](https://www.learnprompt.pro/docs/advanced-prompting/automated-prompt-engineer/)  
[https://portkey.ai/blog/what-is-automated-prompt-engineering](https://portkey.ai/blog/what-is-automated-prompt-engineering)  
[https://www.deeplearning.ai/the-batch/research-summary-automatic-prompt-engineer-ape/](https://www.deeplearning.ai/the-batch/research-summary-automatic-prompt-engineer-ape/)  
[https://fnl.es/Science/Papers/Prompt+Engineering/Automatic+Prompt+Engineer+(APE)](https://fnl.es/Science/Papers/Prompt+Engineering/Automatic+Prompt+Engineer+\(APE\))

# 👽 Brudnopis

- [[Base LLM|LLM]] = czarna skrzynka, prompty = program (instrukcja) podlegająca optymalizacji
- Setki iteracji → wybór najlepszych promptów na podstawie IQM, F1, hit-rate; niuanse doboru metryk ważne jak w tuning [[Uczenie Maszynowe|ML]]
- Rozdzielenie modeli: generator promptów ≠ model rozwiązujący zadanie (testujący)
- APE używany do TruthfulQA (prawdziwość), Reasoning, Math, Extraction, klasyfikacja tekstów
- Przykład: prompt “Let's solve…” > “Let's think…” dla zeroshot chain-of-thought
- Porównanie: klasyczne AI prompt designer vs. APE (skalowanie, automatyzacja, eliminacja trial-and-error)
- Research trend: APE/AutoPrompt/Prompt Tuning – coraz mocniej hybrydowy workflow w prompt engineering