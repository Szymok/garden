---

title: Wymiary  
created: 2025-07-16  
status: 🌱 draft
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- wymiary
- modelowanie wymiarowe
- OLAP
- analityka danych  
aliases:
- dimensions
- wymiar danych

---

# 🎯 Definicja

**Wymiary** (ang. _dimensions_) to atrybuty opisowe lub kategoryczne, które służą do segmentacji, filtrowania, grupowania oraz analizowania danych ilościowych (miar). Stanowią kontekst analityczny dla danych biznesowych i są podstawowym elementem modelowania danych w systemach OLAP, hurtowniach danych oraz narzędziach [[Business Intelligence]].

# 🔑 Kluczowe punkty

- Wymiary odpowiadają na pytania: „kiedy”, „gdzie”, „dla kogo”, „jakiego typu”.
- Stanowią kontekst dla interpretacji metryk (np. sprzedaż wg regionu i czasu).
- Są elementem schematu gwiazdy (_star schema_) w modelowaniu wymiarowym.
- Wiele systemów OLAP wykorzystuje hierarchie wymiarów (np. Rok → Miesiąc → Dzień).
- Kluczowe dla realizacji operacji typu [[Rollup|roll-up]] i drill-down w raportowaniu.

# 📚 Szczegółowe wyjaśnienie

## Przykłady typowych wymiarów

|Wymiar|Przykładowe wartości|
|---|---|
|Czas|2023-01, 2023-Q1, poniedziałek|
|Klient|Anna Nowak, Segment Gold, B2B|
|Lokalizacja|Warszawa, Polska, Region Północny|
|Produkt|SKU-12345, Laptop, Kategoria X|
|Kanał sprzedaży|E-commerce, Retail, Partnerzy|
|Pracownik|ID-789, Sprzedawca A, Dział X|

W analizach miary są często agregowane względem wymiarów. Np.:

> "Liczba zamówień wg miesiąca i kanału sprzedaży"

### Wymiary vs [[Fakty]] (Miary)

||Wymiar|Fakt ([[Miara]])|
|---|---|---|
|Typ danych|Kategoryczne / opisowe|Ilościowe / metryczne|
|Służy do|segmentacji, grupowania, filtrowania|obliczeń, porównań, metryk|
|Przykład|"Region: Europa", "Miesiąc: Styczeń"|"Przychód = 10 000 zł", "Liczba zamówień = 238"|

## Hierarchie wymiarów

Hierarchie pozwalają na operacje typu [[Rollup|roll-up]] i drill-down. Przykład:

- Wymiar: Czas  
    → Hierarchia: Rok → Kwartał → Miesiąc → Dzień

Umożliwia to predefiniowane agregacje (np. SUMA sprzedaży per miesiąc), eksplorację danych i układanie widoków OLAP.

## Wymiary konformalne (Conformed [[Dimensions|Dimensions]])

W modelowaniu Kimballa wymiary takie jak „Czas” lub „Klient” są współdzielone przez różne tabele faktów (np. sprzedaż, płatności, zwroty). Są one kompatybilne z każdą tabelą faktów, która ich potrzebuje. To umożliwia spójne raportowanie i agregacje pomiędzy dziedzinami.

# 💡 Przykład zastosowania

Analityk buduje raport przedstawiający tygodniową sprzedaż według kategorii produktów i lokalizacji.

- Wymiary: Data (→ Tydzień), Produkt (→ Kategoria), Miasto
- [[Miara]]: SUMA wartość sprzedaży  
    Dzięki wymiarom możliwe jest stworzenie tabeli przestawnej oraz wykresu dynamicznego pokazującego trendy wg interesujących segmentów.

## 📌 Źródła

- [Kimball Group – ___BLOCK_PLACEHOLDER_6___ Techniques](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/dimensional-modeling-techniques/)
- [Wikipedia: Dimension (data warehouse)](https://en.wikipedia.org/wiki/Dimension_\(data_warehouse\))
- [[[dbt]] Docs – [[Dimensions|dimensions]] in metrics](https://docs.getdbt.com/docs/semantic-layer/metrics/)

# 👽 Brudnopis

- Wymiar = kontekst dla liczby, np. segment, produkt, kraj, KWARTAŁ
- Hierarchia = umożliwia [[Rollup|roll-up]]/drill-down → np. SKU → Produkt → Marka
- Business-friendly: „Chcę przychodów wg regionów i miesięcy" = wymiar „region” + „czas”
- Wymiar wspólny = conformed → Customer ID = ten sam ID w Sales & Return
- vs Miary = dane liczbowe ([[Fakty]]), które analizujesz wg wymiarów
- W [[Business Intelligence|BI]] (Power [[Business Intelligence|BI]], Looker) – tabelki przestawne są „pivot” wg wymiarów (wiersze, kolumny)