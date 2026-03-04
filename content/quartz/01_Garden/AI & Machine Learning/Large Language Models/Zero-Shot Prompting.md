---
title: Zero-Shot Prompting
created: 2026-02-04
status: evergreen
category: AI / Prompt Engineering
difficulty: basic
language: pl
tags:
  - zero-shot
  - prompting
  - llm
  - generalization
aliases:
  - Zero-shot
  - Brak przykładów
---
# 🎯 Definicja
**Zero-Shot Prompting** to metoda, w której prosisz model AI o wykonanie zadania **bez podawania żadnych przykładów**.
Polegasz na jego ogólnej wiedzy ze świata.
"Przetłumacz to na polski: Hello". (Nie dajesz przykładów tłumaczeń, model "wie" co to tłumaczenie).

# 🔑 Kluczowe punkty
- **Najprostsza technika:** Po prostu pytasz.
- **Wymaga Instruction Tuning:** Działa dobrze na modelach trenowanych do wykonywania poleceń (jak GPT-4, Claude), słabo na starych modelach (jak GPT-3 Base).
- **Ograniczenia:** Jeśli zadanie jest nietypowe ("Sformatuj to w JSON w specyficzny sposób X"), Zero-Shot często zawodzi. Wtedy użyj [[Few-Shot Prompting]].

# 📚 Szczegółowe wyjaśnienie
Modele LLM widziały miliardy tekstów. Widziały tłumaczenia, streszczenia, klasyfikacje.
Zero-Shot to test ich generalizacji.
Jeśli prompt jest jasny ("Napisz wiersz o kocie"), model zrozumie intencję.

# 💡 Przykład zastosowania
Zero-Shot:
`User: "Zaklasyfikuj sentyment: 'Ten film był okropny'."`
`AI: "Negatywny."`

Few-Shot (gdyby Zero-Shot zawiódł):
`User: "Dobre -> Pozytywny. Złe -> Negatywny. Ten film był okropny -> ?"`

## 📌 Źródła
- Prompt Engineering Guide.

## 👽 Brudnopis
- To domyślny sposób, w jaki ludzie rozmawiają z ChatGPT. Dopiero gdy model nie rozumie, dodajemy przykłady (Few-Shot) lub instrukcje krok-po-kroku (Chain-of-Thought).