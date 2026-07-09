---
title: Introduction to GraphQL
created: 2026-02-04
status: evergreen
category: API / Development
difficulty: intermediate
language: en
tags:
  - graphql
  - api
  - query-language
  - rest
  - one-api
aliases:
  - Wstęp do GraphQL
  - GQL
---
# 🎯 Definicja
**GraphQL** to język zapytań do API.
W przeciwieństwie do REST (gdzie masz sztywne endpointy typu `/users`), w GraphQL mówisz dokładnie, czego chcesz:
"Daj mi użytkownika ID=1, ale tylko jego imię i listę tytułów postów".

# 🔑 Kluczowe punkty
- **No Over-fetching:** Nie pobierasz megabajtów niepotrzebnych danych (np. całej historii logowania, gdy chcesz tylko imię).
- **Single Endpoint:** Zazwyczaj jeden URL `/graphql` do wszystkiego.
- **Strongly Typed:** Masz schemat (Schema), który mówi dokładnie, co jest dostępne.

# 📚 Szczegółowe wyjaśnienie
W [[Ataccama|Ataccama]] ONE API używamy GraphQL do zarządzania metadanymi.
Możesz pobrać listę Termów, zaktualizować Regułę, uruchomić Profilowanie.
Query (Pobierz):
```graphql
query {
  term(id: "123") {
    name
    description
  }
}
```
Mutation (Zmień):
```graphql
mutation {
  createTerm(name: "Nowy Termin") {
    id
  }
}
```

# 💡 Przykład zastosowania
Mobile App.
Ekran profilu potrzebuje tylko Imienia i Avatara.
Stare REST API `/user/1` zwracało obiekt JSON 50kB (adresy, historia, uprawnienia). Aplikacja muliła.
GraphQL: Prosi tylko o `name` i `avatar`. Odpowiedź ma 200 bajtów. Aplikacja śmiga.

## 📌 Źródła
- GraphQL.org learn.

## 👽 Brudnopis
- Stworzony przez Facebooka w 2012, upubliczniony w 2015. Rozwiązuje problem złożonych relacji w API.
