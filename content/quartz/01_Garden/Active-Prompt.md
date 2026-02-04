---
title: Active-Prompt
created: 2026-02-04
status: evergreen
category: AI/LLM
difficulty: advanced
language: pl
tags:
  - active-prompt
  - prompt-engineering
  - chain-of-thought
  - uncertainty
aliases:
  - Active Prompting
  - Uncertainty-based prompting
---
# 🎯 Definicja
**Active-Prompt** to metoda inżynierii promptów, w której model LLM sam identyfikuje problemy, które sprawiają mu trudność (mierząc swoją "niepewność"), i prosi człowieka o dostarczenie przykładów (Chain-of-Thought) konkretnie dla tych trudnych przypadków.

# 🔑 Kluczowe punkty
- **Adaptacyjność:** Zamiast stałego zestawu przykładów (fixed CoT), dobieramy przykłady dynamicznie.
- **Metryka Niepewności:** Model generuje kilka odpowiedzi i sprawdza, jak bardzo się różnią (spójność/korelacja). Duża rozbieżność = duża niepewność.
- **Efektywność:** Annotujemy tylko to, co jest trudne dla modelu, oszczędzając czas ekspertów.

# 📚 Szczegółowe wyjaśnienie
Podejście to rozwiązuje problem "doboru przykładów" w few-shot learningu. Zamiast zgadywać, jakie przykłady będą pomocne, pytamy model: "Gdzie się wahasz?".
Proces:
1. Model rozwiązuje zbiór treningowy.
2. Mierzymy niepewność (np. entropię odpowiedzi).
3. Wybieramy TOP-K najtrudniejszych pytań.
4. Człowiek dopisuje do nich ścieżkę rozumowania (Chain-of-Thought).
5. Używamy tych nowych przykładów w prompcie docelowym.

# 💡 Przykład zastosowania
Budujemy bota do rozwiązywania zadań z fizyki.
1. Puszczamy go na 100 zadań testowych.
2. Widzimy, że przy zadaniach z *ruchu po okręgu* model generuje 5 różnych wyników dla tego samego pytania (wysoka niepewność).
3. Fizyk dopisuje krok-po-kroku rozwiązanie dla 5 zadań z ruchu po okręgu.
4. Dodajemy te rozwiązania do promptu systemowego.
5. Model działa lepiej na całej klasie podobnych problemów.

## 📌 Źródła
- Diao et al., "Active-Prompt: Prompting LLMs to be More Accurate with Less Human Annotation", arXiv:2302.12246

## 👽 Brudnopis
- Active-Prompt = adaptacyjne chain-of-thought z aktywną selekcją przykładów
- Model generuje k odpowiedzi → ocena niepewności → pytania do adnotacji przez człowieka
- Tylko najtrudniejsze niepewne przypadki trafiają do puli CoT → szybki wzrost skuteczności reasoning
- Ideowy związek z active learning / data programming / prompt engineering