---
title: "CTE - Common Table Expression"
tags:
- inżynieria danych
---

Wspólne Wyrażenie Tabeli (CTE - Common Table Expression) to tymczasowy nazwany zestaw wyników, do którego możesz się odwoływać wewnątrz instrukcji SELECT, INSERT, UPDATE lub DELETE. CTE może być także używane w widoku.

```sql
WITH cte_query AS
(SELECT … podzapytanie ...)
SELECT główne zapytanie ... FROM/JOIN z cte_query ...
```

## Rodzaje: Rekurencyjne i Nierekurencyjne
### Nierekurencyjne CTE
Istnieją dwa rodzaje CTE: rekurencyjne i nierekurencyjne.

Nierekurencyjne są proste, gdzie CTE jest używane do unikania duplikacji w SQL poprzez odwołanie się do nazwy zamiast samego zapytania SQL.

Przykład:
```sql
WITH avg_per_store AS
  (SELECT store, AVG(amount) AS average_order
   FROM orders
   GROUP BY store)
SELECT o.id, o.store, o.amount, avg.average_order AS avg_for_store
FROM orders o
JOIN avg_per_store avg
ON o.store = avg.store;
```

### Rekurencyjne CTE

Rekurencyjne CTE korzystają z powtarzających się pętli proceduralnych, stąd rekursja. Zapytanie rekurencyjne wywołuje siebie, dopóki zapytanie nie spełni warunku. W rekurencyjnym CTE należy podać warunek, który zakończy rekursję.

Rekurencyjne CTE są przydatne do zapytań dotyczących danych hierarchicznych, takich jak struktury organizacyjne, gdzie jeden pracownik podlega kierownikowi, lub wielopoziomowe listy materiałów, gdzie produkt składa się z wielu komponentów, a każdy komponent również składa się z wielu innych komponentów.

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
    employees.id,
    employees.first_name,
    employees.last_name,
    employees.superior_id,
    levels.level + 1
  FROM employees, levels
  WHERE employees.superior_id = levels.id
)
 
SELECT *
FROM levels;
```

Więcej informacji na temat [5 praktycznych przykładów użycia CTE w SQL | LearnSQL.com](https://learnsql.com/blog/practical-sql-cte-examples/).