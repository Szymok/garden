---

title: Co to jest Analiza Danych?  
created: 2025-07-16  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- analiza danych
- inżynieria danych
- DataAnalysis
- wizualizacja
- dashboards  
aliases:
- Dashboards
- Wizualizacja

---

# 🎯 Definicja

**Analiza danych** to proces systematycznego gromadzenia, przetwarzania, eksplorowania i interpretowania danych w celu odkrywania istotnych wzorców, trendów i związków, które wspierają podejmowanie decyzji. Jest nauką i sztuką wydobywania wiedzy z danych – zarówno historycznych, jak i bieżących – poprzez techniki statystyczne, eksploracyjne i wizualne.

# 🔑 Kluczowe punkty

- 🎯 Cel: podejmowanie decyzji opartych o dane (data-driven decisions).
- 🔢 Opiera się na zbiorach liczbowych oraz jakościowych – wymaga czyszczenia i standaryzacji danych.
- 📊 Obejmuje raportowanie, eksplorację, modelowanie i wizualizację.
- 🤝 Silnie powiązana z dyscyplinami takimi jak [[Business Intelligence]], statystyka, ekonometria i data science.
- 🛠 Wspierana przez narzędzia do manipulacji danych (np. SQL, [[Pandas]]) i wizualizacji (np. Power [[Business Intelligence|BI]], Tableau).

# 📚 Szczegółowe wyjaśnienie

## Etapy analizy danych

1. **Zbieranie danych** – z wielu źródeł: baz danych, plików CSV, API, jezior danych, hurtowni (Data Warehouse).
2. **Przygotowanie danych** – oczyszczanie, uzupełnianie braków, transformacja, wybór istotnych kolumn.
3. **Eksploracja danych** – zadawanie pytań do danych, filtrowanie, grupowanie, statystyki opisowe.
4. **[[Wizualizacja]]** – użycie wykresów (słupkowych, liniowych, heatmap) dla pokazania wzorców i anomalii.
5. **Wnioskowanie i modelowanie** – przewidywanie trendów, estymowanie wskaźników, testy statystyczne.
6. **Komunikacja wyników** – dashboardy, raporty, storytelling danych.

## Typy analizy

|Rodzaj|Opis|
|---|---|
|Opisowa (descriptive)|Co się wydarzyło? – agregacja, raporty, eksploracja|
|Diagnostyczna|Dlaczego to się wydarzyło? – korelacje, drill-down, segmentacja|
|Predykcyjna ([[Uczenie Maszynowe\|ML]])|Co się prawdopodobnie wydarzy? – modele statystyczne, regresje|
|Preskrypcyjna|Co powinno się wydarzyć? – rekomendacje, optymalizacja decyzji|

## Narzędzia do analizy danych

- ● SQL, [[dbt]] – pobieranie i [[transformacja danych]]
- ● [[Pandas]], Polars – analiza w Pythonie
- ● Excel, Google Sheets – szybka analiza ręczna
- ● Tableau, Power [[Business Intelligence|BI]], Metabase, Superset – dashboardy i [[wizualizacja]]
- ● Jupyter Notebook – eksploracja i dokumentacja interaktywna
- ● R, SPSS, SAS – narzędzia statystyczne

# 💡 Przykład zastosowania

Analityczka w firmie e-commerce analizuje zamówienia z ostatnich sześciu miesięcy. Łączy dane z CRM, kanałów reklamowych i danych magazynowych. Wyznacza współczynnik porzuceń koszyka, mapuje topowe źródła ruchu, tworzy segmenty klientów oraz przedstawia to na dashboardzie Power [[Business Intelligence|BI]]. Wyniki trafiają do decydentów odpowiedzialnych za kampanie remarketingowe i logistykę dostaw.

## 📌 Źródła

- [Wikipedia: Data Analysis](https://en.wikipedia.org/wiki/Data_analysis)
- [Toward Data Science: What is data analysis?](https://towardsdatascience.com/what-is-data-analysis-ae3c5a421d5e)
- [Business Intelligence vs. Data Analysis](https://www.techtarget.com/searchbusinessanalytics/definition/data-analysis)

# 👽 Brudnopis

- analiza danych = dowiedzenie się _co_, _dlaczego_, _co dalej_
- [[Business Intelligence|BI]] skupia się na dashboardach → analiza = interakcja + hipotezy + eksploracja
- kluczowe: dobór miar, metryk, segmentacja, [[wizualizacja]], storytelling
- aspekty techniczne: dane muszą być czyste, transformowane i testowane (jakość)
- Python → [[Pandas]], Polars, Plotly; SQL → eksploracja tabel, grupowanie, limitowanie
- narzędzia [[Business Intelligence|BI]]: Power [[Business Intelligence|BI]], Tableau, Looker, Superset
- DBA → analiza danych operacyjnych; analityk → [[KPI]], strategia; DS → modele
- rola: decyzje strategiczne, QA danych, insighty z marketingu/sprzedaży/wydajności