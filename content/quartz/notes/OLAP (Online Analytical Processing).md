---

title: "OLAP (Online Analytical Processing)"  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- OLAP
- przetwarzanie analityczne
- modelowanie wymiarowe
- hurtownie danych
- sześcian OLAP  
aliases:
- przetwarzanie analityczne OLAP
- Online Analytical Processing

---

# 🎯 Definicja

**OLAP (Online Analytical Processing)** to technika wielowymiarowej analizy danych biznesowych, umożliwiająca szybkie przetwarzanie złożonych zapytań analitycznych w hurtowniach danych. Kluczowym elementem OLAP jest **sześcian OLAP**, czyli zoptymalizowana [[Strukturyzacja danych|struktura danych]] pozwalająca analizować miary w kontekście różnych wymiarów, takich jak czas, produkt czy lokalizacja.

# 🔑 Kluczowe punkty

- **Wielowymiarowość** – dane analizowane są w wielu wymiarach jednocześnie (np. sprzedaż wg regionu, kwartału, produktu).
- **Szybkie analizy ad-hoc** – OLAP wspiera natychmiastowe odpowiedzi na złożone pytania analityczne.
- **Miary + [[Wymiary]]** – dane są organizowane w postaci miar numerycznych oraz wymiarów opisowych.
- **Sześciany OLAP** – specjalna forma przechowywania danych zoptymalizowana pod kątem analizy, nie transakcji.
- **Język MDX** – specjalistyczny język zapytań zaprojektowany do komunikacji z OLAP, szczególnie w środowiskach Microsoft.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania OLAP

W przeciwieństwie do OLTP, OLAP służy do wspierania decyzji biznesowych i umożliwia analizę danych historycznych. Dane są organizowane w tzw. **sześciany OLAP**, gdzie:

- **Miary** (np. przychody, suma zamówień) są wartościami numerycznymi, które chcemy analizować.
- **[[Wymiary]]** (np. czas, klient, produkt) stanowią kontekst, w którym analizujemy dane.

Użytkownicy mogą:

- Drążyć (drill-down) i zagregować dane ([[Rollup|roll-up]]),
- Przeglądać przekroje danych z różnych perspektyw (np. pivot),
- Analizować trendy, porównania i wartości wskaźnikowe ([[KPI]]).

## Rodzaje OLAP

- **MOLAP (Multidimensional OLAP)** – klasyczny model, dane przechowywane w wielowymiarowych strukturach (np. Microsoft SSAS).
- **ROLAP (Relational OLAP)** – dane przechowywane w relacyjnych tabelach, a sześciany są emulowane przez zapytania SQL.
- **HOLAP (Hybrid OLAP)** – łączy zalety obu podejść: dane zagregowane w wielowymiarowej formie, detale w relacyjnej.

## Język MDX

**MDX (Multidimensional Expressions)** to specjalistyczny język zapytań do pracy z OLAP. Pozwala np. na definiowanie hierarchii wymiarów, agregowanie danych czy budowę wskaźników. Często używany w systemach takich jak MS Analysis Services.

# 💡 Przykład zastosowania

W korporacji detalicznej dane sprzedażowe są ładowane co noc do hurtowni danych, a następnie agregowane do sześcianu OLAP. Analitycy mogą szybko sprawdzać:

- sprzedaż wg regionów i kategorii produktów,
- porównania kwartalne i roczne (YoY),
- efektywność kampanii marketingowych przez pivot danych wg kanałów i produktów.  
    Dzięki zastosowaniu OLAP, czasy odpowiedzi na zapytania spadły z minut do kilku sekund.

## 📌 Źródła

- [Microsoft – MDX Documentation](https://learn.microsoft.com/en-us/analysis-services/multidimensional-models/mdx/)
- [Wikipedia – OLAP](https://pl.wikipedia.org/wiki/OLAP)
- [OLAP vs OLTP – TechTarget](https://www.techtarget.com/searchdatamanagement/definition/OLAP-online-analytical-processing)

## 👽 Brudnopis

- OLAP → zapytania analityczne na dużej liczbie danych, miary + [[wymiary]]
- Sześcian OLAP = struktura wielowymiarowa z preagregacjami
- MDX = język zapytań, alternatywa do SQL dla modelu wielowymiarowego
- ROLAP wolniejszy, ale tańszy (działa na starszych hurtowniach)
- MOLAP szybki, ale zużywa więcej zasobów
- OLAP ↔ OLTP – analiza vs transakcje
- Wspieranie decyzji biznesowych, raportowanie [[KPI]], kokpity menedżerskie