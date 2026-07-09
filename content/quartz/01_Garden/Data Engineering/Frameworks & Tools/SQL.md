---

title: "SQL"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- programowanie
- SQL
- bazy danych  
aliases:
- structured query language
- język zapytań SQL

---

# 🎯 Definicja

**SQL (Structured Query Language)** to standaryzowany język zapytań używany do pracy z relacyjnymi bazami danych. Umożliwia tworzenie, odczytywanie, aktualizowanie oraz usuwanie danych (CRUD), a także zarządzanie strukturą baz danych i kontrolą dostępu. SQL jest podstawowym narzędziem analityka, inżyniera danych oraz deweloperów aplikacji.

# 🔑 Kluczowe punkty

- SQL służy do **manipulowania i zapytywania danych** w systemach relacyjnych (RDBMS), jak PostgreSQL, MySQL, Oracle, SQL Server.
- Składa się z kilku grup instrukcji: DML (Data Manipulation), DDL (Data Definition), DCL (Data Control) i TCL (Transaction Control).
- Jest językiem **deklaratywnym** – opisuje _co_ chcemy uzyskać, nie _jak_.
- Kluczowy w analizie danych, raportowaniu, ELT oraz migracjach danych.
- Zgodność z SQL różni się między systemami baz danych – każdy może mieć własne rozszerzenia.

# 📚 Szczegółowe wyjaśnienie

## Podstawowe komponenty SQL

|Rodzaj instrukcji|Przykład funkcji|Opis|
|---|---|---|
|**DML**|SELECT, INSERT, UPDATE|Operacje na danych|
|**DDL**|CREATE, DROP, ALTER|Tworzenie i modyfikacja struktur danych|
|**DCL**|GRANT, REVOKE|Zarządzanie uprawnieniami|
|**TCL**|COMMIT, ROLLBACK|Kontrola transakcji|

### Przykład podstawowego zapytania SQL:

```sql
SELECT first_name, last_name
FROM employees
WHERE department = 'Sales'
ORDER BY last_name ASC;
```

## Poziomy zaawansowania SQL

W społeczności danych popularny jest podział rozwoju biegłości w SQL:

1. **Poziom 0** — brak znajomości, podstawowa składnia.
2. **Poziom 1–2** — proste zapytania SELECT + JOIN, filtrowanie, agregacje.
3. **Poziom 3** — zagnieżdżone zapytania, [[CTE|CTE]], case-when.
4. **Poziom 4** — OLAP, okna, pivot/unpivot, dynamic SQL.
5. **Poziom 5** — optymalizacja, profile query, materialized views, performance tuning.

![](images/sql-levels Data Bank]([https://twitter.com/largedatabank/status/1559651463919452161](https://twitter.com/largedatabank/status/1559651463919452161))

## Warianty i silniki SQL

- PostgreSQL – zgodny ze standardem ANSI, rozszerzalny (CTEs, JSON, array).
- MySQL – popularny open-source, powszechnie używany w aplikacjach webowych.
- Microsoft SQL Server – dominujący w środowiskach korporacyjnych.
- [[Snowflake|Snowflake]]/BigQuery – SQL jako warstwa do analizy danych w chmurze.
- SQLite – lekki silnik dla embedded/mobile apps.

# 💡 Przykład zastosowania

Zespół analityczny korzysta z SQL do analizy efektywności kampanii marketingowych. Tworzą oni zestaw zapytań SQL w BigQuery, które łączą dane o kliknięciach (ads), sesjach (analytics) i transakcjach (orders). Gotowe zapytania są podstawą dashboardów w Looker Studio i raportów zarządczych.

## 📌 Źródła

- [https://www.w3schools.com/sql/](https://www.w3schools.com/sql/)
- [https://mode.com/sql-tutorial/](https://mode.com/sql-tutorial/)
- [https://github.com/airbytehq/SQL-Levels-Explained](https://github.com/airbytehq/SQL-Levels-Explained)
- [https://sqlzoo.net/](https://sqlzoo.net/)

## 👽 Brudnopis

- SQL jako język nieimperatywny – skup się na _co_, nie _jak_
- ANSI SQL vs dialekty (PostgreSQL, MySQL, T-SQL)
- Wydajność: indeksy, explain plan, struktura zapytań
- SQL to nie tylko analyst tool – to też dla dev i inżynierów
- Warto znać: [[CTE|CTE]], window functions, NULL logic, GROUP BY + HAVING logic
- Dobry SQL = szybki, czytelny, skalowalny

---