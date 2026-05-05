---

title: "CTE - Common Table Expression"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- SQL
- CTE
- zapytania SQL  
aliases:
- common table expression
- wyrażenia tabelowe

---

# 🎯 Definicja

**Wspólne Wyrażenie Tabeli (CTE — Common Table Expression)** to tymczasowy, nazwany zestaw wyników, który można wykorzystać wewnątrz instrukcji takich jak `SELECT`, `INSERT`, `UPDATE` lub `DELETE`. CTE ułatwia pisanie czytelnych, modularnych zapytań i może być też używane w definicji widoków.

# 🔑 Kluczowe punkty

- CTE to tymczasowa tabela wynikowa wykorzystywana w ramach pojedynczego zapytania.
- Ułatwia unikanie powtarzania się tego samego podzapytania oraz poprawia czytelność kodu.
- Dostępne są dwa typy: **nierekurencyjne** i **rekurencyjne** CTE.
- Rekurencyjne CTE pozwala na operacje na danych hierarchicznych i rekurencyjnych strukturach.
- Stosowanie CTE może poprawić organizację złożonych zapytań SQL.

# 📚 Szczegółowe wyjaśnienie

## Składnia podstawowa

```sql
WITH cte_query AS (
  SELECT … -- definicja podzapytania
)
SELECT … 
FROM cte_query
JOIN …
```

## Nierekurencyjne CTE

Stosowane jako aliasy dla skomplikowanych podzapytań lub do wielokrotnego wykorzystania wyniku podzapytania w dalszej części zapytania. Przykład:

```sql
WITH avg_per_store AS (
  SELECT store, AVG(amount) AS average_order
  FROM orders
  GROUP BY store
)
SELECT o.id, o.store, o.amount, avg.average_order AS avg_for_store
FROM orders o
JOIN avg_per_store avg ON o.store = avg.store;
```

## Rekurencyjne CTE

Pozwalają na pisanie zapytań, które odwołują się same do siebie w celu iteracyjnego przetwarzania danych, np. eksploracji struktur hierarchicznych typu drzewo.

Struktura:

- Zdefiniuj zapytanie podstawowe (kotwicę), które dostarcza pierwszy poziom danych.
- Zdefiniuj część rekurencyjną, która odwołuje się do CTE i rozszerza wynik o kolejne poziomy.
- Użyj `UNION ALL` by łączyć wyniki.

Przykład hierarchii pracowników:

```sql
WITH levels AS (
  SELECT
    id,
    first_name,
    last_name,
    superior_id,
    1 AS level
  FROM employees
  WHERE superior_id IS NULL
  UNION ALL
  SELECT
    e.id,
    e.first_name,
    e.last_name,
    e.superior_id,
    l.level + 1
  FROM employees e
  JOIN levels l ON e.superior_id = l.id
)
SELECT * FROM levels;
```

# 💡 Przykład zastosowania

Rekurencyjne CTE umożliwia łatwe uzyskanie pełnej ścieżki hierarchii organizacyjnej, np. wszystkich podwładnych konkretnego menedżera, z określeniem poziomu podległości.

# 📌 Źródła

- [5 praktycznych przykładów użycia CTE w SQL | LearnSQL.com](https://learnsql.com/blog/practical-sql-cte-examples/)
- Microsoft Docs – Common Table Expressions: [https://docs.microsoft.com/en-us/sql/t-sql/queries/with-common-table-expression-transact-sql](https://docs.microsoft.com/en-us/sql/t-sql/queries/with-common-table-expression-transact-sql)
- PostgreSQL Documentation – WITH Queries: [https://www.postgresql.org/docs/current/queries-with.html](https://www.postgresql.org/docs/current/queries-with.html)

## 👽 Brudnopis

- CTE – alias i tymczasowa tabela w SQL
- Nierekurencyjne: refaktoryzacja zapytań, modularność
- Rekurencyjne: hierarchie, drzewa, grafy
- UNION ALL łączy kotwicę i rekurencję
- Zwróć uwagę na warunki końcowe, by uniknąć nieskończonej rekursji
- Poprawia czytelność i może polepszyć wydajność zapytań
- Alternatywa dla podzapytań zagnieżdżonych lub widoków

---