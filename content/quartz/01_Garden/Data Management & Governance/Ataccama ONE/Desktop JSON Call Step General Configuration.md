---
title: Desktop JSON Call Step General Configuration
created: 2026-07-09
status: evergreen
category: Ataccama ONE
difficulty: intermediate
language: pl
tags:
  - ataccama
  - one-desktop
  - json-call
  - api
aliases:
  - Konfiguracja kroku JSON Call
  - JSON Call ONE Desktop
---

# 🎯 Definicja
Krok **JSON Call** w programie **[[ONE Desktop|ONE Desktop]]** służy do wykonywania operacji na ONE API bezpośrednio z poziomu planów integracyjnych i przepływów danych (patrz również: [[Ansible Role in Deployment (Ataccama)|Wdrażanie Ataccamy]]). Umożliwia wysyłanie [[One API Queries|żądań GraphQL]] (za pomocą metody HTTP POST) i przetwarzanie struktury odpowiedzi JSON w celu przekazania jej do kolejnych kroków w planie.

---

# 🔑 Kluczowe punkty
- Żądania GraphQL są wysyłane przy użyciu metody HTTP **POST** (patrz: [[Endpoints and HTTP Headers|Punkty Końcowe i Nagłówki]]).
- Treść zapytania (query, patrz: [[One API Queries]]) oraz zmienne (variables) są przekazywane jako oddzielne sekcje w formacie JSON w szablonie wejściowym (**Input Template**).
- Adres docelowy (URL) może być podany bezpośrednio lub zdefiniowany jako zasób serwerowy (**server resource**).
- Odpowiedź JSON jest parsowana za pomocą sekcji **Reader** w zakładce General.
- Wymaga konfiguracji nagłówków HTTP (m.in. uwierzytelniania Basic Auth z hasłem zakodowanym w Base64, patrz: [[Endpoints and HTTP Headers|Metody Uwierzytelniania]]).

---

# 📚 Szczegółowe wyjaśnienie konfiguracji

### 1. Konfiguracja ogólna (General Configuration)
W zakładce General konfigurujesz połączenie i treść żądania:
- **URL:** Adres punktu końcowego (np. `http://localhost:8080/graphql`).
- **HTTP Method:** Musi być ustawiona na **POST**.
- **Input Template:** Definiuje JSON wysyłany do API. Struktura musi zawierać pola `query` oraz opcjonalnie `variables`:
  ```json
  {
    "query": "query listItems { catalogItems { edges { node { gid name } } } }",
    "variables": {}
  }
  ```

---

### 2. Parsowanie odpowiedzi (Reader Configuration)
Odpowiedź GraphQL z serwera jest zagnieżdżona pod kluczem `"data"`. Krok JSON Call pozwala na spłaszczenie tej struktury do strumieni danych (Data Streams):
- **Path:** Ścieżka JSON Path określająca początek strumienia (np. `data.catalogItems.edges[*].node` w celu iterowania po kolejnych encjach katalogu metadanych, patrz: [[Data Catalog]]).
- **Attributes:** Lista pól, które mają zostać pobrane z obiektu JSON jako kolumny (np. atrybut `gid` mapowany na kolumnę wyjściową `id`).
- **Substreams:** Definicje podstrumieni dla zagnieżdżonych struktur za pomocą relatywnych ścieżek JSON Path.

---

### 3. Nagłówki HTTP (HTTP Headers)
Do poprawnego działania wymagane jest uwierzytelnienie. Najczęściej stosuje się nagłówek Basic Authentication:
- Nazwa nagłówka: `Authorization`
- Wartość: `Basic <credentials_encoded_in_base64>`

#### Przykład kodowania poświadczeń:
* Dane logowania: `Admin:Admin`
* Zakodowane w Base64: `YWRtaW46YWRtaW4=`
* Wartość nagłówka: `Basic YWRtaW46YWRtaW4=`

---

# 💡 Przykład zastosowania
Krok ten jest powszechnie stosowany w automatyzacji zadań administracyjnych z poziomu planów [[ONE Desktop|ONE Desktop]] – na przykład w celu pobrania listy wszystkich [[Data Source|źródeł danych]], a następnie wywołania dla nich [[One API Mutations|mutacji]] [[Profiling|profilowania (profiling)]] lub [[Data Quality|ewaluacji DQ]] w pętli.

---

## 📌 Źródła
- Dokumentacja techniczna [[ONE Desktop|ONE Desktop]]
- [[Ataccama|Ataccama]] ONE Integration Guide
