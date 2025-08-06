---

title: SQL Catalog Item  
created: 2025-05-21  
status:  
category: data catalog / metadata management  
difficulty: średni  
language: pl  
tags:

- katalog danych
- sql
- metadane
- transformacje
- data governance  
aliases:
- element katalogu SQL
- SQL-based catalog items
- SQL transformation item

---

# 🎯 Definicja

**SQL Catalog Item** to typ elementu w katalogu danych (Catalog Item), który został utworzony na podstawie zapytania SQL zamiast bezpośredniego odniesienia do fizycznej tabeli lub pliku danych. Taki element może agregować wiele źródeł danych, zawierać przekształcenia, filtrowania lub inne operacje SQL, i funkcjonować jako logiczne [[Data Source|źródło danych]] w ramach katalogu.

# 🔑 Kluczowe punkty

- 🧱 Tworzone na bazie zapytań SQL – mogą łączyć dane z wielu tabel, widoków lub schematów.
- 🔄 Przydatne do tworzenia widoków operacyjnych, warstw analitycznych lub wersji przekształconych bez konieczności fizycznego materializowania danych.
- ⚡ Wspierane przez połączenia typu JDBC, [[Apache Hive|Hive]] Metastore, Snowflake, BigQuery itp.
- 🎛️ Działa jak każdy inny element katalogu: można przypisać termin słownikowy, jakość danych, [[komentarze]] i reguły DQ.
- 🔒 Elastyczne, ale wymaga dokładnej kontroli zgodności zapytań SQL z jego źródłem (np. różnice dialektów).

# 📚 Szczegółowe wyjaśnienie

## Główne zastosowania SQL Catalog Item

|Zastosowanie|Opis|
|---|---|
|🔗 Łączenie wielu tabel|Tworzenie jednego logicznego widoku biznesowego łączącego różne źródła (np. customer + transactions).|
|🔄 Transformacje|Zastosowanie logiki biznesowej: filtrowanie, agregacje, obliczenia offline.|
|🧱 Budowa warstw analitycznych|Stworzenie staging/intermediate layer dla modeli raportowych lub feature’ów [[Uczenie Maszynowe\|ML]].|
|🎯 Filtrowanie i selekcja danych|Tworzenie podzbiorów danych dla określonych przypadków użycia.|

### Co zawiera SQL Catalog Item?

- Zapytanie SQL w polu konfiguracyjnym (edytorze SQL).
- Źródło połączenia (connection, np. Snowflake, PostgreSQL).
- Opcjonalnie: harmonogram odświeżania (jeśli zapytanie działa jako materializowany widok).
- Możliwość podłączenia reguł jakości, terminów biznesowych, klasyfikacji.

## Przykład zapytania SQL w SQL Catalog Item

```sql
SELECT
  c.customer_id,
  c.name,
  t.total_spent,
  CURRENT_DATE as report_date
FROM
  customers c
JOIN (
  SELECT
    customer_id,
    SUM(amount) as total_spent
  FROM transactions
  GROUP BY customer_id
) t ON c.customer_id = t.customer_id
WHERE c.region = 'EU'
```

### Główne kroki tworzenia SQL Catalog Item

1. Przejdź do sekcji [[Data Catalog]] > + New Catalog Item > wybierz „SQL-based”.
2. Wybierz istniejące połączenie (JDBC/Snowflake/BigQuery).
3. Wklej zapytanie SQL do edytora.
4. Przypisz nazwę, typ danych, opcjonalne opisy, tagi biznesowe.
5. Zapisz element – dostępny będzie jak każdy inny item w katalogu.

# 💡 Przykład zastosowania

Wyobraź sobie, że Twoja organizacja trzyma dane klientów, transakcji i statusów kont w osobnych tabelach. Przez SQL Catalog Item możesz połączyć je logicznie i umożliwić analitykom jednoźródłowy dostęp do pełnego profilu klienta – bez potrzeby ETL lub dodatkowego pipeline'u.

```python
# Pseudozapis utworzenia SQL Catalog Item
create_sql_catalog_item(
    name="Client_Profile_EU",
    connection="Snowflake_PROD",
    sql="""
        SELECT c.id, c.email, SUM(t.amount) as total_spent
        FROM client c
        LEFT JOIN transactions t ON c.id = t.client_id
        WHERE c.region = 'EU'
        GROUP BY c.id, c.email
    """
)
```

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.databricks.com/glossary/sql-editor](https://www.databricks.com/glossary/sql-editor)
- [https://docs.snowflake.com/en/sql-reference](https://docs.snowflake.com/en/sql-reference)
- [https://learn.microsoft.com/en-us/power-bi/connect-data/service-datasets-sql-scripts](https://learn.microsoft.com/en-us/power-bi/connect-data/service-datasets-sql-scripts)

# 👽 Brudnopis

- SQL Item = lightweight extract / logic = lepsze niż materializacja, gdy chcesz szybki widok
- Możesz mieć warstwy: Physical Table (raw) → SQL View (transformed) → Assigned to Glossary Term
- Zachowuje wszystkie właściwości katalogowe = lineage, DQ, relationships
- Często jako staging do modeli [[Uczenie Maszynowe|ML]] lub [[Business Intelligence|BI]]: mniej kosztowny niż pełny pipeline
- Uważać na dostępność – jak źródło odpada, SQL Item nie działa = warto monitorować lub materializować krytyczne widoki