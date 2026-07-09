---
title: Ataccama ONE Metadata Explorer
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - metadata
  - exploration
  - mmg
aliases:
  - Metadata Mode
  - Przeglądarka metadanych
---
# 🎯 Definicja
Widok w [[ONE Desktop|ONE Desktop]] służący do inspekcji struktury metadanych platformy (MMDM - Meta Meta Data Model). Pozwala zrozumieć, jakie obiekty (Entities) i relacje istnieją w systemie.

# 🔑 Kluczowe punkty
- **Read-only:** Nie służy do edycji (do tego służy [[Metadata|Metadata]] Writer lub GUI webowe).
- **Tryby:**
    - *[[Metadata|Metadata]] Mode:* Szczegóły konkretnej instancji (np. tabela "Klienci").
    - *[[Metadata|Metadata]] Presentation Mode:* Definicje typów obiektów (np. co to jest "Tabela").

# 📚 Szczegółowe wyjaśnienie
Przydatne przy pisaniu zaawansowanych automatyzacji. Jeśli chcesz napisać skrypt, który "znajdzie wszystkie tabele bez właściciela", musisz najpierw zobaczyć w [[Metadata|Metadata]] Explorerze, jak powiązane są obiekty `Table` i `User`.

# 💡 Przykład zastosowania
Sprawdzenie, jakie atrybuty ma obiekt `DQ Rule` w systemie, aby użyć ich w raporcie (np. `author`, `createdDate`, `qualityDimension`).

## 📌 Źródła
- [[Ataccama|Ataccama]] Documentation - [[Metadata|Metadata]] Management.

## 👽 Brudnopis
- MMM ([[Metadata|Metadata]] Model Management) jest sercem Ataccamy.
- Explorer pokazuje "graf" powiązań.