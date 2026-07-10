---
title: Podstawy Promptowania (Prompting Basics)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: basic
language: pl
tags:
  - prompting
  - basics
  - llm
  - communication
aliases:
  - Prompt Basics
  - Czym jest prompt
  - Wstęp do promptingu
---
# 🎯 Definicja
**Prompt** to tekst, który wpisujesz do AI. To polecenie, pytanie lub początek historii. Inżynieria Promptów (Prompt Engineering) to sztuka dobierania słów tak, żeby model zrozumiał intencję i dał najlepszy możliwy wynik.

# 🔑 Kluczowe punkty
- **Model to uzupełniacz tekstu:** LLM próbuje zgadnąć "jakie słowo pasuje najlepiej jako następne". Prompt nadaje kierunek temu zgadywaniu.
- **Struktura:** Dobry prompt ma: Rolę ("Jesteś ekspertem..."), Zadanie ("Napisz..."), Kontekst ("Dla klienta...") i Format ("W tabeli...").
- **Iteracja:** Pierwszy prompt rzadko jest idealny. Trzeba go poprawiać.

# 📚 Szczegółowe wyjaśnienie
Rodzaje:
- **Zero-Shot:** Zadajesz pytanie bez przykładów ("Przetłumacz na polski: Cat").
- **Few-Shot:** Dajesz przykłady ("Dog -> Pies. Cat -> ?"). To drastycznie zwiększa skuteczność.
- **Chain-of-Thought:** Prosisz model "Pomyśl krok po kroku". Zwiększa logikę.

# 💡 Przykład zastosowania
Zamiast pisać: "Napisz maila o podwyżkę."
Napisz:
"Jesteś doświadczonym pracownikiem korporacji. Napisz profesjonalny, ale stanowczy e-mail do szefa z prośbą o spotkanie w sprawie rewizji wynagrodzenia. Podkreśl moje ostatnie sukcesy (projekt X, projekt Y). E-mail ma być krótki."

## 📌 Źródła
- Learn Prompting Course.

## 👽 Brudnopis
- Traktuj AI jak nowego, zdolnego stażystę, który nie zna kontekstu Twojej firmy. Musisz mu wszystko wytłumaczyć.