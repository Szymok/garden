---
title: JSON Call (Krok Integracji)
created: 2026-02-04
status: evergreen
category: Ataccama ONE Desktop
difficulty: intermediate
language: pl
tags:
  - integration
  - rest-api
  - graphql
  - json
  - one-desktop
aliases:
  - JSON Call Step
  - Wywołanie API w Desktopie
---
# 🎯 Definicja
**JSON Call** to krok (Step) w Ataccama ONE Desktop służący do wykonywania zapytań HTTP (REST, GraphQL) i parsowania odpowiedzi w formacie JSON. Pozwala połączyć proces ETL Ataccamy z dowolnym zewnętrznym systemem (np. pobrać kursy walut, wysłać powiadomienie na Slacka, pobrać dane z ONE Platform przez GraphQL).

# 🔑 Kluczowe punkty
- **Metody:** Obsługuje GET, POST, PUT, DELETE.
- **GraphQL:** Aby wysłać zapytanie GraphQL, użyj metody POST i w Body wpisz strukturę JSON z polem `query`.
- **Reader:** Wbudowany parser JSON pozwala zamienić zagnieżdżoną odpowiedź API na płaską tabelę danych (Data Stream).

# 📚 Szczegółowe wyjaśnienie
Konfiguracja kroku:
1.  **URL:** Adres API (może być sparametryzowany).
2.  **HTTP Headers:** Autoryzacja (np. `Authorization: Bearer ...`).
3.  **Input Template (Body):** Treść zapytania (dla POST).
4.  **Reader Configuration:** Mapowanie JSON Path (np. `$.data.users[*]`) na kolumny wyjściowe Ataccamy.

# 💡 Przykład zastosowania
Chcesz pobrać listę użytkowników z Ataccama ONE Platform do pliku Excel.
1. Tworzysz plan w Desktopie.
2. Dodajesz krok **JSON Call**.
3. URL: `https://twoja-instancja/graphql`.
4. Body: `{"query": "{ users { username email } }"}`.
5. Reader: Mapujesz `username` i `email`.
6. Wynik podpinasz do kroku `Text File Writer`.

## 📌 Źródła
- Ataccama ONE Desktop Documentation - JSON Call Step.

## 👽 Brudnopis
- To "Szwajcarski scyzoryk" do integracji w Desktopie.
- Pamiętaj o obsłudze błędów (HTTP 400/500) - krok ma wyjście na błędy (Error port).