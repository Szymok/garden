---

title: Custom Filter  
created: 2025-03-28  
status:  
category: ataccama  
difficulty: podstawowy  
language: pl  
tags:

- custom filter
- metadata model
- AQL  
aliases:

---

# 🎯 Definicja

**Custom Filter** w kontekście Ataccama ONE to niestandardowy filtr wyszukiwania/metadanych, umożliwiający zaawansowane zawężanie i wyszukiwanie zasobów, obiektów lub metadanych na podstawie własnych kryteriów użytkownika. Filtry te budowane są z użyciem języka AQL (Ataccama Query Language) i pozwalają tworzyć wyrażenia logiczne oparte na atrybutach modelu metadanych.

# 🔑 Kluczowe punkty

- Pozwala na zaawansowane przeszukiwanie zasobów/metadanych poprzez własne wyrażenia AQL.
- Obsługuje operatory logiczne (`AND`, `OR`, `NOT`), porównania (`=`, `!=`, `LIKE`, itp.), operacje na danych tekstowych, liczbowych i datach.
- Może być wykorzystywany do filtracji, raportowania, automatyzacji zadań i masowych aktualizacji.
- Wspiera budowanie personalizowanych dashboardów oraz powiadomień zależnych od wybranych zasobów.
- Umożliwia zapisywanie i udostępnianie filtrów w ramach zespołu lub organizacji.

# 📚 Szczegółowe wyjaśnienie

## Czym jest Custom Filter?

Custom Filter umożliwia określenie własnych kryteriów wyszukiwania nad zestawami metadanych lub zasobów — np. tabel, pól, słowników — w Ataccama ONE. Dzięki wykorzystaniu AQL użytkownik ma pełną kontrolę nad logiką zapytania, np. można wyszukiwać tylko te źródła danych, które są aktywne, mają określone słowa kluczowe lub pochodzą z konkretnego katalogu.

### Najważniejsze składniki Custom Filter:

- **Atrybuty:** nazwa, opis, właściciel, data utworzenia, typ, itp.
- **Operatory:** `=`, `!=`, `>`, `<`, `LIKE` (dopasowanie do wzorca), `IN` (zawiera), `IS NULL`
- **Logika:** łączenie warunków `AND`/`OR`, negacja `NOT`, grupowanie nawiasami `()`

## Przykład składni AQL:

```aql
type = "Table" AND createdBy = "jan.kowalski" AND (status = "Active" OR status = "Reviewed")
```

Możliwe jest także wyszukiwanie po metadanych niestandardowych, tagach, czy pełnotekstowo:

```aql
description LIKE "*klient*" AND tags IN ("sensitive", "PII")
```

## Typowe zastosowania:

- Wyszukiwanie wszystkich tabel utworzonych przez konkretną osobę lub z określonym tagiem.
- Filtracja pól zawierających wrażliwe lub niezgodne atrybuty (np. `containsSensitiveData = true`).
- Monitorowanie zasobów nieużywanych przez dłuższy czas (`lastAccess < "2025-01-01"`).
- Dynamiczne dashboardy — np. pokazujące tylko te elementy, które spełniają warunki do quality controllingu.

# 💡 Przykład zastosowania

Załóżmy, że chcesz znaleźć wszystkie tabele typu "klienci", które są aktywne i pochodzą z hurtowni typu "Snowflake" oraz zawierają dane osobowe. Przykładowy filtr:

```aql
type = "Table" 
AND name LIKE "*klient*" 
AND status = "Active" 
AND sourceSystem = "Snowflake" 
AND tags IN ("PII")
```

W tym przypadku wyrażenie wyszukuje wszystkie aktywne tabele, których nazwa zawiera słowo "klient", pochodzą z systemu Snowflake i mają tag oznaczający dane osobowe.

## 📌 Źródła

- [Ataccama ONE – Searching using AQL](https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application/searching-using-aql)

# 👽 Brudnopis

- Custom filter = wyszukiwanie/expression logiczne po metadanych
- AQL: składnia SQL-podobna, typy, tagi, pola systemowe, statusy
- Przykład: type="Table", owner="Nowak", status="Active", description LIKE "_poufne_"
- Praktyka: dashboardy, automatyzacja, powiadomienia, audyt użycia modeli
- Protip: używać tagów systemowych oraz pól własnych (custom attributes) do finezyjnej filtracji