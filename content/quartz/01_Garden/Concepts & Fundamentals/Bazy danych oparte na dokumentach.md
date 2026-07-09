---
title: Bazy Dokumentowe (Document Stores)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: basic
language: pl
tags:
  - nosql
  - mongodb
  - json
  - document-db
aliases:
  - Document Databases
  - MongoDB
  - Couchbase
---
# 🎯 Definicja
**Baza dokumentowa** to rodzaj bazy NoSQL, która przechowuje dane w formacie półstrukturalnym (zazwyczaj **JSON** lub BSON), zamiast w tabelach z wierszami i kolumnami. Każdy "rekord" to samodzielny dokument, który może mieć różną strukturę.

# 🔑 Kluczowe punkty
- **Elastyczny schemat (Schema-less):** Dokument A może mieć pole "telefon", a dokument B go nie mieć. Nie trzeba robić `ALTER TABLE`.
- **Hierarchia:** Dane mogą być zagnieżdżone (tablice, obiekty w obiektach), co świetnie mapuje się na obiekty w kodzie programowania (Java/JS Objects).
- **Skalowalność:** Łatwiejsze skalowanie poziome (Sharding) niż w relacyjnych bazach.

# 📚 Szczegółowe wyjaśnienie
W świecie relacyjnym ([[SQL|SQL]]), aby zapisać "Fakturę" i jej "Pozycje", musisz mieć dwie tabele (`Invoices`, `InvoiceLines`) i łączyć je JOIN-em.
W bazie dokumentowej (MongoDB), Faktura to jeden plik JSON, który zawiera tablicę Pozycji.
`{ "id": 1, "client": "XYZ", "lines": [ { "item": "A", "price": 10 }, { "item": "B", "price": 5 } ] }`
Odczyt jest atomowy i szybki (czytasz jeden klucz = dostajesz całość).

Wady: Trudniejsze raportowanie analityczne (JOINy są drogie/niemożliwe), ryzyko bałaganu w danych (brak schema enforcement).

# 💡 Przykład zastosowania
Katalog produktów w e-commerce.
Jeden produkt to "Telewizor" (ma przekątną ekranu), drugi to "Buty" (mają rozmiar).
W [[SQL|SQL]] wymagałoby to tabeli `Attributes` (EAV model) lub wielu kolumn NULL.
W MongoDB każdy produkt ma po prostu inny JSON z odpowiednimi polami.

## 📌 Źródła
- [MongoDB Documentation](https://www.mongodb.com/docs/)

## 👽 Brudnopis
- JSON, BSON (Binary JSON), XML bases.
- Przykłady: MongoDB, CouchDB, Couchbase, Amazon DocumentDB.
- Często używane jako "Operational Datastore" dla aplikacji webowych.