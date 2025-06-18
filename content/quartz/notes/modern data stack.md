---
title: "Nowoczesny Stos Danych"
tags:
- inżynieria danych
---
Nowoczesny Stos Danych (MDS) to zestaw narzędzi open-source służących do osiągnięcia pełnej analizy od procesu przyjmowania danych do [transformacji](notes/transformacje%20danych.md), aż po wykorzystanie uczenia maszynowego w celu utworzenia rozwiązania hurtowni danych kolumnowych lub zasobu typu lake, z obsługą panelu analitycznego do przeglądania danych. Ten stos jest rozszerzalny jak klocki Lego. Zazwyczaj składa się z **[integracji danych](notes/integracja%20danych.md), narzędzia do transformacji, [Orchestratora](notes/orkiestrator%20danych.md) i narzędzia [Inteligencji Biznesowej](notes/narz%C4%99dzia%20business%20intelligence.md)**. W miarę wzrostu ilości danych można dodać narzędzia do kontroli jakości danych, narzędzia do obserwowalności, [Katalog Danych](notes/katalog%20danych.md), [Warstwę Semantyczną](notes/warstwa%20semantyczna.md) i wiele innych.

W pewnym sensie, jest to rozbiórka [stosu danych](https://blog.fal.ai/the-unbundling-of-airflow-2/), jak to ujmuje Gorkem:
> Produkty zaczynają się od niewielkich rozmiarów, z czasem dodają przylegające obszary i funkcjonalności do swojej oferty, stając się platformami. Kiedy te **platformy** osiągną odpowiednią skalę, ludzie zaczynają opracowywać lepiej zaniedbane obszary lub abstrahować funkcjonalność, aby podzielić ją na specjalizowane fragmenty, i wtedy zaczyna się rozbiórka.

Celem MDS jest uzyskanie wglądu w dane przy użyciu najlepiej dopasowanych narzędzi do każdej części. Warto zaznaczyć, że jest to stosunkowo nowy termin.

> [!note] Nowe terminy pojawiające się
>
> Pojawił się już nowy termin [ngods (nowa generacja otwartego stosu danych)](https://blog.devgenius.io/modern-data-stack-demo-5d75dcdfba50). Lub *DataStack 2.0* w ostatnim artykule na blogu Dagstera: [Evolution IQ Case Study](https://dagster.io/blog/evolution-iq-case-study).

## Przyszłość MDS
Jeśli spojrzymy nieco w przyszłość, Barr Moses przedstawia w swoim artykule [Co czeka w przyszłości na Nowoczesny Stos Danych?](https://www.montecarlodata.com/blog-the-future-of-the-modern-data-stack/) więcej funkcji, takich jak udostępnianie danych, wszechstronna [Gospodarka Danych](notes/data%20governance.md), wyrównane [Zasób Danych](notes/data%20asset.md) i [Hurtownia Danych](notes/data%20warehouse.md), oraz nowsza ewolucja analizy predykcyjnej:
![](images/future-modern-data-stack.png)
