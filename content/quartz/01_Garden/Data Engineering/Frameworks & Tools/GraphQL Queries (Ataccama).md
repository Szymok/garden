---
title: GraphQL Queries (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Integration
difficulty: advanced
language: en
tags:
  - graphql
  - api
  - queries
  - metadata
  - automation
aliases:
  - Ataccama GraphQL API
  - Zapytania GraphQL
---
# 🎯 Definicja
**GraphQL API** w [[Ataccama|Ataccama]] ONE to główny sposób na wyciąganie metadanych z platformy. Zamiast sztywnych endpointów REST (np. `/getUsers`), piszesz elastyczne zapytania ("Daj mi ID, Nazwę i Email użytkowników, ale tylko tych aktywnych").

# 🔑 Kluczowe punkty
- **Elastyczność:** Pobierasz tylko to, czego potrzebujesz.
- **Relacje:** Możesz pobrać Term, jego Atrybuty i powiązane Reguły w JEDNYM zapytaniu.
- **[[Introspection|Introspection]]:** Schema jest samodokumentująca się.

# 📚 Szczegółowe wyjaśnienie
Przykładowe operacje:
- **List [[Catalog Items|Catalog Items]]:** Pobierz listę tabel/plików.
- **Profile:** Uruchom profilowanie na tabeli.
- **Monitoring Projects:** Pobierz wyniki DQ.

# 💡 Przykład zastosowania
Pobranie listy projektów monitoringowych:
```graphql
query getProjects {
  monitoringProjects(versionSelector: { draftVersion: true }) {
    edges {
      node {
        gid
        name
      }
    }
  }
}
```

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Developer Guide.

## 👽 Brudnopis
- Używaj **[[GraphQL Playground|GraphQL Playground]]** (wbudowanego w ONE), żeby testować zapytania przed wklejeniem ich do skryptów Python/Ansible.
