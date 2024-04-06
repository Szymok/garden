---
title: "Niestrukturalne dane"
tags:
- inżynieria danych
- koncepcje
---
Niestrukturalne dane to dane, które nie podlegają modelowi danych i nie mają łatwo rozpoznawalnej struktury. Dane niestrukturalne nie mogą być łatwo wykorzystywane przez programy i są trudne do analizy. Przykłady danych niestrukturalnych to zawartość e-maila, treść dokumentu Word, dane z mediów społecznościowych, zdjęcia, filmy, wyniki ankiet itp.

## Przykład niestrukturalnych danych

Prostym przykładem niestrukturalnych danych jest ciąg znaków zawierający interesujące informacje, ale nie został on sformatowany zgodnie z dobrze zdefiniowanym schematem. Przykładem jest przedstawiona poniżej tabela:

|               |  **NiestrukturalnyCiąg**|
|---------| -----------|
|Rekord 1| "Bob ma 29 lat" |
|Rekord 2| "Mary właśnie skończyła 30 lat"|

## Dane niestrukturalne a dane strukturalne

W przeciwieństwie do danych niestrukturalnych, [dane strukturalne](notes/dane%20strukturalne.md) odnoszą się do danych, które zostały sformatowane zgodnie z dobrze zdefiniowanym schematem. Przykładem mogą być dane przechowywane w dokładnie zdefiniowanych kolumnach w bazie danych relacyjnej lub arkuszu kalkulacyjnym. Przykłady strukturalnych pól to wiek, imię, numer telefonu, numery kart kredytowych czy adresy. Przechowywanie danych w formacie strukturalnym umożliwia ich łatwe zrozumienie i zapytania za pomocą maszyn oraz narzędzi takich jak SQL.

## Formatowanie danych niestrukturalnych

Przekształcenie danych strukturalnych z danych niestrukturalnych jest często wykonywane podczas etapu [transformacji danych](notes/transformacje%20danych.md) w procesie [ETL](notes/etl.md) lub [ELT](notes/elt.md). 

Na przykład, aby efektywnie wykorzystać dane niestrukturalne podane w poprzednim przykładzie, można by je przekształcić na dane strukturalne takie jak poniżej:

|               |  **imię** | **wiek** |
|---------| -----------|---- |
|Rekord 1| "Bob" | 29 |
|Rekord 2| "Mary"| 30 |

Przechowywanie danych w strukturalny sposób sprawia, że znacznie łatwiej jest przeprowadzać zapytania. Na przykład po sformatowaniu danych przykładowych jest możliwe łatwe i efektywne wykonywanie zapytań według imienia lub wieku.
