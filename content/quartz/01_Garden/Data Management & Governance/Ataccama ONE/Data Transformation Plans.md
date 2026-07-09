---
title: Data Transformation Plans (Plany Transformacji)
created: 2026-02-04
status: evergreen
category: Ataccama/ETL
difficulty: intermediate
language: pl
tags:
  - etl
  - transformation
  - one-web
  - pipeline
aliases:
  - Plany transformacji
  - Post-processing plans
---
# 🎯 Definicja
**Data [[Transformation Plans|Transformation Plans]]** w [[Ataccama|Ataccama]] ONE to wizualne narzędzie do budowania przepływów danych (ETL) w przeglądarce. Pozwala pobrać dane (np. z Katalogu lub wyników Monitoringu), przekształcić je (Filtr, Join, [[Lookup|Lookup]], Expression) i zapisać wynik (do pliku, bazy lub ONE Data). Jest to webowy odpowiednik planów `.plan` z [[ONE Desktop|ONE Desktop]].

# 🔑 Kluczowe punkty
- **No-Code / Low-Code:** Budujesz proces z klocków. Kodujesz tylko logikę w Expression.
- **Post-Processing:** Często używane do obróbki wyników DQ (np. "Weź błędne rekordy, wzbogać o nazwisko managera i wyślij do tabeli remediacji").
- **Standalone:** Mogą działać niezależnie jako lekkie procesy ETL (np. przygotowanie danych testowych).

# 📚 Szczegółowe wyjaśnienie
Typowe kroki w planie:
1.  **Input:** `Catalog Item Input` (tabela źródłowa).
2.  **Transform:**
    - `Filter`: Odsiej rekordy.
    - `Add Attribute`: Wylicz nową kolumnę.
    - `Join`: Dołącz dane z innej tabeli.
    - `Union`: Połącz dwa strumienie.
3.  **Output:** `ONE Data Writer` (zapisz do wewnętrznej bazy) lub `Database Output`.

Działa to na silniku DPE (Data Processing Engine), więc jest wydajne i skalowalne.

# 💡 Przykład zastosowania
Chcesz stworzyć raport "Top Klientów".
Plan:
1.  Wczytaj tabelę `Transakcje`.
2.  Zgrupuj po `Klient_ID` i policz sumę wydatków (Agregacja).
3.  Połącz (Join) z tabelą `Klienci`, żeby dodać Nazwisko.
4.  Odfiltruj tych z sumą < 1000 PLN.
5.  Zapisz wynik do nowej tabeli w ONE Data, którą udostępnisz sprzedawcom.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - [[Transformation Plans|Transformation Plans]].

## 👽 Brudnopis
- Webowe plany są super do szybkich zadań ("Ad-hoc"). Do bardzo skomplikowanych, korporacyjnych ETL-i z setkami kroków nadal częściej używa się [[ONE Desktop|ONE Desktop]] (IDE).
- Ale webowe plany zyskują na sile (UX jest lepszy).