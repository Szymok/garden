---
title: Instruction Tuned LLM (Modele Instrukcyjne)
created: 2026-02-04
status: evergreen
category: LLM
difficulty: intermediate
language: pl
tags:
  - llm
  - fine-tuning
  - rlhf
  - chatgpt
aliases:
  - InstructGPT
  - Modele It
  - Instruction Tuning
---
# 🎯 Definicja
**Instruction Tuned LLM** to model językowy, który przeszedł dodatkowy trening (Fine-Tuning), aby nauczyć się **wykonywać polecenia**, a nie tylko dokańczać tekst. To różnica między "surowym" GPT-3 (który po pytaniu "Jaka jest stolica Polski?" mógłby dopisać "A jaka jest stolica Niemiec?"), a ChatGPT (który odpowie "Warszawa").

# 🔑 Kluczowe punkty
- **Base Model:** Umie mówić, ale nie umie słuchać poleceń.
- **Instruct Model:** Nauczony na parach (Instrukcja -> Odpowiedź).
- **Zastosowanie:** Chatboty, asystenci, automatyzacja zadań.

# 📚 Szczegółowe wyjaśnienie
Proces tworzenia modelu Instruct:
1.  Bierzemy **Base Model** (np. Llama 2 Base), który przeczytał cały internet.
2.  Tworzymy zbiór danych treningowych składający się z tysięcy poleceń ("Napisz maila", "Przetłumacz", "Strość") i wzorowych odpowiedzi.
3.  Robimy **Supervised Fine-Tuning (SFT)**.
4.  Często dodajemy RLHF (Reinforcement Learning from Human Feedback), aby model był "grzeczny" i bezpieczny.

# 💡 Przykład zastosowania
Prompt: "Wyjaśnij grawitację 5-latkowi".
- **Base Model:** Może zacząć cytować podręcznik fizyki albo wygenerować listę pytań egzaminacyjnych o grawitacji.
- **Instruct Model:** "Wyobraź sobie, że Ziemia przytula wszystko do siebie..." (Rozumie intencję "wyjaśnij" i ograniczenie "5-latkowi").

## 📌 Źródła
- "Training language models to follow instructions with human feedback" (Ouyang et al., 2022 - paper o InstructGPT).

## 👽 Brudnopis
- Obecnie większość modeli, z którymi mają styczność użytkownicy (Chat), to modele Instruction Tuned. Modele Base używają głównie inżynierowie do specyficznego douczania.