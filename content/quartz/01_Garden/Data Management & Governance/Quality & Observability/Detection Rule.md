---
title: Detection Rule (Reguła Wykrywania)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - detection
  - classification
  - discovery
  - regex
aliases:
  - Reguła Wykrywania
  - Term Detection Rule
---
# 🎯 Definicja
**Detection Rule** (Reguła Wykrywania) to logika używana w Data Catalogu do automatycznego rozpoznawania, co znajduje się w kolumnie. Dzięki niej system "wie", że kolumna `klient_mail` to tak naprawdę **Email Address** (Business Term), a kolumna `usr_dob` to **Date of Birth**.

# 🔑 Kluczowe punkty
- **Cel:** Automatyzacja mapowania słownika biznesowego (Glossary) na warstwę techniczną (Discovery).
- **Metody:** Condition Builder (GUI) lub Advanced Expression (kod/regex).
- **Zastosowanie:** Działa podczas skanowania/profilowania danych.
- **Efekt:** Automatyczne tagowanie kolumn (np. "To wrażliwe dane PII").

# 📚 Szczegółowe wyjaśnienie
Reguł nie wykrywają "błędów" (jak DQ Rules), ale "znaczenie".
Typowe warunki:
1.  **Nazwa kolumny:** `Contains("pesel")`
2.  **Format danych:** `MatchesRegex("\d{11}")`
3.  **Wartości:** Ponad 90% wartości to 11 cyfr.
Jeśli warunki są spełnione, system sugeruje Stewardowi: "Hej, ta kolumna to chyba PESEL, czy mam przypisać ten termin?".

# 💡 Przykład zastosowania
Masz 500 tabel z danymi klientów.
Chcesz znaleźć wszystkie kolumny przechowujące karty kredytowe.
Tworzysz Regułę Wykrywania:
`IF column_name LIKE '%card%' OR '%cc%' AND data matches Luhn Algorithm -> Suggest Term "Credit Card Number"`.
Uruchamiasz Discovery. System znajduje 50 kolumn w różnych tabelach, oznaczając je jako wrażliwe.

## 📌 Źródła
- Ataccama ONE Documentation - Detection Rules.

## 👽 Brudnopis
- Reguły te są kluczowe w **Data Classification** (np. RODO).
- Można łączyć logikę: Nazwa Kolumny + Próbka Danych (Data Sample) dają największą skuteczność.