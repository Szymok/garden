---

title: One API Queries  
created: 2025-07-16  
status: 🌱 draft
category: data governance  
difficulty: średni  
language: pl  
tags:
  - ataccama
  - api
  - graphql
  - queries
aliases:
  - zapytania API
  - ONE API queries

---

# 🎯 Definicja

**Zapytania One API (One API Queries)** to zapytania w języku GraphQL służące do pobierania danych i metadanych z platformy Ataccama ONE (np. modułu [[Metadata|Metadata Management]]). W przeciwieństwie do tradycyjnych interfejsów REST API (patrz: [[Endpoints and HTTP Headers|Nagłówki HTTP]]), GraphQL umożliwia klientom precyzyjne określenie struktury zwracanych danych w ramach jednego żądania HTTP, eliminując problem nadmiarowego pobierania danych (over-fetching). Do interaktywnego testowania zapytań służy [[Ataccama Using Playground|GraphQL Playground]].

# 🔑 Kluczowe punkty

- **Precyzja**: Klient definiuje dokładnie te pola, które są mu potrzebne, w tym dane zagnieżdżone i powiązane encje [[Metadata|modelu metadanych]].
- **Identyfikator GID**: Podstawą pobierania konkretnych encji jest ich unikalny, globalny identyfikator `gid`.
- **Funkcje zaawansowane**: Zapytania obsługują sortowanie (`orderBy`), stronicowanie (paginację z parametrami `skip`, `size`, `cursor`) oraz filtrowanie (za pomocą języka AQL i AI).
- **Zadania asynchroniczne**: Przez API można wywoływać operacje takie jak [[Profiling|profilowanie danych]] lub testy [[Data Quality|Jakości Danych]], a następnie odpytywać o ich status (Job status).

# 📚 Szczegółowe wyjaśnienie

## Pobieranie i przeszukiwanie encji

