---

title: Kursor (Cursor)  
created: 2025-07-16  
status: 🌱 draft
category: airbyte  
difficulty: podstawowy  
language: pl  
tags:

- airbyte
- synchronizacja przyrostowa
- ETL
- kursor
- data engineering  
aliases:
- cursor
- wskaźnik synchronizacji

---

# 🎯 Definicja

**Kursor (Cursor)** w inżynierii danych i narzędziach takich jak Airbyte to specjalny wskaźnik (pole) używany podczas synchronizacji przyrostowej, który umożliwia śledzenie, które rekordy danych zostały już zreplikowane między źródłem a celem. Pozwala to kopiować tylko nowe lub zaktualizowane rekordy w każdej iteracji procesu synchronizacji.

# 🔑 Kluczowe punkty

- **Kursor śledzi postęp synchronizacji inkrementalnej** – zapamiętuje ostatni zreplikowany rekord na podstawie wybranego pola (np. `updated_at`).
- **Znacząco optymalizuje przepływ danych** – zamiast pełnej replikacji, przesyłane są wyłącznie nowe/zmienione dane.
- **Pole kursora powinno być monotonicznie rosnące** (np. data utworzenia/aktualizacji, numer sekwencyjny, id).
- **Airbyte automatycznie używa wartości kursora w zapytaniach** do systemu źródłowego – pobierając tylko świeże rekordy.
- **Synchronizacja oparta na kursorach** to standard w skalowalnych, efektywnych pipeline’ach ETL/ELT.

# 📚 Szczegółowe wyjaśnienie

## Jak działa kursor w synchronizacji przyrostowej?

1. **Pierwsza synchronizacja:**
    - Airbyte pobiera wszystkie rekordy ze źródła i zapisuje najwyższą wartość kursora.
2. **Kolejne synchronizacje:**
    - Zapytania do źródła zawierają warunek na pole kursora, np. `WHERE updated_at > [ostatni zapisany kursor]`.
    - Pobierane są jedynie zmienione lub świeżo dodane rekordy.

**Przykład praktyczny:**

- Pole kursora: `updated_at` (timestamp).
- Ostatnia synchronizacja: max(`updated_at`) = 2025-07-12 16:00.
- Nowe zapytanie: rekordy z `updated_at` > 2025-07-12 16:00.

## Zalety stosowania kursora

- Redukcja obciążenia sieci i systemów – nie przesyłasz duplikatów.
- Szybsze przetwarzanie dużych zbiorów (np. w codziennych pipeline’ach BI).
- Zmniejsza ryzyko pominięcia lub podwójnej replikacji rekordów (gdy pole kursora monotoniczne i unikalne).
- Pozwala na ciągły streaming lub zaplanowane batchowe odświeżanie danych.

## Wybór pola kursora

- Najlepiej sprawdza się kolumna typu data/godzina (`updated_at`, `created_at`), ale równie dobrze może to być rosnąca liczba (np. id).
- Pole musi być odporne na cofanie się wartości i powinno jasno wskazywać kolejność “nowości” rekordu.
- Źle dobrane pole kursora może skutkować utratą części danych lub ponowną replikacją tych samych rekordów.

# 💡 Przykład zastosowania w Airbyte

**Przykład 1:**  
Synchronizacja bazy Postgres z hurtownią Snowflake:

- Pole kursor: `last_modified`
- Airbyte rejestruje max(`last_modified`) po każdym tasku.
- Przy kolejnym uruchomieniu pipeline, pobiera tylko rekordy gdzie `last_modified` > ostatni kursor.

**Przykład 2:**  
API do systemów SaaS (np. CRM):

- API często udostępnia pole `lastSyncToken` lub `since_timestamp`.
- Airbyte automatycznie uzupełnia wartość kursora na podstawie poprzedniego eksportu.

# 📌 Źródła

- [https://airbyte.com/tutorials/incremental-data-synchronization](https://airbyte.com/tutorials/incremental-data-synchronization)
- [https://docs.airbyte.com/understanding-airbyte/sync-modes/incremental](https://docs.airbyte.com/understanding-airbyte/sync-modes/incremental)
- [https://docs.airbyte.com/connector-development/cursor-field](https://docs.airbyte.com/connector-development/cursor-field)
- [https://mode.com/sql-tutorial/sql-cursors/](https://mode.com/sql-tutorial/sql-cursors/)

# 👽 Brudnopis

- Kursor = wskaźnik synchronizacji, zapisuje “do którego momentu przetworzono dane”
- Standard nie tylko w Airbyte, ale też Fivetran, Informatica, Talend, Apache NiFi
- Typowe sytuacje: codzienne zasilanie DWH, inkrementalny monitoring zmian (CDC)
- Wyzwaniem: typ pola, obsługa opóźnień (lag), duplikaty, soft-delete
- “Kursor czasowy” preferowany, ale można używać niepowtarzalnego id
- W Airbyte obsługa field cursor na poziomie connectora i konfigurowalna w UI