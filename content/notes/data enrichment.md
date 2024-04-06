---
title: data enrichment
---

Wzbogacanie danych to rodzaj [transformacji danych](notes/transformacja%20danych.md), która dodaje dodatkowe informacje do danych w celu umożliwienia nowego rodzaju zapytań i/lub zwiększenia efektywności zapytań.

## Przykład wzbogacania danych
Wyobraź sobie, że masz „System A”, który zawiera mapowanie adresu IP na kraj, oraz „System B”, który zawiera zbiór danych z rekordami zawierającymi adres IP (ale nie zawierający kraju). Jeśli chciałbyś wykonywać zapytania w „Systemie B” według kraju, korzystne byłoby przekształcenie rekordów w „Systemie B”, aby zawierały pole z krajem. Można to osiągnąć, uruchamiając zadanie transformacji, które odczytuje adres IP z każdego rekordu w „Systemie B”, wykonuje wyszukiwanie w „Systemie A”, aby uzyskać powiązaną nazwę kraju, i zapisuje nazwę kraju z powrotem do „wzbogaconego” zbioru danych w „Systemie B”. Przyszłe zapytania, które rozkładają dane według kraju, mogą następnie być wykonywane efektywnie wobec tego wzbogaconego zbioru danych w „Systemie B”.
