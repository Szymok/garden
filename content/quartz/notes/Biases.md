---
title: Biases
created: 2025-07-16
status: Final
category: LLM
difficulty: średniozaawansowany
language: pl
tags: 
  - LLM
  - bias
  - sztuczna inteligencja
  - NLP
  - prompt engineering
aliases:
  - tendencyjność
  - stronniczość modeli językowych
---

# 🎯 Definicja

**Bias (stronniczość, tendencyjność)** w kontekście dużych modeli językowych (LLM) oznacza preferencyjną skłonność modelu do określonego rodzaju odpowiedzi wynikającą z danych treningowych, architektury modelu lub sposobu formułowania promptów. Może być niezamierzona i prowadzić do zafałszowanych wyników, dyskryminujących lub nieprecyzyjnych generacji.

# 🔑 Kluczowe punkty

- Tendencyjność może wynikać z niezrównoważonego rozkładu danych w promptach (np. większość przykładów jednej klasy).
- Kolejność przypadków w strukturze few-shot learning również wpływa na rezultat modelu.
- Bias może prowadzić do spadku ogólnej wydajności modelu, a także problemów etycznych i związanych z zaufaniem.
- Minimalizację biasu wspierają techniki takie jak zbalansowane dane wejściowe, randomizacja kolejności oraz moderacja treści.
- Zjawisko staje się bardziej widoczne w trudniejszych zadaniach i domenach, gdzie model ma mniej informacji.

# 📚 Szczegółowe wyjaśnienie

## 📊 Dystrybucja przykładów

W podejściu few-shot (np. klasyfikacja sentymentu) sposób dystrybucji przykładów pozytywnych i negatywnych może wpływać na decyzje modelu. Jeśli jeden typ etykiety dominuje w zestawie promptów, model może błędnie uogólniać i preferować tę etykietę niezależnie od faktycznego kontekstu.

**Przykład:**

Prompt:
```

Q: I just got the best news ever! A: Positive Q: We just got a raise at work! A: Positive Q: I'm so proud of what I accomplished today. A: Positive Q: I'm having the best day ever! A: Positive Q: I'm really looking forward to the weekend. A: Positive Q: I just got the best present ever! A: Positive Q: I'm so happy right now. A: Positive Q: I'm so blessed to have such an amazing family. A: Positive Q: The weather outside is so gloomy. A: Negative Q: I just got some terrible news. A: Negative Q: That left a sour taste. A:

```

Output modelu: `Negative`

Wersja z przewagą pozytywnych przykładów:
```

Q: The food here is delicious! A: Positive Q: I'm so tired of this coursework. A: Negative Q: I can't believe I failed the exam. A: Negative Q: I had a great day today! A: Positive Q: I hate this job. A: Negative Q: The service here is terrible. A: Negative Q: I'm so frustrated with my life. A: Negative Q: I never get a break. A: Negative Q: This meal tastes awful. A: Negative Q: I can't stand my boss. A: Negative Q: I feel something. A:

```

Output: `Negative`

W kolejnej wersji, zmieniając proporcję na 8 pozytywnych i 2 negatywne, model dla „I feel something.” odpowiedział: `Positive`. Oznacza to, że rozkład przykładów może wpływać na predykcję nawet dla niejednoznacznych przypadków.

**Zalecenia:**
- Utrzymuj równowagę etykiet w promptach few-shot.
- Zmieniaj konfiguracje i testuj różne warianty promptów pod względem wpływu biasu.

## 🔀 Kolejność przykładów

Model może być podatny na efekt pierwszeństwa — jeśli wszystkie pozytywne przypadki są na początku, a negatywne na końcu, jego odpowiedzi mogą być tendencyjne, nawet przy zbalansowanym rozkładzie klas. Problem ten nasila się szczególnie wtedy, gdy dane są dodatkowo niezrównoważone.

**Rekomendacje:**
- Losowo mieszaj kolejność przykładów.
- Testuj zachowanie modelu przy różnych permutacjach tego samego prompta.
- Stosuj automatyczne mechanizmy "shuffling" w pipeline promptowego generowania w podejściu MLOps.

## 📉 Złożoność a bias

- W prostych zadaniach (np. sentyment binarny) modele dobrze radzą sobie z neutralizacją wpływu biasu.
- W złożonych problemach: klasyfikacja emocji, detekcja intencji czy tokenizacja wieloklasowa – wpływ biasu znacznie rośnie.
- W takich przypadkach konieczne może być fine-tuning modelu lub zastosowanie uwarunkowanej generacji (conditioned decoding).

# 💡 Przykład zastosowania

W systemie klasyfikacji ticketów wsparcia klienta (CRM), początkowa architektura umożliwiała modelowi LLM klasyfikację biletów do kategorii "Complaint", "Praise", "Request" bez zachowania równowagi przykładów, co skutkowało dominującym przydzielaniem biletów do jednej kategorii (Complaint). Po zastosowaniu zbalansowanego few-shot prompting oraz losowej kolejności, rozkład predykcji uległ wyrównaniu i zmniejszył odsetek błędnych klasyfikacji o 21%.

## 📌 Źródła

 Anthropic – Prompting best practices for reducing bias: https://www.anthropic.com/index/prompting-best-practices  
 Google Research – Understanding and Reducing the Gender Bias in Neural Machine Translation: https://research.google/pubs/pub46757/  
 OpenAI – Classifier Zero-shot vs Few-shot Performance: https://platform.openai.com/docs/guides/gpt-best-practices

## 👽 Brudnopis

- Few-shot prompt z nierówną liczbą przykładów wpływa na wynik → model może przejąć tendencyjność
- Model silniej ulega biasowi przy trudnych do jednoznacznej klasyfikacji tekstach
- Kolejność przykładów też wpływa → shuffle = must-have
- Testować różne rozkłady i kolejności → eksperymenty A/B
- W zastosowaniach produkcyjnych zawsze uwzględniać rekomendacje dot. redukcji wpływu przykładów
- Bias mniej widoczny w prostych zadaniach (np. sentyment), ale wyraźniejszy w nieoczywistych wypowiedziach
