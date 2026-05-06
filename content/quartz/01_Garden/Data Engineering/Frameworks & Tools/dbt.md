---

title: dbt  
created: 2025-07-16  
status: 🌱 draft
category: inÅ¼ynieria danych  
difficulty: Å›redni  
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

# ðŸŽ¯ Definicja

**dbt (data build tool)** to narzÄ™dzie typu open source (dostÄ™pne rÃ³wnieÅ¼ jako usÅ‚uga w chmurze â€“ dbt Cloud), ktÃ³re umoÅ¼liwia transformacjÄ™ danych za pomocÄ… jÄ™zyka SQL bezpoÅ›rednio w hurtowni danych. Jest centralnym elementem modelu ELT, koncentrujÄ…cym siÄ™ na â€žTâ€ (transform), i jest standardem de facto w nowoczesnej inÅ¼ynierii danych ([[InÅ¼ynieria Danych|data engineering]] / analytics engineering).

# ðŸ”‘ Kluczowe punkty

- ðŸ“¦ UmoÅ¼liwia pisanie, testowanie, dokumentowanie i uruchamianie transformacji w SQL.
- ðŸ”„ Stosuje podejÅ›cie ELT â€” dane sÄ… najpierw Å‚adowane do hurtowni, a transformacje wykonywane sÄ… wewnÄ…trz niej.
- ðŸ§± Wspiera modularne tworzenie modeli danych z moÅ¼liwoÅ›ciÄ… dziedziczenia, zaleÅ¼noÅ›ci i graficznej wizualizacji DAG.
- âœ… ObsÅ‚uguje testy danych i automatyczne dokumentowanie modeli oraz metadanych.
- ðŸ”— Integruje siÄ™ z rÃ³Å¼nymi hurtowniami, takimi jak Snowflake, BigQuery, Redshift, Databricks, PostgreSQL.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Jak dziaÅ‚a dbt?

1. **Å¹rÃ³dÅ‚a danych** sÄ… Å‚adowane do hurtowni danych przez narzÄ™dzia typu Fivetran, Airbyte, Kafka (warstwa "extract & load").
2. **dbt** wykonuje transformacje SQL w hurtowni (np. czyszczenie danych, Å‚Ä…czenie tabel, budowa warstw analitycznych).
3. Dzielisz kod SQL na **moduÅ‚owe modele** (np. staging, intermediate, marts), ktÃ³re dziedziczÄ… po sobie.
4. Wszystkie transformacje sÄ… wersjonowane i uruchamialne jako pipeline (lokalnie lub w dbt Cloud).

## Kluczowe skÅ‚adniki

- **Model**: plik SQL budujÄ…cy tabelÄ™ lub widok w hurtowni danych.
- **Seeds**: dane ÅºrÃ³dÅ‚owe z pliku CSV, ktÃ³re moÅ¼na zaÅ‚adowaÄ‡ jako tabelÄ™.
- **Sources**: odniesienia do rzeczywistych tabel poza dbt, np. ÅºrÃ³dÅ‚a typu raw_data.orders.
- **Tests**: predefiniowane lub niestandardowe testy walidujÄ…ce dane (np. brak NULL, unikalnoÅ›Ä‡ klucza).
- **Docs**: dokumentacja i lineage'owanie modeli â€“ generowane automatycznie.

## Wersja lokalna vs dbt Cloud

|Cecha|dbt Core (CLI)|dbt Cloud (SaaS)|
|---|---|---|
|Wymagana instalacja|Tak (Python + dbt)|Nie|
|Framework Open Source|âœ…|âœ…|
|CI/CD|Lokalnie lub Github CI|Wbudowane i zintegrowane|
|UI|Brak (CLI tylko)|âœ… Web UI z drag-and-drop i schedulerem|
|Schedule & history|ðŸš« manualne|âœ… wbudowany graficzny harmonogram|

# ðŸ’¡ PrzykÅ‚ad zastosowania

ZespÃ³Å‚ danych w firmie e-commerce tworzy pipeline w dbt, ktÃ³ry:

- Staging: przeksztaÅ‚ca raw_orders -> orders_stg (czyÅ›ci typy, formatuje daty).
- Intermediate: Å‚Ä…czy z tablicÄ… users i produktÃ³w, tworzÄ…c joiny na poziomie sesji.
- Marts: finalna warstwa customer_lifetime_value, z ktÃ³rej korzysta dashboard CFO.

CaÅ‚oÅ›Ä‡ jest uruchamiana co godzinÄ™ w dbt Cloud za pomocÄ… harmonogramu. Testy dbt automatycznie wykrywajÄ… brakujÄ…ce dane i wysyÅ‚ajÄ… alert, jeÅ›li metryka zapeÅ‚nienia spada.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://www.getdbt.com/](https://www.getdbt.com/)
- [https://docs.getdbt.com/](https://docs.getdbt.com/)
- [https://towardsdatascience.com/the-rise-of-dbt-in-modern-data-stack-2b4c6bb9a6c5](https://towardsdatascience.com/the-rise-of-dbt-in-modern-data-stack-2b4c6bb9a6c5)
- [https://analyticsengineer.io/why-every-data-team-should-use-dbt/](https://analyticsengineer.io/why-every-data-team-should-use-dbt/)

# ðŸ‘½ Brudnopis

- ELT: dbt robi T (transform), Fivetran/Airbyte robi E+L
- Standard in analytics engineering & modern [[Stos danych|data stack]]
- Workflow: sources â†’ staging â†’ core models â†’ marts
- testy: not_null, unique, accepted_values, relational integrity
- Wersjonowanie w Git, CI/CD, testy automatyczne
- dbt Cloud integruje scheduler, monitoring, lineage, CI
- Zyskuje popularnoÅ›Ä‡ w zespoÅ‚ach [[Business Intelligence|BI]] i inÅ¼ynierii analitycznej