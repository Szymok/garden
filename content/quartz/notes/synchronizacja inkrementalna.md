---
title: Inkrementalna Inkrementalna
tags:
  - airbyte
---
Inkrementalna synchronizacja to proces efektywnego kopiowania danych do systemu docelowego poprzez okresowe wykonywanie zapytań na systemie źródłowym w celu uzyskania rekordów, które zostały zaktualizowane lub dodane od poprzedniej operacji synchronizacji. Tylko te rekordy, które niedawno zostały dodane lub zaktualizowane, zostaną przesłane do celu, co jest znacznie bardziej efektywne niż kopiowanie całego zbioru danych podczas każdej operacji synchronizacji. Inkrementalna synchronizacja wykorzystuje pole kursora, takie jak `updated_at` (lub dowolne inne pole), aby określić, które rekordy powinny być propagowane, i replikowane powinny być tylko rekordy z wartością `updated_at`, która jest nowsza niż wartość `updated_at` ostatniego rekordu wysłanego w poprzedniej synchronizacji.

Jednakże, bez specjalnego rozważenia, rekordy, które zostały usunięte w systemie źródłowym, nie będą propagowane do celu, ponieważ nigdy nie pojawią się w wynikach takiego zapytania. 
