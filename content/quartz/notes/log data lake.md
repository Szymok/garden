---
title: "dziennik transakcji w Data Lake"
tags:
- inżynieria danych
---

Dziennik transakcji to uporządkowany zapis każdej transakcji, z konfigurowalnym okresem, który opcjonalnie można ustawić tak, aby przechowywać wszystkie transakcje (tj. dane nieskończone). Dziennik transakcji to wspólny komponent używany w wielu z powyższych funkcji, w tym w transakcjach [ACID](notes/acid.md), skalowalnym przetwarzaniu metadanych i podróży w czasie [Time Travel](notes/time%20travel.md). Na przykład, [Delta Lake](notes/delta%20lake.md) tworzy pojedynczy [folder o nazwie `_delta_log`](https://airbyte.com/tutorials/load-data-into-delta-lake-on-databricks-lakehouse#step-5).
