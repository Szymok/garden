---
title: Modern Data Stack (Nowoczesny Stos Danych)
created: 2026-02-04
status: evergreen
category: Data Architecture
difficulty: basic
language: pl
tags:
  - mds
  - architecture
  - cloud
  - saas
  - dbt
aliases:
  - MDS
  - Nowoczesny Stos Danych
  - Stos Danych
---
# 🎯 Definicja
**Modern Data Stack (MDS)** to zestaw narzędzi chmurowych do przetwarzania danych, które są **modułowe**, łatwe w integracji i zazwyczaj płatne w modelu "pay-as-you-go". To przeciwieństwo starych, monolitycznych platform (jak Oracle czy SAP BW), gdzie kupowałeś wielką "kobyłę" na lata.

# 🔑 Kluczowe punkty
- **ELT zamiast ETL:** Najpierw ładujemy dane do chmury (Extract, Load), a potem je obrabiamy (Transform) mocą Warehouse'a.
- **SQL Driven:** Większość transformacji dzieje się w SQL (np. [[dbt]]), co democratyzuje dostęp dla analityków.
- **Best-of-Breed:** Wybierasz najlepsze narzędzie do każdej funkcji (Fivetran do rur, Snowflake jako baza, dbt do logiki, Looker do wykresów).

# 📚 Szczegółowe wyjaśnienie
Klasyczny skład MDS:
1.  **Ingestion:** Fivetran / Airbyte (Pobierz dane z Facebooka/Salesforce i wrzuć do bazy).
2.  **Warehousing:** Snowflake / BigQuery / Databricks (Tutaj trzymamy dane).
3.  **Transformation:** [[dbt]] (Tu piszemy SQL, który czyści dane).
4.  **Orchestration:** Airflow / Dagster / Prefect (Dyrygent, który mówi "teraz ty").
5.  **BI:** Looker / Tableau / Superset (Wykresy).
6.  **Reverse ETL:** Hightouch (Wyślij wyniki z powrotem do CRM, np. "Ten klient jest VIP").

# 💡 Przykład zastosowania
Startup e-commerce.
Zamiast zatrudniać 5 inżynierów do pisania skryptów w Pythonie, kupują Fivetran ($500/mc), podpinają Shopify i Google Ads. Dane lądują w Snowflake. Analityk pisze modele w dbt. W tydzień mają działającą analitykę, którą kiedyś budowano rok.

## 📌 Źródła
- "The Modern Data Stack: Past, Present, and Future" (a16z).

## 👽 Brudnopis
- Obecnie mówi się o "Post-Modern Data Stack", bo MDS stał się zbyt skomplikowany i drogi (abonamenty za 10 narzędzi się sumują).