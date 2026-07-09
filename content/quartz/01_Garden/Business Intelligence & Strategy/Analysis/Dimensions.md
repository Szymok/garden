---
title: Dimensions (Wymiary)
created: 2026-02-04
status: evergreen
category: Data Engineering / Modeling
difficulty: basic
language: pl
tags:
  - dimensions
  - modeling
  - olap
  - star-schema
  - kimball
aliases:
  - Wymiary
  - Dimension Tables
---
# 🎯 Definicja
**[[Wymiary|Wymiary]] (Dimensions)** to "kontekst" dla danych.
Odpowiadają na pytania: **Kto? Gdzie? Kiedy? Co?**
Jeśli powiem "1000 PLN" (to jest Fakt/[[Miara|Miara]]), to nic nie znaczy.
Ale "1000 PLN (Fakt) sprzedaży Produktu X (Wymiar), w Sklepie Y (Wymiar), w Czerwcu (Wymiar)" to już informacja.

# 🔑 Kluczowe punkty
- **Atrybuty opisowe:** Tekst, kategorie, daty.
- **Hierarchie:** Rok -> Kwartał -> Miesiąc. Kraj -> Miasto -> Ulica.
- **Filtrowanie i Grupowanie:** W [[SQL|SQL]] to są kolumny w `GROUP BY` i `WHERE`.

# 📚 Szczegółowe wyjaśnienie
W [[Dimensional Modeling]] (Kimball) mamy:
1.  **Tabele Faktów:** Długie, wąskie, pełne liczb (ID_Sklepu, ID_Produktu, Kwota).
2.  **Tabele Wymiarów:** Krótkie, szerokie, pełne opisów (ID_Sklepu, Nazwa Sklepu, Adres, Kierownik).
**Conformed Dimensions:** [[Wymiary|Wymiary]] wspólne dla całej firmy (np. Wymiar Czasu, Wymiar Klienta). To klucz do spójnego raportowania.

# 💡 Przykład zastosowania
Raport sprzedaży.
Masz Tabelę Faktów `Sales`.
[[Wymiary|Wymiary]]:
- `Dim_Date` (Kiedy?)
- `Dim_Product` (Co?)
- `Dim_Store` (Gdzie?)
Analityk przeciąga "Rok" z `Dim_Date` i "Nazwę Kategorii" z `Dim_Product` na osie wykresu. System łączy to z faktami sprzedaży.

## 📌 Źródła
- The [[Data Warehouse|Data Warehouse]] Toolkit (Ralph Kimball).

## 👽 Brudnopis
- "Facts represent the measurements of a business process. Dimensions contain the context."
