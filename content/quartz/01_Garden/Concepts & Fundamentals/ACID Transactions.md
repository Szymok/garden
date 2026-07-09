---
title: ACID Transactions
created: 2026-02-04
status: evergreen
category: Data Engineering / Concepts
difficulty: intermediate
language: pl
tags:
  - acid
  - database
  - transactions
  - consistency
  - delta-lake
aliases:
  - Transakcje ACID
  - Atomowość
  - Spójność
---
# 🎯 Definicja
**ACID** to 4 przykazania bezpiecznej [[Bazy danych|bazy danych]]. Gwarantują, że dane nie znikną, nie popsują się i nie pomylą, nawet jak wyciągniesz wtyczkę z kontaktu w połowie zapisu.
A: Atomicity (Wszystko albo nic).
C: Consistency (Zasady zachowane).
I: Isolation (Każdy widzi swoje).
D: Durability (Zapisane na wieki).

# 🔑 Kluczowe punkty
- **Atomowość:** Przelew bankowy. Odejmij X z konta A, Dodaj X do konta B. Jak padnie w połowie -> Cofnij wszystko (Rollback). Pieniądze nie mogą zniknąć.
- **[[Data Lakehouse|Data Lakehouse]]:** Nowoczesne formaty jak [[Delta Lake]] i [[Apache Iceberg]] przyniosły ACID do świata plików (S3/ADLS). Kiedyś na [[Data Lake|Data Lake]]'u jak zapis padł, zostawał śmieć. Teraz jest transakcja.

# 📚 Szczegółowe wyjaśnienie
- **Isolation:** Użytkownik A czyta tabelę. Użytkownik B ją kasuje. Izolacja decyduje, co widzi A. (Zazwyczaj widzi stan sprzed skasowania - Snapshot Isolation).
- **Durability:** Po komunikacie "Success", dane muszą być na dysku. Nie w RAMie.

# 💡 Przykład zastosowania
Dwa procesy ETL piszą do tej samej tabeli w [[Delta Lake]].
Proces 1: Aktualizuje klientów z Polski.
Proces 2: Aktualizuje klientów z Niemiec.
Dzięki ACID (Optimistic Concurrency Control), oba zapiszą się poprawnie. Bez ACID, jeden mógłby nadpisać plik drugiego i połowa danych by zniknęła ("Last write wins").

## 📌 Źródła
- Designing Data-Intensive Applications.
- [[Delta Lake|Delta Lake]] Transaction Log docs.

## 👽 Brudnopis
- NoSQL (np. MongoDB, Cassandra) kiedyś odrzucały ACID dla wydajności (tzw. BASE). Dziś większość wraca do ACID (lub daje taką opcję), bo deweloperzy nie chcą martwić się o spójność danych ręcznie.
