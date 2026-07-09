---
title: GraphQL Subscriptions (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / API
difficulty: advanced
language: pl
tags:
  - graphql
  - real-time
  - websockets
  - events
  - api
aliases:
  - Subskrypcje GraphQL
  - Real-time Events
---
# 🎯 Definicja
**GraphQL [[Subscriptions|Subscriptions]]** to sposób na "nasłuchiwanie" zmian w czasie rzeczywistym.
Zamiast pytać serwera co 5 sekund "Czy coś się zmieniło?" (Polling), otwierasz stałe połączenie (WebSocket). Serwer sam daje znać, jak coś się stanie.

# 🔑 Kluczowe punkty
- **Push, nie Pull:** Serwer wypycha dane do klienta.
- **Wydajność:** Mniej zapytań HTTP. Idealne do pasków postępu, czatów, powiadomień.
- **Events:** W [[Ataccama|Ataccama]] ONE możesz subskrybować zdarzenia np. `ENTITY_CREATED`, `DQ_EVAL_FINISHED`.

# 📚 Szczegółowe wyjaśnienie
Składnia jest podobna do Query, ale słowo kluczowe to `subscription`.
Przykład prostej subskrypcji zdarzeń zewnętrznych (External Events) w ONE:
```graphql
subscription {
  externalEvents {
    id
    entityId
    entityType
    timestamp
  }
}
```
Gdy ktoś utworzy nową tabelę w katalogu, Twój skrypt od razu dostanie JSONa z jej ID.

# 💡 Przykład zastosowania
Budujesz dashboard na telewizorze w biurze. Pokaż "Ostatnie incydenty DQ".
Używasz Subskrypcji. Gdy tylko system wykryje błąd danych, telewizor się aktualizuje. Bez odświeżania strony F5.

## 📌 Źródła
- GraphQL Docs - [[Subscriptions|Subscriptions]].
- [[Ataccama|Ataccama]] Developers Guide.

## 👽 Brudnopis
- Pamiętaj, że [[Subscriptions|Subscriptions]] wymagają stanowego połączenia (WebSocket). To trudniejsze do skalowania niż zwykłe REST API (stateless).
