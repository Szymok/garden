---

title: Wymiary  
created: 2025-07-16  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- wymiary
- modelowanie wymiarowe
- OLAP
- analityka danych  
aliases:
- dimensions
- wymiar danych

---

# ðŸŽ¯ Definicja

**Wymiary** (ang. _dimensions_) to atrybuty opisowe lub kategoryczne, ktÃ³re sÅ‚uÅ¼Ä… do segmentacji, filtrowania, grupowania oraz analizowania danych iloÅ›ciowych (miar). StanowiÄ… kontekst analityczny dla danych biznesowych i sÄ… podstawowym elementem modelowania danych w systemach OLAP, hurtowniach danych oraz narzÄ™dziach [[Business Intelligence]].

# ðŸ”‘ Kluczowe punkty

- Wymiary odpowiadajÄ… na pytania: â€žkiedyâ€, â€žgdzieâ€, â€ždla kogoâ€, â€žjakiego typuâ€.
- StanowiÄ… kontekst dla interpretacji metryk (np. sprzedaÅ¼ wg regionu i czasu).
- SÄ… elementem schematu gwiazdy (_star schema_) w modelowaniu wymiarowym.
- Wiele systemÃ³w OLAP wykorzystuje hierarchie wymiarÃ³w (np. Rok â†’ MiesiÄ…c â†’ DzieÅ„).
- Kluczowe dla realizacji operacji typu [[Rollup|roll-up]] i drill-down w raportowaniu.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## PrzykÅ‚ady typowych wymiarÃ³w

|Wymiar|PrzykÅ‚adowe wartoÅ›ci|
|---|---|
|Czas|2023-01, 2023-Q1, poniedziaÅ‚ek|
|Klient|Anna Nowak, Segment Gold, B2B|
|Lokalizacja|Warszawa, Polska, Region PÃ³Å‚nocny|
|Produkt|SKU-12345, Laptop, Kategoria X|
|KanaÅ‚ sprzedaÅ¼y|E-commerce, Retail, Partnerzy|
|Pracownik|ID-789, Sprzedawca A, DziaÅ‚ X|

W analizach miary sÄ… czÄ™sto agregowane wzglÄ™dem wymiarÃ³w. Np.:

> "Liczba zamÃ³wieÅ„ wg miesiÄ…ca i kanaÅ‚u sprzedaÅ¼y"

### Wymiary vs [[Fakty]] (Miary)

||Wymiar|Fakt ([[Miara]])|
|---|---|---|
|Typ danych|Kategoryczne / opisowe|IloÅ›ciowe / metryczne|
|SÅ‚uÅ¼y do|segmentacji, grupowania, filtrowania|obliczeÅ„, porÃ³wnaÅ„, metryk|
|PrzykÅ‚ad|"Region: Europa", "MiesiÄ…c: StyczeÅ„"|"PrzychÃ³d = 10 000 zÅ‚", "Liczba zamÃ³wieÅ„ = 238"|

## Hierarchie wymiarÃ³w

Hierarchie pozwalajÄ… na operacje typu [[Rollup|roll-up]] i drill-down. PrzykÅ‚ad:

- Wymiar: Czas  
    â†’ Hierarchia: Rok â†’ KwartaÅ‚ â†’ MiesiÄ…c â†’ DzieÅ„

UmoÅ¼liwia to predefiniowane agregacje (np. SUMA sprzedaÅ¼y per miesiÄ…c), eksploracjÄ™ danych i ukÅ‚adanie widokÃ³w OLAP.

## Wymiary konformalne (Conformed Dimensions)

W modelowaniu Kimballa wymiary takie jak â€žCzasâ€ lub â€žKlientâ€ sÄ… wspÃ³Å‚dzielone przez rÃ³Å¼ne tabele faktÃ³w (np. sprzedaÅ¼, pÅ‚atnoÅ›ci, zwroty). SÄ… one kompatybilne z kaÅ¼dÄ… tabelÄ… faktÃ³w, ktÃ³ra ich potrzebuje. To umoÅ¼liwia spÃ³jne raportowanie i agregacje pomiÄ™dzy dziedzinami.

# ðŸ’¡ PrzykÅ‚ad zastosowania

Analityk buduje raport przedstawiajÄ…cy tygodniowÄ… sprzedaÅ¼ wedÅ‚ug kategorii produktÃ³w i lokalizacji.

- Wymiary: Data (â†’ TydzieÅ„), Produkt (â†’ Kategoria), Miasto
- [[Miara]]: SUMA wartoÅ›Ä‡ sprzedaÅ¼y  
    DziÄ™ki wymiarom moÅ¼liwe jest stworzenie tabeli przestawnej oraz wykresu dynamicznego pokazujÄ…cego trendy wg interesujÄ…cych segmentÃ³w.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [Kimball Group â€“ [[Modelowanie Wymiarowe|Dimensional Modeling]] Techniques](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/dimensional-modeling-techniques/)
- [Wikipedia: Dimension (data warehouse)](https://en.wikipedia.org/wiki/Dimension_\(data_warehouse\))
- [[[dbt]] Docs â€“ dimensions in metrics](https://docs.getdbt.com/docs/semantic-layer/metrics/)

# ðŸ‘½ Brudnopis

- Wymiar = kontekst dla liczby, np. segment, produkt, kraj, KWARTAÅ
- Hierarchia = umoÅ¼liwia [[Rollup|roll-up]]/drill-down â†’ np. SKU â†’ Produkt â†’ Marka
- Business-friendly: â€žChcÄ™ przychodÃ³w wg regionÃ³w i miesiÄ™cy" = wymiar â€žregionâ€ + â€žczasâ€
- Wymiar wspÃ³lny = conformed â†’ Customer ID = ten sam ID w Sales & Return
- vs Miary = dane liczbowe ([[Fakty]]), ktÃ³re analizujesz wg wymiarÃ³w
- W [[Business Intelligence|BI]] (Power [[Business Intelligence|BI]], Looker) â€“ tabelki przestawne sÄ… â€žpivotâ€ wg wymiarÃ³w (wiersze, kolumny)