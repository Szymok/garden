---

title: Miara  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- miara
- KPI
- miernik
- business intelligence
- data modeling  
aliases:
- Miernik

---

# 🎯 Definicja

**Miara** (ang. _measure_, _metric_, _[[KPI]]_) to ilościowy wskaźnik służący do oceny wydajności, efektywności lub stanu biznesowego organizacji, procesu, produktu lub zasobu. Miary są podstawowymi „liczbami” pojawiającymi się w raportach, dashboardach oraz analizach [[Business Intelligence|BI]] — umożliwiają wspólną interpretację wyników i postępów działalności.

# 🔑 Kluczowe punkty

- Odzwierciedlają kluczowe aspekty działalności — mierzą sprzedaż, koszty, efektywność, czas reakcji i wiele innych wskaźników.
- Definiowane jednoznacznie, by zapewnić spójność raportowania oraz porównań między działami.
- Wspierają kontrolę realizacji strategii biznesowej ([[KPI]], OKR).
- Tworzone głównie jako wyrażenia obliczeniowe (np. w SQL) oraz udostępniane poprzez [[Narzędzia Business Intelligence|narzędzia BI]].
- Powiązane z wymiarami — umożliwiają analizy przekrojowe wg czasu, regionu, klienta, produktu itd.

# 📚 Szczegółowe wyjaśnienie

## Typy miar

- **Miary proste**: bezpośrednio odczytywane z systemu źródłowego (np. suma przychodu, liczba transakcji).
- **Miary złożone (obliczone)**: agregacje lub transformacje innych miar, obliczane według określonego wzoru (np. marża = przychód – koszty; konwersja = liczba zakupów/liczba odwiedzin).
- **[[KPI]] ([[KPI|Key Performance Indicator]])**: najważniejsze miary strategiczne dla organizacji.

## Powiązanie z wymiarami

Miary są analizowane względem **wymiarów** (np. czas, produkt, kanał) — to tzw. [[modelowanie wymiarowe]]. Segmentacja, filtrowanie lub drążenie danych („drill down”) umożliwia zrozumienie, _dlaczego_ dana miara przyjęła określoną wartość, pokazuje ukryte trendy i obserwacje.

|Miara|Wymiar przykładowy|Przykład raportowania|
|---|---|---|
|Przychód|Region|Przychód wg regionu i kwartału|
|LTV klienta|Typ klienta|LTV wg segmentów klientów|
|Czas realizacji|Kanał sprzedaży|Średni czas zamówienia na sklep/online|
|Liczba zwrotów|Produkt|Ilość zwrotów na kategorię produktu|

## Definicje miar w narzędziach [[Business Intelligence|BI]] i w warstwie semantycznej

Współczesne [[Narzędzia Business Intelligence|narzędzia BI]] (np. Power [[Business Intelligence|BI]], Tableau, Looker) umożliwiają centralne definiowanie miar w tzw. warstwie miar lub warstwie semantycznej. Standaryzacja tych definicji ogranicza ryzyko nieporozumień i zapewnia, że każda osoba analizująca dane posługuje się tą samą logiką obliczania metryk.

- **[[Warstwa semantyczna]]**: Abstrakcja nad SQL — jedna definicja miary używana we wszystkich dashboardach, raportach i modelach [[Uczenie Maszynowe|ML]].

# 💡 Przykład zastosowania

Zespół finansowy w sieci sklepów detalicznych definiuje kluczowe miary: _Przychód Netto_, _Marża Brutto_, _Liczba Transakcji_. Każda z nich jest opisana w warstwie semantycznej i dostępna w dashboardach. Dzięki powiązaniu tych miar z wymiarami (np. region, kategoria produktu, miesiąc), zarząd może szybko monitorować efektywność sprzedaży w różnych kanałach i identyfikować obszary do optymalizacji.

## 📌 Źródła

- [What is a Business Metric? – Tableau](https://www.tableau.com/learn/articles/business-metrics)
- [[[Business Intelligence|BI]] Reporting Fundamentals – IBM](https://www.ibm.com/topics/business-intelligence)
- [[[dbt]]: Semantic Layer — Metric Constructs](https://docs.getdbt.com/docs/semantic-layer/metrics)

# 👽 Brudnopis

- Miara = [[KPI]], liczba opisująca stan/proces, agregat, suma, avg, count, calculated metric
- Kluczowe: jednoznaczna definicja, powiązanie z wymiarami (drilldown)
- [[Business Intelligence|BI]]: budowanie raportów, dashboardów, monitoring [[KPI]]
- Warstwa miar (np. [[dbt]], Looker): spójna definicja, reużycie, unifikacja danych
- Przykład: przychód wg produktu i regionu, LTV wg segmentu, conversion rate jako miara obliczona
- Przykłady systemów: Power [[Business Intelligence|BI]], Tableau, Looker, [[dbt]] metrics