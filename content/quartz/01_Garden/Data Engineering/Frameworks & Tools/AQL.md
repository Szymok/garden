---
title: AQL (Advanced Query Language)
created: 2026-02-04
status: evergreen
category: Tech
difficulty: intermediate
language: pl
tags:
  - aql
  - query-language
  - metadata
  - ataccama
aliases:
  - Język zapytań metadanych
  - Ataccama Query Language
---
# 🎯 Definicja
**AQL (Advanced Query Language)** to specjalistyczny językiem zapytań wykorzystywany w systemach zarządzania metadanymi (np. Ataccama ONE), służący do wyszukiwania, filtrowania i agregowania obiektów w katalogu danych.

# 🔑 Kluczowe punkty
- **Cel:** Przeszukiwanie grafu metadanych (np. "znajdź wszystkie tabele zawierające kolumnę 'PESEL'").
- **Możliwości:** Obsługuje operatory logiczne, nawigację po relacjach (parent/child) i filtrowanie po atrybutach.
- **Zastosowanie:** Dynamiczne widoki w GUI, automatyzacja w regułach Data Quality, raportowanie.

# 📚 Szczegółowe wyjaśnienie
AQL przypomina SQL, ale zamiast na wierszach i kolumnach, operuje na Obiektach (Items) i ich Właściwościach (Properties).
Jest kluczowy dla administratorów i Data Stewardów, gdy standardowe filtry w interfejsie nie wystarczają.

**Przykłady operatorów:**
- `LIKE`, `IN`, `IS NULL`
- `path.to.attribute` (nawigacja po kropce)

# 💡 Przykład zastosowania
Zapytanie znajdujące nieaktywne reguły DQ:
```sql
SELECT rule FROM DqRule rule WHERE rule.active = false AND rule.author = 'system'
```

Zapytanie o "sieroty" (obiekty bez właściciela):
```sql
SELECT item FROM CatalogItem item WHERE item.steward IS NULL
```

## 📌 Źródła
- Ataccama ONE Documentation (AQL Reference).

## 👽 Brudnopis
- AQL ≈ SQL/Cypher → dedykowany metamodelowi, nie tabelom produkcyjnym.
- Idealny do dynamicznych dashboardów: „pokaż wszystkie obiekty, które ...”, monitorowania DQ, workflow na taskach.
- Integracja z GraphQL/API oraz językiem reguł.