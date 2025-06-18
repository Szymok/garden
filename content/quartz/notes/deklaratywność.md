---
title: "deklaratywność"
tags:
- inżynieria danych
---
Pipelines danych w podejściu **[deklaratywnym](notes/deklaratywność.md)** nie określają kolejności, w jakiej mają być wykonane, ale zamiast tego pozwalają każdemu krokowi/zadaniu znaleźć najlepszy czas i sposób wykonania. Podejście deklaratywne opisuje *co* program robi, bez wyraźnego określania jego sterowania. [Funkcjonalne Inżynieria Danych](notes/funkcjonalny%20data%20engineering.md) i [Programowanie Funkcyjne](notes/programowanie%20funkcyjne.md) to paradygmaty programowania **deklaratywnego**, w przeciwieństwie do paradygmatów programowania **[imperatywnego](notes/imperatywność.md)**.

## Deklaratywne vs Imperatywne
Podejścia deklaratywne są atrakcyjne, ponieważ sprawiają, że systemy są łatwiejsze do debugowania i automatyzacji. Robią to, wyraźnie pokazując intencję i oferując prosty sposób na zarządzanie i wprowadzanie zmian. Poprzez wyraźne deklarowanie, jak powinien wyglądać pipeline, na przykład **definiując produkty danych, które powinny istnieć**, staje się znacznie łatwiejsze do odkrycia, kiedy to nie jest spełnione, dlaczego tak jest i jakie są przyczyny. To warstwa podstawowa dla całości linii przekazu, obserwowalności i monitorowania [jakości danych](https://airbyte.com/blog/data-quality-issues) w Twojej platformie.

![](images/declarative-vs-imperative.png)
