---
title: "Push-Down"
tags:
- inżynieria danych
aliases:
- Optymalizacja Push-Down
---
Push-Down (ang. optymalizacja push-down) ma na celu wykonanie jak największej ilości pracy w bazach źródłowych.

Push-downy lub optymalizacje push-down przenoszą logikę transformacji do bazy danych źródłowej. To zmniejsza potrzebę fizycznego przechowywania danych i transferu ich przez sieć.

Na przykład, warstwa semantyczna (ang. semantic layer) lub wirtualizacja danych (ang. data virtualization) przekształca logikę transformacji w zapytania [SQL](notes/sql.md) i przesyła je do bazy danych. Baza danych źródłowa uruchamia zapytania SQL w celu przetworzenia transformacji.

Optymalizacja push-down zwiększa wydajność mapowania, gdy baza danych źródłowa może przetwarzać logikę transformacji szybciej niż sama warstwa semantyczna.
