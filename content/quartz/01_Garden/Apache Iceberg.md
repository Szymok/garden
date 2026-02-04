---
title: Apache Iceberg
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: advanced
language: pl
tags:
  - iceberg
  - data-lakehouse
  - table-format
  - acid
aliases:
  - Format Iceberg
  - Iceberg Data Lake
---
# 🎯 Definicja
**Apache Iceberg** to otwarty format tabel dla ogromnych zbiorów analitycznych. Został zaprojektowany przez Netflix, aby naprawić problemy ze skalowalnością i poprawnością danych w Apache Hive (np. brakujące pliki, brak atomowości).

# 🔑 Kluczowe punkty
- **Ukryte Partycjonowanie (Hidden Partitioning):** Użytkownik nie musi wiedzieć, że dane są fizycznie podzielone na "rok=2024/miesiac=01". Po prostu pyta o datę, a Iceberg sam wie, które pliki czytać.
- **Snapshot Isolation:** Czytelnicy nigdy nie widzą "częściowo zapisanych" danych. Widzą spójny stan z momentu rozpoczęcia zapytania.
- **Schema Evolution:** Możesz zmienić nazwę kolumny lub jej typ, i nic się nie zepsuje.

# 📚 Szczegółowe wyjaśnienie
Iceberg zyskuje ogromną popularność jako "wygrany" standard dla nowoczesnego Data Lakehouse. Jest wspierany przez wszystkich gigantów (AWS, Snowflake, Google BigQuery, Databricks).
W przeciwieństwie do Hudi (skupionego na streamingu) czy Delta Lake (początkowo zamkniętego przez Databricks), Iceberg jest postrzegany jako najbardziej "neutralny" i najlepiej zaprojektowany architektonicznie format.
Nie przechowuje listy plików w folderach (co jest wolne na S3), ale w specjalnych plikach metadanych (Manifest files), co pozwala na błyskawiczne operacje nawet na tabelach z milionami plików.

# 💡 Przykład zastosowania
Globalna platforma streamingowa (jak Netflix) trzyma dane o oglądalności w Icebergu.
Gdy inżynier musi usunąć dane użytkownika (RODO/GDPR), wykonuje proste `DELETE FROM logs WHERE user_id = 'XYZ'`. Iceberg przepisuje tylko te nieliczne pliki, w których ten użytkownik występuje, tworząc nowy "Snapshot" tabeli.

## 📌 Źródła
- [Apache Iceberg](https://iceberg.apache.org/)

## 👽 Brudnopis
- Time Travel: `SELECT * FROM table TIMESTAMP AS OF '2024-01-01'`.
- Maintenance: Expire Snapshots, Compaction.
- Neutralność silnika: działa tak samo dobrze w Sparku, Trino, Flinku.