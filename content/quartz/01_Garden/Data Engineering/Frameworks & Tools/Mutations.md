---
title: Mutations (GraphQL)
created: 2026-02-04
status: evergreen
category: API / Development
difficulty: intermediate
language: pl
tags:
  - graphql
  - api
  - crud
  - development
aliases:
  - Mutacje GraphQL
  - Zmiana danych w API
---
# 🎯 Definicja
W świecie **GraphQL**, **Mutation** to operacja służąca do **modyfikacji** danych na serwerze (Create, Update, Delete). To odpowiednik metod POST, PUT, DELETE w REST API. O ile `Query` służy tylko do czytania ("Daj mi dane"), `Mutation` mówi "Zmień coś".

# 🔑 Kluczowe punkty
- **Zapis:** Służy do tworzenia, aktualizacji i usuwania rekordów.
- **Sekwencyjność:** Mutacje wykonują się po kolei (jedna po drugiej), żeby uniknąć wyścigów (Race Conditions). [[Queries|Queries]] mogą dziać się równolegle.
- **Zwrot:** Mutacja może (i powinna) zwrócić zmodyfikowany obiekt. (np. "Skasowałem usera X, oto jego ID i status").

# 📚 Szczegółowe wyjaśnienie
W odróżnieniu od REST, gdzie URL i metoda HTTP (POST /users) definiują akcję, w GraphQL masz jeden endpoint, a w treści zapytania piszesz `mutation { createProject(...) }`.
W [[Ataccama|Ataccama]] ONE API, mutacje służą np. do:
- `catalogItemCreate` (stwórz wpis w katalogu).
- `runMonitoring` (uruchom zadanie).
- `publishEntity` (zatwierdź zmiany).

# 💡 Przykład zastosowania
Chcesz dodać nowy komentarz do posta.
W REST wysyłasz `POST /api/comments`.
W GraphQL wysyłasz:
```graphql
mutation {
  addComment(postId: "123", content: "Super!") {
    id
    createdAt
    author {
      name
    }
  }
}
```
Od razu dostajesz z powrotem ID nowego komentarza i nazwę autora, żeby wyświetlić to na ekranie bez dodatkowego zapytania.

## 📌 Źródła
- GraphQL Documentation - Mutations.

## 👽 Brudnopis
- Pamiętaj: Query = Read. Mutation = Write.