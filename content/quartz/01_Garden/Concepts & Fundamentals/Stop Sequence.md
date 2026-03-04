---
title: Stop Sequence (LLM Control)
created: 2026-02-04
status: evergreen
category: AI / Prompt Engineering
difficulty: intermediate
language: en
tags:
  - prompting
  - api
  - control
  - generation
  - parameters
aliases:
  - Stop Token
  - Sequence Termination
---
# 🎯 Definicja
**Stop Sequence** to "hamulec ręczny" dla modelu LLM.
To ciąg znaków, po napotkaniu którego model **musi** przestać generować tekst.
Jest to parametr API (np. w OpenAI `stop=["\n", "User:"]`).

# 🔑 Kluczowe punkty
- **Oszczędność:** Nie płacisz za generowanie zbędnego bełkotu po właściwej odpowiedzi.
- **Kontrola:** Zapobiegasz sytuacji, gdzie (w trybie Few-Shot) model zaczyna generować pytania i odpowiedzi za użytkownika (halucynuje całą rozmowę).
- **Struktura:** Niezbędne przy generowaniu kodu lub sformatowanych danych (np. JSON).

# 📚 Szczegółowe wyjaśnienie
Jak działa model? Przewiduje następny token w nieskończoność (do limitu `max_tokens`).
Jeśli pokażesz mu rozmowę:
```
User: Cześć
AI: Cześć
User: Jak się masz?
AI: Dobrze
```
I poprosisz o dokończenie... Model może napisać:
`User: To super. AI: Też tak myślę. User: Pa.`
Ustawienie Stop Sequence na `User:` sprawia, że model zatrzyma się zaraz po swojej odpowiedzi.

# 💡 Przykład zastosowania
Chatbot Agenta Obsługi Klienta.
Prompt:
`Jesteś pomocnym asystentem. Rozmowa:`
`User: {pytanie}`
`Assistant:`
Ustawiasz `stop=["User:"]`.
Gdybyś tego nie zrobił, model mógłby wygenerować:
`Assistant: Proszę zresetować router. User: Dziękuję, pomogło.` (Model symuluje zadowolonego klienta, zamiast czekać na prawdziwego).

## 📌 Źródła
- OpenAI API Reference - Chat Completions.

## 👽 Brudnopis
- Częsty błąd: Spacje. `User:` to nie to samo co ` User:`. W tokenizacji spacja ma znaczenie. Najlepiej podawać warianty.