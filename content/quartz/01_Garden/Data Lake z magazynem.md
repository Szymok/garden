---
title: Data Lake z Magazynem (Hybrid Architecture)
created: 2026-02-04
status: evergreen
category: Data Engineering/Architecture
difficulty: intermediate
language: pl
tags:
  - data-lake
  - data-warehouse
  - architecture
  - hybrid
aliases:
  - Data Lake + Data Warehouse
  - Architektura hybrydowa
---
# 🎯 Definicja
Architektura **Data Lake z Magazynem** to model hybrydowy, w którym **Data Lake** (Tanie, skalowalne, na pliki surowe) współpracuje z **Data Warehouse** (Szybkie, strukturalne, SQL-owe, do raportowania). Jest to krok pośredni w ewolucji w stronę [[Data Lakehouse]].

# 🔑 Kluczowe punkty
- **Podział ról:** Lake służy do *Ingestion* i przechowywania surowych danych (Raw/Bronze). Warehouse służy do *Serving* danych przetworzonych (Gold) dla biznesu.
- **Koszt:** Trzymanie petabajtów danych w S3 (Lake) jest tanie. Trzymanie ich w Snowflake/Redshift (Warehouse) jest drogice. Dlatego do Warehouse trafia tylko to, co wartościowe.
- **ETL:** Procesy ETL/ELT przenoszą i czyszczą dane z Lake do Warehouse.

# 📚 Szczegółowe wyjaśnienie
Typowy przepływ:
1.  **Data Lake (S3/ADLS):** Tu lądują logi, JSON-y z API, zrzuty z CSV. "Strefa zrzutu". Data Scienciści mogą tu grzebać w poszukiwaniu skarbów.
2.  **ETL (Spark/Glue/dbt):** Pobiera dane z Lake, czyści, standaryzuje.
3.  **Data Warehouse (Snowflake):** Przechowuje "Wersję Prawdy" – tabele faktów i wymiarów, gotowe pod Power BI.
Wadą tego podejścia jest **duplikacja danych** (są i tu, i tu) oraz ryzyko rozjazdu danych (data drift).

# 💡 Przykład zastosowania
Firma telekomunikacyjna.
Wszystkie logi z anten (miliardy wierszy dziennie) lecą na S3 (Data Lake). Są tam trzymane "na wszelki wypadek" i do analizy awarii.
Tylko zagregowane dane (np. "Ile minut gadał klient X w miesiącu Y") są ładowane do Hurtowni Danych, żeby wystawić fakturę i pokazać dashboard zarządowi.

## 📌 Źródła
- "Designing Data-Intensive Applications" - Martin Kleppmann.

## 👽 Brudnopis
- Obecnie ten model jest wypierany przez [[Data Lakehouse]], który stara się wyeliminować konieczność kopiowania danych do Warehouse'a, robiąc Warehouse "na" Lake'u.