---
title: "Dane strukturalne"
tags:
- inżynieria danych
- koncepcja
---
Strukturalne dane odnoszą się do danych, które zostały sformatowane zgodnie z dobrze zdefiniowanym schematem. Przykładem mogą być dane przechowywane w dokładnie zdefiniowanych kolumnach w bazie danych relacyjnej lub arkuszu kalkulacyjnym. Przykłady strukturalnych pól obejmują wiek, imię, numer telefonu, numery kart kredytowych czy adresy. Przechowywanie danych w formacie strukturalnym umożliwia ich łatwe zrozumienie i zapytania za pomocą maszyn oraz narzędzi takich jak SQL.

## Przykład strukturalnych danych

Poniżej znajduje się przykład strukturalnych danych tak, jakby się one pojawiały w bazie danych:

|         |  **wiek**| **imię**| **telefon**| 
|---------|-----|------|-----|
|Rekord 1| 29 | Bob | 123-456 |
|Rekord 2| 30 | Sue | 789-123 | 

Może się wydawać, że wszystkie dane są strukturalne, ale nie zawsze jest to prawda - dane mogą być niestrukturalne lub półstrukturalne. Różnice najlepiej zrozumieć na przykładach, które omówione są w kolejnych sekcjach. 

## Strukturalne dane a dane niestrukturalne

Dane strukturalne można zestawić z [danymi niestrukturalnymi](notes/dane%20niestrukturalne.md), które nie podlegają modelowi danych i nie mają łatwo rozpoznawalnej struktury. Dane niestrukturalne nie mogą być łatwo wykorzystywane przez programy i są trudne do analizy. Przykłady danych niestrukturalnych to zawartość e-maila, treść dokumentu Word, dane z mediów społecznościowych, zdjęcia, filmy, wyniki ankiet itp. 

Prostym przykładem danych niestrukturalnych jest ciąg zawierający interesujące informacje, ale nie został on sformatowany zgodnie z dobrze zdefiniowanym schematem. Przykład jest przedstawiony poniżej:

|               |  **DaneNiestrukturalne**|
|---------| -----------|
|Rekord 1| "Bob ma 29 lat" |
|Rekord 2| "Mary właśnie skończyła 30 lat"|

## Formatowanie danych niestrukturalnych

Przekształcenie danych niestrukturalnych w strukturalne można przeprowadzić podczas etapu [transformacji danych](notes/transformacje%20danych.md) w procesie [ETL](notes/etl.md) lub [ELT](notes/elt.md). 

Na przykład, aby efektywnie wykorzystać dane niestrukturalne podane w poprzednim przykładzie, można by je przekształcić na dane strukturalne, takie jak poniżej:

|               |  **imię** | **wiek** |
|---------| -----------|---- |
|Rekord 1| "Bob" | 29 |
|Rekord 2| "Mary"| 30 |

Przechowywanie danych w strukturalny sposób sprawia, że znacznie łatwiej jest przeprowadzać zapytania. Na przykład po sformatowaniu danych możliwe jest łatwe i efektywne wykonanie następującego zapytania w oparciu o dane strukturalne:
  
``` SQL
SELECT * FROM X where Age=29
```

Takie zapytanie mogłoby być kosztowne i/lub trudniejsze do wykonania na danych niestrukturalnych.

## Strukturalne dane a dane półstrukturalne

Dane strukturalne można również zestawić z [danymi półstrukturalnymi](https://chat.openai.com/notes/dane%20p%C3%B3%C5%82strukturalne.md), które nie mają sztywnej struktury i nie są bezpośrednio zgodne z modelem danych. Niemniej jednak, dane półstrukturalne posiadają tagi i elementy opisujące dane.

Przykłady danych półstrukturalnych to pliki JSON lub XML. Dane półstrukturalne często zawierają wystarczającą ilość informacji, aby można je było stosunkowo łatwo przekształcić w dane strukturalne. 

Przykładem danych półstrukturalnych jest osadzony wewnątrz ciągu znaków JSON. Ciąg zawiera wszystkie informacje wymagane do zrozumienia struktury danych, ale w danym momencie jest to po prostu ciąg znaków - nie został jeszcze sformatowany. Przykładem danych półstrukturalnych jest również surowy JSON przechowywany przez Airbyte podczas procesu ELT. Wygląda to następująco:


|               |  data |
|---------| -----------|
|Rekord 1| "{'id': 1, 'name': 'Mary X'}" |
|Rekord 2| "{'id': 2, 'name': 'John D'}"|
## Formatowanie danych półstrukturalnych

Przekształcenie danych półstrukturalnych na dane strukturalne jest często stosunkowo proste. Na przykład, jeśli włączona jest normalizacja, Airbyte automatycznie przekształci przechowywane w polu `_airbyte_data` dane JSON w tabelę, która wygląda następująco:

|---|**id**|**imię**|
|---|---|---|
|Rekord 1|1|"Mary X"|
|Rekord 2|2|"John D"|

## Praktyczny przykład przekształcenia danych półstrukturalnych na strukturalne

Jeśli dane JSON półstrukturalne są przechowywane w Postgresie, można je przekształcić na dane strukturalne, korzystając z Funkcji i Operatorów JSON. 