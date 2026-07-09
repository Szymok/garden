---
title: Automatic Prompt Engineer (APE)
created: 2026-02-04
status: evergreen
category: AI/LLM
difficulty: advanced
language: pl
tags:
  - prompt-engineering
  - automation
  - optimization
  - ape
aliases:
  - APE
  - Automatyczna inżynieria promptów
---
# 🎯 Definicja
**Automatic Prompt Engineer (APE)** to framework, który traktuje tworzenie promptów jako problem optymalizacyjny (programowanie). Zamiast człowieka piszącego instrukcje, model LLM sam generuje, testuje i wybiera najlepsze prompty do danego zadania.

# 🔑 Kluczowe punkty
- **Black-box optimization:** APE nie potrzebuje dostępu do wag modelu (działa z API [[GPT-4|GPT-4]]/Claude).
- **Proces:** Generuj kandydatów -> Ewaluuj wyniki -> Wybierz najlepszy -> Mutuj (ulepszaj).
- **Wyniki:** Często findet prompty lepsze od ludzkich (np. słynne "Let's work this out in a step by step way to be sure we have the right answer").

# 📚 Szczegółowe wyjaśnienie
Ręczne pisanie promptów to metoda prób i błędów ("dodam 'jesteś ekspertem', może pomoże").
APE automatyzuje ten proces.
1. Dajesz mu 5 przykładów wejścia i wyjścia (Input-Output pairs).
2. APE pyta LLM: "Jaka instrukcja mogła doprowadzić do takich wyników?".
3. Dostaje 10 propozycji.
4. Testuje każdą propozycję na zbiorze walidacyjnym.
5. Zwraca najlepszą instrukcję.

# 💡 Przykład zastosowania
Chcesz, żeby model zamieniał potoczny tekst na JSON.
Zamiast męczyć się z pisaniem "Jesteś parserem JSON, nie dodawaj komentarzy...", dajesz APE przykłady tekstów i oczekiwanych JSON-ów. APE znajduje prompt, który daje 99% skuteczności, np. "Translate user intent into structured JSON format strictly following schema X".

## 📌 Źródła
- Zhou et al., "Large Language Models Are Human-Level Prompt Engineers", arXiv:2211.01910.

## 👽 Brudnopis
- To "Meta-prompting" na sterydach.
- "Prompt programming" staje się rzeczywistością.