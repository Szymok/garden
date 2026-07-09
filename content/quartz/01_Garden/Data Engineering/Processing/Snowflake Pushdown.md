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
**[[Snowflake|Snowflake]] Pushdown** to technika, w której [[Ataccama|Ataccama]] nie ściąga danych do siebie, żeby je przetworzyć.
Zamiast tego, wysyła zapytanie [[SQL|SQL]] do [[Snowflake|Snowflake]]'a: "Ty to policz, masz 1000 procesorów. Mi wyślij tylko wynik".

# 🔑 Kluczowe punkty
- **Wydajność:** [[Snowflake|Snowflake]] przetworzy miliard wierszy w sekundy. [[Ataccama|Ataccama]] (Java) musiałaby je pobrać przez sieć, co trwałoby godziny.
- **Koszt:** Płacisz za [[Snowflake|Snowflake]] Credits, ale oszczędzasz na transferze i serwerach Ataccamy.
- **Security:** Dane nie opuszczają [[Snowflake|Snowflake]]'a (dobre dla RODO).

# 📚 Szczegółowe wyjaśnienie
Kiedy uruchamiasz [[Profiling|Profiling]] na tabeli w [[Snowflake|Snowflake]]:
1.  **Bez Pushdown:** `SELECT * FROM table`. [[Ataccama|Ataccama]] pobiera 1TB danych. Mieli je lokalnie.
2.  **Z Pushdown:** [[Ataccama|Ataccama]] generuje [[SQL|SQL]]: `SELECT AVG(age), MIN(date) FROM table`. [[Snowflake|Snowflake]] liczy. [[Ataccama|Ataccama]] dostaje 1KB wyników.

# 💡 Przykład zastosowania
Masz tabelę transakcji (5 TB). Chcesz policzyć ilość Nulli w kolumnie `Transaction_ID`.
Z Pushdown: [[Ataccama|Ataccama]] wysyła `SELECT COUNT(*) - COUNT(Transaction_ID) ...`.
Wynik wraca w 3 sekundy. Nie obciążasz sieci firmowej.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Processing Engines Documentation.

## 👽 Brudnopis
- Pushdown to "ELT" (Extract, Load, Transform), a nie "ETL". Transformacja dzieje się w bazie docelowej.