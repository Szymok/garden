---
title: Snowflake Pushdown (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Performance
difficulty: intermediate
language: en
tags:
  - snowflake
  - pushdown
  - performance
  - optimization
  - elt
aliases:
  - Przetwarzanie w Snowflake
  - Pushdown SQL
---
# 🎯 Definicja
**Snowflake Pushdown** to technika, w której Ataccama nie ściąga danych do siebie, żeby je przetworzyć.
Zamiast tego, wysyła zapytanie SQL do Snowflake'a: "Ty to policz, masz 1000 procesorów. Mi wyślij tylko wynik".

# 🔑 Kluczowe punkty
- **Wydajność:** Snowflake przetworzy miliard wierszy w sekundy. Ataccama (Java) musiałaby je pobrać przez sieć, co trwałoby godziny.
- **Koszt:** Płacisz za Snowflake Credits, ale oszczędzasz na transferze i serwerach Ataccamy.
- **Security:** Dane nie opuszczają Snowflake'a (dobre dla RODO).

# 📚 Szczegółowe wyjaśnienie
Kiedy uruchamiasz Profiling na tabeli w Snowflake:
1.  **Bez Pushdown:** `SELECT * FROM table`. Ataccama pobiera 1TB danych. Mieli je lokalnie.
2.  **Z Pushdown:** Ataccama generuje SQL: `SELECT AVG(age), MIN(date) FROM table`. Snowflake liczy. Ataccama dostaje 1KB wyników.

# 💡 Przykład zastosowania
Masz tabelę transakcji (5 TB). Chcesz policzyć ilość Nulli w kolumnie `Transaction_ID`.
Z Pushdown: Ataccama wysyła `SELECT COUNT(*) - COUNT(Transaction_ID) ...`.
Wynik wraca w 3 sekundy. Nie obciążasz sieci firmowej.

## 📌 Źródła
- Ataccama ONE Processing Engines Documentation.

## 👽 Brudnopis
- Pushdown to "ELT" (Extract, Load, Transform), a nie "ETL". Transformacja dzieje się w bazie docelowej.