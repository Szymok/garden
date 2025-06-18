---
title: "Architektura Lambda"
tags:
- inżynieria danych
---
Architektura Lambda to architektura przetwarzania danych zaprojektowana do obsługi ogromnych ilości danych, wykorzystująca zarówno metody przetwarzania w trybie wsadowym, jak i przetwarzania strumieniowego. To podejście do architektury stara się zrównoważyć opóźnienia, przepustowość i odporność na błędy, używając przetwarzania wsadowego do dostarczania kompleksowych i dokładnych widoków danych wsadowych, jednocześnie wykorzystując przetwarzanie strumieniowe w czasie rzeczywistym do dostarczania widoków danych online. Dwa wyjścia z widokami mogą być połączone przed prezentacją. Wzrost architektury Lambda jest powiązany z rozwojem dużych danych, analizy w czasie rzeczywistym oraz dążeniem do zmniejszenia opóźnień w przetwarzaniu [MapReduce](notes/mapreduce.md).
