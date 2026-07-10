---
title: DELTA Prompt
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: średni
language: pl
tags:
  - prompt-engineering
  - llm
  - delta
aliases:
  - Prompt DELTA
---
# 🎯 Definicja
**DELTA Prompt** to strukturalny framework inżynierii promptów (prompt engineering) ułatwiający tworzenie precyzyjnych i powtarzalnych zapytań do modeli językowych (LLM). Nazwa jest akronimem od kluczowych elementów struktury promptu:
*   **D**efine role (Określ rolę)
*   **E**xplain context (Wyjaśnij kontekst)
*   **L**imit parameters (Ogranicz parametry i zasady)
*   **T**emplate (Szablon wyjściowy)
*   **A**udience (Grupa docelowa)

# 🔑 Kluczowe punkty
*   **Strukturyzacja:** Pomaga uniknąć "wolnej amerykanki" w pisaniu promptów, narzucając jasną i logiczną strukturę.
*   **Precyzja:** Przez jawne określenie ograniczeń (L) i szablonu (T), model generuje znacznie mniej halucynacji i zbędnych wtrąceń.
*   **Rola i kontekst:** Silnie wiąże rolę (D) z kontekstem (E), co ułatwia modelowi aktywowanie odpowiednich obszarów wiedzy.

# 📚 Szczegółowe wyjaśnienie
Pisanie dobrych promptów wymaga dostarczenia modelowi optymalnego kontekstu i instrukcji. Framework DELTA porządkuje ten proces:

1.  **Define role (D):** Kim model ma być? (np. *"Działasz jako doświadczony deweloper baz danych SQL"*).
2.  **Explain context (E):** Jaka jest sytuacja i co chcemy osiągnąć? (np. *"Chcemy przenieść dane analityczne z bazy PostgreSQL do magazynu danych Snowflake"*).
3.  **Limit parameters (L):** Jakie są restrykcje, zasady, czego nie robić? (np. *"Nie używaj funkcji okna, zachowaj kompatybilność ze standardem ANSI SQL, nie dodawaj żadnego komentarza poza kodem"*).
4.  **Template (T):** W jakim formacie ma być odpowiedź? (np. *"Przedstaw wynik wyłącznie jako blok kodu markdown"*).
5.  **Audience (A):** Do kogo jest kierowany wynik? (np. *"Odbiorcą kodu będzie młodszy programista, kod musi być łatwy do odczytania"*).

Dzięki takiemu rozbiciu instrukcji, LLM otrzymuje czyste, niesprzeczne i łatwe do przetworzenia instrukcje.

# 💡 Przykład zastosowania
Przykładowy prompt napisany zgodnie z frameworkiem DELTA:
```markdown
[D] Działasz jako ekspert ds. Jakości Danych (Data Quality Specialist) w zespole Data Governance.
[E] Musimy przygotować definicję reguły sprawdzającej poprawność numerów PESEL w nowym systemie CRM.
[L] Zasady: Reguła musi weryfikować sumę kontrolną oraz długość (11 znaków). Format wyjściowy to czysty SQL dla silnika Ataccama. Nie używaj funkcji specyficznych dla baz Oracle.
[T] Wynik przedstaw w postaci: 
    - Nazwa reguły
    - Krótki opis logiczny
    - Kod SQL wyrażenia walidacyjnego
[A] Odbiorcą dokumentu jest analityk biznesowy, który zatwierdza reguły.
```

## 📌 Źródła
*   [[Wstęp do promptingu|Prompting w cyfrowym ogrodzie]]
*   [[Zasady promptowania|Zasady tworzenia dobrych promptów]]

