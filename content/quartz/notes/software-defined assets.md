---
title: software-defined assets
tags:
  - inżynieria
  - danych
---

Zasób zdefiniowany programowo (ang. Software-Defined Asset) został wprowadzony po raz pierwszy przez [Dagster](notes/Dagster.md) z następującą definicją:
> Nowe, [deklaratywne](notes/deklaratywność.md) podejście do zarządzania danymi i ich orchestracji.
> Deklaratywne zarządzanie danymi polega na użyciu kodu do zdefiniowania zasobów danych, które mają istnieć. Te definicje zasobów, kontrolowane wersjonowaniem za pomocą gita i inspekcjonowalne za pomocą narzędzi, pozwalają każdemu w Twojej organizacji zrozumieć Twój kanoniczny zestaw zasobów danych, umożliwiają odtworzenie ich w dowolnym momencie i stanowią podstawę dla opartej na zasobach orchestracji.

Kluczem do zasobów zdefiniowanych programowo jest deklaracja zasobu danych/produktu przed uruchomieniem. Funkcja zdefiniowana programowo w Dagsterze jest podobna do mikrousługi lub kodu, który definiuje zasób w sposób [funkcjonalny](notes/funkcjonalny%20data%20engineering.md) (który może działać niezależnie). Dzięki podejściu deklaratywnemu mamy więcej informacji zdefiniowanych jako kod, co pomaga [orchestratorowi](notes/orkiestrator%20danych.md) określić linię dziedziczenia, sposób uruchamiania, itp.

Najlepszą rzeczą jest to, że otrzymujemy rzeczywistą linię dziedziczenia naszych fizycznych zasobów danych, a nie arbitralną linię zadań (co jest interesujące dla inżynierów, ale nie dla konsumentów danych).

W przyszłości będzie pisanych więcej kodów z wykorzystaniem zasobów zdefiniowanych programowo, ponieważ redukuje to potrzebę pisania dużej ilości szablonów, ponieważ jest deklaratywność i opisuje, co zasób ma zrobić i zawierać, a nie jak to jest obsługiwane i uruchamiane przez Dagstera. Zobacz więcej na temat [Trendów w Orkiestracji Danych](https://airbyte.com/blog/data-orchestration-trends), gdzie wyjaśniono trendy obejmujące ten przejście od [imperatywnego](notes/imperatywność.md) potoku z operacjami, zadaniami, grafami itp. do Zasobów z zasobami zdefiniowanymi programowo.

Wiele ogłoszono podczas [Dnia Społeczności Dagstera](https://www.youtube.com/live/An78xLxM9zQ?feature=share), gdzie Nick, założyciel Dagstera, powiedział: "Pomyśl o iPhone'ie: Wydaje się, że to jedno urządzenie, ale jest to wiele skomplikowanej i zróżnicowanej technologii. To samo dotyczy orkiestracji, która może być przyszłością w pakowaniu [Stosu Danych Otwartych](notes/open%20data%20stack.md) w jeden spójny stos danych. Alternatywą byłoby pionowe zintegrowanie z jednym z prominentnych dostawców.
