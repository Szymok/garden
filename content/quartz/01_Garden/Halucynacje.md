---
title: Halucynacje (Hallucinations)
created: 2026-02-04
status: evergreen
category: LLM / AI Safety
difficulty: basic
language: pl
tags:
  - hallucinations
  - errors
  - factuality
  - safety
aliases:
  - Konfabulacje
  - Błędy AI
  - Zmyślanie
---
# 🎯 Definicja
**Halucynacje** to zjawisko, w którym model językowy ([[Base LLM|LLM]]) generuje odpowiedź, która jest gramatycznie poprawna i brzmi pewnie, ale jest merytorycznie **fałszywa** lub nie ma pokrycia w rzeczywistości. Model nie "kłamie" celowo - on po prostu przewiduje kolejne słowo, nie weryfikując prawdy.

# 🔑 Kluczowe punkty
- **Pewność siebie:** Najgroźniejsze jest to, że AI halucynuje z pełnym przekonaniem ("Oczywiście, bitwa pod Grunwaldem była w 1990 roku").
- **Źródło:** Wynika z natury probabilistycznej modeli (zgadują, co pasuje statystycznie).
- **Rodzaje:**
    - **Faktograficzne:** Zmyślone daty, nazwiska.
    - **Logiczne:** Błędne wnioskowanie (A > B, B > C, więc C > A - błąd).

# 📚 Szczegółowe wyjaśnienie
Dlaczego modele halucynują?
Bo nie mają dostępu do "bazy prawdy". Uczyły się na całym internecie, gdzie jest dużo fikcji i błędów. Jeśli zapytasz o nieistniejącą książkę, model może wymyślić jej fabułę, bo widział tysiące opisów książek i wie, jak taki opis powinien wyglądać.
Metody walki: [[RAG]] (daj modelowi źródło), [[Chain-of-Thought Prompting]] (każ mu myśleć powoli), ograniczanie Temperatury.

# 💡 Przykład zastosowania
Prawnik użył ChatGPT do napisania pozwu.
Model zacytował 6 precedensowych wyroków sądowych.
Okazało się, że żaden z tych wyroków nie istniał - model je wymyślił, bo brzmiały "prawniczo".
Prawnik miał poważne kłopoty dyscyplinarne.

## 📌 Źródła
- "Survey on Hallucination in Large Language Models" (J. Zhang et al.).

## 👽 Brudnopis
- Halucynacja to "cecha, nie błąd" (feature, not a bug) w przypadku zadań kreatywnych (pisanie bajek). Jest błędem tylko w zadaniach faktograficznych.