---
title: Base LLM (Fundamentale Modele Językowe)
created: 2026-02-04
status: evergreen
category: AI/LLM
difficulty: basic
language: pl
tags:
  - llm
  - foundation-models
  - nlp
  - transformer
aliases:
  - Large Language Models
  - Modele bazowe
  - Foundation Models
---
# 🎯 Definicja
**Base LLM** (Bazowy Model Językowy) to model wytrenowany na ogromnym korpusie tekstu (Internet, książki, kod) wyłącznie w celu przewidywania kolejnego słowa (Next Token Prediction). Nie był jeszcze dostrajany instrukcjami (Instruction Tuned) ani Reinforcement Learningiem (RLHF).

# 🔑 Kluczowe punkty
- **Surowy stan:** Model bazowy nie "rozumie" poleceń. Jeśli zapytasz go "Jaka jest stolica Francji?", może odpowiedzieć pytaniem "A jaka jest stolica Niemiec?", myśląc, że to lista pytań z testu.
- **Wszechstronność:** Jest fundamentem (Foundation Model), na którym buduje się modele do chata, kodowania, streszczania.
- **[[Halucynacje|Halucynacje]]:** Częściej zmyśla, bo jego celem jest "prawdopodobny ciąg dalszy tekstu", a nie "prawda".

# 📚 Szczegółowe wyjaśnienie
Base LLM to np. GPT-3 (wersja `davinci`, nie `text-davinci-003`). Jest jak super-oczytany papuga-autouzupełniacz.
Proces tworzenia ChatGPT wygląda tak:
1. **Pre-training:** Trenujemy Base LLM na 10TB tekstu. (Koszt: miliony $).
2. **Fine-tuning (SFT):** Pokazujemy mu pary Pytanie-Odpowiedź, żeby nauczył się słuchać poleceń.
3. **RLHF:** Oceniamy jego odpowiedzi, żeby był "pomocny i nieszkodliwy".

Base LLM jest przydatny do zadań typu **Few-Shot Learning** (daj mu 5 przykładów i 6. do uzupełnienia) oraz do **finetuningu** na własnych danych.

# 💡 Przykład zastosowania
Uzupełnianie kodu (Code Completion).
Piszesz: `def calculate_area(radius):`
Base LLM dopowiada: `return 3.14 * radius ** 2`
W tym przypadku nie wydajemy polecenia ("Napisz funkcję..."), tylko zaczynamy pisać, a model kończy. Do tego Base LLM jest idealny.

## 📌 Źródła
- OpenAI [[GPT-4|GPT-4]] Technical Report.

## 👽 Brudnopis
- LLaMA, GPT-3 Base, BLOOM.
- "Completion" API vs "Chat" API.