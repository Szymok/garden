---
title: Wstęp do GraphQL
created: 2026-05-06
status: evergreen
category: Data Engineering
difficulty: średni
language: pl
tags:
  - graphql
  - api
  - ataccama
  - query-language
aliases:
  - GraphQL Introduction
  - Wprowadzenie do GraphQL
  - GQL
---


# 🎯 Definicja
**GraphQL** to język zapytań (Query Language) dla interfejsów API oraz środowisko uruchomieniowe (runtime) do ich wykonywania. Został stworzony przez Facebooka w 2012 roku jako alternatywa dla architektury REST. Pozwala klientom na precyzyjne określenie, jakich danych potrzebują, eliminując problem pobierania nadmiarowych danych (over-fetching) lub niewystarczających danych (under-fetching).

---

# 🔑 Kluczowe punkty
- **Brak nadmiarowości (No Over-fetching):** Pobierasz tylko te pola, których aplikacja potrzebuje w danej chwili.
- **Pojedynczy punkt końcowy (Single Endpoint):** Wszystkie zapytania są kierowane na jeden adres URL (np. `/graphql`, patrz: [[Endpoints and HTTP Headers]]).
- **Silne typowanie (Strongly Typed):** API opiera się na ściśle zdefiniowanym schemacie (Schema), który automatycznie dokumentuje dostępne typy i relacje (patrz: [[GraphQL Introspection|Introspekcja]]).
- **Agnostyczność technologiczna:** GraphQL działa niezależnie od używanej [[Bazy danych|bazy danych]] czy silnika przechowywania danych.

---

# 📚 Szczegółowe wyjaśnienie

W tradycyjnym REST API, pobranie profilu użytkownika i jego postów wymagałoby wywołania kilku endpointów (np. `GET /users/1` i `GET /users/1/posts`). W GraphQL wykonujesz jedno zapytanie określające dokładnie strukturę wynikowego obiektu JSON:

### Przykład Zapytania (Query):
```graphql
query GetUserProfile {
  user(id: "1") {
    name
    avatarUrl
    posts {
      title
    }
  }
}
```

### Typy operacji w GraphQL:
1. **Query (Zapytanie):** Operacja tylko do odczytu. Pobiera dane bez modyfikacji czegokolwierk na serwerze (patrz: [[One API Queries|Zapytania w Ataccama ONE]]).
2. **Mutation (Mutacja):** Służy do zapisu, edycji i usuwania danych oraz uruchamiania procesów (patrz: [[One API Mutations|Mutacje w Ataccama ONE]]).
3. **Subscription (Subskrypcja):** Umożliwia ciągły nasłuch zdarzeń i otrzymywanie aktualizacji w czasie rzeczywistym, zazwyczaj przez WebSockets (patrz: [[One API Subscriptions|Subskrypcje w Ataccama ONE]]).

---

# 💡 Zastosowanie w [[Ataccama|Ataccama]] ONE
Interfejs ONE API opiera się w pełni na standardzie GraphQL. Pozwala on na zarządzanie konfiguracją obiektów i metadanymi. Przykładowo, za pomocą GraphQL możesz:
- Pobrać listę wszystkich terminów biznesowych przypisanych do użytkownika (patrz: [[Glossary Terms]]).
- Uruchomić zadanie ewaluacji jakości danych (DQ) dla określonego elementu katalogu (patrz: [[Data Quality]]).
- Odpytać o status asynchronicznego zadania profilowania (patrz: [[Profiling]]).

---

## 📌 Źródła
- [Oficjalny samouczek GraphQL.org](https://graphql.org/learn/)
- Specyfikacja standardu GraphQL (spec.graphql.org)
