---
title: SPICE Prompt
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: średni
language: pl
tags:
  - prompt-engineering
  - llm
  - spice
aliases:
  - Prompt SPICE
---
# 🎯 Definicja
**SPICE Prompt** to framework projektowania zapytań (prompt engineering) zorientowany na zadania biznesowe, analityczne i operacyjne. Ułatwia on precyzyjne przekazanie intencji i szczegółowych wymagań biznesowych do modeli językowych (LLM). Nazwa pochodzi od słów:
*   **S**ituation (Sytuacja i tło)
*   **P**erspective (Perspektywa, rola)
*   **I**nput (Dane wejściowe)
*   **C**onstraints (Ograniczenia i zakazy)
*   **E**xpectations (Oczekiwania dotyczące formatu i tonu odpowiedzi)

# 🔑 Kluczowe punkty
*   **Biznesowe zorientowanie:** Szczególnie przydatny przy analizie wymagań, tworzeniu dokumentacji lub generowaniu raportów biznesowych.
*   **Wydzielenie danych (Input):** Wyraźnie rozgranicza dane (np. tabele, fragmenty tekstu) od samych instrukcji działania.
*   **Bezpieczeństwo (Constraints):** Pomaga w zdefiniowaniu reguł chroniących przed ujawnieniem poufnych danych lub zbytnim uogólnieniem.

# 📚 Szczegółowe wyjaśnienie
Elementy frameworku SPICE to:

1.  **Situation (S):** Nakreślenie tła biznesowego. Dlaczego wykonujemy to zadanie? (np. *"Przygotowujemy się do wdrożenia nowej dyrektywy unijnej dotyczącej ochrony danych"*).
2.  **Perspective (P):** Rola, jaką ma przyjąć model. (np. *"Działasz jako doświadczony Oficer Ochrony Danych (DPO) w firmie FinTech"*).
3.  **Input (I):** Surowe dane, dokumenty, tabele lub fragmenty tekstu, na których model ma pracować. (np. *"Przeanalizuj poniższy fragment regulaminu świadczenia usług: [tekst]"*).
4.  **Constraints (C):** Ograniczenia techniczne i merytoryczne. (np. *"Używaj tylko pojęć zdefiniowanych w RODO, nie wymyślaj własnych interpretacji, odpowiedź nie może przekraczać 200 słów"*).
5.  **Expectations (E):** Co dokładnie chcemy otrzymać jako wynik i w jakiej formie. (np. *"Wygeneruj tabelę z dwiema kolumnami: Zapis regulaminu | Potencjalne ryzyko"*).

# 💡 Przykład zastosowania
Prompt napisany zgodnie z frameworkiem SPICE:
```markdown
[S] Przygotowujemy strategię migracji naszej platformy raportowej z SAS do SQL.
[P] Działasz jako analityk systemowy z dużym doświadczeniem w inżynierii danych.
[I] Wejściem jest poniższy fragment kodu makra SAS:
    %macro migrate(input_table);
      data output_data;
        set &input_table;
        if age > 18 then segment = 'Adult';
        else segment = 'Minor';
      run;
    %mend;
[C] Nie używaj w odpowiedzi kodu w językach innych niż standardowy ANSI SQL. Wyjaśnienie ogranicz do minimum.
[E] Chcę otrzymać odpowiadający temu makru kod instrukcji SELECT z klauzulą CASE w formacie kodu Markdown.
```

## 📌 Źródła
*   [[Wstęp do promptingu|Inżynieria Promptów (Prompt Engineering)]]
*   [[Zasady promptowania|Najważniejsze zasady projektowania promptów]]

