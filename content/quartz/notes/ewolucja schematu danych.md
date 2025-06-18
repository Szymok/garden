---
title: "Ewolucja Schematu"
tags:
- inżynieria danych
---
Automatyczna ewolucja schematu to kluczowa cecha w [Formatach Tabel w Jeziorze Danych](notes/format%20tabel%20data%20lake.md), ponieważ zmiana formatów wciąż stanowi utrudnienie w dzisiejszej pracy inżyniera danych. Ewolucja schematu oznacza dodawanie nowych kolumn bez psucia istniejących elementów lub nawet powiększania niektórych typów. Możemy nawet zmieniać nazwy lub kolejność kolumn, chociaż może to zepsuć zgodność wsteczną. Niemniej jednak możemy zmienić jedną tabelę, a format tabeli zadba o jej zmianę we wszystkich rozproszonych plikach. Co najlepsze, nie wymaga to przepisywania całej tabeli i plików podstawowych.

Zobacz także [Transakcje ACID](notes/acid.md).
