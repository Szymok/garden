---
title: Ataccama ONE Metadata Writer
created: 2026-02-04
status: sapling
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - etl
  - metadata
  - automation
aliases:
  - ONE Metadata Writer Step
  - Zapis metadanych
---
# 🎯 Definicja
Komponent (krok w planie ETL) umożliwiający tworzenie, aktualizację lub usuwanie obiektów metadanych w platformie [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **Moc:** Pozwala programowo zarządzać platformą (np. automatycznie zakładać tysiące terminów słownikowych).
- **Ryzyko:** Nieprawidłowe użycie może uszkodzić spójność metadanych.
- **Tryby:** Create, Update, Delete.

# 📚 Szczegółowe wyjaśnienie
Służy do automatyzacji Governance.
Scenariusz: "Data Synchronization". Masz zewnętrzny system HR. Chcesz, aby każdy nowy pracownik w HR automatycznie stawał się "Użytkownikiem" w [[Ataccama|Ataccama]] ONE.
Plan ETL czyta bazę HR -> `Metadata Writer` tworzy obiekt `User` w Ataccamie.

# 💡 Przykład zastosowania
Masowy import definicji biznesowych z Excela do Glosariusza (Business Glossary).
1. `Excel Reader` (czyta plik).
2. `Metadata Writer` (tworzy obiekty typu `Term` w folderze `Glossary`).

## 📌 Źródła
- [[Ataccama|Ataccama]] Desktop Guide.

## 👽 Brudnopis
- Wymaga uprawnień administratora lub odpowiednich ról w systemie.
- Często używany w migracjach z innych systemów DQ.