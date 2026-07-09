---
title: One API Mutations
created: 2026-07-09
status: evergreen
category: Ataccama ONE
difficulty: intermediate
language: pl
tags:
  - ataccama
  - mutations
  - graphql
  - api
aliases:
  - Mutacje One API
  - Ataccama mutations
---

# 🎯 Definicja
**Mutacje ([[Mutations|Mutations]])** w GraphQL to specjalne operacje przeznaczone do modyfikacji danych po stronie serwera (zapis, aktualizacja, usuwanie). W przeciwieństwie do [[One API Queries|zapytań (queries)]], które mogą być wykonywane równolegle, mutacje są wykonywane sekwencyjnie (szeregowo), co zapewnia spójność i chroni przed wyścigami (race conditions) podczas modyfikacji danych. Do testowania mutacji można użyć środowiska [[Ataccama Using Playground|GraphQL Playground]].

---

# 🔑 Kluczowe punkty
- Służą do wykonywania wszelkich operacji zapisu i modyfikacji danych w [[Ataccama|Ataccama]] ONE (tworzenie, edycja, usuwanie encji, uruchamianie procesów).
- Mutacje mogą zwracać stan wykonanego zadania (np. identyfikator `gid` zadania DQ, patrz: [[Data Quality]]) oraz zmodyfikowany obiekt wraz z zagnieżdżonymi polami.
- Wykonywane są **sekwencyjnie (w serii)**, w przeciwieństwie do [[One API Queries|zapytań]] wykonywanych współbieżnie.
- Stanowią odpowiednik operacji modyfikujących w REST (POST, PUT, DELETE, patrz: [[Endpoints and HTTP Headers|Nagłówki HTTP]]).

---

# 📚 Szczegółowe wyjaśnienie i przykłady

### 1. Uruchamianie ewaluacji Jakości Danych (DQ)
Możesz uruchomić ewaluację jakości danych (DQ evaluation) dla elementu katalogu, konkretnego atrybutu (atrybutu elementu katalogu) lub terminu biznesowego. Każda z tych operacji zwraca identyfikator zadania (`gid`).
- Więcej o profilowaniu i DQ: [[Profiling]] oraz [[Data Quality]].

#### Uruchomienie ewaluacji DQ dla elementu katalogu ([[Data Catalog|Catalog Item]])
```graphql
mutation catalogItemDQ {
    catalogItemEvaluateDq(gid: "identyfikator_elementu_katalogu") {
        gid
    }
}
```
**Przykładowa odpowiedź:**
```json
{
    "data": {
        "catalogItemEvaluateDq": {
            "gid": "e80174ca-a512-40e0-8975-b1417a63b4a9"
        }
    }
}
```

#### Uruchomienie ewaluacji DQ dla atrybutu elementu katalogu (Attribute)
```graphql
mutation catalogItemAttributeDQ {
    attributeEvaluateDq(gid: "identyfikator_atrybutu") {
        gid
    }
}
```

#### Uruchomienie ewaluacji DQ dla terminu słownikowego ([[Glossary Terms|Glossary Term]])
```graphql
mutation glossaryTermDQ {
    termEvaluateDq(gid: "identyfikator_terminu") {
        gid
    }
}
```

---

### 2. Usuwanie encji (Deleting Entities)
Usunięcie encji w [[Ataccama|Ataccama]] ONE wymaga w pierwszej kolejności utworzenia wersji roboczej usunięcia (delete draft), a następnie jej opublikowania (publish).

#### Operacja GraphQL do usuwania elementu katalogu:
```graphql
mutation deleteEntity {
    catalogItemDelete(gid: "0726c74e-fc9e-40ad-a29d-23ec1dac8769") {
        success
    }
}
```
*Uwaga: W przypadku usuwania atrybutu elementu katalogu należy zastąpić `catalogItemDelete` przez `attributeDelete`. Dla terminu słownikowego użyj `termDelete`.*

**Przykładowa odpowiedź:**
```json
{
    "data": {
        "catalogItemDelete": {
            "success": true
        }
    }
}
```

---

### 3. Publikowanie encji (Publishing Entities)
Mutacja `publishEntity` pozwala na publikację dowolnego węzła [[Metadata|modelu metadanych (MMD)]]. Obecnie operacja ta omija domyślny proces zatwierdzania (workflow), automatycznie akceptując żądania publikacji.

#### Publikacja elementu katalogu:
```graphql
mutation publishEntity {
    catalogItemPublish(gid: "0726c74e-fc9e-40ad-a29d-23ec1dac8769") {
        success
        result {
            publishedVersion {
                name
            }
        }
    }
}
```
*Uwaga: W przypadku publikacji atrybutu elementu katalogu użyj `attributePublish`. Dla terminu biznesowego użyj `termPublish`.*

**Przykładowa odpowiedź:**
```json
{
    "data": {
        "catalogItemPublish": {
            "success": true,
            "result": {
                "publishedVersion": {
                    "name": "customers.csv"
                }
            }
        }
    }
}
```

**Publikacja wersji roboczej usunięcia (Delete Draft):**
```json
{
    "data": {
        "catalogItemDelete": {
            "success": true,
            "result": {
                "publishedVersion": null
            }
        }
    }
}
```

---

### 4. Klonowanie reguł i terminów (Duplicating [[Rules|Rules]] and Terms)
Umożliwia skopiowanie konfiguracji [[Data Quality Rules (Ataccama)|reguł DQ]] lub [[Glossary Terms|terminów biznesowych]] (np. w celu przypisania podobnych reguł do wielu plików wyszukiwania). Operacja kopiuje wyłącznie konfigurację i nie przenosi powiązań encji (skopiowany obiekt nie jest nigdzie przypisany).

#### Duplikowanie terminu:
```graphql
mutation copyTerm {
    termCopy(gid: "identyfikator_terminu") {
        result {
            gid
        }
    }
}
```

#### Duplikowanie reguły:
```graphql
mutation copyRule {
    ruleCopy(gid: "identyfikator_reguly") {
        result {
            gid
        }
    }
}
```

**Przykładowa odpowiedź:**
```json
{
    "data": {
        "ruleCopy": {
            "result": {
                "gid": "a0ceca7a-1653-4338-9054-8da4e45dcd7e"
            }
        }
    }
}
```

---

## 📌 Źródła
- Dokumentacja techniczna [[Ataccama|Ataccama]] ONE API
- GraphQL Specification ([[Mutations|Mutations]])
