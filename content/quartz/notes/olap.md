---
title: "OLAP (Online Analytical Processing)"
tags:
- inżynieria danych
---

OLAP to skrót od **Online Analytical Processing** (Przetwarzanie Analityczne w Trybie Online). OLAP wykonuje wielowymiarową analizę danych biznesowych i umożliwia złożone obliczenia, analizę trendów oraz zaawansowane [modelowanie wymiarow](notes/modelowanie%20wymiarow.md). **Sześcian OLAP** to baza danych wielowymiarowa zoptymalizowana dla potrzeb [hurtowni danych](notes/data%20warehouse.md) i aplikacji przetwarzania analitycznego online (OLAP).

Sześcian OLAP to metoda przechowywania danych w formie wielowymiarowej, zazwyczaj w celu raportowania. W sześcianach OLAP dane ([Miary](notes/miara.md)) są kategoryzowane według [wymiarów](notes/wymiary.md).

Aby zarządzać i przeprowadzać procesy związane z sześcianem OLAP, Microsoft opracował język zapytań, znany jako [wyrażenia wielowymiarowe (MDX)](https://learn.microsoft.com/en-us/analysis-services/multidimensional-models/mdx/), pod koniec lat 90. Wielu innych dostawców baz wielowymiarowych przyjęło MDX do zapytań danych, ale obsługa sześcianu wymaga specjalistycznych umiejętności.

Przeciwieństwem OLAP jest [OLTP](notes/oltp.md). Więcej informacji można znaleźć na stronie [Wikipedia](https://pl.wikipedia.org/wiki/OLAP).
