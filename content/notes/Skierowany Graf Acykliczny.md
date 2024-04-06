---
title: "Skierowany Graf Acykliczny (DAG - Directed Acyclic Graph)"
tags:
- inżynieria danych
---
Skrót DAG oznacza **Skierowany Graf Acykliczny**. DAG to graf, w którym informacje muszą podróżować wzdłuż skończonego zbioru węzłów połączonych krawędziami. Nie ma określonego węzła startowego ani też możliwości, by dane podróżowały przez graf w pętli, która wraca do punktu startowego.

Jest to popularny sposób budowania potoków danych. Graf ten jasno definiuje [Genealogię Danych](notes/genealogia%20danych.md). Ponadto, jest stworzony w celu funkcjonalnego podejścia, w którym istnieje [idempotencja](notes/idempotentność.md), aby można było ponownie uruchamiać potoki bez efektów ubocznych.

![](images/dag.png)
