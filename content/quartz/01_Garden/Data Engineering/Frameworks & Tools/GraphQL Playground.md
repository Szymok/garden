---
title: GraphQL Playground (Środowisko Testowe)
created: 2026-02-04
status: evergreen
category: API & Integration
difficulty: basic
language: pl
tags:
  - graphql
  - ide
  - testing
  - playground
  - ataccama
aliases:
  - GraphiQL
  - Konsola GraphQL
---
# 🎯 Definicja
**GraphQL Playground** to interaktywne środowisko (IDE) działające w przeglądarce, które służy do testowania, pisania i debugowania zapytań GraphQL. Jest tym dla GraphQL, czym Postman jest dla REST API, ale zazwyczaj jest wbudowane bezpośrednio w serwer aplikacji (np. w [[Ataccama|Ataccama]] ONE).

# 🔑 Kluczowe punkty
- **Autocomplete:** Dzięki [[GraphQL Introspection|introspekcji]], Playground podpowiada nazwy pól i błędy w czasie rzeczywistym.
- **Dokumentacja (Docs):** Panel boczny pozwala przeklikać się przez cały schemat API bez czytania zewnętrznych plików.
- **Historie (History):** Pamięta Twoje ostatnie zapytania.

# 📚 Szczegółowe wyjaśnienie
Aby użyć Playground w [[Ataccama|Ataccama]] ONE:
1. Wejdź na adres: `https://<twoja-instancja>/graphql`.
2. Otwórz panel **HTTP HEADERS** (na dole).
3. Dodaj autoryzację (inaczej dostaniesz błąd 401/403):
```json
{
  "Authorization": "Basic YWRtaW46YWRtaW4=" 
}
```
(lub Token Bearer).
4. Wpisz zapytanie po lewej i kliknij ▶ (Play). Wynik pojawi się po prawej.

# 💡 Przykład zastosowania
Chcesz sprawdzić ID użytkownika "admin".
Wpisujesz w Playground:
```graphql
query {
  users(filter: "username = 'admin'") {
    id
    email
  }
}
```
Playground podświetli `filter` na żółto i podpowie składnię. Po kliknięciu Play otrzymasz JSON z wynikiem.

## 📌 Źródła
- [GraphQL Playground GitHub](https://github.com/graphql/graphql-playground).

## 👽 Brudnopis
- Narzędzie to jest następcą starszego "GraphiQL".
- Pozwala na testowanie nie tylko zapytań (Query), ale też modyfikacji (Mutation) i subskrypcji (Subscription).