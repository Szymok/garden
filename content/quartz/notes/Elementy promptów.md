---

title: Elementy promptów  
created: 2025-07-16  
status: Final  
category: Prompt Engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- inżynieria promptów
- ai  
aliases:
- wiadomość
- komunikat AI

---

# 🎯 Definicja

**Prompt** to instrukcja, polecenie, pytanie lub dowolny komunikat przekazywany systemowi sztucznej inteligencji, który pozwala uzyskać oczekiwaną odpowiedź, wykonać zadanie lub wygenerować konkretny rodzaj treści. Prompt pełni rolę „języka” komunikacji między człowiekiem a modelem AI – precyzyjna i przemyślana konstrukcja promptu jest kluczem do skutecznych interakcji.

# 🔑 Kluczowe elementy promptu

W praktyce prompt może zawierać dowolne z poniższych elementów – ich dobór zależy od celu i kontekstu zadania:

- **Polecenie (instrukcja):**
    
    - Opisuje konkretne zadanie do wykonania przez model, np. „Podsumuj tekst w trzech punktach”, „Podaj kod w Pythonie obliczający sumę liczb parzystych od 1 do 100”.
- **Kontekst:**
    
    - Dodatkowe informacje, tło lub wcześniejsze fragmenty rozmowy, które pomagają modelowi zrozumieć założenia i uwarunkowania, np. „Jestem właścicielem sklepu z biżuterią. Zaplanuj działania marketingowe…”.
- **Dane wejściowe:**
    
    - Konkretny tekst, liczba, fragment danych czy pytanie, na bazie których model ma zadziałać. Przykład: “Tekst do podsumowania…”, “Co oznacza termin ‘prompt engineering’?”
- **Output indicator (wskazówka co do formatu/typu odpowiedzi):**
    
    - Określenie, w jakim formacie ma być wynik – np. “Odpowiedz w formie listy”, “Przygotuj tabelę porównawczą”, “Wyjaśnij eksperckim językiem”.

Ważne: Nie każdy prompt musi zawierać wszystkie te elementy, ich zestaw zależy od złożoności zadania i celu interakcji.

# 📚 Szczegółowe wyjaśnienie

Prompty mogą być:

- **Bardzo proste** („Kto był pierwszym prezydentem Polski?”)
- **Rozbudowane/podzielone na sekcje** (wieloelementowe instrukcje z kontekstem, przykładem i oczekiwanym formatem wyjściowym)
- **Kontekstowe** (nawiązujące do wcześniejszych rozmów lub sytuacji)
- **Warunkowe lub instruktażowe** (wielokrokowe, scenariusze „jeśli... to wtedy...”, [[Roles|role]], ograniczenia)

Przemyślane uwzględnienie wszystkich użytecznych elementów promptu jest jednym z fundamentów skutecznej pracy z modelami AI – im bardziej zrozumiała i kompletna będzie instrukcja, tym większa szansa na adekwatny, precyzyjny rezultat.

# 💡 Przykład konstrukcji promptu

Polecenie:  
„Jako ekspert ds. finansów, wyjaśnij w trzech punktach, jak działa podatek PIT.”

Kontekst:  
„Załóż, że odbiorcą jest student pierwszego roku ekonomii.”

Dane wejściowe:  
Brak, instrukcja oparta na wiedzy ogólnej.

Output indicator:  
“Odpowiedź podaj w formie ponumerowanej listy.”

# 📌 Źródła

- maxroy.agency/baza-wiedzy/prompt/
- promptowy.com/co-to-jest-prompt-kompletny-przewodnik-po-promptach-w-ai
- cyrekdigital.com/pl/baza-wiedzy/prompt/
- (użyte do weryfikacji i poszerzenia zakresu)

## 👽 Brudnopis

- Konkretny cel promptu = jasna instrukcja + odpowiedni kontekst + sample input/output
- Output indicator może wskazywać styl: ekspercki, laicki, tabela, markdown
- Prompty iteracyjne = zadanie + feedback i poprawka
- [[Roles|Role]]-based prompt = „Jako X, wykonaj Y…”
- Przemieszanie elementów = duża elastyczność – skuteczność zależna od jakości instrukcji

---