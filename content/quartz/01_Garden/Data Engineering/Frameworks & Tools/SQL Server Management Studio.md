---

title: SQL Server Management Studio  
created: 2025-07-16  
status: Final  
category: Bazy danych / Narzędzia  
difficulty: podstawowy  
language: pl  
tags:

- SQL Server
- SSMS
- bazy danych
- sql server management studio  
aliases:
- ssms
- microsoft ssms
- sql management studio

---

# 🎯 Definicja

**[[SQL|SQL]] Server Management Studio (SSMS)** to graficzne narzędzie od firmy Microsoft służące do zarządzania instancjami Microsoft [[SQL|SQL]] Server oraz Azure [[SQL|SQL]] Database. SSMS pozwala administratorom baz danych (DBA), deweloperom i analitykom zarządzać strukturą serwerową, pisać zapytania T-[[SQL|SQL]], kontrolować bezpieczeństwo oraz monitorować wydajność.

# 🔑 Kluczowe komponenty SSMS

## System Databases

W [[SQL|SQL]] Server znajduje się kilka wbudowanych baz danych systemowych:

|Nazwa|Opis|
|---|---|
|**master**|Najważniejsza baza – zawiera konfigurację serwera, informacje o użytkownikach, połączeniach, loginach, endpointach, itp.|
|**model**|Służy jako szablon dla nowych baz danych (dziedziczą jej strukturę).|
|**msdb**|Zawiera historię, harmonogramy zadań (jobs), alerty, operatorów – używana przez [[SQL|SQL]] Server Agent.|
|**tempdb**|Tymczasowa przestrzeń – dla danych tymczasowych, tabel tymczasowych i sortowań. Opróżniana przy każdym restarcie serwera.|

## Security

- Zawiera:
    - **Loginy** (logins) – konta użytkowników mające dostęp do serwera [[SQL|SQL]]
    - **[[Roles|Role]] serwerowe** – przypisania uprawnień na poziomie serwera
    - Możliwa integracja z Active Directory

## Server Objects

Sekcja obejmująca komponenty serwera, takie jak:

- **Linked Servers** – połączenia do zewnętrznych źródeł danych
- **Endpoints** – np. do komunikacji typu SOAP
- **Triggers** – wyzwalacze DDL na poziomie serwera

## Replication

- Obsługa różnych form replikacji danych:
    - Snapshot
    - Merge
    - Transactional
- Umożliwia utrzymywanie kopii danych między serwerami

## PolyBase

- Umożliwia łączenie i [[Przetwarzanie danych|przetwarzanie danych]] z zewnętrznych źródeł, np. Hadoop, Azure Blob Storage, z użyciem zapytań T-[[SQL|SQL]].

## Always On High Availability

- Umożliwia konfigurację **grup dostępności**, **failoverów** i replikację logiczną dla wysokiej dostępności.

## Management

Panel do zarządzania:

- Planami konserwacji
- Monitorowaniem i alertowaniem
- Rejestrami błędów i dziennikami zdarzeń

## Integration Services Catalogs

- Obsługa **[[SQL|SQL]] Server Integration Services (SSIS)** – projektów ETL i uruchomień paczek

## XEvent Profiler

- Lekka wersja [[SQL|SQL]] Profiler (rozszerzenie dla Extended Events – XEvents)
- Pokazuje aktywne instrukcje i eventy w czasie rzeczywistym (np. zapytania, sesje, blokady)

# 📊 Widok systemowy: sys.databases

```sql
SELECT * FROM sys.databases;
```

Wyświetla listę wszystkich baz danych widocznych z poziomu instancji [[SQL|SQL]] Server, łącznie z informacjami o:

- nazwa [[Bazy danych|bazy danych]]
- stan (online/offline)
- opcje AutoShrink, AutoClose
- daty utworzenia
- tryby bezpieczeństwa i recovery model

# 💡 Przykład użycia

Administrator chce zweryfikować, ile razy tempdb została automatycznie rozszerzona w ciągu ostatniej doby, oraz sprawdzić, które użytkowniki wykonują najbardziej kosztowne zapytania. Używa XEvent Profiler przy monitorowaniu live i przeszukuje sys.dm_exec_requests oraz sys.dm_exec_sessions z poziomu zapytań T-[[SQL|SQL]] w SSMS.

# 📌 Źródła

- [https://learn.microsoft.com/en-us/sql/ssms/sql-server-management-studio-ssms](https://learn.microsoft.com/en-us/sql/ssms/sql-server-management-studio-ssms)
- [https://learn.microsoft.com/en-us/sql/relational-databases/system-databases/system-databases](https://learn.microsoft.com/en-us/sql/relational-databases/system-databases/system-databases)
- [https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-databases-transact-sql](https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-databases-transact-sql)
- [https://sqlservercentral.com](https://sqlservercentral.com)

## 👽 Brudnopis

- SSMS = klasyczne IDE dla MS [[SQL|SQL]] Server
- XEvent Profiler vs [[SQL|SQL]] Server Profiler – lepsze wydajnościowo, snapshoty/trace
- sys.databases = widok systemowy, selektor runtime config db
- tempdb to hot spot dla dużych sortowań / joinów bez indeksów
- master = konfiguracja + login map + linki do baz
- msdb = job manager dla [[SQL|SQL]] Agent
- PolyBase = [[SQL|SQL]] + zewnętrzne źródła (Big Data)

---