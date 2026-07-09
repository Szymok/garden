---
title: Delta Lake
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - delta-lake
  - parquet
  - acid
  - lakehouse
  - databricks
aliases:
  - Delta Table
  - Format Delta
---
# 🎯 Definicja
**Delta Lake** to otwarta warstwa oprogramowania (storage layery), która dodaje **niezawodność**, wydajność i bezpieczeństwo do Data Lakes. W praktyce jest to format zapisu danych (oparty na [[apache parquet]]), który wzbogaca surowe pliki o **Dziennik Transakcji** (Transaction Log), umożliwiając obsługę [[Transakcje ACID|ACID]] na zwykłym S3/ADLS.

# 🔑 Kluczowe punkty
- **ACID na plikach:** Gwarancja, że albo wszystkie dane się zapiszą, albo żadne (koniec z "uszkodzonymi plikami" w połowie kopiowania).
- **Time Travel:** Możesz zapytać o dane "stan na wczoraj godz. 12:00".
- **Schema Enforcement:** Pilnuje, żebyś nie wgrał stringa do kolumny int (ochrona jakości danych).
- **Open Source:** Projekt rozwijany przez Linux Foundation (stworzony przez Databricks).

# 📚 Szczegółowe wyjaśnienie
Zwykły [[Data Lake|Data Lake]] to "worek plików". Trudno tam zaktualizować jeden rekord (musisz przepisać cały plik). Trudno o spójność (ktoś czyta, gdy ty piszesz).
Delta Lake wprowadza folder `_delta_log`, w którym w plikach JSON zapisuje każdą operację ("Dodano plik A.parquet", "Usunięto plik B.parquet").
Gdy czytasz tabelę Delta, Spark najpierw czyta Log, ustala które pliki są aktualne, i dopiero je czyta. Daje to pełną izolację i spójność.

# 💡 Przykład zastosowania
System RODO / GDPR.
Musisz usunąć dane Jana Kowalskiego z historycznych zapisów z 5 lat.
W zwykłym [[Data Lake|Data Lake]] to koszmar (szukanie w tysiącach plików JSON/CSV).
W Delta Lake robisz: `DELETE FROM users WHERE name = 'Jan Kowalski'`. Silnik Delta sam znajdzie odpowiednie pliki Parquet, przepisze je bez tego rekordu i zaktualizuje log.

## 📌 Źródła
- delta.io documentation.
- "Delta Lake: The Definitive Guide" - O'Reilly.

## 👽 Brudnopis
- Główni konkurenci: [[Apache Iceberg]] i [[Apache Hudi]].
- Delta jest fundamentem architektury [[Data Lakehouse]].