---
title: "imperatywność"
tags:
- inżynieria danych
---

Pipeline **imperatywny** wskazuje _jak_ postępować na każdym etapie w sposób proceduralny. W przeciwieństwie do tego, rurociąg **[deklaratywność](notes/deklaratywność.md)** w przetwarzaniu danych nie określa kolejności wykonania, lecz zamiast tego pozwala każdemu krokowi/zadaniu znaleźć najlepszy czas i sposób na uruchomienie.

Sposób _jak_ powinien być odpowiednio obsłużony przez narzędzie, framework lub platformę, na której się to odbywa. Na przykład, zaktualizuj zasób, gdy zmieniły się dane źródłowe. Oba podejścia prowadzą do tego samego wyniku. Niemniej jednak, podejście deklaratywne korzysta z **planistów zapytań w czasie kompilacji** i **analizy statystyk działania** w celu wyboru najlepszego sposobu obliczeń oraz znalezienia wzorców w celu ograniczenia ilości przekształconych danych.
