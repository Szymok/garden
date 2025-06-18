---
title: "Kursor (Cursor)"
tags:
- airbyte
---
Na poziomie koncepcyjnym, kursor jest narzędziem śledzącym, które jest używane podczas [synchronizacji przyrostowej](notes/synchronizacja%20inkrementalna.md), aby zapewnić, że tylko nowo zaktualizowane lub wstawione rekordy są wysyłane z źródła danych do celu w każdej iteracji synchronizacji.

Synchronizacja przyrostowa w Airbyte może być myślona koncepcyjnie jako pętla, która okresowo wykonuje operacje synchronizacji. Każda iteracja tej pętli replikuje tylko rekordy, które zostały wstawione lub zaktualizowane w systemie źródłowym od poprzedniego wykonania tej pętli synchronizacji - innymi słowy, każda operacja synchronizacji będzie kopiować tylko rekordy, które wcześniej nie były replikowane przez poprzednie synchronizacje. Jest to znacznie bardziej efektywne niż kopiowanie całego zbioru danych w każdej iteracji, co jest zachowaniem w przypadku pełnej synchronizacji odświeżania.

Wysyłanie tylko zaktualizowanych lub nowo wstawionych dokumentów wymaga śledzenia, które rekordy zostały już zreplikowane w poprzednich synchronizacjach. Dokonuje się tego za pomocą kursora, który można traktować jako wskaźnik na najnowszy rekord, który został zreplikowany w danej synchronizacji. Podczas wybierania dokumentów do synchronizacji, Airbyte zawiera najnowszą wartość kursora jako część zapytania do systemu źródłowego, aby zapewnić, że zostaną zreplikowane tylko nowe/zaktualizowane rekordy.

Na przykład baza danych źródłowa może zawierać rekordy, które obejmują pole o nazwie `updated_at`, które przechowuje najnowszy czas wstawienia lub aktualizacji rekordu. Jeśli pole `updated_at` jest wybrane jako pole kursora, to po danej operacji synchronizacji, kursor będzie pamiętać największą wartość `updated_at`, która została zobaczone w rekordach zreplikowanych do celu w tej synchronizacji. W kolejnej operacji synchronizacji rekordy, które zostały wstawione lub zaktualizowane w źródle, są pobierane przez włączenie wartości kursora jako części zapytania, tak aby wybierało tylko rekordy, gdzie wartość `updated_at` jest większa niż (a w niektórych przypadkach większa lub równa) największa wartość `updated_at` widziana w poprzedniej synchronizacji.

Należy zauważyć, że choć nie jest surowo konieczne wybieranie pola czasowego jako pola kursora, pole wybrane jako kursor powinno być monotonicznie rosnące w czasie.

Więcej informacji na temat [Synchronizacja przyrostowa danych między bazami danych Postgres](https://airbyte.com/tutorials/incremental-data-synchronization).