Zapytania GraphQL pozwalają na przeglądanie struktury metadanych Ataccama ONE. Możliwe jest nakładanie filtrów oraz sortowania:
- **Prymitywne sortowanie**: np. `orderBy: [{ property: "name", direction: ASC }]`.
- **Paginacja**: kontrolowana za pomocą parametrów `skip` i `size` lub kursorów (patrz również: [[Extracting Audit API#Stronicowanie (Pagination) w Audit API|Paginacja w Audit API]]).
- **Filtrowanie**: 
  - `filter` – standardowe filtry oparte na języku AQL (Ataccama Query Language).
  - `query` – zapytanie AQL przetwarzane wstępnie przez algorytmy sztucznej inteligencji.
  - `queryParts` – przyjazne dla użytkownika klocki filtrów przetwarzane przez AI.

## Statystyki i agregacje Jakości Danych (DQ)

Platforma umożliwia pobieranie zagregowanych wyników jakości danych dla pojęć biznesowych ([[Glossary Terms|Business Terms]]):
- **Wystąpienia terminu (Term occurrences)**: Określa, do ilu encji (np. atrybutów, [[Data Catalog|elementów katalogu]]) przypisano dany [[Glossary Terms|termin słownikowy]]. Parametr `withCount: true` uwzględnia kaskadowo encje potomne.
- **Agregacja DQ (Aggregation Results)**: Zbiera ostatnie wyniki testów jakości ze wszystkich atrybutów powiązanych z terminem. Parametr `at` pozwala odpytać o stan historyczny (porównaj: [[Data Quality|Jakość Danych]]).
- **Ważność terminu (Term Validity)**: Zwraca liczbę poprawnych (valid) i niepoprawnych (invalid) rekordów w powiązanych [[Data Quality Rules (Ataccama)|regułach DQ]].

---

# 💡 Przykłady zapytań (Queries)

## 1. Listowanie elementów katalogu ([[Data Catalog|List catalog items]])

Zapytanie zwraca listę elementów katalogu, ich identyfikatory `gid`, nazwy w wersji roboczej (`draftVersion`) oraz przypisane do nich atrybuty.

**Zapytanie (Query):**
```graphql
query listCatalogItems {
  catalogItems(versionSelector: {draftVersion: true}) {
    edges {
      node {
        gid
        draftVersion {
          name
          attributes {
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
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "catalogItems": {
      "edges": [
        {
          "node": {
            "gid": "1589346f-d5b5-4400-9a13-ad3f733c70ea",
            "draftVersion": {
              "name": "party_full",
              "attributes": {
                "edges": [
                  {
                    "node": {
                      "gid": "0fb027e1-e680-496f-91a6-f43fb1b1e4eb",
                      "draftVersion": {
                        "name": "src_email"
                      }
                    }
                  },
                  {
                    "node": {
                      "gid": "2ece8b69-df78-4a95-abf9-cdbea8ebb252",
                      "draftVersion": {
                        "name": "src_sin"
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      ]
    }
  }
}
```

## 2. Listowanie atrybutów wybranego elementu katalogu (List CI attributes)

Pobiera listę atrybutów dla konkretnego obiektu na podstawie jego zmiennej `$gid` (patrz również: [[Data Catalog]]).

**Zapytanie (Query):**
```graphql
query listAttributes ($gid: GID!) {
  catalogItem(gid: $gid) {
    publishedVersion {
      attributes {
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
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "catalogItem": {
      "publishedVersion": {
        "attributes": {
          "edges": [
            {
              "node": {
                "gid": "75642c37-8e88-4241-9a50-4f801eb47ade",
                "draftVersion": {
                  "name": "name"
                }
              }
            },
            {
              "node": {
                "gid": "808fef47-5dc8-4e60-8e91-e914cf18dec7",
                "draftVersion": {
                  "name": "modifieddate"
                }
              }
            }
          ]
        }
      }
    }
  }
}
```

## 3. Listowanie źródeł danych ([[Data Source|List data sources]])

Zwraca listę zdefiniowanych [[Data Source|źródeł danych]] oraz powiązanych z nimi połączeń (connections).

**Zapytanie (Query):**
```graphql
query listDataSources {
  sources(versionSelector: { draftVersion: true }) {
    edges {
      node {
        gid
        draftVersion {
          name
          connections {
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
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "sources": {
      "edges": [
        {
          "node": {
            "gid": "3bc4a6c0-cd9f-4e6f-a1c4-d0d5de161eee",
            "draftVersion": {
              "name": "AWS MySQL source",
              "connections": {
                "edges": [
                  {
                    "node": {
                      "gid": "10dca55a-2be8-459b-a4e6-44dd0f018cfb",
                      "draftVersion": {
                        "name": "mysql aws"
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      ]
    }
  }
}
```

## 4. Listowanie pojęć słownika biznesowego ([[Glossary Terms|List glossary terms]])

Zwraca wszystkie dostępne [[Glossary Terms|terminy słownikowe]] w wersji roboczej.

**Zapytanie (Query):**
```graphql
query listGlossaryTerms {
  terms(versionSelector: {draftVersion: true}) {
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

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "terms": {
      "edges": [
        {
          "node": {
            "gid": "033df1b9-ef3c-48c7-b40a-a8fc98249221",
            "draftVersion": {
              "name": "Gender"
            }
          }
        },
        {
          "node": {
            "gid": "08fcb90f-763b-40bf-ae7d-0601e7ec1651",
            "draftVersion": {
              "name": "Airports"
            }
          }
        }
      ]
    }
  }
}
```

## 5. Listowanie typów terminów słownikowych (List term types)

Odpytuje o typ każdego zdefiniowanego pojęcia biznesowego (np. `keyPerformanceIndicator`, `businessTerm` - patrz: [[Glossary Terms]]).

**Zapytanie (Query):**
```graphql
query getTermTypes {
  terms(versionSelector: { draftVersion: true }) {
    edges {
      node {
        gid
        type
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "terms": {
      "edges": [
        {
          "node": {
            "gid": "01503672-d0a0-492f-9ac6-b318fb9ee7d2",
            "type": "keyPerformanceIndicator"
          }
        },
        {
          "node": {
            "gid": "03b3e732-cded-40fd-9b52-134c2cfbefe3",
            "type": "businessTerm"
          }
        }
      ]
    }
  }
}
```

## 6. Listowanie projektów monitorowania jakości (List monitoring projects)

Zapytanie wyciągające identyfikatory wszystkich projektów monitorowania [[Data Quality|reguł jakościowych]].

**Zapytanie (Query):**
```graphql
query getProjects {
  monitoringProjects(versionSelector: { draftVersion: true }) {
    edges {
      node {
        gid
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "monitoringProjects": {
      "edges": [
        {
          "node": {
            "gid": "0f8f3b16-a9a4-491e-9384-eb302dda1fba"
          }
        },
        {
          "node": {
            "gid": "19fce03c-e238-49c9-ab26-ddddc48c95e0"
          }
        }
      ]
    }
  }
}
```

## 7. Wyszukiwanie wystąpień terminu (Retrieve term occurrences)

Zwraca statystyki powiązań wybranego pojęcia słownikowego ze strukturami danych (np. [[Data Catalog|elementami katalogu]]).

**Zapytanie (Query):**
```graphql
query getTermOccurrences {
  term(gid: "033df1b9-ef3c-48c7-b40a-a8fc98249221") {
    statistics(withCount: true, relationships: []) {
      usageStatistics {
        nodePath
        totalCount
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "term": {
      "statistics": {
        "usageStatistics": [
          {
            "nodePath": "/sources/locations/catalogItems",
            "totalCount": 5
          },
          {
            "nodePath": "/sources/locations",
            "totalCount": 4
          }
        ]
      }
    }
  }
}
```

## 8. Wyniki agregacji jakości danych (DQ) dla terminu (Retrieve term DQ aggregation results)

Zwraca wyniki jakości danych zagregowane z przypisanych atrybutów (patrz: [[Data Quality]]).

**Zapytanie (Query):**
```graphql
query GetTermDQ {
  term(gid: "410c6bac-0000-7000-0000-000000051ce3") {
    publishedVersion {
      aggregationResult(at: "2022-07-26T09:34:27.117946Z") {
        ruleInstanceCount
        attributeCount
        catalogItemCount
        totalCount
        results {
          id
          count
          name
        }
      }
    }
  }
}
```

## 9. Szczegółowa agregacja atrybutów terminu (Retrieve term's attribute aggregation results)

Pobiera wyniki jakości danych (DQ) na poziomie konkretnych atrybutów.

**Zapytanie (Query):**
```graphql
query GetAttributeDQ {
  term(gid: "410c6bac-0000-7000-0000-000000051ce3") {
    publishedVersion {
      attributeAggregationResult(
        selector: { limit: 1 }
        attributes: [
          { attributeId: "5c866cdf-0000-7000-0000-000000055412" },
          { attributeId: "5c866cdf-0000-7000-0000-000000055408" }
        ]
      ) {
        attributeId
        aggregations {
          aggregationId
          processings {
            processingId
            startedAt
            ruleInstanceCount
            attributeCount
            totalCount
            results {
              count
              name
              id
            }
          }
        }
      }
    }
  }
}
```

## 10. Walidacja i poprawność terminu (Retrieve Term Validity)

Zwraca ogólne metryki poprawności (liczba rekordów poprawnych/błędnych) dla reguł powiązanych z terminem.

**Zapytanie (Query):**
```graphql
query GetValidity {
  term(gid: "410c6bac-0000-7000-0000-000000051ce3") {
    publishedVersion {
      dqEvalTermAggr {
        publishedVersion {
          attributeCount
          ruleCount
          validCount
          invalidCount
          recordCount
        }
      }
    }
  }
}
```

## 11. Profilowanie: Pobieranie konfiguracji ([[Profiling|Profiling configurations]])

Przed uruchomieniem profilowania należy pobrać identyfikator konfiguracji (patrz: [[Profiling]]).

**Zapytanie (Query):**
```graphql
query listProfilingConfigurations {
  profilingConfigurations(versionSelector: { publishedVersion: true }) {
    edges {
      node {
        gid
        publishedVersion {
          name
          type
          description
          anomalyDetectionEnabled
          samplingLimitCount
          samplingLimitPercentage
        }
      }
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "profilingConfigurations": {
      "edges": [
        {
          "node": {
            "gid": "723fa8c2-9ea9-4119-b0a7-d49f1f6e4c45",
            "publishedVersion": {
              "name": "Full profiling",
              "type": "FULL",
              "description": "Full profiling of all the table rows",
              "anomalyDetectionEnabled": true,
              "samplingLimitCount": null,
              "samplingLimitPercentage": null
            }
          }
        }
      ]
    }
  }
}
```

## 12. Uruchomienie profilowania elementu katalogu (Profile catalog items: Request)

Uruchamia proces [[Profiling|profilowania (profiling)]] na wybranym elemencie przy użyciu pobranego identyfikatora konfiguracji (`configId`). Ta operacja modyfikuje dane, więc pod spodem jest to [[One API Mutations|mutacja]].

**Zapytanie (Query):**
```graphql
query profiling {
  catalogItem(gid: "0726c74e-fc9e-40ad-a29d-23ec1dac8769") {
    gid
    profile(defaultCredential: true, configId: "723fa8c2-9ea9-4119-b0a7-d49f1f6e4c45") {
      gid
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "catalogItem": {
      "gid": "0726c74e-fc9e-40ad-a29d-23ec1dac8769",
      "profile": {
        "gid": "1f6fe8e6-5b19-439d-ad2f-99b60beaefda"
      }
    }
  }
}
```

## 13. Sprawdzanie statusu zadania profilowania (Job status)

Asynchroniczne sprawdzanie stanu uruchomionego zadania (np. `FINISHED`, `RUNNING`, `FAILED`).

**Zapytanie (Query):**
```graphql
query getJobStatus {
  job(gid: "1f6fe8e6-5b19-439d-ad2f-99b60beaefda") {
    gid
    draftVersion {
      status
    }
  }
}
```

**Odpowiedź (Response JSON):**
```json
{
  "data": {
    "job": {
      "gid": "1f6fe8e6-5b19-439d-ad2f-99b60beaefda",
      "draftVersion": {
        "status": "FINISHED"
      }
    }
  }
}
```

---

# 📌 Źródła

- [Dokumentacja Ataccama ONE - Developer Portal](https://docs.ataccama.com/)
- [GraphQL Specification and Documentation](https://graphql.org/)

# 👽 Brudnopis

- **Różnice z REST**: GraphQL pozwala pobrać dokładnie to, co zadeklarowano w zapytaniu (jeden endpoint, zagnieżdżone obiekty, patrz: [[Endpoints and HTTP Headers]]).
- **Struktura połączeń**: Wykorzystanie schematu `edges` i `node` do paginacji oraz pobierania rekordów.
- **Parametry DQ dla terminów**:
  - `statistics`: liczba przypisań pojęć w katalogu (patrz: [[Glossary Terms]])
  - `aggregationResult`: zbiorcza jakość danych z poziomu reguł
  - `dqEvalTermAggr`: podsumowanie poprawności (valid/invalid)
- **Workflow profilowania**:
  1. Pobierz konfigurację (np. `FULL`/`SAMPLE`) -> `profilingConfigurations` (patrz: [[Profiling]])
  2. Uruchom zadanie -> `profile(...)`
  3. Odpytuj o status zadania -> `job(gid) { draftVersion { status } }`