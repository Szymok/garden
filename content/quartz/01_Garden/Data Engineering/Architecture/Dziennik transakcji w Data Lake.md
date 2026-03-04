---
title: Dziennik transakcji w Data Lake (Transaction Log)
created: 2026-02-04
status: evergreen
category: Data Engineering/Architecture
difficulty: advanced
language: pl
tags:
  - transaction-log
  - acid
  - delta-lake
  - metadata
aliases:
  - Transaction Log
  - Delta Log
  - _delta_log
---
# 🎯 Definicja
**Dziennik transakcji** (Transaction Log) w [[Data Lakehouse]] to mechanizm zapisu metadanych, który gwarantuje spójność operacji (ACID). Zamiast nadpisywać pliki danych bezpośrednio, system najpierw zapisuje "intencję" lub "fakt dokonania zmiany" w dzienniku. Dzięki temu wiemy dokładnie, które pliki składają się na aktualny stan tabeli.

# 🔑 Kluczowe punkty
- **Prawda o danych:** To Log mówi, co jest w tabeli, a nie lista plików na dysku (S3/ADLS).
- **Atomowość:** Zmiana (np. dodanie 100 plików) pojawia się w logu jako jeden wpis. Albo jest cały, albo wcale.
- **Współbieżność:** Pozwala wielu użytkownikom pisać i czytać jednocześnie (Optimistic Concurrency Control).

# 📚 Szczegółowe wyjaśnienie
W [[Delta Lake]] log znajduje się w folderze `_delta_log` i składa się z plików JSON (np. `000001.json`).
Wpis w JSON wygląda tak:
`{ "add": { "path": "part-001.parquet", "size": 1024, "stats": {...} } }`
`{ "remove": { "path": "part-000.parquet", "timestamp": ... } }`
Czytając log sekwencyjnie, Spark buduje "Snapshot" tabeli.

# 💡 Przykład zastosowania
Dwie osoby próbują zmodyfikować ten sam rekord.
1.  Użytkownik A czyta wersję 10.
2.  Użytkownik B czyta wersję 10.
3.  Użytkownik A zapisuje wersję 11.
4.  Użytkownik B próbuje zapisać wersję 11 -> **Błąd konkurencji**. Musi odświeżyć dane (przeczytać v11) i spróbować ponownie.
Bez logu, B mógłby nadpisać zmiany A bez niczyjej wiedzy.

## 📌 Źródła
- "Delta Lake: The Definitive Guide".

## 👽 Brudnopis
- Mechanizm ten przenosi funkcje znane z baz Oracle/MSSQL na pliki w chmurze.
- Log pozwala też na "Time Travel" (odtworzenie stanu na podstawie starych wpisów w logu).