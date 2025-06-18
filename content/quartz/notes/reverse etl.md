---
title: "Odwrócony ETL"
tags:
- inżynieria danych
aliases:
- Aktywacja Danych
- Analityka Operacyjna
---
Odwrócony ETL to druga strona [ETL](notes/etl.md)/[ELT](notes/elt.md). **W przypadku Odwróconego ETL, hurtownia danych staje się źródłem, a nie miejscem docelowym**. Dane są pobierane z hurtowni, przekształcane w celu dopasowania do wymagań formatowania danych docelowego źródła i ładowane do aplikacji – na przykład do systemu CRM takiego jak Salesforce – w celu umożliwienia podejmowania działań.

W pewnym sensie koncepcja Odwróconego ETL nie jest nowa dla inżynierów danych, którzy od dłuższego czasu umożliwiają przemieszczanie danych z hurtowni do aplikacji biznesowych. Jak wspomina [Maxime Beauchemin](notes/maxime%20beauchemin.md) w [swoim artykule](https://preset.io/blog/reshaping-data-engineering/), Odwrócony ETL "wydaje się być nowoczesnym sposobem rozwiązania pewnej części tego, co dawniej nazywano zarządzaniem danymi głównymi ([Master Data Management (MDM)](notes/master%20data%20management%20(mdm).md))."

Dowiedz się więcej w artykule [Wytłumaczenie Odwróconego ETL](https://airbyte.com/blog/reverse-etl#so-what-is-a-reverse-etl).
