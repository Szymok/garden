---
title: "ELT"
tags:
- inżynieria danych
---
ELT (Extract, Load, and [Transform](notes/transformacje%20danych.md)) to podejście do [integracji danych](notes/integracja%20danych.md), które polega na wydobyciu (E) danych z systemu źródłowego, załadowaniu (L) surowych danych do systemu docelowego przed przekształceniem (T) tych danych. Innymi słowy, w podejściu ELT przekształcenie (T) danych jest wykonywane _wewnątrz_ docelowego [Magazynu Danych](notes/data%20warehouse.md) po załadowaniu danych.

ELT różni się od bardziej tradycyjnego podejścia [ETL](notes/etl.md) do integracji danych, w którym dane są przekształcane przed dotarciem do celu. Zobacz [ETL kontra ELT](notes/etl%20vs%20elt.md) po więcej szczegółów porównania tych podejść.

Przejście od paradygmatu ETL do paradygmatu ELT stało się możliwe dzięki spadającym kosztom obliczeń i przechowywania w chmurze oraz pojawieniu się magazynów danych opartych na chmurze, takich jak Redshift, BigQuery czy Snowflake.

Następujący obraz ilustruje podejście ELT do integracji danych -- na tym diagramie [dbt](https://docs.getdbt.com/docs/introduction) tworzy i zarządza SQL-em używanym do przekształcania danych w docelowym miejscu:

![](images/elt-tool.png)

ELT jest również powiązane z [Odwróconym ETL](notes/reverse%20etl.md), o którym możesz dowiedzieć się więcej pod adresem: [Wyjaśnienie Odwróconego ETL](https://airbyte.com/blog/reverse-etl#so-what-is-a-reverse-etl) lub [Airbyte.com](https://airbyte.com).
