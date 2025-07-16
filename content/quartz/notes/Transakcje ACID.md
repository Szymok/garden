---

title: "Transakcje ACID"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- ACIDTransactions
- ConcurrencyControl
- DataLakeFormats  
aliases:
- transakcyjność
- acid
- transakcje w data lake

---

# 🎯 Definicja

**Transakcje ACID** to zbiór właściwości, które gwarantują poprawność i niezawodność operacji na danych w systemach zarządzania bazami danych (DBMS) oraz nowoczesnych formatach tabel w jeziorach danych (Data Lake Table Formats). Skrót **ACID** oznacza:

- **A — Atomicity (atomowość)**
- **C — Consistency (spójność)**
- **I — Isolation (izolacja)**
- **D — Durability (trwałość)**

Te właściwości zapewniają, że każda operacja na danych zostanie przeprowadzona **całkowicie** lub **wcale**, pozostawiając system zawsze w spójnym stanie — nawet w sytuacjach awaryjnych, takich jak awaria systemu, przerwa w zasilaniu lub błąd zapisu.

# 🔑 Kluczowe punkty

- Transakcje ACID to warunek konieczny dla **bezpiecznego współdzielenia danych** i gwarantowanej historii zmian.
- Modele ACID są dziś wspierane nie tylko przez relacyjne bazy danych, ale też nowoczesne **formaty tabel w Data Lake**, takie jak:
    - **Delta Lake**
    - **Apache Iceberg**
    - **Apache Hudi**
- Każdy format implementuje ACID w nieco inny sposób – poprzez wersjonowanie plików, logi transakcji i warstwę metadanych.
- Rola kluczowa w systemach wymagających dużej liczby operacji zapisu/odczytu, równocześnie i na dużą skalę.

# 📚 Szczegółowe wyjaśnienie

## A — Atomicity (atomowość)

Każda transakcja jest **niepodzielna**: wykonuje się w całości lub wcale.  
Jeśli jedna z operacji się nie powiedzie, inne zmiany są wycofywane (rollback).

Przykład: Jeśli próbujesz zaktualizować dane w dwóch tabelach jednocześnie — albo obie zmiany się powiodą, albo żadna nie zostanie zapisana.

## C — Consistency (spójność)

System przechodzi z jednego **poprawnego stanu** w inny poprawny stan. Po zakończeniu transakcji integralność danych (np. unikalne ID, typy danych, ograniczenia kluczy obcych) musi zostać zachowana.

## I — Isolation (izolacja)

Transakcje wykonywane równolegle są **odseparowane** i nie powinny na siebie wpływać (np. poprzez "brudny odczyt").

Rodzaje izolacji (w tradycyjnym SQL):

- READ UNCOMMITTED
- READ COMMITTED
- REPEATABLE READ
- SERIALIZABLE

W OLAP i systemach Lakehouse izolacja implementowana jest przez katalogi wersjonowania i snapshoty.

## D — Durability (trwałość)

Po zatwierdzeniu (commit) zmiany są **utrwalone** – pozostają zachowane nawet mimo awarii (bo są zapisane np. w dziennikach, logach transakcyjnych, wpisane do nowego snapshotu).

# 🔄 ACID w formatach Lakehouse

|Format|ACID|Implementacja|
|---|---|---|
|**Delta Lake**|✅|`_delta_log/`, transakcje JSON, snapshoty|
|**Apache Hudi**|✅|`commit logs`, `.hoodie/` metadane i timeline|
|**Apache Iceberg**|✅|`metadata.json`, snapshoty, manifesty, atomic commits|

Wszystkie te formaty pozwalają na:

- Upserty, delecje, time travel
- Zachowanie historii zmian
- Równoległy dostęp (bez konfliktu odczyt/zapis)

# 💡 Przykład zastosowania

W hurtowni danych typu Lakehouse tabela użytkowników jest zapisywana równocześnie przez kilka źródeł. Dzięki ACID operacje są wykonywane w sposób bezpieczny: nie dochodzi do konfliktów ani częściowych zapisów. Podczas awarii części źródeł dane są automatycznie wycofywane z przetwarzania i zapisany jest tylko poprawny subset.

Równolegle analityk może wykonać zapytanie używając określonej wersji danych (`VERSION AS OF`) — system gwarantuje, że snapshot danego punktu w czasie jest spójny i kompletny.

## 📌 Źródła

- [https://docs.delta.io/latest/delta-transaction-log.html](https://docs.delta.io/latest/delta-transaction-log.html)
- [https://iceberg.apache.org/](https://iceberg.apache.org/)
- [https://hudi.apache.org/docs/concepts#acid](https://hudi.apache.org/docs/concepts#acid)
- [https://en.wikipedia.org/wiki/ACID](https://en.wikipedia.org/wiki/ACID)

## 👽 Brudnopis

- ACID = minimum współbieżności + gwarancje odczytów
- Delta: JSON logs, Iceberg: metadata.json + manifest, Hudi: timeline z commitem
- snapshot = izolacja, redo-log = trwałość
- ACID ≠ tylko dla OLTP — dziś też OLAP i batch / micro-batch
- Wsparcie dla rollback, merge, conflict resolution

---