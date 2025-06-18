---
title: "ETL"
tags:
- inżynieria danych
---
ETL (Ekstrakcja, [Przekształcanie](notes/transformacje%20danych.md) i Ładowanie) to paradygmat przenoszenia danych z jednego systemu do drugiego. Obejmuje odczyt danych (Ekstrakcja) z jednego systemu, modyfikację danych (Przekształcanie), a następnie przesłanie ich (Ładowanie) do systemu docelowego. Paradygmat ETL pojawił się w latach 70. 

Kluczową cechą ETL jest to, że dane są przekształcane przed ich przesłaniem do celu, jak to ilustruje poniższy obraz:

![](images/etl-tool.png)

Jednak w ostatnich latach preferowany paradygmat przenoszenia danych przesunął się w kierunku [ELT](notes/elt.md) (Ekstrakcja, Ładowanie i Przekształcanie). Filozofia ELT nakazuje, że dane powinny pozostać nietknięte - poza drobnym oczyszczaniem i filtrowaniem - podczas przechodzenia przez etapy ekstrakcji i ładowania, aby surowe dane zawsze były dostępne w docelowym [Magazynie Danych](notes/data%20warehouse.md). Zobacz [ETL kontra ELT](notes/etl%20vs%20elt.md) po porównanie tych podejść.


## ETL się zmienia
Sposób, w jaki wykonujemy ETL, się zmienia. Przez długi czas ETL wykonywano za pomocą narzędzi takich jak Informatica, IBM Datastage, Cognos, AbInitio lub Microsoft SSIS. Obecnie używamy bardziej programowych lub konfiguracyjnych platform, takich jak [Airflow](notes/airflow.md), [Dagster](notes/dagster.md) i [Temporal](notes/temporal.md).

Historycznie **ETL kiedyś był preferowany** nad ELT z następujących **już nieważnych powodów**:
- ETL mógł osiągnąć oszczędności kosztów poprzez usunięcie niechcianych danych przed ich przesłaniem do celu - jednak wraz ze spadkiem kosztów obliczeń i przechowywania w chmurze wartość tej propozycji jest znacznie mniejsza.
- Ponieważ ETL przekształca dane przed ich przechowywaniem, unika złożoności przekształcania danych _po_ przesłaniu ich do celu - jednak nowe narzędzia takie jak [dbt](notes/dbt.md) (data build tool) sprawiają, że przekształcanie danych w miejscu docelowym jest preferowane i łatwe.
