---
title: Custom Filter (Filtry Niestandardowe)
created: 2026-02-04
status: evergreen
category: Ataccama/User Guide
difficulty: basic
language: pl
tags:
  - aql
  - filtering
  - search
  - one-web
aliases:
  - AQL Filter
  - Wyszukiwanie zaawansowane
---
# 🎯 Definicja
**Custom Filter** w Ataccama ONE to funkcja pozwalająca na tworzenie zaawansowanych kwerend wyszukiwania przy użyciu języka **[[AQL]]** (Ataccama Query Language). Pozwala wyjść poza proste filtrowanie "wybierz z listy" i budować złożoną logikę (`AND`, `OR`, `NOT`, `LIKE`).

# 🔑 Kluczowe punkty
- **Precyzja:** Daje kontrolę, której nie masz w prostym UI. Możesz łączyć warunki nawiasami.
- **Zapisywanie:** Filtry można zapisać ("Saved Filters") i udostępnić zespołowi.
- **Zastosowanie:** Wszędzie. W katalogu danych, w Data Quality, w Issue Trackerze.

# 📚 Szczegółowe wyjaśnienie
Gdy klikniesz "Advanced Filter" lub "Custom AQL", otwierasz konsolę tekstową.
Składnia jest podobna do SQL, ale operuje na obiektach platformy.
Przykłady operatorów:
- `IS NULL` / `IS NOT NULL`
- `IN ("Value1", "Value2")`
- `LIKE "pattern*"` (gwiazdka jako wildcard)
- `matches("[0-9]+")` (Regex!)

# 💡 Przykład zastosowania
Szukasz tabel, które są "zaśmiecone" (mają niską jakość), ale są ważne (mają stewarda).
`quality < 0.5 AND steward IS NOT NULL`
Albo szukasz wszystkich kolumn PII, które nie są jeszcze zabezpieczone:
`tags CONTAIN "PII" AND attributeType != "Masked"`

## 📌 Źródła
- Ataccama ONE Web App User Guide.

## 👽 Brudnopis
- Ważne: AQL w filtrach webowych to nie to samo co AQL w Sparku/SQL. To język zapytań do *metadanych*.
- Auto-podpowiadanie (IntelliSense) w edytorze filtra bardzo pomaga znać nazwy atrybutów (np. `systemName` vs `name`).