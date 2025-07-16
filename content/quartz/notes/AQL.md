---

title: AQL  
created: 2025-03-31  
status:  
category: zapytania / modelowanie metadanych  
difficulty: średni  
language: pl  
tags:

- AQL
- query language
- wyszukiwania zaawansowane  
aliases:
- Advanced Query Language
- język zapytań metadanych

---

# 🎯 Definicja

**AQL (Advanced Query Language)** to specjalistyczny język zapytań wykorzystywany w systemach zarządzania metadanymi (takich jak Ataccama ONE), umożliwiający zaawansowane wyszukiwania i filtrowanie struktur modelu metadanych, obiektów katalogu danych, relacji oraz właściwości w meta-metamodelu. Pozwala na konstrukcję złożonych zapytań warunkowych, logicznych i agregujących bezpośrednio na poziomie semantycznym modeli danych.

# 🔑 Kluczowe punkty

- Pozwala budować złożone filtry, selekcje i reguły na obiektach metadanych oraz ich relacjach.
- Obsługuje operatory logiczne (`AND`, `OR`, `NOT`), porównania (`=`, `>`, `IN`), nawigację po relacjach i kolekcjach.
- Wspiera zarówno wyszukiwania tekstowe, jak i warunki na własnościach oraz typach obiektów.
- Służy do przeszukiwania rozbudowanych środowisk katalogu, np. znajdowania obiektów z określonym tagiem, bez właściciela, z określonym statusem lub zgodnością jakości.
- Umożliwia definiowanie dynamicznych widoków, workflow, powiadomień oraz automatyzacji z poziomu platformy.

# 📚 Szczegółowe wyjaśnienie

AQL (w Ataccama, Collibra lub innych systemach katalogowania i zarządzania metadanymi) często działa podobnie do zapytań SQL lub języków zapytań typowych dla grafów (np. Cypher, GraphQL), jednak zamiast operować na tabelach – pracuje na obiektach modelu metadanych.

**Składnia i możliwości:**

- Zapytania mogą dotyczyć dowolnego poziomu modelu – od źródeł danych, przez elementy katalogowe, po szczegółowe atrybuty (np. kolumny).
- Możliwa jest nawigacja po relacjach (np. parent-child, references, derived from).
- Wspiera operacje na kolekcjach (np. znajdź wszystkie obiekty, które zawierają określony tag i są typu „Tabela”).
- Pozwala agregować i sortować wyniki (np. wszystkie obiekty danego typu pogrupowane po statusie monitorowania).
- Stosowane w zapytaniach API, workflow automatyzujących, niestandardowych widokach dashboardów lub raportach compliance.

**Przykładowe frazy i operatory:**

|Operator|Opis|
|---|---|
|`=`|Porównanie wartości|
|`IN`, `NOT IN`|Sprawdzenie wartości w zbiorze|
|`LIKE`|Dopasowanie wzorca tekstowego|
|`EXISTS`|Sprawdzenie istnienia relacji/właściwości|
|`ORDER BY`|Sortowanie wyników zapytania|

# 💡 Przykład zastosowania

Znajdź wszystkie elementy katalogowe typu „Tabela”, których właściciel (`Owner`) nie został przypisany i które posiadają kolumnę z terminem słownikowym „Customer Email”:

```aql
SELECT item
FROM CatalogItem item
WHERE item.type = 'Table'
  AND item.owner IS NULL
  AND EXISTS (
    SELECT a
    FROM item.attributes a
    WHERE a.glossaryTerm = 'Customer Email'
  )
```

Inny przykład – wyszukiwanie obiektów z niezalecanymi wartościami dla atrybutu (np. „status” IN `['archived', 'deprecated']`):

```aql
SELECT *
FROM CatalogItem
WHERE status IN ('archived', 'deprecated')
```

AQL może być uruchamiane w panelu zaawansowanego wyszukiwania platformy lub z poziomu API do automatycznych audytów i raportów.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://help.collibra.com/docs/collibra/latest/Query_Language](https://help.collibra.com/docs/collibra/latest/Query_Language)
- [https://en.wikipedia.org/wiki/Query_language](https://en.wikipedia.org/wiki/Query_language)

# 👽 Brudnopis

- AQL ≈ SQL/Cypher → dedykowany metamodelowi, nie tabelom produkcyjnym.
- Idealny do dynamicznych dashboardów: „pokaż wszystkie obiekty, które ...”, monitorowania DQ, workflow na taskach.
- Platforma zwykle ma kreator lub podpowiedzi składni w GUI – promuje automatyzację governance.
- Integracja z GraphQL/API oraz językiem reguł (np. Condition Builder dla zaawansowanych użytkowników).