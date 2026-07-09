---

title: Endpoints and HTTP Headers  
created: 2025-07-16  
status: 🌱 draft
category: data governance  
difficulty: średni  
language: pl  
tags:
  - ataccama
  - api
  - graphql
  - HTTP headers
  - endpoints
aliases:
  - punkty końcowe i nagłówki HTTP
  - ataccama endpoints

---

# 🎯 Definicja

**Endpoints and HTTP Headers** w platformie Ataccama ONE odnoszą się do punktów końcowych sieci oraz nagłówków protokołu HTTP używanych do komunikacji z API GraphQL platformy. Umożliwiają one zewnętrznym systemom i klientom wysyłanie [[One API Queries|zapytań (queries)]], [[One API Mutations|modyfikacji (mutations)]] oraz [[One API Subscriptions|subskrypcji (subscriptions)]] w celu integracji z modułem zarządzania metadanymi ([[Metadata|Metadata Management Module – MMM]]).

# 🔑 Kluczowe punkty

- **Jeden punkt końcowy**: Wszystkie zapytania GraphQL w Ataccama ONE są wysyłane na pojedynczy endpoint, zazwyczaj `<ataccama_URL>/graphql`.
- **Subskrypcje**: Do obsługi zdarzeń w czasie rzeczywistym używany jest dedykowany endpoint subskrypcji (patrz: [[One API Subscriptions]]).
- **GraphiQL Playground**: Interaktywne środowisko do testowania zapytań jest dostępne pod adresem `<ataccama_URL>/playground/` (patrz: [[Ataccama Using Playground]]).
- **Uwierzytelnianie Bearer Token**: Integracje produkcyjne opierają się na tokenach OAuth2 (JWT) generowanych przez Keycloak (realm `ataccamaone`).
- **Obsługa błędów**: Zapytania GraphQL zawsze zwracają kod HTTP `200 OK`, a ewentualne błędy walidacji czy biznesowe znajdują się wewnątrz obiektu `errors` w strukturze JSON odpowiedzi.

# 📚 Szczegółowe wyjaśnienie

## Punkty końcowe (Endpoints)

1. **Główny Endpoint GraphQL**:
   - Adres: `<ataccama_URL>/graphql`
   - Służy do wysyłania standardowych zapytań odczytu ([[One API Queries|query]]) i zapisu ([[One API Mutations|mutation]]).
   - Host odpowiada lokalizacji serwera HTTP modułu [[Metadata|MMM]] (Metadata Management Module).
2. **Endpoint Subskrypcji**:
   - Adres: `<ataccama_URL>/subscriptions`
   - Używa protokołu WebSocket do ciągłego przesyłania zdarzeń w czasie rzeczywistym (patrz: [[One API Subscriptions]]).
3. **GraphiQL Playground**:
   - Adres: `<ataccama_URL>/playground/`
   - Graficzny interfejs w przeglądarce ułatwiający budowanie i testowanie zapytań (patrz: [[Ataccama Using Playground]]). W środowisku GraphiQL uwierzytelnianie sesją użytkownika jest wstrzykiwane automatycznie.

## Nagłówki HTTP (HTTP Headers)

Każde zapytanie do API GraphQL musi zawierać następujące nagłówki HTTP:
- `Content-Type: application/json` – wskazuje, że przesyłane dane są w formacie JSON.
- `Authorization: Bearer <token>` – token dostępowy wymagany do autoryzacji zapytania.

### Metody uwierzytelniania

- **Keycloak Bearer Token (Rekomendowane produkcyjnie)**:
  Wymaga skonfigurowania klienta typu *service account* w realmie `ataccamaone` w Keycloak, pobrania tokena dostępowego przez endpoint Keycloak i wstrzyknięcia go do nagłówka `Authorization`.
- **Uwierzytelnianie sesyjne (Playground)**:
  W [[Ataccama Using Playground|GraphiQL]] aktywna sesja przeglądarki automatycznie odświeża i wstrzykuje token. Jeśli sesja wygaśnie, należy odświeżyć stronę playgroundu.
- **Basic Auth (Zdeprecjonowane)**:
  Starsze wersje pozwalały na uwierzytelnianie Basic (login i hasło zakodowane w Base64), jednak obecnie standardem jest Bearer token. Metodę tę stosuje się m.in. w krokach integracyjnych w programie Desktop (patrz: [[Desktop JSON Call Step General Configuration]]).

## Ciało zapytania (Request Body)

Zapytania GraphQL przesyłane są metodą **POST**. Ciało żądania to obiekt JSON o następującej strukturze:
- `query` (wymagane): Ciąg znaków zawierający treść zapytania GraphQL (wymaga ucieczki cudzysłowów `\"`).
- `variables` (opcjonalne): Obiekt zawierający dynamiczne parametry przekazywane do zapytania.
- `operationName` (opcjonalne): Nazwa operacji, przydatna przy debugowaniu i gdy w jednym zapytaniu przesyłamy wiele operacji.

### Anatomia zapytania GraphQL
1. **Root item (Element główny)**: Punkt wejścia zapytania (np. [[Data Catalog|catalogItems]]).
2. **Fields (Pola)**: Konkretne właściwości obiektów, które chcemy pobrać (np. `gid`, `name`).
3. **Arguments (Argumenty)**: Filtry i parametry przekazywane do pól (np. `versionSelector: {draftVersion: true}`).
4. **Edges & Node (Krawędzie i Węzły)**: Struktura opakowująca wyniki w celu obsługi paginacji i metadanych połączenia (patrz: [[One API Queries|Zapytania]]).

