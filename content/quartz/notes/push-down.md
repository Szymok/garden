---

title: "Push-Down"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- optymalizacja
- sql
- przetwarzanie zapytań
- data pipelines  
aliases:
- optymalizacja push-down
- pushdown logic

---

# 🎯 Definicja

**Push-Down** (lub optymalizacja push-down) to technika polegająca na przesuwaniu logiki transformacji lub przetwarzania danych jak najbliżej ich źródła — zazwyczaj do bazy danych — zamiast realizowania tej logiki po stronie warstwy pośredniej, np. silnika ETL lub hurtowni danych. Dzięki temu ogranicza się przesyłanie danych przez sieć, poprawiając wydajność całego procesu przetwarzania.

# 🔑 Kluczowe punkty

- Push-down minimalizuje ilość przesyłanych danych przez sieć, wykonując transformacje bezpośrednio „tam, gdzie dane żyją”.
- Wykorzystuje wydajność silników baz danych (np. PostgreSQL, BigQuery, Oracle) zamiast procesować dane lokalnie.
- Szczególnie skuteczny w systemach integracji danych, np. podczas ekstrakcji z OLTP do DWH.
- Może dotyczyć filtrowania, joinów, agregacji i innych operacji wykonywanych w SQL.
- Często stosowany w warstwie semantycznej, wirtualizacji danych i nowoczesnych systemach ELT.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Push-Down?

Zamiast pobierać całą tabelę z bazy i przetwarzać ją lokalnie, przekształcenie zostaje „wciśnięte” (ang. pushed-down) do źródłowego zapytania. Przykład:

### Bez push-down:

- Narzędzie pobiera całą tabelę `orders`, a następnie lokalnie filtruje dane z roku 2025.

### Z push-down:

- Narzędzie wysyła zapytanie SQL:

```sql
SELECT * FROM orders WHERE year = 2025;
```

- Filtrowanie następuje już w bazie danych. Do narzędzia trafiają tylko potrzebne dane.

## Przykłady zastosowań

- **ETL/ELT**: Narzędzia takie jak [[dbt]], Airbyte, Informatica, Talend, przy dobrej konfiguracji, potrafią zaprojektować zapytania tak, by transformacje wykonywały się bezpośrednio w źródle lub w hurtowni.
- **[[Wirtualizacja danych]] ([[Wirtualizacja Danych|Data Virtualization]])**: Narzędzia typu Denodo, Trino, Dremio wykorzystują push-down, aby unikać lokalnego przetwarzania danych.
- **[[Warstwa semantyczna]] (Semantic Layer)**: Looker, Cube.dev, AtScale potrafią generować SQL push-down podczas renderowania dashboardów.

## Korzyści z wykorzystania push-down

|Korzyść|Opis|
|---|---|
|**Redukcja transferu danych**|Przetwarzane są tylko potrzebne dane, a nie cały surowy zbiór.|
|**Wyższa wydajność**|Wykorzystanie indeksów, optymalizacji silnika DB, paralelizmu.|
|**Mniejsze zużycie zasobów lokalnych**|Mniej pamięci i CPU po stronie aplikacji lub warstwy pośredniej.|
|**Większa skalowalność**|Procesy lepiej skalują się z dużymi wolumenami danych.|

## Potencjalne wyzwania

- Nie wszystkie integracje/silniki wspierają efektywny push-down.
- Może zwiększyć obciążenie systemów źródłowych operacyjnych (OLTP).
- Wymaga dobrej znajomości możliwości targetowanego silnika bazodanowego.
- W niektórych przypadkach wymaga specjalnych konfiguracji/adapterów.

# 💡 Przykład zastosowania

Zespół [[Inżynieria Danych|data engineering]] zbudował pipeline do kopiowania danych z systemu ERP (Oracle) do hurtowni BigQuery. Dzięki aktywowaniu trybu push-down w narzędziu ELT (np. Fivetran), zamiast kopiować wszystkie rekordy z tabeli `transactions`, system pobiera wyłącznie te z ostatnich 7 dni, ponieważ filtr `WHERE transaction_date > CURRENT_DATE - 7` jest wykonywany już w Oracle.

## 📌 Źródła

- [https://docs.getdbt.com/docs/build/custom-sql/push-down](https://docs.getdbt.com/docs/build/custom-sql/push-down)
- [https://www.informatica.com/blogs/what-is-pushdown-optimization.html](https://www.informatica.com/blogs/what-is-pushdown-optimization.html)
- [https://cube.dev/blog/the-case-for-push-down-semantic-layer/](https://cube.dev/blog/the-case-for-push-down-semantic-layer/)
- [https://www.denodo.com/en/document/white-paper/push-down-queries-explained-data-virtualization](https://www.denodo.com/en/document/white-paper/push-down-queries-explained-data-virtualization)

## 👽 Brudnopis

- Push-down = SQL wysyłany do źródła zamiast pobrania i transformacji lokalnie
- Kluczowe w ELT (nie robi transformacji po pobraniu → szybciej, taniej)
- Przykłady: [[dbt]] vs Python [[Pandas]]: [[dbt]] pushdown = SQL w silniku, [[Pandas]] lokalnie
- Data Lake → pushdown do Delta/Parquet przez [[DuckDB]], Presto
- Siła nowoczesnych [[Data Lakehouse|lakehouse]]: federacyjny SQL z push-down + vectorizzata
- Nie każdy konektor obsługuje pushdown (np. Airbyte legacy connector vs native JDBC)
- Sprzężenie z cost-based planner – warunki, indeksy, sort merge join
- Wady: limitacja logiki, zależność od wersji SQL w źródle, security na QL level

---