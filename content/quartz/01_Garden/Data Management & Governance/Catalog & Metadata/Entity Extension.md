---
title: Entity Extension (Rozszerzanie Encji)
created: 2026-02-04
status: evergreen
category: Data Modeling
difficulty: intermediate
language: pl
tags:
  - inheritance
  - metamodel
  - catalog
  - entities
aliases:
  - Dziedziczenie w modelu metadanych
  - Funkcja Extends
---
# 🎯 Definicja
**Entity Extension** (funkcja `Extends`) to mechanizm dziedziczenia w modelu metadanych (np. w Ataccama ONE). Pozwala stworzyć nową encję, która automatycznie przejmuje wszystkie cechy (właściwości i atrybuty) encji bazowej (rodzica), dodając do niej nowe, specyficzne pola.

# 🔑 Kluczowe punkty
- **Dziedziczenie:** Encja pochodna ma wszystko to, co rodzic + swoje własne pola.
- **Niezmienność rodzica:** Nie można usunąć ani zmienić typu odziedziczonych pól w dziecku.
- **Polimorfizm:** Dzięki temu można traktować różne obiekty (Tabela, Plik) jako jeden typ ogólny (KatalogItem).

# 📚 Szczegółowe wyjaśnienie
Przykład hierarchii:
1.  **catalogItem** (Rodzic): Ma pola `Name`, `Description`, `Owner`.
2.  **tableCatalogItem** (`Extends catalogItem`): Dziedziczy nazwę i opis, dodaje `RowCount`, `Columns`.
3.  **fileCatalogItem** (`Extends catalogItem`): Dziedziczy nazwę i opis, dodaje `FileSize`, `Format`.

W interfejsie nie widzisz pól rodzica na liście "własnych" pól encji, są one ukryte pod sekcją "Inherited".

# 💡 Przykład zastosowania
Tworzysz model dla "Zasobu Danych".
Zamiast definiować pole `Nazwa` osobno dla Tabeli, Raportu i Pliku, tworzysz abstrakcyjną encję `Zasób` z polem `Nazwa`.
Następnie Tabela, Raport i Plik dziedziczą po `Zasób`.
Dzięki temu, gdy chcesz wyszukać "Wszystkie zasoby o nazwie X", przeszukujesz tylko encję `Zasób`, a nie trzy osobne.

## 📌 Źródła
- Ataccama ONE Metamodel Configuration Guide.

## 👽 Brudnopis
- Zła praktyka: Dublowanie nazwy pola w dziecku, jeśli już jest w rodzicu (system na to nie pozwoli lub wywoła błąd).
- To klasyczne programowanie obiektowe (OOP) przeniesione na grunt modelowania metadanych.