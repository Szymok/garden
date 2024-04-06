---
title: "Granulacja danych"
tags:
- inżynieria danych
---
Deklarowanie granulacji (lub _ziarna_) to kluczowy krok w [Modelowaniu Wymiarowym](notes/modelowanie%20wymiarow.md). Granulacja określa dokładnie, co reprezentuje pojedynczy wiersz tabeli faktów. Deklaracja granulacji staje się wiążącą umową dotyczącą projektu. Granulację należy zadeklarować przed wyborem [wymiarów](notes/wymiary) lub [faktów](notes/fakty), ponieważ każdy kandydujący wymiar lub fakt musi być zgodny z granulacją. Ta spójność zapewnia jednolitość we wszystkich projektach wymiarowych, co jest kluczowe dla wydajności i łatwości użycia aplikacji [Inteligencji Biznesowej](notes/business%20intelligence.md).

Na przykład, w warstwie **transformacji**, trzeba zrównoważyć niską i wysoką granulację. Na jakim poziomie dokonujesz agregacji i przechowujesz dane (np. [rollups](notes/rollup.md) danych godzinowych w celu oszczędności przestrzeni), lub jakie wartościowe wymiary dodać. Z dodaniem każdego wymiaru i jego kolumny, liczba wierszy będzie się [rozrastać](https://www.ibm.com/docs/en/ida/9.1.1?topic=phase-step-identify-measures#c_dm_design_cycle_4__c_dm_4_step7) wykładniczo, i nie możemy trwale przechowywać każdej z tych reprezentacji na dysku.

[Warstwa Semantyczna](notes/warstwa%20semantyczna.md) jest znacznie bardziej elastyczna i ma największy sens na bazie [przetworzonych danych](notes/transformacje%20danych.md) w [Magazynie Danych](notes/data%20warehouse.md). Unikaj rozległych przenosin lub ponownych przetwarzan dużej ilości danych. Pomyśl o kostkach [OLAP](notes/olap).md), gdzie możesz dowolnie kroić i kroić ad-hoc znaczące ilości danych bez ich wcześniejszego przechowywania.

Dowiedz się więcej na temat [Technik Modelowania Wymiarowego Kimballa](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/grain/). Również powiązane jest [Rollup](notes/rollup.md).
