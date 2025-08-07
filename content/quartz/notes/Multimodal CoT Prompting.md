---

title: Multimodal CoT Prompting  
created: 2025-07-16  
status:  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- chain-of-thought
- multimodal
- LLM
- vision
- NLP  
aliases:
- Multimodal CoT
---
# 🎯 Definicja

**Multimodal [[Chain-of-Thought Prompting]]** (Multimodalne podpowiadanie łańcucha myśli, Multimodal-[[Chain-of-Thought Prompting|CoT]]) to rozszerzenie klasycznego podejścia [[Chain-of-Thought Prompting|CoT]], w którym modele językowe wykorzystują zarówno tekst, jak i dane wizualne (np. obrazy, [[Wizualizacja|wykresy]]) w celu realizacji złożonego rozumowania i uzyskania bardziej kompletnych odpowiedzi. Model przechodzi przez dwuetapowy proces: najpierw generuje przesłanki na podstawie multimodalnych informacji, a następnie na ich podstawie wnioskuje o odpowiedzi.

# 🔑 Kluczowe punkty

- **Dwa etapy rozumowania:** Najpierw generowanie przesłanek z danych tekstowych i wizualnych; następnie użycie tych przesłanek do udzielenia odpowiedzi.
- **Pokonanie ograniczeń [[Chain-of-Thought Prompting|CoT]]:** Tradycyjne [[Chain-of-Thought Prompting|CoT]] skupia się wyłącznie na tekście, podczas gdy Multimodal-[[Chain-of-Thought Prompting|CoT]] pozwala integrować wiele modalności (język + obraz).
- **Wyższa skuteczność:** Multimodalny model [[Chain-of-Thought Prompting|CoT]] z ok. 1 mld parametrów przewyższa GPT-3.5 na benchmarku ScienceQA, mimo znacznie mniejszej wielkości.
- **Redukcja halucynacji:** Integracja danych wizualnych pomaga modelowi generować bardziej realistyczne i uzasadnione przesłanki, co ogranicza ryzyko “halucynacji” odpowiedzi.
- **Zastosowania:** Nauka, edukacja, testy wielomodalne, systemy ekspertowe z dostępem do tekstu i obrazu.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Multimodal [[Chain-of-Thought Prompting|CoT]]?

Multimodalny łańcuch myśli obejmuje dwa główne kroki:

1. **Rationale Generation (Generowanie przesłanek)**  
    Model otrzymuje pytanie wraz z tekstowym i wizualnym kontekstem, następnie tworzy szczegółowy, krok po kroku “łańcuch myśli” (np. wskazówki tekstowe powiązane z informacjami obrazowymi).
    
2. **Answer Inference (Wnioskowanie odpowiedzi)**  
    Do modelu trafia tekst, obraz oraz wygenerowana przesłanka z pierwszego kroku, na podstawie których formułowana jest finalna odpowiedź.
    

## Przewaga nad klasycznym [[Chain-of-Thought Prompting|CoT]]

||Klasyczne [[Chain-of-Thought Prompting\|CoT]]|Multimodal [[Chain-of-Thought Prompting\|CoT]]|
|---|---|---|
|Wejście|Tekst|Tekst + Obraz|
|Przesłanki|Tylko tekstowe|Tekstowe + wizualne|
|Efektywność|Ograniczona modalnością|Lepsza integracja informacji|
|Wynik|Może halucynować|Bardziej uzasadnione, trafniejsze odpowiedzi|

## Wyniki benchmarków

- Multimodal-[[Chain-of-Thought Prompting|CoT]] (model ~1B) przewyższył GPT-3.5 [[Chain-of-Thought Prompting|CoT]] na ScienceQA, osiągając najwyższy wynik wśród testowanych metod na pytaniach wymagających interpretacji tekstów i obrazów.
- Analiza wykazała lepszą konwergencję procesu uczenia oraz mniejszą tendencję do generowania fałszywych przesłanek i odpowiedzi.

# 💡 Przykład zastosowania

**Przykład:**  
Model [[Base LLM|LLM]] dostaje pytanie naukowe z obrazem mikroskopowym.

1. Generuje multimodalną przesłankę: rozpoznaje struktury na obrazie, łączy je z opisem tekstowym i instrukcją pytania.
2. Na podstawie tej przesłanki wnioskuje, które odpowiedzi są poprawne (np. klasyfikuje komórki jako patologiczne).

Takie podejście sprawdza się w quizach naukowych (ScienceQA), testach maturalnych (z obrazem), edukacji technicznej czy analizie prezentacji multimedialnych.

# 📌 Źródła

[https://www.promptingguide.ai/techniques/multimodalcot](https://www.promptingguide.ai/techniques/multimodalcot)  
[https://arxiv.org/abs/2302.00923](https://arxiv.org/abs/2302.00923)  
[https://python.plainenglish.io/promt-engineering-101-multimodal-chain-of-thought-prompting-a0005b4e5186](https://python.plainenglish.io/promt-engineering-101-multimodal-chain-of-thought-prompting-a0005b4e5186)  
[https://openreview.net/forum?id=y1pPWFVfvR](https://openreview.net/forum?id=y1pPWFVfvR)

# 👽 Brudnopis

- Kluczowe: dwufazowy mechanizm – przesłanki multimodalne i wnioskowanie odpowiedzi
- ScienceQA = benchmark z pytaniami tekstowo-obrazowymi - Multimodal-CoT przewyższa GPT-3.5 [[Chain-of-Thought Prompting|CoT]]
- Redukcja halucynacji – więcej danych wejściowych = mniej błędnych przesłanek
- Możliwe aplikacje: edukacja, medycyna, systemy z multimodalną percepcją
- Modele 1B lepsze niż duże [[Base LLM|LLM]] typowo-tekstowe na zadaniach wizualnych
- Inspiracja: “Language is not all you need” – potrzeba integracji percepcji i języka