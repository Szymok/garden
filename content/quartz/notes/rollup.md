---

title: "Rollup"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- agregacja danych
- summarizacja
- hurtownia danych  
aliases:
- preagregacja
- agregaty
- roll-up

---

# 🎯 Definicja

**Rollup** to technika agregacji danych, polegająca na ich podsumowaniu w mniej szczegółowej formie, często na wyższym poziomie hierarchii lub z większą granularnością czasową. Rollupy zmniejszają wolumen danych, przyspieszają zapytania analityczne i stanowią podstawę do budowy widoków [[Business Intelligence|BI]] oraz tabel agregujących (aggregate tables) w hurtowniach danych.

# 🔑 Kluczowe punkty

- Rollup = **agregacja grupująca dane** według wyższych poziomów hierarchii (np. dzień → miesiąc, produkt → kategoria)
- Używane w **data warehousach, OLAP**, systemach raportowych i dashboardach [[Business Intelligence|BI]]
- Rollupy mogą zmniejszyć liczbę wierszy o rzędy wielkości – mniej danych do przetwarzania
- Są formą **preagregacji**, często materializowane jako tabele pomocnicze
- Technikę Rollup można implementować manualnie (SQL) lub automatycznie (np. przez [[dbt]], OLAP engine)

# 📚 Szczegółowe wyjaśnienie

## Przykład: z dziennego do miesięcznego

[[Fakty|Tabela faktów]] sprzedaży na poziomie dziennym:

|data|id_produktu|sprzedaż|
|---|---|---|
|2025-06-01|101|120|
|2025-06-02|101|140|

Po rollupie do poziomu miesięcznego:

|miesiąc|id_produktu|suma_sprzedaży|
|---|---|---|
|2025-06|101|260|

## Zastosowania

- **Widoki [[Business Intelligence|BI]] / dashboardy** – odczyty dla licznych użytkowników nie spowalniają bazy
- **Hurtownie danych (DWH)** – tabele agregujące przyspieszają zapytania OLAP
- **[[Modelowanie wymiarowe]]** – podstawowy mechanizm w hierarchiach czasu, regionu, produktu
- **Raporty zbiorcze** – gdzie szczegóły nie są potrzebne na każdym poziomie

## Implementacja – SQL (GROUP BY ROLLUP)

W wielu bazach danych (np. PostgreSQL, Snowflake, BigQuery):

```sql
SELECT 
  region, 
  produkt_kategoria, 
  SUM(sprzedaż) AS suma
FROM zakupy
GROUP BY ROLLUP (region, produkt_kategoria);
```

Wynik zawiera:

- sumy dla (region + kategoria)
- sumy per region
- całkowita suma globalna (`NULL, NULL`)

## Rollup vs CUBE

|Operacja|Opis|
|---|---|
|**ROLLUP**|Agregacje hierarchiczne "z góry na dół" (np. dzień → miesiąc → rok)|
|**CUBE**|Wszystkie możliwe kombinacje grup atrybutów (np. produkt x region x kanał)|

# 💡 Przykład zastosowania

Zespół analiz biznesowych tworzy widoki w Looker z codziennymi danymi transakcyjnymi. Aby przyspieszyć dashboard z wykresami kwartalnych przychodów wg województwa, tworzą rollup w [[dbt]], który agreguje dane na poziomie miesiąc/województwo i zapisuje je jako `table: sales_rollup`.

Wyszukiwanie danych odbywa się teraz 5x szybciej, a obciążenie zapytań do tabeli źródłowej spadło o 90%.

## 📌 Źródła

- [https://docs.getdbt.com/docs/build/rollups](https://docs.getdbt.com/docs/build/rollups)
- [https://mode.com/sql-tutorial/sql-rollup/](https://mode.com/sql-tutorial/sql-rollup/)
- Snowflake Docs – [ROLLUP and CUBE](https://docs.snowflake.com/en/sql-reference/constructs/group-by-rollup-cube-grouping-sets)
- Google BigQuery: GROUP BY ROLLUP

## 👽 Brudnopis

- rollup = suma na poziomie agregatu
- vs brute-force agregacja: rollup jest zoptymalizowany
- [[dbt]]: tworzenie tabel materiałowanych z preagregacją
- OLAP cubes: n-dimensional rollups
- W Looker = aggte function z persist_table: true
- rollup można cache'ować, inkrementalnie uzupełniać (np. przez `is_incremental()`)

---