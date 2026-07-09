---
title: GraphQL Request Body
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Integration
difficulty: advanced
language: pl
tags:
  - graphql
  - integration
  - api
  - json
  - variables
aliases:
  - Formaty zapytań GraphQL
  - Query Structure
---
# 🎯 Definicja
**GraphQL [[Request Body|Request Body]]** to struktura JSON, którą wysyłasz do serwera API (metodą POST), aby otrzymać dane. W przeciwieństwie do REST, gdzie parametry są często w URL, w GraphQL **wszystko** (zapytanie, zmienne, nazwa operacji) siedzi w body.

# 🔑 Kluczowe punkty
- **Standardowe pola:**
    - `query`: Tutaj wklejasz zapytanie (String).
    - `variables`: Obiekt JSON z wartościami dla zmiennych (np. `$gid`).
    - `operationName`: Nazwa operacji (przydatne przy debugowaniu).
- **Zmienne:** Zawsze używaj `variables`, zamiast sklejać stringi (zapobiega to Injection i błędom składni).

# 📚 Szczegółowe wyjaśnienie
Prawidłowy [[Request Body|Request Body]] wygląda tak:
```json
{
  "operationName": "GetTable",
  "variables": {
    "id": "123-abc"
  },
  "query": "query GetTable($id: GID!) { catalogItem(gid: $id) { name } }"
}
```
Serwer najpierw sprawdza `query`, potem podstawia `variables` w miejsca oznaczone `$`, a na końcu wykonuje logikę.

# 💡 Przykład zastosowania
Integracja Pythona z [[Ataccama|Ataccama]] ONE:
```python
import requests

query = """
query GetProjects {
  monitoringProjects {
    edges { node { name } }
  }
}
"""

response = requests.post(
    url="https://one.ataccama.com/graphql",
    json={"query": query},  # Biblioteka requests sama zrobi z tego JSON body
    headers={"Authorization": "Bearer ..."}
)
```

## 📌 Źródła
- GraphQL.org - Serving over HTTP.

## 👽 Brudnopis
- Najczęstszy błąd: Zapominanie o cudzysłowach wewnątrz stringa query (np. `query: "{ ... }"` jest źle, jeśli w środku nie uciekniesz znaków `"`).
