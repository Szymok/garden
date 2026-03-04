---
title: Ataccama ONE Explorer
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - ide
  - development
  - components
aliases:
  - ONE Desktop Explorer
  - Zakładka Explorer
---
# 🎯 Definicja
Główny widok w **Ataccama ONE Desktop** (IDE), służący do nawigacji po plikach projektu, planach przetwarzania danych (.plan), komponentach (.comp) i regułach.

# 🔑 Kluczowe punkty
- **Zasoby:** Pozwala zarządzać plikami `.plan`, `.comp`, `.rule`, `.profile`.
- **Integracja:** Bezpośrednie połączenie z repozytorium Git i serwerem ONE Platform.
- **Drag & Drop:** Możesz przeciągać reguły i źródła danych bezpośrednio na obszar roboczy planu.

# 📚 Szczegółowe wyjaśnienie
To tutaj programista spędza 90% czasu. Strukturę projektu tworzą foldery:
- `data/` - pliki wejściowe/wyjściowe (CSV, TXT).
- `plans/` - logika ETL.
- `components/` - reużywalne fragmenty logiki.
- `rules/` - reguły DQ.

# 💡 Przykład zastosowania
Chcesz stworzyć nowy proces walidacji? W Explorerze klikasz PPM na folder `plans` -> `New Plan`, nazywasz go `validate_customers.plan`, a następnie przeciągasz tabelę z bazy danych z sekcji `Catalog Items`.

## 📌 Źródła
- Ataccama ONE Desktop Documentation.

## 👽 Brudnopis
- Wirtualne Katalogi (Virtual Catalog Items) też są tu widoczne.
- Można podglądać dane (F8) bezpośrednio z plików.