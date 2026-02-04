---
title: Metadata Sync (Synchronizacja Metadanych)
created: 2026-02-04
status: evergreen
category: Data Governance / Integration
difficulty: intermediate
language: pl
tags:
  - metadata-sync
  - integration
  - api
  - lineage
  - automation
aliases:
  - Synchronizacja Katalogów
  - Metadata Exchange
---
# 🎯 Definicja
**Metadata Sync** to proces zapewniania spójności między różnymi systemami zarządzania danymi. Jeśli w bazie danych pojawi się nowa tabela, katalog danych powinien o tym wiedzieć. Jeśli analityk doda opis w katalogu, narzędzie BI powinno go wyświetlić.

# 🔑 Kluczowe punkty
- **Kierunek:** Jednokierunkowy (Source -> Catalog) lub Dwukierunkowy (Catalog <-> BI Tool).
- **Automatyzacja:** Ręczna (Import CSV) vs Automatyczna (API/Scheduled Jobs).
- **Trudności:** Mapowanie pojęć (System A nazywa to "Owner", System B "Steward").

# 📚 Szczegółowe wyjaśnienie
W nowoczesnej firmie masz "Archipelag Narzędzi":
- Snowflake (Baza)
- Tableau (Raporty)
- Ataccama/Collibra (Katalog)
- Jira (Zadania)
Bez synchronizacji, w każdym z tych systemów definicja "Klienta" może być inna. Metadata Sync to "mosty" łączące ten archipelag. Zazwyczaj "Katalog Danych" pełni rolę centralnego węzła (Huba), który zasysa metadane techniczne zewsząd i udostępnia definicje biznesowe z powrotem.

# 💡 Przykład zastosowania
Analityk tworzy nowy raport w Tableau.
Automat (Metadata Sync) w nocy:
1. Skanuje serwer Tableau.
2. Wykrywa nowy raport.
3. Tworzy dla niego wpis w Katalogu Danych.
4. Pobiera lineage (z jakich tabel korzysta raport).
Rano Data Steward wchodzi do Katalogu i widzi, że nowa tabela jest już używana w raporcie.

## 📌 Źródła
- "Metadata Management for Dummies".

## 👽 Brudnopis
- Największym wrogiem synchronizacji jest **zmiana API** u dostawców (np. nowa wersja Snowflake zmienia nazwy kolumn systemowych).