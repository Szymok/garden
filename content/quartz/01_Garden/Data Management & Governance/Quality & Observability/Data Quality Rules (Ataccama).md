---
title: Data Quality Rules (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / DQ
difficulty: basic
language: pl
tags:
  - rules
  - dq
  - validation
  - logic
  - expression
aliases:
  - Reguły Jakości Danych
  - DQ Checks
---
# 🎯 Definicja
**DQ [[Rules|Rules]]** to małe kawałki logiki, które odpowiadają na pytanie: "Czy ta wartość jest poprawna?".
Przykład: "Czy Wiek > 0?", "Czy Email zawiera @?", "Czy PESEL ma 11 cyfr?".

# 🔑 Kluczowe punkty
- **Reusable:** Raz napisana reguła "Poprawny Email" może być użyta w 100 tabelach.
- **Business Logic:** To tutaj tłumaczysz wymagania biznesowe ("Klient VIP musi mieć telefon") na kod.
- **Statusy:** Reguła zazwyczaj zwraca: `TRUE` (Dobre), `FALSE` (Złe) lub kody błędów (`ERR_FORMAT`, `ERR_MISSING`).

# 📚 Szczegółowe wyjaśnienie
W [[Ataccama|Ataccama]] ONE reguły tworzysz na 3 sposoby:
1.  **No-Code (Expression Builder):** Klikasz klocki ("Length > 5").
2.  **Expression ([[Ataccama|Ataccama]] Expression Language):** Piszesz kod (podobny do Java/[[SQL|SQL]]). `length(value) > 5`.
3.  **Component:** Skomplikowane diagramy przepływu (dla bardzo złożonej logiki, np. walidacja adresu z geo-kodowaniem).

# 💡 Przykład zastosowania
Dział Sprzedaży narzeka na jakość telefonów.
Tworzysz regułę `Check_Phone_Number`.
Logika:
- Usuń spacje i myślniki.
- Sprawdź, czy są same cyfry.
- Sprawdź, czy długość wynosi 9 (dla PL).
Wpinasz regułę w Monitoring. Od teraz wiesz dokładnie, jaki % numerów jest błędnych.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE [[Rules|Rules]] Reference.

## 👽 Brudnopis
- Nie myl Reguł (Logic) z Planami (Execution). Reguła to definicja. Plan to uruchomienie tej reguły na konkretnym pliku.
