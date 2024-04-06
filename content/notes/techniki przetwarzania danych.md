---
title: "Jakie są Techniki Przetwarzania Danych (oparte na wierszach, kolumnach, wektorowe)"
tags:
- inżynieria danych
---
Zbiór koncepcji i technologii obejmujących różne metody i optymalizacje przechowywania, pobierania i przetwarzania danych w systemach baz danych. Ta strona słownika zawiera definicje dla **przechowywania kolumnowego, przechowywania wierszowego i silników wektorowych**, które są wszystkie technikami mającymi na celu poprawę wydajności i efektywności różnych rodzajów obciążeń, takich jak operacje transakcyjne, analityczne i przetwarzanie danych na dużą skalę.

Dzięki zrozumieniu tych technik, użytkownicy i programiści baz danych mogą podejmować świadome decyzje dotyczące tego, która metoda najlepiej pasuje do ich konkretnych przypadków użycia i wymagań.

## Przechowywanie Kolumnowe
Technika przechowywania danych w bazie danych, która przechowuje dane według kolumn, a nie wierszy, co umożliwia bardziej efektywne kompresowanie i szybsze zapytania w obciążeniach analitycznych. Przechowywanie kolumnowe jest szczególnie przydatne dla operacji odczytu i dużych analiz danych, ponieważ umożliwia pobieranie konkretnych kolumn bez konieczności dostępu do całego wiersza. Stanowi to kontrast wobec tradycyjnego przechowywania wierszowego, gdzie dane są przechowywane wiersz po wierszu, co bardziej pasuje do obciążeń transakcyjnych i operacji, które obejmują częste aktualizacje i wstawiania.

## Przechowywanie Wierszowe
Tradycyjna technika przechowywania danych w bazie danych, gdzie dane są przechowywane w kolejnych wierszach, umożliwia efektywne przetwarzanie operacji, które obejmują całe rekordy, takie jak wstawianie, aktualizowanie i usuwanie. Przechowywanie wierszowe jest odpowiednie dla systemów transakcyjnych (OLTP), które wymagają szybkiego dostępu do poszczególnych rekordów. Może jednak być mniej efektywne dla obciążeń analitycznych i przetwarzania danych na dużą skalę, gdzie przechowywanie kolumnowe oferuje lepszą wydajność dzięki możliwości wybiórczego pobierania konkretnych kolumn bez dostępu do całego wiersza.

## Silnik Wektorowy
Nowoczesny silnik wykonawczy zapytań bazodanowych, zaprojektowany do optymalizacji przetwarzania danych poprzez wykorzystanie operacji wektorowych i zdolności SIMD (Single Instruction, Multiple Data) nowoczesnych procesorów. Silniki wektorowe, takie jak Photon Engine firmy Databricks lub [DuckDB](notes/duckdb.md), przetwarzają dane w dużych blokach lub partiach, co umożliwia poprawioną równoległość, lokalność cache i zmniejszenie narzutu w porównaniu do tradycyjnych silników przetwarzania wierszowego w trybie wierszowym. Skutkuje to znacznie szybszą wydajnością zapytań, szczególnie w przypadku obciążeń [analitycznych](notes/analiza%20danych.md) i przetwarzania danych na dużą skalę, co czyni silniki wektorowe popularnym wyborem w erze dużych danych i analizy czasu rzeczywistego.
