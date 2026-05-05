---

title: Bazy danych  
created: 2025-07-16  
status: Draft  
category: IT  
difficulty: podstawowy  
language: pl  
tags:

- bazy danych
- baza danych
- sql
- noSQL  
aliases:
- database
- DBMS

---

# 🎯 Definicja

**Baza danych** to zorganizowany zbiór danych, który jest przechowywany i zarządzany w sposób umożliwiający łatwe dodawanie, modyfikację, wyszukiwanie i analizę informacji. Bazy danych wspierają aplikacje i systemy informatyczne w efektywnym przechowywaniu i przetwarzaniu danych.

# 🔑 Kluczowe punkty

- Bazy danych można podzielić na relacyjne (SQL) i nierelacyjne (NoSQL).
- Relacyjne bazy danych przechowują dane w tabelach powiązanych kluczami.
- NoSQL umożliwia przechowywanie danych dokumentowych, klucz-wartość, grafowych lub kolumnowych.
- Bazy danych wspierają transakcje, zapewniając integralność i spójność danych.
- Systemy zarządzania bazą danych (DBMS) udostępniają interfejsy do manipulacji danymi.

# 📚 Szczegółowe wyjaśnienie

## Rodzaje baz danych

- **Relacyjne bazy danych (RDBMS):**  
    Dane są przechowywane w tabelach z precyzyjną strukturą, zapytania realizowane za pomocą języka SQL. Przykłady: MySQL, PostgreSQL, Oracle DB.
    
- **NoSQL:**  
    Przechowuje dane w mniej ustrukturyzowanych formatach, skalowalnych horyzontalnie. Typy: dokumentowe (MongoDB), grafowe (Neo4j), kolumnowe (Cassandra), klucz-wartość (Redis).
    

## Funkcje baz danych

- Przechowywanie danych
- Wyszukiwanie i filtrowanie
- Mechanizmy bezpieczeństwa i kontroli dostępu
- Obsługa transakcji (ACID)
- Optymalizacja zapytań oraz indeksowanie

# 💡 Przykład zastosowania

Relacyjna baza danych może przechowywać informacje o klientach, zamówieniach i produktach w sklepie internetowym, umożliwiając szybkie generowanie raportów sprzedaży. NoSQL może przechowywać dynamiczne dane sesji użytkowników lub dane z czujników IoT.

## 📌 Źródła

- [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
- [https://www.mongodb.com/nosql-explained](https://www.mongodb.com/nosql-explained)
- [https://www.w3schools.com/sql/](https://www.w3schools.com/sql/)

## 👽 Brudnopis

- Podstawy: dane, tabela, wiersz, kolumna
- SQL do manipulacji danych: SELECT, INSERT, UPDATE, DELETE
- NoSQL: elastyczność vs. brak spójności ACID w niektórych systemach
- Wdrażanie: lokalnie, chmura, hybrydy
- Scalanie, backup, replikacja — systemy wysokiej dostępności
- Kluczowe technologie i narzędzia: MySQL, PostgreSQL, MongoDB, Redis, Cassandra, Neo4j.