---
title: Elementy Promptów (Anatomia Promptu)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: basic
language: pl
tags:
  - prompt-structure
  - context
  - instruction
  - llm
aliases:
  - Składnia Promptu
  - Prompt Elements
---
# 🎯 Definicja
Dobry **Prompt** to nie tylko pytanie. To strukturalne polecenie, które powinno zawierać kluczowe komponenty: **Rolę, Kontekst, Instrukcję, Dane Wejściowe i Format Wyjściowy**. Im lepiej zdefiniujesz te elementy, tym lepszą odpowiedź uzyskasz od modelu AI.

# 🔑 Kluczowe punkty
- **Rola (Persona):** Kim ma być AI? (np. "Jesteś Senior Python Developerem").
- **Kontekst:** Tło sytuacji (np. "Piszę aplikację dla banku").
- **Instrukcja (Task):** Co dokładnie zrobić (np. "Napisz funkcję walidującą IBAN").
- **Constraint (Ograniczenia):** Czego nie robić (np. "Nie używaj bibliotek zewnętrznych").
- **Format:** Jak oddać wynik (np. "Tylko kod, bez wyjaśnień, w bloku markdown").

# 📚 Szczegółowe wyjaśnienie
Wzór na idealny prompt (często zwany "MEGA Prompt"):
`[ROLA] + [KONTEKST] + [ZADANIE] + [DANE] + [OGRANICZENIA] + [FORMAT]`
Modele LLM są stochastyczne. Dając im strukturę, zawężasz przestrzeń prawdopodobieństwa do tych odpowiedzi, na których ci zależy.

# 💡 Przykład zastosowania
Słaby prompt: "Napisz maila do klienta."
Dobry prompt:
"Jesteś Specjalistą ds. Obsługi Klienta (Rola). Klient jest zdenerwowany opóźnieniem paczki (Kontekst). Napisz przeprosiny i zaoferuj 10% rabatu (Zadanie). Bądź uprzejmy, ale konkretny (Styl). Nie obiecuj daty dostawy (Ograniczenie). Wynik jako czysty tekst maila (Format)."

## 📌 Źródła
- "[[Prompt Engineering Guide|Prompt Engineering Guide]]" - promptingguide.ai.

## 👽 Brudnopis
- Warto eksperymentować z kolejnością (czasem instrukcja na końcu działa lepiej - [[Recency Bias]]).
- Technika "Few-Shot" polega na dodaniu do elementów promptu kilku przykładów (Input -> Output).