---

title: GraphQL  
created: 2025-07-16  
status: Final  
category: API  
difficulty: podstawowy  
language: pl  
tags:

- graphql
- api
- web development
- query language
- frontend/backend  
aliases:
- gql
- język zapytań graphql

---

# 🎯 Definicja

**GraphQL** to otwartoźródłowy język zapytań oraz środowisko wykonawcze do pobierania danych z API, opracowany przez Facebooka. W przeciwieństwie do REST, GraphQL umożliwia klientowi precyzyjne określenie, jakie dane chce otrzymać, co pozwala ograniczyć liczby zapytań i objętość przesyłanych danych.

# 🔑 Kluczowe punkty

- Umożliwia klientowi żądanie konkretnych pól obiektów (tzw. selektywność danych).
- Umożliwia zbieranie danych z wielu źródeł/typów w jednym zapytaniu.
- Wspiera typowanie danych (schema-first) — schemat definiuje strukturę danych.
- Zapytania, mutacje i subskrypcje to trzy główne typy operacji.
- Ułatwia szybki rozwój UI, szczególnie w aplikacjach SPAs i mobilnych.

# 📚 Szczegółowe wyjaśnienie

## Podstawowe pojęcia

- **Schema** – struktura API definiująca typy danych, relacje i metody zarządzania nimi.
- **Query** – pobieranie danych.
- **Mutation** – modyfikacja/stworzenie/delikatacja danych.
- **Subscription** – dostęp w czasie rzeczywistym do danych (push).

### Przykład zapytania GraphQL:

```graphql
query {
  user(id: "123") {
    name
    email
    posts {
      title
    }
  }
}
```

Zapytanie pobiera dane użytkownika `123`, jego nazwę, email i listę tytułów postów – wszystko w jednej odpowiedzi.

### Przykład schematu:

```graphql
type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post]
}

type Post {
  id: ID!
  title: String!
  content: String
}
```

Schema może być użyta zarówno do walidacji zapytań, jak i generowania dokumentacji (np. za pomocą GraphiQL lub Altair).

## Zalety GraphQL

- **Minimalizacja over-fetching i under-fetching** — klient dokładnie wybiera potrzebne pola.
- **Elastyczność rozwijania API** bez zmieniania istniejących endpointów.
- **Silne typowanie** – wykrywanie błędów jeszcze przed wywołaniem zapytania.
- **Jeden endpoint** – unifikacja komunikacji z API.

## Wady i wyzwania

- Krzywa uczenia się przy wdrażaniu na back-endzie.
- Złożoność cachowania.
- Potencjalne podatności na n-spędne zapytania (np. poprzez deeply nested queries).
- Najlepiej działa z dobrze zaprojektowanym schematem — wymaga dyscypliny architektonicznej.

# 💡 Przykład zastosowania

Aplikacja mobilna e-commerce używa GraphQL, by w jednym zapytaniu pobrać dane o promocjach, katalogu i historii zamówień użytkownika. Klient sam decyduje, które dane są potrzebne np. dla danego widoku — pozwala to zmniejszyć liczbę requestów i poprawić szybkość ładowania aplikacji.

## 📌 Źródła

- [https://graphql.org/](https://graphql.org/)
- [https://graphql.org/learn/](https://graphql.org/learn/)
- Apollo GraphQL – [https://www.apollographql.com/docs/](https://www.apollographql.com/docs/)

## 👽 Brudnopis

- GQL = kontrast do REST: klient decyduje, nie serwer
- Zamiast wielu endpointów jeden → /graphql
- Metody: query (GET), mutation (POST), subscription (WebSocket)
- Narzędzia: Apollo, Graphene (Python), Hasura, GraphQL.js
- Dokumentacja generowana automatycznie na podstawie schematu
- Używane w GitHub GraphQL API, Shopify, Facebook, Wix
- Dobrze działa dla potrzeb komponentów frontendu — React, Next.js, Svelte

---