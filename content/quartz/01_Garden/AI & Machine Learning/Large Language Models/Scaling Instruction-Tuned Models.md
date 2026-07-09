---
title: Scaling Instruction-Tuned Models (Instrukcje w LLM)
created: 2026-02-04
status: evergreen
category: AI / LLM Training
difficulty: advanced
language: pl
tags:
  - instruction-tuning
  - flan
  - scaling
  - training
  - cot
aliases:
  - Skalowanie Modeli Instrukcyjnych
  - Flan-T5
  - Flan-PaLM
---
# 🎯 Definicja
**Instruction Tuning** to proces uczenia modelu, żeby wykonywał polecenia ("Przetłumacz to", "Podsumuj to"), a nie tylko dokończył zdanie.
Skalowanie polega na zwiększaniu liczby zadań instrukcyjnych (z 10 do 1800+), co drastycznie poprawia inteligencję modelu, nawet jeśli sam model nie rośnie.

# 🔑 Kluczowe punkty
- **FLAN (Finetuned Language Net):** Metoda Google. Bierzemy surowy model i uczymy go na 1800 typach zadań.
- **Zero-Shot:** Model nauczony na instrukcjach potrafi rozwiązać nowe zadanie, którego nigdy nie widział, bo rozumie samą koncepcję "instrukcji".
- **CoT:** Połączenie instrukcji z [[Chain-of-Thought Prompting]] daje najlepsze wyniki w matematyce.

# 📚 Szczegółowe wyjaśnienie
Dlaczego GPT-3 był głupi (musiałeś mu dawać przykłady), a ChatGPT jest mądry (rozumie "zrób to")?
Bo GPT-3 był tylko "next token predictor".
ChatGPT przeszedł Instruction Tuning (RLHF/SFT).
Badania (np. Flan-PaLM) pokazują, że im więcej RÓŻNYCH instrukcji w treningu, tym lepiej model radzi sobie z **niewidzianymi** zadaniami.

# 💡 Przykład zastosowania
Chcesz, żeby model oceniał sentyment recenzji filmowych.
Bez Instruction Tuning: Musisz dać mu 5 przykładów (Few-Shot).
Z Instruction Tuning (Flan-T5): Piszesz po prostu "Oceń sentyment: Film był słaby". Model odpowiada "Negatywny". Rozumie polecenie bez przykładów.

## 📌 Źródła
- "Scaling Instruction-Finetuned Language Models" (Chung et al., 2022).

## 👽 Brudnopis
- To dowód, że [[Jakość Danych|jakość danych]] (różnorodność instrukcji) jest ważniejsza niż rozmiar modelu. Mały model instruction-tuned (Flan-T5 XL) bił na głowę gigantycznego GPT-3 w wielu testach.
