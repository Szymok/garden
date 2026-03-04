---
title: Miara (Metric)
created: 2026-02-04
status: evergreen
category: Business Intelligence
difficulty: basic
language: pl
tags:
  - metric
  - measurement
  - kpi
  - analytics
  - semantics
aliases:
  - Measure
  - Metryka
  - Wskaźnik
---
# 🎯 Definicja
**Miara** (Metric/Measure) to liczba, która opisuje rzeczywistość biznesową. Jest to ilościowa reprezentacja zjawiska, np. "1000 zł" (Sprzedaż), "50 sztuk" (Magazyn), "30 stopni" (Temperatura). Bez miar nie ma analityki, są tylko anegdoty.

# 🔑 Kluczowe punkty
- **Agregacja:** Miary zazwyczaj się sumuje, uśrednia lub liczy (SUM, AVG, COUNT).
- **Kontekst (Wymiar):** Miara sama w sobie znaczy niewiele ("1000 zł"). Nabiera sensu z wymiarem ("Sprzedaż w Styczniu w Warszawie").
- **Typy:**
    - **Podstawowe:** Bezpośrednio z bazy (`kwota_transakcji`).
    - **Wyliczalne:** Wzór (`zysk = przychód - koszty`).

# 📚 Szczegółowe wyjaśnienie
W Inżynierii Danych kluczowe jest rozdzielenie **Faktów** (zdarzeń, które generują miary) od **Wymiarów** (opisów).
Miara musi być **addytywna** (można dodawać sprzedaż z wczoraj i dziś) lub **nieaddytywna** (nie można dodawać stanu magazynowego z wczoraj i dziś, bo wyjdzie bzdura; trzeba uśredniać).

# 💡 Przykład zastosowania
Dashboard Dyrektora Sprzedaży.
Miara: **Przychód (Revenue)**.
Wymiary: **Region**, **Produkt**, **Handlowiec**.
Dyrektor "kroi" (Slice & Dice) miarę Przychodu przez różne wymiary, żeby zobaczyć, kto sprzedaje najlepiej.

## 📌 Źródła
- "The Data Warehouse Toolkit" (Kimball).

## 👽 Brudnopis
- Ważne: Spójna definicja. Jeśli Marketing liczy "Sprzedaż" jako "zamówione", a Księgowość jako "opłacone", to mają różne Miary o tej samej nazwie. To prosty przepis na katastrofę na spotkaniu zarządu.