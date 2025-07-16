---

title: dbt  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: średni  
language: pl  
tags:

- dbt
- ELT
- transformacje danych
- SQL
- data modeling
- analytics engineering  
aliases:
- dbt-core
- data build tool
- dbt cloud

---

# 🎯 Definicja

**dbt (data build tool)** to narzędzie typu open source (dostępne również jako usługa w chmurze – dbt Cloud), które umożliwia transformację danych za pomocą języka SQL bezpośrednio w hurtowni danych. Jest centralnym elementem modelu ELT, koncentrującym się na „T” (transform), i jest standardem de facto w nowoczesnej inżynierii danych ([[Inżynieria Danych|data engineering]] / analytics engineering).

# 🔑 Kluczowe punkty

- 📦 Umożliwia pisanie, testowanie, dokumentowanie i uruchamianie transformacji w SQL.
- 🔄 Stosuje podejście ELT — dane są najpierw ładowane do hurtowni, a transformacje wykonywane są wewnątrz niej.
- 🧱 Wspiera modularne tworzenie modeli danych z możliwością dziedziczenia, zależności i graficznej wizualizacji DAG.
- ✅ Obsługuje testy danych i automatyczne dokumentowanie modeli oraz metadanych.
- 🔗 Integruje się z różnymi hurtowniami, takimi jak Snowflake, BigQuery, Redshift, Databricks, PostgreSQL.

# 📚 Szczegółowe wyjaśnienie

## Jak działa dbt?

1. **Źródła danych** są ładowane do hurtowni danych przez narzędzia typu Fivetran, Airbyte, Kafka (warstwa "extract & load").
2. **dbt** wykonuje transformacje SQL w hurtowni (np. czyszczenie danych, łączenie tabel, budowa warstw analitycznych).
3. Dzielisz kod SQL na **modułowe modele** (np. staging, intermediate, marts), które dziedziczą po sobie.
4. Wszystkie transformacje są wersjonowane i uruchamialne jako pipeline (lokalnie lub w dbt Cloud).

## Kluczowe składniki

- **Model**: plik SQL budujący tabelę lub widok w hurtowni danych.
- **Seeds**: dane źródłowe z pliku CSV, które można załadować jako tabelę.
- **Sources**: odniesienia do rzeczywistych tabel poza dbt, np. źródła typu raw_data.orders.
- **Tests**: predefiniowane lub niestandardowe testy walidujące dane (np. brak NULL, unikalność klucza).
- **Docs**: dokumentacja i lineage'owanie modeli – generowane automatycznie.

## Wersja lokalna vs dbt Cloud

|Cecha|dbt Core (CLI)|dbt Cloud (SaaS)|
|---|---|---|
|Wymagana instalacja|Tak (Python + dbt)|Nie|
|Framework Open Source|✅|✅|
|CI/CD|Lokalnie lub Github CI|Wbudowane i zintegrowane|
|UI|Brak (CLI tylko)|✅ Web UI z drag-and-drop i schedulerem|
|Schedule & history|🚫 manualne|✅ wbudowany graficzny harmonogram|

# 💡 Przykład zastosowania

Zespół danych w firmie e-commerce tworzy pipeline w dbt, który:

- Staging: przekształca raw_orders -> orders_stg (czyści typy, formatuje daty).
- Intermediate: łączy z tablicą users i produktów, tworząc joiny na poziomie sesji.
- Marts: finalna warstwa customer_lifetime_value, z której korzysta dashboard CFO.

Całość jest uruchamiana co godzinę w dbt Cloud za pomocą harmonogramu. Testy dbt automatycznie wykrywają brakujące dane i wysyłają alert, jeśli metryka zapełnienia spada.

# 📌 Źródła

- [https://www.getdbt.com/](https://www.getdbt.com/)
- [https://docs.getdbt.com/](https://docs.getdbt.com/)
- [https://towardsdatascience.com/the-rise-of-dbt-in-modern-data-stack-2b4c6bb9a6c5](https://towardsdatascience.com/the-rise-of-dbt-in-modern-data-stack-2b4c6bb9a6c5)
- [https://analyticsengineer.io/why-every-data-team-should-use-dbt/](https://analyticsengineer.io/why-every-data-team-should-use-dbt/)

# 👽 Brudnopis

- ELT: dbt robi T (transform), Fivetran/Airbyte robi E+L
- Standard in analytics engineering & modern data stack
- Workflow: sources → staging → core models → marts
- testy: not_null, unique, accepted_values, relational integrity
- Wersjonowanie w Git, CI/CD, testy automatyczne
- dbt Cloud integruje scheduler, monitoring, lineage, CI
- Zyskuje popularność w zespołach BI i inżynierii analitycznej