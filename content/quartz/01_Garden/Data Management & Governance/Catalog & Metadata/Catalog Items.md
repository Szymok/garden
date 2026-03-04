---
title: Catalog Items (Elementy Katalogu)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - data-catalog
  - metadata
  - ataccama
  - inventory
aliases:
  - Obiekty katalogowe
  - Assets
---
# 🎯 Definicja
**Catalog Items** to podstawowe obiekty zarządzane w Katalogu Danych (Data Catalog). Reprezentują fizyczne lub logiczne zasoby danych, takie jak tabele, pliki, raporty, modele AI czy interfejsy API.

# 🔑 Kluczowe punkty
- **Abstrakcja:** Catalog Item to nie same dane (bajty), ale metadane "o danych" (wskaźnik, opis, schemat).
- **Wzbogacanie:** Po zaimportowaniu "surowego" obiektu (np. nazwy tabeli `T01_CUST`), Steward dodaje do niego opis biznesowy ("Tabela Klientów"), tagi i właściciela.
- **Lineage:** Obiekty są łączone powiązaniami, tworząc mapę przepływu danych.

# 📚 Szczegółowe wyjaśnienie
W systemie takim jak Ataccama ONE, wszystko w katalogu jest Itemem.
Hierarchia:
- **System** (np. "Hurtownia Snowflake").
  - **Database** (np. "PROD_DWH").
    - **Schema** (np. "SALES").
      - **Table** (Catalog Item).
        - **Column** (Attribute).

Catalog Item jest centralnym punktem wiedzy. To tu widzisz:
1. Profiling (jaki jest rozkład danych?).
2. Data Quality (czy dane są czyste?).
3. Glossary (co to znaczy biznesowo?).
4. Lineage (skąd przyszło?).

# 💡 Przykład zastosowania
Analityk szuka danych o sprzedaży. Wpisuje w wyszukiwarkę katalogu "Sales".
Znajduje Catalog Item `fact_sales`.
Widzi, że:
- Właścicielem jest Jan Kowalski.
- Jakość danych wynosi 98%.
- Tabela jest oznaczona tagiem "GDPR: Contains Personal Data".
Dzięki temu wie, czy może jej użyć i kogo pytać o dostęp.

## 📌 Źródła
- Ataccama ONE Documentation.

## 👽 Brudnopis
- Automatyczne katalogowanie (Scanners/Crawlers) vs Ręczne rejestrowanie.
- Virtual Catalog Items (widoki logiczne stworzone w katalogu, nieistniejące w bazie).