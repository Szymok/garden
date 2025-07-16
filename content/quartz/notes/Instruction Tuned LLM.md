---

title: Instruction Tuned LLM  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: średniozaawansowany  
language: pl  
tags:

- llm
- AI
- Sztuczna-Inteligencja
- instruction tuning
- modele językowe  
aliases:
- instruction-tuned models
- large language models
- LLM instruction

---

# 🎯 Definicja

**Instruction Tuned LLM (Instruction-Tuned Large Language Model)** to model językowy przetrenowany lub dostrojony specjalnie pod kątem rozumienia i wykonywania poleceń użytkownika wyrażonych w języku naturalnym. Proces ten, znany jako **instruction tuning**, zwiększa użyteczność i sterowalność LLM w zastosowaniach praktycznych – np. w czatbotach, asystentach AI czy interfejsach w stylu „prompt-pytanie → odpowiedź”.

# 🔑 Kluczowe punkty

- Instruction tuned LLM są dostrajane do wykonywania **zadanych poleceń** (np. „Stwórz listę...”, „Wytłumacz jak...”, „Zamień to na kod…”).
- Trening uwzględnia pary: **instrukcja → oczekiwane działanie**, zamiast tradycyjnych danych predykcyjnych (np. następne słowo).
- Modele te są lepiej przystosowane do interakcji z użytkownikiem w stylu zeroshot/fewshot/in-context learning.
- Znane przykłady to: **OpenAI InstructGPT**, **ChatGPT**, **FLAN-T5**, **LLaMA 2-Chat**, **Mistral-Instruct**, **Databricks Dolly**.
- Instruction tuning nie zawiera RLHF (fine-tuningu przez feedback ludzi), ale bywa etapem poprzedzającym RLHF.

# 📚 Szczegółowe wyjaśnienie

## Instruction Tuning — jak to działa?

Instruction tuning polega na przetrenowaniu LLM na dedykowanych parach:

- **Input**: Naturalnie sformułowana instrukcja (prompt)
- **Output**: Oczekiwana odpowiedź, zgodna z intencją użytkownika

Przykład pary do instrukcji:

```
Instrukcja: Wygeneruj 3 możliwe nazwy dla startupu zajmującego się analityką danych.
Oczekiwany output: DataWiz, InsightForge, MetricsFox
```

Trening odbywa się na zbiorach zawierających dziesiątki tysięcy takich promptów. Przykładowe zbiory:

- **FLAN Collection**
- **Self-Instruct**
- **Databricks Dolly Dataset**
- **OpenAssistant Conversations**

Instruction tuning może być samodzielny lub łączony z technikami:

- **SFT** (Supervised Fine-Tuning)
- **RLHF**, gdzie tuning służy jako etap 1 (awareness of instructions).

## Czym różni się Instruction-Tuned LLM od bazowego?

|Cecha|LLM (bazowy)|Instruction-Tuned LLM|
|---|---|---|
|Styl interakcji|Kontynuacja tekstu|Reagowanie na polecenia|
|Przykład użycia|Generuj kolejne zdanie|„Podsumuj poniższy tekst…”|
|Trening|Predykcja następnego tokena|Dopasowanie do sformułowanej instrukcji|
|Użyteczność dla użytkownika|Niższa|Wyższa (bardziej naturalny „czat”)|

## Główne zastosowania

- Czatboty i interfejsy konwersacyjne
- Agenci AI wykonujący złożone zadania (np. planowanie, kodowanie)
- Samoopisujące się API i pipeline danych
- Narzędzia wspierające decyzje, analizy, przetwarzanie dokumentów
- In-context few-shot reasoning + chain-of-thought

# 💡 Przykład zastosowania

W firmie doradczej wdrożono LLaMA-2-Chat, który był instruction-tuned. Użytkownicy mogą zadawać pytania w stylu:  
„Podsumuj dane kwartalne sprzedaży według regionu i wyciągnij 3 główne wnioski.”  
Model odpowiada logicznie, krok po kroku, przestrzegając instrukcji struktury odpowiedzi. Wersja base model była mniej responsywna i wymagała bardziej precyzyjnego promptowania.

## 📌 Źródła

- [https://arxiv.org/abs/2203.02155](https://arxiv.org/abs/2203.02155) (InstructGPT, Ouyang et al.)
- [https://huggingface.co/blog/instruction-tuning](https://huggingface.co/blog/instruction-tuning)
- [https://github.com/openai/summarize-from-feedback](https://github.com/openai/summarize-from-feedback)
- [https://www.databricks.com/blog/introducing-dolly-instruction-tuned-llm](https://www.databricks.com/blog/introducing-dolly-instruction-tuned-llm)

## 👽 Brudnopis

- instruction tuning ≠ RLHF (etap przed, nad/pod)
- prompt: "Zrób X" — LLM wie, że musi wykonać instrukcję, nie tylko kontynuować tekst
- flan-t5 jako OTP do zadaniowości
- modele tuned ≠ base = dużo łatwiejsze w użyciu out-of-the-box
- trening często z crowdsourcingiem lub pseudo-labels (self-instruct)
- każda aplikacja B2B potrzebuje interfejsu LLM → instrukcje mają sens via fine-tune
- vs cot/cof/s.cot: instruction tuning boostuje „gotowość do rozumienia celu”

---