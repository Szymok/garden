---
title: Simple Model Extensions (Ataccama SME)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Metadata
difficulty: intermediate
language: en
tags:
  - metadata
  - extensibility
  - customization
  - sme
  - attributes
aliases:
  - Rozszerzenia Modelu
  - Custom Attributes
---
# 🎯 Definicja
**Simple Model Extensions (SME)** to sposób na dodanie własnych pól do Ataccama ONE bez dzwonienia do działu IT.
Chcesz dodać pole "Właściciel Biznesowy" do Tabeli?
Chcesz dodać pole "Poziom Ryzyka" do Raportu?
Używasz SME.

# 🔑 Kluczowe punkty
- **No-Code:** Klikasz w UI i dodajesz pole.
- **Typy:** Text, Number, Date, Boolean, List (Dropdown), User Reference.
- **Zasięg:** Globalny (dla wszystkich) lub Lokalny (dla projektu).

# 📚 Szczegółowe wyjaśnienie
Standardowy model w katalogu ma pola: `Name`, `Description`.
A co jeśli Twoja firma wymaga pola `Cost Center`?
Wchodzisz w **Settings -> Metadata Extensions**.
Wybierasz obiekt `Catalog Item`.
Dodajesz pole `Cost Center` (Text).
Od teraz każdy Catalog Item ma to pole. Możesz po nim filtrować i szukać.

# 💡 Przykład zastosowania
Dział Compliance wymaga, aby każdy zbiór danych miał flagę `GDPR Sensitive`.
Admin dodaje SME: `GDPR_Flag` (Boolean) do obiektu `Table`.
Data Stewardzi wchodzą w katalog i odznaczają `True`/`False`.
Później robisz raport: "Pokaż wszystkie tabele z GDPR=True bez właściciela".

## 📌 Źródła
- Ataccama ONE Metadata Extensions Guide.

## 👽 Brudnopis
- Nie przesadzaj z ilością pól. Jeśli dodasz ich 50, nikt nie będzie ich wypełniał. "Metadata Fatigue" to realny problem.