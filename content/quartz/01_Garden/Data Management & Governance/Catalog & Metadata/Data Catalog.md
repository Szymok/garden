---
title: Data Catalog (Katalog Danych)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - catalog
  - metadata
  - discovery
  - governance
aliases:
  - Katalog Danych
  - Knowledge Catalog
---
# 🎯 Definicja
**Data Catalog** to zorganizowany inwentarz zasobów danych w organizacji. Działa jak "Google dla danych firmowych" – pozwala analitykom, inżynierom i biznesowi znaleźć potrzebne zbiory danych, zrozumieć ich znaczenie, dowiedzieć się skąd pochodzą (Lineage) i kto za nie odpowiada (Ownership).

# 🔑 Kluczowe punkty
- **Metadata Management:** Katalog nie trzyma samych danych (rekordów), tylko metadane (o czym są dane, gdzie leżą, jaki mają schemat).
- **Data Discovery:** Ułatwia wyszukiwanie pojęć biznesowych ("Pokaż mi tabele związane z przychodem").
- **Data Lineage:** Wizualizuje przepływ danych (Źródło -> ETL -> Raport).
- **Collaboration:** Pozwala oceniać zbiory danych, dodawać komentarze i tagi.

# 📚 Szczegółowe wyjaśnienie
Bez katalogu danych, wiedza w firmie jest plemienna ("Zapytaj Marka, w której tabeli są aktualne ceny"). Data Catalog automatyzuje ten proces. Skanuje bazy danych (Crawling), pobiera schematy i pozwala przypisać im biznesowe definicje ([[Business Glossary]]).
Główne funkcje w narzędziach typu Ataccama, Alation czy Collibra:
1.  **Harvesting:** Automatyczne sczytywanie metadanych z baz.
2.  **Profiling:** Pokazywanie statystyk jakości danych.
3.  **Tagging:** Oznaczanie danych wrażliwych (PII, RODO).
4.  **Stewardship:** Przypisywanie opiekunów do zbiorów.

# 💡 Przykład zastosowania
Nowy analityk dołącza do zespołu i ma przygotować raport sprzedaży.
Zamiast pytać kolegów, wchodzi do Data Catalog, wpisuje "Sales". Dostaje listę 50 tabel. Filtruje po tagu "Certified" (zaufane dane). Znajduje tabelę `dm_sales_monthly`. Widzi, że jej właścicielem jest zespół Finansów, a dane są odświeżane codziennie o 6:00 rano. Widzi też ostrzeżenie DQ: "Kolumna `region` ma 5% nulli". Dzięki temu wie, czy może użyć tych danych.

## 📌 Źródła
- "Data Catalog for the Modern Data Stack" - Atlan.
- Ataccama ONE Documentation.

## 👽 Brudnopis
- Active Metadata: Nowoczesne katalogi nie są pasywne (tylko do czytania), ale mogą sterować procesami (np. zablokować dostęp w Snowflake, jeśli w katalogu zmieniono tag na "Tajne").
- Katalog jest sercem [[Data Governance]].