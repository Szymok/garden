---
title: Ataccama ONE Metadata Reader
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - etl
  - metadata
  - components
aliases:
  - ONE Metadata Reader Step
  - Czytnik metadanych
---
# 🎯 Definicja
Komponent (krok w planie ETL) umożliwiający pobieranie metadanych z platformy Ataccama ONE do procesu przetwarzania danych.

# 🔑 Kluczowe punkty
- **Źródło:** Czyta z repozytorium metadanych (MMM).
- **Zastosowanie:** Raportowanie o stanie DQ, migracja metadanych, dynamiczne generowanie reguł.
- **Filtrowanie:** Obsługuje [[AQL]] (Ataccama Query Language) do zawężania wyników.

# 📚 Szczegółowe wyjaśnienie
Pozwala wyciągnąć informacje "o danych" z systemu.
Np. zamiast czytać dane z tabeli, czytasz *informacje o kolumnach* tej tabeli (typ, długość, właściciel).

# 💡 Przykład zastosowania
Chcesz wygenerować raport PDF z listą wszystkich reguł DQ, które mają status "Draft".
1. Używasz `Metadata Reader`.
2. Zapytanie AQL: `SELECT name, author FROM DqRule WHERE status = 'Draft'`.
3. Wynik zapisujesz do pliku Excel krokiem `Excel Writer`.

## 📌 Źródła
- Ataccama Desktop Guide.

## 👽 Brudnopis
- Kluczowy element "Metadata Driven" development.