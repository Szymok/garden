---
title: normalizacja bazy danych
tags:
  - inżynieria
  - danych
---
Normalizacja jest stosowana w projektowaniu relacyjnych baz danych w celu zmniejszenia redundancji danych i poprawy integralności danych. Opracowana przez brytyjskiego informatyka [Edgara F. Codd](https://en.wikipedia.org/wiki/Edgar_F._Codd) w latach 70. jako część jego modelu relacyjnego, normalizacja polega na organizacji kolumn (atrybutów) i tabel (relacji) w bazie danych w celu zapewnienia właściwego egzekwowania zależności poprzez ograniczenia integralności bazy danych.

Osiąga się to poprzez stosowanie formalnych reguł podczas procesu syntezy (tworzenia nowego projektu bazy danych) lub dekompozycji (ulepszania istniejącego projektu bazy danych).

1. **Pierwsza Forma Normalna (1NF)**:
    - Eliminacja zduplikowanych danych, zapewniając, że każdy atrybut zawiera tylko wartości atomowe, a każda tabela ma unikalny klucz główny.
2. **Druga Forma Normalna (2NF)**:
    - Spełnienie wszystkich wymagań 1NF i usunięcie zależności częściowych poprzez zapewnienie, że każdy atrybut nieprymarny (atrybut niebędący częścią żadnego klucza kandydującego) całkowicie zależy od klucza głównego.
3. **Trzecia Forma Normalna (3NF)**:
    - Spełnienie wszystkich wymagań 2NF i usunięcie zależności przechodnich poprzez zapewnienie, że żaden atrybut nieprymarny nie jest zależny w sposób przechodni od klucza głównego.

## Denormalizacja
**Denormalizacja**, z drugiej strony, to proces celowego wprowadzania redundancji do projektu bazy danych poprzez łączenie tabel lub dodawanie nadmiarowych danych, mający na celu poprawę wydajności zapytań lub uproszczenie struktury bazy danych. Denormalizacja jest **odwrotnością normalizacji**. Proszę wziąć pod uwagę kompromis między integralnością danych a wydajnością zapytań. Ta technika jest stosowana w [Modelowaniu Wymiarowym](notes/modelowanie%20wymiarow.md) w kostkach [OLAP](notes/olap.md), na przykład.
