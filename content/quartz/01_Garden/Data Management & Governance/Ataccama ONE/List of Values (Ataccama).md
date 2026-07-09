---
title: List of Values (Słowniki Wartości)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: basic
language: pl
tags:
  - lov
  - reference-data
  - validation
  - dictionaries
  - ataccama
aliases:
  - LOV
  - Lista Wartości
  - Enumeracja
---
# 🎯 Definicja
**List of Values (LOV)** to po prostu lista dozwolonych wartości dla danego pola. Np. dla pola "Kolor Oczu" LOV to `['Niebieskie', 'Brązowe', 'Zielone', 'Szare', 'Inne']`. Jeśli w danych pojawi się "Piwne", system zgłosi błąd lub automatycznie zmieni to na "Inne" (zależnie od konfiguracji).

# 🔑 Kluczowe punkty
- **Walidacja:** Podstawa reguł DQ ("Czy wartość jest w słowniku?").
- **Standaryzacja:** Pomaga utrzymać czystość danych na wejściu (Dropdown na froncie aplikacji).
- **Zarządzanie:** Słowniki powinny być zarządzane centralnie (Reference [[Data Management|Data Management]] - [[RDM|RDM]]), a nie zaszyte w kodzie ("Hardcoded").

# 📚 Szczegółowe wyjaśnienie
W [[Ataccama|Ataccama]] ONE:
LOV może być prostym plikiem tekstowym (`.lkp`) lub zarządzaną tabelą w [[RDM|RDM]].
Użycie w regule: `attr.countryCode is in file('countries.lkp')`.
To znacznie wydajniejsze niż pisanie `attr == 'PL' or attr == 'DE' or ...` dla 200 krajów.

# 💡 Przykład zastosowania
System CRM.
Pole: "Status Klienta".
LOV: `Active`, `Churned`, `Lead`.
Handlowiec próbuje wpisać status `Very Interested`. System odrzuca zapis, bo wartości nie ma na liście. Dzięki temu raporty analityczne się nie psują.

## 📌 Źródła
- [[Ataccama|Ataccama]] Documentation - [[Lookup|Lookup]] Files.

## 👽 Brudnopis
- LOV to najprostsza forma "Master Data".
- Częsty problem: Synonimy (np. "USA", "U.S.A.", "United States"). Dobry system LOV mapuje je wszystkie do jednego kodu ("US").