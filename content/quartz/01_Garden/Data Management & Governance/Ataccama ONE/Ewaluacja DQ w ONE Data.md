---
title: Ewaluacja DQ w ONE Data (DQ Evaluation)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - dq-evaluation
  - profiling
  - one-data
  - validation
aliases:
  - Full Profiling DQ
  - Ocena Jakości Danych
---
# 🎯 Definicja
**DQ Evaluation** w [[Ataccama|Ataccama]] ONE to proces, który łączy pełne profilowanie (Full [[Profiling|Profiling]]) z uruchomieniem reguł jakości (DQ [[Rules|Rules]]). Wynikiem jest kompleksowy raport pokazujący, które rekordy są "Invalid" (błędne) w kontekście przypisanych terminów biznesowych i reguł.

# 🔑 Kluczowe punkty
- **Zakres:** Działa na całej tabeli (wszystkie wiersze).
- **Automatyzacja:** Jeśli kolumna ma przypisany Termin (np. Email), system automatycznie odpala reguły dla Emaila.
- **Wyniki:** Dostępne na poziomie Atrybutu (% poprawności kolumny), Wiersza (czy rekord jest czysty) i Komórki (konkretny błąd).
- **Walidacja Live:** Po pierwszym uruchomieniu, edycja ręczna wiersza jest walidowana "w locie".

# 📚 Szczegółowe wyjaśnienie
Kroki procesu:
1.  **Discovery:** Wykrycie terminów (np. "To jest PESEL").
2.  **Assignment:** Przypisanie reguł (np. "PESEL musi mieć 11 cyfr").
3.  **Evaluation:** Sprawdzenie każdego rekordu.
4.  **Reporting:** Wyliczenie "Overall Quality" (np. 98.5%).

Metryka **Overall Quality** jest agregatem ważonym. Możesz skonfigurować, że "Poprawność Syntaktyczna" jest ważniejsza niż "Kompletność".

# 💡 Przykład zastosowania
Wgrywasz plik Excel z danymi klientów ("Brudne dane").
Klikasz "Run Full [[Profiling|Profiling]] & DQ Evaluation".
System pokazuje: "Jakość tabeli: 80%".
Wchodzisz w zakładkę "DQ Insights" i widzisz, że 20% maili nie ma znaku `@`.
Poprawiasz jeden rekord ręcznie -> system od razu zmienia jego status na "Valid", ale nie przelicza całej statystyki tabeli (wymaga ponownego uruchomienia).

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Run DQ Evaluation.

## 👽 Brudnopis
- "Invalid Record" = przynajmniej jedna komórka w wierszu jest błędna.
- Można to uruchamiać cyklicznie (Scheduler), aby monitorować jakość [[Bazy danych|bazy danych]] w czasie (Trend Jakości).