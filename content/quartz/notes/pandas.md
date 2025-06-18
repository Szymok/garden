---
title: "Pandas"
tags:
- inżynieria danych
---
Pandas to biblioteka oprogramowania napisana w języku programowania [Python](notes/python.md) do manipulacji i analizy danych. W szczególności oferuje struktury danych i operacje do manipulowania tabelami numerycznymi i szeregami czasowymi. Jest to oprogramowanie wolne, udostępniane na licencji trójklauzulowej BSD.

## DataFrame w Pandas
To dwuwymiarowa, zmienna pod względem rozmiaru, potencjalnie heterogeniczna tabela danych.

Struktura danych zawiera również osie oznaczone etykietami (wiersze i kolumny). Operacje arytmetyczne są dopasowane zarówno do etykiet wierszy, jak i kolumn. Może być traktowany jako kontener podobny do słownika dla obiektów typu Series. To główna struktura danych w bibliotece Pandas.

Więcej informacji można znaleźć w [Dokumentacji Pandas](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html).

Innym DataFrame o tej samej strukturze API jest [Koalas](https://github.com/databricks/koalas), stworzony przez firmę Databricks, zoptymalizowany dla większych zestawów danych oraz [Apache Spark](notes/apache%20spark.md).
