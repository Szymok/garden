---
title: Idempotentność (Niezawodność Operacji)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - software-engineering
  - reliability
  - rest-api
  - pipelines
aliases:
  - Idempotency
  - Idempotent
  - Powtarzalność
---
# 🎯 Definicja
**Idempotentność** to cecha operacji, która gwarantuje, że **wielokrotne wykonanie tego samego działania daje ten sam efekt**, co wykonanie go tylko raz. W inżynierii danych oznacza to, że jeśli Twój pipeline się wywali w połowie i uruchomisz go ponownie, nie będziesz miał zduplikowanych danych w bazie.

# 🔑 Kluczowe punkty
- **Wzór:** `f(f(x)) = f(x)`.
- **Bezpieczeństwo:** Pozwala na bezpieczne "Retry" (ponawianie) błędnych zadań.
- **Przykłady:**
    - `x = 5` (Idempotentne - po 100 razach x nadal równa się 5).
    - `x = x + 1` (Nieidempotentne - każde uruchomienie zmienia wynik).
    - `DELETE FROM users WHERE id=1` (Idempotentne - za pierwszym razem usuwa, za drugim nic nie robi, stan końcowy ten sam: brak użytkownika).

# 📚 Szczegółowe wyjaśnienie
W systemach rozproszonych (chmura, mikroserwisy) błędy sieci są nieuniknione. Komunikat "Potwierdzenie zamówienia" może zostać wysłany dwa razy przez błąd WiFi.
Jeśli system nie jest idempotentny, klient zostanie obciążony dwa razy.
Jeśli jest idempotentny, drugie żądanie zostanie zignorowane lub nadpisze pierwsze tym samym stanem.
W ETL osiągamy to przez `INSERT OVERWRITE` lub `MERGE` zamiast `INSERT INTO`.

# 💡 Przykład zastosowania
Airflow Task: "Pobierz dane za wczoraj i wstaw do tabeli".
Jeśli użyjesz `INSERT`, a task padnie tuż przed końcem (ale po wstawieniu połowy rekordów), to przy ponownym uruchomieniu będziesz miał duplikaty.
Rozwiązanie Idempotentne:
1. Usuń dane z tabeli za wczoraj (`DELETE WHERE date = yesterday`).
2. Wstaw dane.
Teraz możesz uruchamiać task 50 razy, a wynik zawsze będzie poprawny.

## 📌 Źródła
- "Designing Data-Intensive Applications" - Martin Kleppmann.

## 👽 Brudnopis
- Metody HTTP: GET, PUT, DELETE są idempotentne. POST **nie jest**.
- W świecie Data Engineering dążymy do tego, by każdy DAG był idempotentny.