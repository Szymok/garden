---
title: Endpoints and HTTP Headers (GraphQL/API)
created: 2026-02-04
status: evergreen
category: API & Integration
difficulty: basic
language: pl
tags:
  - api
  - graphql
  - http
  - authentication
  - headers
aliases:
  - Adresy URL i Nagłówki
  - Konfiguracja API ONE
---
# 🎯 Definicja
**Endpoints** (Punkty końcowe) to adresy URL, pod którymi dostępne są usługi API (np. GraphQL). W Ataccama ONE, typowy endpoint dla modułu MMM (Metadata Management Module) to `localhost:8021/graphql`. **HTTP Headers** (Nagłówki) to metadane wysyłane z każdym żądaniem, określające format danych i uwierzytelnienie.

# 🔑 Kluczowe punkty
- **Endpoint:** Adres usługi. W GraphQL często jest to jeden adres dla wszystkich zapytań (w przeciwieństwie do REST).
- **Metoda:** GraphQL używa metody `POST`.
- **Content-Type:** Musi być ustawiony na `application/json`.
- **Authorization:** Nagłówek wymagany do zalogowania (Basic lub Bearer Token).

# 📚 Szczegółowe wyjaśnienie
Aby wysłać zapytanie do API ONE, musisz skonfigurować klienta (np. Postman lub GraphQL Playground):
1.  **URL:** `http://<host>:8021/graphql`
2.  **Body:** Twoje zapytanie JSON (np. `{ query: { ... } }`).
3.  **Headers:**
    - `"Content-Type": "application/json"`
    - `"Authorization": "Basic <Base64String>"` (dla Basic Auth)
    - Lub `"Authorization": "Bearer <JWT_Token>"` (dla Keycloak).

# 💡 Przykład zastosowania
Chcesz pobrać listę systemów ze słownika.
W GraphQL Playground w zakładce "HTTP HEADERS" wpisujesz:
```json
{
  "Content-Type": "application/json",
  "Authorization": "Basic YWRtaW46YWRtaW4="
}
```
(Gdzie `YWRtaW46YWRtaW4=` to zakodowane `admin:admin`).

## 📌 Źródła
- Ataccama ONE Developer Guide.
- MDN Web Docs - HTTP Headers.

## 👽 Brudnopis
- Basic Auth nie jest bezpieczny na produkcji (hasło lata w Base64). Używaj Bearer Tokens (OAuth2).
- W GraphQL Playground nagłówki wpisuje się w dedykowanym panelu JSON na dole po lewej.