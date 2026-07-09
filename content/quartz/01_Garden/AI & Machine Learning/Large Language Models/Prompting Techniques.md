---
title: Prompting Techniques (Techniki Promptowania)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: advanced
language: pl
tags:
  - cot
  - tot
  - rag
  - few-shot
  - zero-shot
  - strategies
aliases:
  - Techniki Promptowania
  - CoT vs ToT
  - Advanced Prompting
---
# 🎯 Definicja
Istnieje wiele sformalizowanych metod pisania promptów, które naukowo udowodniły swoją wyższość nad "zwykłym pytaniem". Te techniki pomagają modelowi przezwyciężyć jego ograniczenia (brak pamięci, słaba arytmetyka, [[Halucynacje|halucynacje]]).

# 🔑 Przegląd Technik
1.  **[[Zero-Shot Prompting]]:** Brak przykładów. Działa dla prostych zadań.
2.  **[[Few-Shot Prompting]]:** Podanie 1-5 przykładów (Input -> Output) w prompcie. _Najlepszy stosunek wysiłku do efektu._
3.  **[[Chain-of-Thought Prompting]] (CoT):** Wymuszenie "kroku po kroku". _Kluczowe dla logiki i matematyki._
4.  **[[Self-Consistency|Self-Consistency]]:** Zapytaj model 3 razy o to samo i wybierz najczęstszą odpowiedź (Głosowanie). _Redukuje błędy losowe._
5.  **[[Tree of Thoughts|Tree of Thoughts]] (ToT):** Kazanie modelowi symulować kilku ekspertów dyskutujących nad problemem. _Dla bardzo trudnych problemów kreatywnych._
6.  **ReAct (Reason + Act):** Model myśli, decyduje jakie narzędzie użyć (np. Google Search), używa go, i wraca do myślenia. _Podstawa Autonomicznych Agentów._

# 📚 Kiedy co stosować?
- Piszesz maila? -> **Role Prompting** ("Jesteś copywriterem").
- Liczysz budżet? -> **CoT** ("Rozbij to na małe kroki").
- Klasyfikujesz trudne teksty? -> **Few-Shot** (Daj 3 przykłady trudnych tekstów).
- Budujesz autonomicznego robota? -> **ReAct**.

# 💡 Przykład
**Chain-of-Thought w praktyce:**
Zamiast: "Ile to 23 * 41?"
Napisz: "Oblicz 23 * 41. Pokaż obliczenia pośrednie."
Model: "20 * 40 = 800. 3 * 40 = 120... Suma = 943."
Szansa na poprawny wynik rośnie drastycznie.

## 📌 Źródła
- Wei et al. (2022) "[[Chain-of-Thought Prompting|Chain-of-Thought Prompting]] Elicits Reasoning in Large Language Models".

## 👽 Brudnopis
- Większość "magicznych promptów" w internecie to po prostu ładnie opakowany Few-Shot lub CoT.