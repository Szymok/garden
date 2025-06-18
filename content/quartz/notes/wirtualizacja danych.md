---
title: "Wirtualizacja Danych"
tags:
- inżynieria danych
---
Wirtualizacja Danych pomaga w sytuacjach, gdy masz wiele systemów źródłowych różnych technologii, ale wszystkie są raczej szybkie w czasie odpowiedzi, i jeśli nie uruchamiasz wielu aplikacji operacyjnych. W ten sposób nie przemieszczasz i nie kopiujesz danych oraz nie dokonujesz ich wcześniejszej agregacji, ale masz [Warstwę Semantyczną](notes/warstwa%20miar.md), w której tworzysz swoje modele biznesowe (takie jak kostki), i tylko wtedy, gdy kwerendujesz tę warstwę wirtualizacji danych, kwerenda jest wykonywana na źródle danych. Jeśli używasz np. [Dremio](https://www.dremio.com/), korzystasz tam z technologii [Apache Arrow](notes/apache%20arrow.md), która będzie dla ciebie buforować i optymalizować wiele w pamięci, co pozwoli na osiągnięcie niesamowicie szybkich czasów odpowiedzi.

Jest ściśle związana z [Federacją Danych](notes/data%20federation.md) i [Push-Downs](notes/push-down.md).
