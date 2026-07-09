---
title: GraphQL Introspection (Introspekcja)
created: 2026-02-04
status: evergreen
category: API & Integration
difficulty: basic
language: pl
tags:
  - graphql
  - schema
  - documentation
  - debugging
aliases:
  - Introspekcja GraphQL
  - Schema Discovery
  - Inspektor Sieci
---
# 🎯 Definicja
**Introspekcja** ([[Introspection|Introspection]]) to unikalna cecha GraphQL, która pozwala zapytać API o jego własną strukturę. Możesz wysłać specjalne zapytanie, a serwer zwróci Ci listę wszystkich dostępnych typów, pól, zapytań ([[Queries|Queries]]) i mutacji ([[Mutations|Mutations]]). To automatyczna dokumentacja wbudowana w silnik.

# 🔑 Kluczowe punkty
- **Samodokumentacja:** Nie potrzebujesz PDF-a z dokumentacją. Narzędzia (np. Playground) same pobierają schemat i podpowiadają składnię (Autocomplete).
- **Bezpieczeństwo:** Na produkcji Introspekcja powinna być **WYŁĄCZONA**, aby hakerzy nie poznali łatwo struktury Twojej bazy.
- **Narzędzia:** [[GraphQL Playground|GraphQL Playground]], Apollo Studio, Network Inspector w przeglądarce.

# 📚 Szczegółowe wyjaśnienie
Jak to działa? GraphQL ma zarezerwowane pole `__schema`.
Zapytanie:
```graphql
query {
  __schema {
    types {
      name
    }
  }
}
```
Zwróci listę wszystkich obiektów w API (np. `User`, `Product`, `Order`).
W [[Ataccama|Ataccama]] ONE Network Inspector wykorzystuje ten mechanizm do podglądu, jakie zapytania wysyła frontend do backendu.

# 💡 Przykład zastosowania
Piszesz integrację z [[Ataccama|Ataccama]] ONE.
Otwierasz [[GraphQL Playground|GraphQL Playground]].
Zaczynasz pisać `qu...` i wciskasz `Ctrl+Space`.
Pojawia się lista podpowiedzi: `query`, `qualityResult`, `quarantine`.
To działa właśnie dzięki introspekcji - IDE "zapytało" serwer o dostępne opcje w tle.

## 📌 Źródła
- GraphQL Specification - [[Introspection|Introspection]].

## 👽 Brudnopis
- Jeśli widzisz błąd "Field __schema does not exist", to znaczy, że administrator wyłączył introspekcję (popularna praktyka Security Hardening).