## Obsługa błędów

API GraphQL zwraca status HTTP **200 OK** nawet wtedy, gdy zapytanie zakończy się błędem (np. brak uprawnień, brak obiektu). Status błędu należy weryfikować bezpośrednio w strukturze odpowiedzi JSON, sprawdzając obecność klucza `errors`.

Każdy obiekt błędu w tablicy `errors` zawiera:
- `message` – czytelny opis błędu.
- `locations` – wiersz i kolumna w zapytaniu, które spowodowały problem.
- `path` – ścieżka do pola, na którym wystąpił błąd.
- `extensions` – szczegółowe metadane błędu (np. `reason`, `code` np. `NOT_FOUND`, `UNAUTHORIZED`, `classification`).

---

# 💡 Przykład zastosowania

### 1. Pobieranie elementów katalogu (Query z argumentem)

**Treść zapytania GraphQL:**
```graphql
query GetCatalogItems {
  catalogItems(versionSelector: {draftVersion: true}) {
    edges {
      node {
        gid
        draftVersion {
          name
        }
      }
    }
  }
}
```

**Ciało zapytania HTTP POST (JSON):**
```json
{
  "operationName": "GetCatalogItems",
  "variables": {},
  "query": "query GetCatalogItems { catalogItems(versionSelector: {draftVersion: true}) { edges { node { gid draftVersion { name } } } } }"
}
```

**Przykładowa odpowiedź sukcesu (HTTP 200 OK):**
```json
{
  "data": {
    "catalogItems": {
      "edges": [
        {
          "node": {
            "gid": "0726c74e-fc9e-40ad-a29d-23ec1dac8769",
            "draftVersion": {
              "name": "addresstype"
            }
          }
        },
        {
          "node": {
            "gid": "07c3923c-b726-4424-8ca4-b6bc7867a842",
            "draftVersion": {
              "name": "phonenumbertype"
            }
          }
        }
      ]
    }
  }
}
```

### 2. Użycie zmiennych (Variables)

**Ciało zapytania HTTP POST ze zmienną `gid`:**
```json
{
  "operationName": "GetCatalogItem",
  "variables": {
    "gid": "0726c74e-fc9e-40ad-a29d-23ec1dac8769"
  },
  "query": "query GetCatalogItem($gid: GID!) { catalogItem(gid: $gid) { gid draftVersion { name } } }"
}
```

### 3. Przykładowe odpowiedzi błędów

**Błąd typu "Nie znaleziono obiektu" (Node not found):**
```json
{
  "errors": [
    {
      "message": "The node was not found.",
      "locations": [
        {
          "line": 2,
          "column": 1
        }
      ],
      "path": [
        "catalogItemPublish"
      ],
      "extensions": {
        "reason": "NOT_FOUND",
        "code": "NOT_FOUND",
        "gid": "07c3923c-b726-4424-8ca4-b6bc7867a842",
        "time": {
          "nano": 220422000,
          "epochSecond": 1617648635
        },
        "type": "catalogItem",
        "hash": "dd4a08d8bed5c1f2e16c12205f39efd1",
        "classification": "DataFetchingException"
      }
    }
  ],
  "data": {
    "catalogItemPublish": null
  }
}
```

**Błąd uwierzytelniania / braku uprawnień (Unauthorized):**
```json
{
  "errors": [
    {
      "message": "{\"error\":\"invalid_grant\", \"error_description\":\"Invalid user credentials\"}",
      "locations": [
        {
          "line": 2,
          "column": 1
        }
      ],
      "path": [
        "catalogItem"
      ],
      "extensions": {
        "reason": "INVALID_TOKEN",
        "code": "UNAUTHORIZED",
        "time": {
          "nano": 800461000,
          "epochSecond": 1617648843
        },
        "hash": "76ebda2290ffe334d9e54e98159eedaa",
        "classification": "DataFetchingException"
      }
    }
  ],
  "data": {
    "catalogItem": null
  }
}
```

# 📌 Źródła

- [Dokumentacja Ataccama ONE - Developer Guide](https://docs.ataccama.com/)
- [Oficjalne zasoby Keycloak i OAuth2](https://www.keycloak.org/)
- [Specyfikacja standardu GraphQL](https://spec.graphql.org/)

# 👽 Brudnopis

- **Endpoint główny**: POST na `<ataccama_URL>/graphql`
- **Typy operacji**: 
  1. `Query` (odczyt, patrz: [[One API Queries]])
  2. `Mutation` (modyfikacja, np. insert/update/delete, patrz: [[One API Mutations]])
  3. `Subscription` (nasłuchiwanie zdarzeń czasu rzeczywistego przez WebSocket, patrz: [[One API Subscriptions]])
- **Tokeny**: Keycloak service accounts (realm `ataccamaone`), nagłówek `Authorization: Bearer <token>`
- **Obsługa błędów**: Brak tradycyjnych błędów HTTP (zawsze 200 OK), wszystkie błędy w kluczu `errors` odpowiedzi JSON.