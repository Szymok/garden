---

title: "Dziennik transakcji w Data Lake"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- data lake
- delta lake
- time travel
- acid  
aliases:
- transaction log
- transaction log w lakehouse
- _delta_log

---

# 🎯 Definicja

**Dziennik transakcji w Data Lake** to uporządkowany, trwały rejestr operacji wykonywanych na danych w systemie typu data lake lub [[Data Lakehouse|lakehouse]]. Stanowi centralne źródło informacji o tym, jakie zmiany zostały dokonane na danych oraz kiedy i przez kogo. Dziennik ten umożliwia realizację funkcji takich jak **[[Transakcje ACID|transakcyjność]] ([[Transakcje ACID|ACID]])**, **versioning**, **schema enforcement**, **Time Travel** oraz **recovery**.

# 🔑 Kluczowe punkty

- Jest to **minimalna jednostka zapisu metadanych zmian** — każdy plik w logu reprezentuje jedną akcję (commit).
- Najczęściej implementowany jako katalog plików JSON/parquet (`_delta_log`) np. w formacie **[[Delta Lake]]**.
- Umożliwia budowę **warstwy metadanych** nad tzw. "cheap storage" (S3, ADLS, GCS).
- Wspiera funkcje takie jak **rollback**, **compact data**, **merge**, **rewind**, a nawet pełen audyt danych.
- Rejestracja transakcji pozwala na **rozproszone i równoległe przetwarzanie** z zachowaniem spójności.

# 📚 Szczegółowe wyjaśnienie

## Struktura i mechanizm działania

Dziennik transakcji najczęściej znajduje się w odpowiednio nazwanym katalogu, np. `_delta_log` (dla [[Delta Lake]]), który zawiera:

- **Pliki `.json`** – metadane konkretnych commitów (np. dodania/usunięcia plików).
- **Pliki `.checkpoint.parquet`** – zrzuty stanu po N commitach dla szybszego dostępu.
- **Plik `_last_checkpoint`** – wskazuje na najnowszy plik kontrolny.

Każdy commit zawiera informacje o:

- zmienionych plikach danych (add/remove)
- wersji schematu
- czasie wykonania
- użytkowniku/procesie wykonującym

## Przykład: [[Delta Lake]]

W [[Delta Lake]] każda akcja zapisu (append, upsert, delete) powoduje wygenerowanie nowego pliku w `_delta_log/`. Ten log to fundament:

- **[[Transakcje ACID|ACID]]**: commit odbywa się tylko, jeśli nie wystąpił konflikt
- **Time Travel**: możliwe odczyty do `VERSION AS OF 120` lub `TIMESTAMP AS OF '2023-06-01'`
- **Audit / lineage**: wiadomo kto co zmienił i kiedy
- **Recover**: możliwość cofnięcia danych do dowolnej wersji

## Zalety

- **Niezależność danych od systemu zarządzania** — pliki są trwałe, log mówi jak je interpretować.
- **Transparentność zmian** – wersjonowanie plików pozwala zrekonstruować dowolny stan danych.
- **Skalowalność** – metadane nie muszą być ładowane jako centralna baza (jak w metastore [[Apache Hive|Hive]]).
- **Odporność na błędy w przetwarzaniu** – każdy etap da się wznowić od określonej wersji.

## Wady i wyzwania

- **Rozmiar dziennika** – przy częstych zmianach log może rosnąć bardzo szybko.
- **Wymaga kompaktowania (vacuum, optimize)** – dla poprawy wydajności odczytów.
- **Wrażliwość na zewnętrzne modyfikacje plików bez aktualizacji logu** – np. ręczne zmiany w S3.

# 💡 Przykład zastosowania

W architekturze [[Data Lakehouse|Lakehouse]] opartej na [[Delta Lake]], każda zapis do tabeli `events` automatycznie dopisuje rekord do `_delta_log`. Dzięki temu użytkownicy mogą później cofnąć dane do stanu sprzed incydentu, sprawdzić kto je zmodyfikował, porównać schemat z poprzednią wersją i zapytać o dane na stan z wczoraj. Wszystko bez potrzeby kopiowania plików ani replikacji środowiska.

## 📌 Źródła

- [[Delta Lake]] documentation — [https://docs.delta.io/latest/delta-transaction-log.html](https://docs.delta.io/latest/delta-transaction-log.html)
- Databricks — [[Delta Lake]] internals explained
- [https://airbyte.com/tutorials/load-data-into-delta-lake-on-databricks-lakehouse](https://airbyte.com/tutorials/load-data-into-delta-lake-on-databricks-lakehouse)

## 👽 Brudnopis

- _delta_log = główny składnik storage layer [[Delta Lake]]
- Alternatywy: [[Apache Iceberg]] (manifest), [[Apache Hudi]] (timeline + delta log)
- Log zmienia podejście z "plików danych" na "zarządzalne transakcje"
- Każda zmiana danych → nowy commit json
- Możliwość ładowania [[Delta Lake|Delta table]] w konkretnej wersji
- Nieusuwalne dane (if no vacuum) → wszystko wersjonowane
- Kompresja historii → checkpoint.parquet + json delta
- Fail-safe: możesz “cofnąć” do poprzedniego snapshotu

---