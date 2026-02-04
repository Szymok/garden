---
title: General Prompt Design Tips (Dobre Praktyki)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: basic
language: pl
tags:
  - prompting
  - guidelines
  - best-practices
  - llm
  - communication
aliases:
  - Zasady Promptowania
  - Efektywne Prompty
---
# 🎯 Definicja
Pisanie promptów to sztuka komunikacji z modelem AI. Zasada jest prosta: **Jakość wejścia determinuje jakość wyjścia** (Garbage In, Garbage Out). Dobre prompty są jasne, konkretne i dają modelowi kontekst.

# 🔑 Kluczowe Zasady
1.  **Bądź Konkretny:** Nie pisz "Napisz coś o psach". Pisz "Napisz 3-akapitowy artykuł o szkoleniu psów rasy Border Collie dla początkujących".
2.  **Daj Kontekst:** "Jesteś trenerem psów z 20-letnim doświadczeniem".
3.  **Użyj Separatorów:** Oddziel instrukcje od daty (np. używając `###` lub `"""`), żeby model wiedział, co jest czym.
4.  **Format Wyjściowy:** Powiedz, jak chcesz dostać wynik ("Zwróć wynik jako tabelę Markdown").

# 📚 Szczegółowe wyjaśnienie
Model LLM jest jak bardzo zdolny, ale literalny stażysta. Jeśli nie powiesz mu dokładnie, co ma zrobić, zgadnie. Często źle.
Unikaj negacji ("Nie pisz długich zdań"). Mózg (i AI) słabo radzi sobie z "nie". Lepiej: "Pisz krótkie, zwięzłe zdania".

# 💡 Przykład (Before & After)
🔴 **Źle:**
"Zrób podsumowanie tego tekstu."

🟢 **Dobrze:**
"Jesteś redaktorem technologicznym. Przeczytaj poniższy tekst o AI. Przygotuj podsumowanie w formie 5 punktów (bullet points), skupiając się na zagrożeniach dla prywatności. Styl: profesjonalny, ale przystępny.
Tekst: [Wklej tekst]
"

## 📌 Źródła
- OpenAI Prompt Engineering Guide.

## 👽 Brudnopis
- Chain-of-Thought ("Pomyśl krok po kroku") to jedna z najprostszych metod na skokową poprawę jakości przy trudnych zadaniach logicznych.
