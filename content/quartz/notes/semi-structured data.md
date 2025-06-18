---
title: "semi-structured data"
tags:
- inżynieria danych
- koncepcja
---

Dane półstrukturalne to dane, które nie posiadają sztywnej struktury i nie odpowiadają bezpośrednio modelowi danych, ale posiadają tagi, metadane lub elementy opisujące te dane. Przykłady danych półstrukturalnych to pliki JSON lub XML. Dane półstrukturalne często zawierają wystarczająco dużo informacji, aby można je było stosunkowo łatwo przekształcić w dane strukturalne.

Przykładem danych półstrukturalnych jest osadzone w ciągu znaków dane JSON. Ciąg znaków zawiera wszystkie informacje potrzebne do zrozumienia struktury danych, ale jest obecnie tylko ciągiem znaków - jeszcze nie został przekształcony w strukturę. Przykładem danych półstrukturalnych jest Surowy JSON przechowywany przez Airbyte podczas procesu ELT. Wygląda to następująco:

|               |  **\_airbyte_data**|
|---------| -----------|
|Rekord 1| \"{'id': 1, 'name': 'Mary X'}\" |
|Rekord 2| \"{'id': 2, 'name': 'John D'}\"|

## Dane półstrukturalne a dane strukturalne
W przeciwieństwie do danych półstrukturalnych, [dane strukturalne](notes/dane%20strukturalne.md) odnoszą się do danych sformatowanych według dobrze zdefiniowanego schematu. Przykładem mogą być dane przechowywane w dokładnie zdefiniowanych kolumnach w bazie danych relacyjnej lub arkuszu kalkulacyjnym Excela. Przykłady pól strukturalnych mogą obejmować wiek, imię, numer telefonu, numery kart kredytowych lub adres.

## Przekształcanie danych półstrukturalnych w dane strukturalne

Przekształcenie danych półstrukturalnych w dane strukturalne jest często stosunkowo prostym procesem. Przekształcenie danych półstrukturalnych w dane strukturalne jest zwykle wykonywane podczas etapu [transformacji danych](notes/transformacje%20danych.md) w procesie [ETL](notes/etl.md) lub [ELT](notes/elt.md).

Na przykład, jeśli włączona jest normalizacja, to Airbyte automatycznie przekształci przechowywane w polu `_airbyte_data` dane JSON w tabelę, która będzie wyglądać następująco:

|               |  **id** | **name** |
|---------| -----------|---- |
|Rekord 1| 1 | "Mary X" |
|Rekord 2|2| "John D" |
  
## Przykład rzeczywistego przekształcenia danych półstrukturalnych w dane strukturalne

Jeśli dane półstrukturalne w formacie JSON byłyby przechowywane w bazie danych Postgres, mogłyby zostać przekształcone w dane strukturalne przy użyciu [Funkcji i Operatorów JSON]([https://www.postgresql.org/docs/9.4/functions-json.html](https://www.postgresql.org/docs/9.4/functions-json.html)). 