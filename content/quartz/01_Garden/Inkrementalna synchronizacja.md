---
title: Inkrementalna Synchronizacja (Incremental Sync)
created: 2026-02-04
status: evergreen
category: Data Engineering / ELT
difficulty: intermediate
language: pl
tags:
  - airbyte
  - etl
  - cursor
  - replication
  - performance
aliases:
  - Incremental Sync
  - Delta Load
  - Przyrostowe ładowanie
---
# 🎯 Definicja
**Inkrementalna Synchronizacja** to metoda przesyłania danych, w której kopiujemy tylko **nowe lub zmienione** rekordy, zamiast kopiować całą bazę od zera (Full Refresh). Pozwala to zaoszczędzić czas, łącze internetowe i moc obliczeniową bazy źródłowej.

# 🔑 Kluczowe punkty
- **Kursor:** Pole, które mówi nam "gdzie skończyliśmy". Zazwyczaj `updated_at` (data modyfikacji) lub `id` (autoincrement).
- **Rodzaje:**
    - **Append:** Tylko dopisujemy nowe wiersze (tworzy historię zmian, duplikuje ID).
    - **Dedup:** Dopisujemy i usuwamy/scalmy duplikaty, aby mieć "stan aktualny".
- **Problem:** Trudno wykryć usunięte rekordy (Hard Deletes) bez mechanizmu CDC (Change Data Capture).

# 📚 Szczegółowe wyjaśnienie
Scenariusz: Masz tabelę `Orders` z 10 milionami wierszy. Codziennie dochodzi 1000 nowych.
- **Full Refresh:** Codziennie pobierasz 10,001,000 wierszy. Czas: 5 godzin.
- **Incremental:** Pobierasz tylko 1000 wierszy, gdzie `order_date > wczoraj`. Czas: 5 sekund.

System ELT (np. Airbyte) zapamiętuje "stan" (State) - czyli maksymalną wartość kursora z poprzedniego uruchomienia.

# 💡 Przykład zastosowania
Synchronizacja danych z Salesforce do Snowflake.
Używamy pola `LastModifiedDate` jako kursora.
Airbyte pyta Salesforce: "Daj mi wszystkie rekordy zmienione po `2023-10-27 15:00:00`".
Salesforce zwraca małą paczkę JSON.
Airbyte ładuje ją do Snowflake i aktualizuje swój stan na `2023-10-27 16:00:00`.

## 📌 Źródła
- Airbyte Documentation - Incremental Sync.

## 👽 Brudnopis
- Najważniejsze: Źródło MUSI mieć wiarygodną kolumnę `updated_at`. Jeśli aplikacja zmienia rekord, ale nie aktualizuje tej daty, synchronizacja pominie zmianę (Data Integrity Issue).