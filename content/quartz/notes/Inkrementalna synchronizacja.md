---

title: Inkrementalna synchronizacja  
created: 2025-07-16  
status: Final  
category: ELT / Airbyte  
difficulty: podstawowy  
language: pl  
tags:

- airbyte
- synchronizacja danych
- inkrementalna synchronizacja
- ELT  
aliases:
- incremental sync
- inkrementalna replikacja

---

# 🎯 Definicja

**Inkrementalna synchronizacja** to metoda kopiowania danych, w której do systemu docelowego przesyłane są wyłącznie rekordy, które zostały dodane lub zaktualizowane od czasu ostatniej synchronizacji. Cały proces opiera się na periodycznym wykonywaniu zapytań na systemie źródłowym oraz identyfikacji rekordów za pomocą pola kursora (np. `updated_at`). To rozwiązanie efektywnie minimalizuje ilość przesyłanych danych, radykalnie zmniejszając koszty i obciążenie systemów w porównaniu do pełnej (full) replikacji wszystkich danych podczas każdej synchronizacji.

# 🔑 Kluczowe punkty

- Po każdej synchronizacji replikowane są **tylko nowe lub zmienione rekordy** (wstawione lub zaktualizowane).
- Do wykrywania zmian wykorzystywane jest pole **kursora** (np. `updated_at`, `timestamp`, autoinkrementacja).
- Synchronizacja działa cyklicznie – każde kolejne wywołanie pobiera wyłącznie rekordy nowsze niż ostatnio zsynchronizowany (`cursor > max_cursor` z poprzedniej synchronizacji).
- W Airbyte wyróżniamy tryby: **Incremental Sync - Append** (wszystkie wersje, w tym historyczne) oraz **Incremental Sync - Deduped History** (tabela z historią wersji i tabela deduplikowana do pojedynczego aktualnego rekordu).
- Umożliwia bardzo **wydajną i skalowalną synchronizację** dużych wolumenów danych (np. dziesiątki MB/s dla MongoDB).

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania

1. Airbyte uruchamia zapytanie do źródła (np. bazy danych), które wybiera **tylko te rekordy, których kursor (np. `updated_at`) jest większy niż największy kursor z poprzedniej synchronizacji**.
2. Wybrane rekordy są przesyłane do systemu docelowego (np. hurtowni danych).
3. W trybie Append w docelowej tabeli jest zachowywana każda wersja pobranego rekordu („history”).
4. W trybie Deduped History dodatkowo budowana jest deduplikowana tabela bieżąca — zawiera _tylko najnowszą wersję każdego rekordu_ (dot. np. [[Slowly Changing Dimension (SCD)|SCD]] — [[Slowly Changing Dimension (SCD)|Slowly Changing Dimension]]).
5. Sukces każdej synchronizacji jest zapamiętywany — tzw. checkpoint (punkt kontrolny), co pozwala systemowi wznowić synchronizację od miejsca, w którym poprzednio przerwano (mechanizm checkpointingu).

## Ograniczenia

- **Usunięcia w rekordach:** Dane usunięte w źródle (przez DELETE) domyślnie nie są propagowane do celu, ponieważ nie pojawią się w wynikach zapytania inkrementalnego. Rozwiązaniem jest stosowanie flag „is_deleted”, CDC lub okresowe pełne odświeżenia (full refresh).
- **Wielokrotne aktualizacje:** Jeżeli ten sam rekord był aktualizowany kilka razy między synchronizacjami, mogą powstać wielokrotne wersje historyczne (tryb Append history).
- **Złożoność związana z obsługą schematów:** Musi istnieć stabilne i rosnące pole kursorowe.

## Porównanie z Full Refresh

|Cecha|Inkrementalna synchronizacja|Pełna synchronizacja (Full Refresh)|
|---|---|---|
|Zakres kopiowanych danych|Tylko nowe/zmienione|Wszystkie rekordy, za każdym razem|
|Wydajność|Bardzo wysoka przy dużych zbiorach|Niska — rosnący czas i koszt|
|Obsługa usunięć|Wymaga specjalnej logiki/CDC|Domyślnie zachowywane|
|Obciążenie źródła|Minimalne|Maksymalne|
|Scenariusze użycia|Przepływy transakcyjne, często uaktualniane dane|Mało zmienne, łatwy reset stanu|

# 💡 Przykład zastosowania

W integracji MS SQL → BigQuery za pomocą Airbyte, synchronizacja inkrementalna na tabeli zamówień korzysta z `updated_at`, aby przenosić wyłącznie nowe/zmienione zamówienia. Dzięki temu do BigQuery trafiają tylko rzeczywiste zmiany, co skraca czas replikacji o 95% względem pełnej synchronizacji. Usunięcia obsługiwane są flagą logiczną „is_deleted”.

## 📌 Źródła

[https://airbyte.com/tutorials/incremental-data-synchronization](https://airbyte.com/tutorials/incremental-data-synchronization)  
[https://airbyte.com/blog/understanding-data-replication-modes](https://airbyte.com/blog/understanding-data-replication-modes)  
[https://airbyte.com/blog/checkpointing](https://airbyte.com/blog/checkpointing)

## 👽 Brudnopis

- inkrementalnie = tylko to, co nowe/zmienione (“delta” obsługiwana przez kursor)
- wydajność: nawet >10 MBps [MongoDB]
- historyczny append vs deduped-table ([[Slowly Changing Dimension (SCD)|SCD]])
- brak wsparcia dla usunięć chyba że is_deleted/CDC/full refresh
- checkpointing — odporność na przerwanie synchronizacji
- default dla dużych, często zmienianych tabel
- Problem: „ghost records” bez CDC/usuwalnych flag
- Airbyte: tryby sync — incremental, full, CDC (jeśli obsługuje źródło)
- Normalizacja przez [[dbt]]
- Tryby sync, kontrolowane przez panel Airbyte
- Doświadczenia: w praktyce 90%+ integracji to inkrementalne sync na `updated_at`/`last_modified`

---