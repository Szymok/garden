---
title: Multimodal CoT Prompting
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: advanced
language: pl
tags:
  - chain-of-thought
  - multimodal
  - vision
  - llm
  - techniques
aliases:
  - Multimodalne Łańcuchy Myśli
  - Text+Vision Prompting
---
# 🎯 Definicja
**Multimodal CoT (Chain-of-Thought)** to technika, w której model AI "myśli na głos" (krok po kroku), używając nie tylko tekstu, ale i obrazu. Zamiast pytać tylko o tekst, pokazujesz modelowi zdjęcie i prosisz: "Przeanalizuj ten obraz krok po kroku i odpowiedz na pytanie".

# 🔑 Kluczowe punkty
- **Synergia:** Obraz dostarcza faktów (np. co jest na zdjęciu), tekst dostarcza logiki. Razem dają lepsze wyniki niż każda modalność osobno.
- **Redukcja halucynacji:** Model widzi "dowód" na obrazku, więc rzadziej zmyśla [[Fakty|fakty]] wizualne.
- **Dwuetapowość:**
    1.  **Rationale Generation:** Wygeneruj opis/powód na podstawie obrazu i tekstu.
    2.  **Inference:** Wywnioskuj odpowiedź na podstawie tego opisu.

# 📚 Szczegółowe wyjaśnienie
Tradycyjne LLM (GPT-3) były ślepe. Nowoczesne LMM (Large Multimodal Models, np. GPT-4V, Gemini) widzą.
Multimodal CoT wymusza na modelu jawną werbalizację tego, co widzi, zanim podejmie decyzję.
Przykład: Zamiast zgadywać "To jest niedźwiedź", model "myśli":
1. "Widzę zwierzę z białym futrem."
2. "Stoi na krze lodowej."
3. "Tło to lodowiec."
4. "Wniosek: To niedźwiedź polarny."

# 💡 Przykład zastosowania
Diagnoza medyczna.
Prompt: "Przeanalizuj to zdjęcie RTG. Krok 1: Opisz stan płuc. Krok 2: Sprawdź widoczność serca. Krok 3: Czy widzisz nieprawidłowości? Krok 4: Postaw wstępną diagnozę."
Dzięki temu lekarz widzi **tok rozumowania** AI, a nie tylko suchy wynik "Zapalenie płuc".

## 📌 Źródła
- "Multimodal Chain-of-Thought Reasoning in Language Models" (Amazon Science).

## 👽 Brudnopis
- Multimodalność to przyszłość agentów AI (np. roboty, które muszą widzieć i rozumieć świat).