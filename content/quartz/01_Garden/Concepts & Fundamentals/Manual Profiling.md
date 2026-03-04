---
title: Manual Profiling (Profilowanie Ręczne)
created: 2026-02-04
status: evergreen
category: Data Quality / Discovery
difficulty: basic
language: pl
tags:
  - data-profiling
  - discovery
  - analysis
  - data-stewardship
  - ataccama
aliases:
  - Ad-hoc Profiling
  - Ręczne badanie danych
---
# 🎯 Definicja
**Manual Profiling** (Ręczne Profilowanie) to proces, w którym użytkownik "na żądanie" uruchamia analizę jakości danych dla wybranej tabeli lub pliku. W odróżnieniu od profilowania automatycznego (działającego w nocy dla całego systemu), tutaj to analityk decyduje: "Chcę sprawdzić tę tabelę TERAZ".

# 🔑 Kluczowe punkty
- **Interaktywność:** Wyniki dostajesz od razu (lub po chwili).
- **Elastyczność:** Możesz profilować tylko to, co Cię interesuje (np. jedną nową tabelę z Excela).
- **Tryby:**
    - **Import Metadata:** Tylko nazwy kolumn (błyskawiczne).
    - **Data Sample:** Analiza pierwszych 1000 wierszy (szybkie).
    - **Full Profiling:** Analiza każdego rekordu (wolne, ale dokładne).

# 📚 Szczegółowe wyjaśnienie
Po co profilować ręcznie?
Często Analityk dostaje nowy plik CSV od klienta. Zanim wgra go do hurtowni, chce zobaczyć "co tam siedzi".
Manual Profiling pokaże:
- Ile jest pustych wartości (Nulls)?
- Czy daty są w dobrym formacie?
- Czy są duplikaty w kolumnie ID?
To pierwsza linia obrony przed "śmieciowymi danymi".

# 💡 Przykład zastosowania
Dostajesz plik `klienci_export.csv`.
Uruchamiasz "Full Profiling" w Ataccama ONE.
Widzisz, że kolumna `email` jest pusta w 90% przypadków.
Dzięki temu wiesz, że nie możesz użyć tego pliku do kampanii mailingowej – oszczędzasz czas i nerwy zespołu marketingu.

## 📌 Źródła
- Ataccama Data Quality User Guide.

## 👽 Brudnopis
- Ręczne profilowanie jest kluczowe w fazie "Exploratory Data Analysis" (EDA).