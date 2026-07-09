---
title: LLM Settings (Ustawienia LLM)
created: 2026-02-04
status: evergreen
category: AI / Configuration
difficulty: intermediate
language: pl
tags:
  - llm
  - temperature
  - top-p
  - configuration
  - generation
aliases:
  - Ustawienia LLM
  - Parametry modelu
---
# 🎯 Definicja
**[[Ustawienia LLM|Ustawienia LLM]]** to pokrętła, którymi sterujesz zachowaniem modelu.
Model to nie tylko "Prompt + Odpowiedź". To także konfiguracja: "Jak bardzo losowy mam być?", "Jakie słowa karać?".

# 🔑 Kluczowe punkty
- **Temperature:** Skala losowości (0-1).
- **[[Top P]]:** Nucleus Sampling (Odetnij statystycznie mało prawdopodobne słowa).
- **Max Tokens:** Kiedy przestać gadać.
- **Frequency/Presence Penalty:** Zapobiegaj powtarzaniu tych samych słów (Sposób na zacinanie się modelu).

# 📚 Szczegółowe wyjaśnienie
Domyślne ustawienia (np. w ChatGPT) są zbalansowane (Temp=0.7).
Do zadań programistycznych ([[Generowanie kodu|generowanie kodu]]) używa się Temp=0.2 (Chcesz poprawny kod, a nie "kreatywną składnię").
Do pisania wierszy Temp=0.9.

# 💡 Przykład zastosowania
Model w pętli powtarza "To jest test. To jest test. To jest test."
Rozwiązanie: Zwiększ `Frequency Penalty` na 0.5. Model dostanie "karę" za użycie słowa "test" drugi raz, więc poszuka innego.

## 📌 Źródła
- OpenAI API Reference.

## 👽 Brudnopis
- Te ustawienia są krytyczne w API, ale często ukryte w prostych czatbotach webowych. Jako inżynier AI musisz je kontrolować.
