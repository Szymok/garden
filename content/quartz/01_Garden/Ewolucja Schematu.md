---
title: Ewolucja Schematu (Schema Evolution)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - schema-evolution
  - delta-lake
  - data-lakehouse
  - etl
aliases:
  - Schema Evolution
  - Zmiana struktury tabeli
---
# 🎯 Definicja
**Ewolucja Schematu** to zdolność systemu bazodanowego (zwłaszcza [[Data Lakehouse]], np. Delta Lake) do automatycznego dostosowania struktury tabeli do nowych danych, bez psucia danych historycznych. Pozwala na dodawanie nowych kolumn lub zmianę typów "w locie" podczas zapisu.

# 🔑 Kluczowe punkty
- **Problem:** Tradycyjne ETL wywala się, gdy źródło doda nową kolumnę ("Schema Mismatch").
- **Rozwiązanie:** Schema Evolution wykrywa nową kolumnę i automatycznie robi `ALTER TABLE ADD COLUMN`.
- **Gdzie:** Delta Lake (opcja `mergeSchema`), Iceberg, Hudi.

# 📚 Szczegółowe wyjaśnienie
Typy ewolucji w Delta Lake:
1.  **Add Column:** Bezpieczne. Stare rekordy dostają `null` w nowej kolumnie.
2.  **Change Data Type (Upcasting):** Np. z `Byte` na `Short`.
3.  **Rename/Drop:** Zazwyczaj wymagają ręcznej interwencji lub specjalnych flag ( `overwriteSchema`), bo są ryzykowne.

# 💡 Przykład zastosowania
Ingestion logów z aplikacji mobilnej.
Wersja aplikacji 1.0 wysyła `{user_id, action}`.
Wersja 2.0 dodaje `{device_os}`.
Z włączonym Schema Evolution, pipeline Sparkowy po prostu doda kolumnę `device_os` do tabeli docelowej w momencie pojawienia się pierwszego logu z v2.0. Bez tego pipeline by padł z błędem.

## 📌 Źródła
- "Delta Lake: The Definitive Guide".

## 👽 Brudnopis
- Należy uważać na "Schema Drift" – niekontrolowany rozrost tabeli o śmieciowe kolumny.
- W produkcji często stosuje się "Schema Enforcement" (blokadę zmian) na tabelach Silver/Gold, a Evolution tylko na Bronze (Landing).