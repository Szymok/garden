---
title: Data Quality Firewalls (Zapory Jakości Danych)
created: 2026-02-04
status: evergreen
category: Ataccama/DQ
difficulty: advanced
language: pl
tags:
  - dq-firewall
  - api
  - real-time
  - garbage-in-garbage-out
aliases:
  - DQ Firewalls
  - Zapora Jakości
---
# 🎯 Definicja
**DQ Firewall** to usługa w [[Ataccama|Ataccama]] ONE, która wystawia reguły jakości danych jako **API**. Pozwala to aplikacjom zewnętrznym (np. formularzom webowym, systemom ETL) sprawdzać jakość rekordu *zanim* zostanie on zapisany w bazie. To realizacja zasady "Prevention is better than Cure".

# 🔑 Kluczowe punkty
- **Real-Time DQ:** Ocena jakości odbywa się w milisekundach, w locie.
- **Centralizacja:** Używasz tych samych reguł, co w batchowym monitoringu (np. `Valid Email`). Nie musisz kodować walidacji dwa razy (raz w Java Script na frontendzie, drugi raz w [[SQL|SQL]] w hurtowni).
- **API:** Dostęp przez REST lub GraphQL.

# 📚 Szczegółowe wyjaśnienie
Jak to działa?
1.  Tworzysz projekt "DQ Firewall".
2.  Wybierasz atrybuty (np. `Name`, `Email`, `Phone`).
3.  Podpinasz reguły walidacyjne (np. `Name` nie może być puste, `Email` musi mieć @).
4.  Publikujesz projekt. System generuje endpoint HTTP.
5.  Twój developer frontendu, gdy użytkownik klika "Wyślij", wysyła JSON-a do Ataccamy.
6.  [[Ataccama|Ataccama]] odpowiada: `{"status": "INVALID", "errors": ["Email format is wrong"]}`.
7.  Aplikacja blokuje zapis i pokazuje błąd użytkownikowi.

# 💡 Przykład zastosowania
Formularz rejestracji nowego klienta w banku.
Zamiast pisać logikę walidacji PESEL-u w kodzie strony www (gdzie łatwo o błąd lub zmianę przepisów), strona wysyła PESEL do DQ Firewalla.
Firewall sprawdza sumę kontrolną, datę urodzenia i płeć. Jeśli jest błędny, odrzuca go.
Jeśli bank zmieni reguły (np. obsługa PESELi dla obcokrajowców), zmienia je w jednym miejscu ([[Ataccama|Ataccama]]), a wszystkie formularze od razu działają wg nowych zasad.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - DQ Firewalls.

## 👽 Brudnopis
- DQ Firewall zapobiega efektowi "Garbage In, Garbage Out".
- Może być też używany w procesie ETL (np. Apache NiFi strzela do Firewalla i odrzuca błędne rekordy na bok).