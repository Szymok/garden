---

title: Stos danych  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data stack
- architektura danych
- modern data stack  
aliases:
- data stack
- nowoczesny stos danych

---

# 🎯 Definicja

**Stos danych (ang. data stack)** to zestaw technologii, narzędzi i warstw architektury danych używanych do zbierania, przechowywania, przetwarzania, analizy i udostępniania danych w organizacji. Zestaw ten tworzy fundament dla nowoczesnych platform danych wspierających analitykę oraz rozwiązania AI/[[Uczenie Maszynowe|ML]].

# 🔑 Kluczowe punkty

- Stos danych definiuje kompletny łańcuch przetwarzania danych: od źródła do analityki.
- W jego skład wchodzą komponenty do ekstrakcji, przechowywania, przetwarzania, raportowania i wartościowania danych.
- Może być zbudowany z różnych technologii open-source, rozwiązań chmurowych lub narzędzi SaaS.
- Koncepcja nowoczesnego stosu danych ([[Nowoczesny Stos Danych|Modern Data Stack]]) koncentruje się na modularności, chmurze i elastyczności.
- Kluczowy w tworzeniu platform danych pod raportowanie ([[Business Intelligence|BI]]), Data Science oraz Product Analytics.

# 📚 Szczegółowe wyjaśnienie

## Warstwy klasycznego stosu danych

1. **Ekstrakcja i załadunek danych (ELT/ETL):**
    
    - Narzędzia ETL/ELT odpowiadają za pobranie danych ze źródeł (API, bazy danych, pliki) i ich załadowanie do hurtowni danych.
    - Przykłady: Fivetran, Airbyte, Apache NiFi, [[dbt]] (w transformacji), Apache [[Apache Airflow|Airflow]] jako orkiestracja.
2. **Przechowywanie danych (Storage/Warehouse):**
    
    - Hurtownie danych (DWH) lub jeziora danych (Data Lakes) przechowują dane w ustrukturyzowanej lub surowej formie.
    - Przykłady: Snowflake, Google BigQuery, Amazon Redshift, Databricks, [[Delta Lake]], S3.
3. **Przetwarzanie danych (Processing/Transform):**
    
    - Transformacje danych — strukturalne, semantyczne, logiczne — przygotowujące dane do analizy i modelowania.
    - Narzędzia: [[dbt]] (transformacje SQL), Apache Spark, Trino/Presto, [[Pandas]].
4. **Analityka i [[Wizualizacja]] ([[Business Intelligence|BI]]/Analytics):**
    
    - Warstwa prezentacji dla użytkowników biznesowych.
    - Przykłady: Power [[Business Intelligence|BI]], Looker, Tableau, Metabase, Superset.
5. **Monitorowanie i jakość danych (Data QA / Observability):**
    
    - Narzędzia monitorujące jakość i poprawność danych, np. schematy, null-e, odchylenia.
    - Przykłady: Monte Carlo, Great Expectations, Soda, Datadog for pipelines.
6. **Zarządzanie i bezpieczeństwo (Governance/Security):**
    
    - Kontrola dostępu, katalogi danych, linie pochodzenia (data lineage), zgodność z RODO/GDPR.
    - Przykłady: Atlan, Collibra, Amundsen, DataHub.

## Cechy nowoczesnego stosu danych ([[Nowoczesny Stos Danych|Modern Data Stack]])

- **Cloud-native:** narzędzia działają w chmurze, skalowalne i łatwe do zintegrowania.
- **Modularność:** możliwość podmiany komponentów bez konieczności przebudowy całego systemu.
- **Low/no-code integracje:** wielu dostawców oferuje GUI do konfiguracji ETL, QA itp.
- **Streaming + batch:** wsparcie zarówno dla danych realtime, jak i wsadowych.

# 💡 Przykład zastosowania

Startup e-commerce korzysta z nowoczesnego stosu danych zbudowanego z:

- Airbyte do ekstrakcji danych ze Stripe, Shopify i Google Ads
- Snowflake jako hurtowni danych
- [[dbt]] do transformacji i modelowania warstw analitycznych
- Metabase do raportowania
- Great Expectations do walidacji poprawności danych

Dzięki temu zespół analityczny codziennie generuje dashboardy [[KPI]] w czasie rzeczywistym i przewiduje rotację klientów za pomocą modeli machine learningowych.

## 📌 Źródła

- [https://www.moderndatastack.xyz/](https://www.moderndatastack.xyz/)
- [https://select.dev/data-stack](https://select.dev/data-stack)
- [https://towardsdatascience.com/modern-data-stack-for-new-companies-879a02b9f1ef](https://towardsdatascience.com/modern-data-stack-for-new-companies-879a02b9f1ef)
- [https://docs.getdbt.com/docs/introduction](https://docs.getdbt.com/docs/introduction)

## 👽 Brudnopis

- Stos danych = cały pipeline danych: od źródła do wizualizacji
- Warstwy: ingress → warehouse → transformacje → [[Business Intelligence|BI]] → [[Uczenie Maszynowe|ML]]
- [[Nowoczesny Stos Danych|MDS]] = gotowe do chmury, plug-and-play, open standards
- Zwróć uwagę na rozdzielenie ETL i ELT (w [[dbt]] typu T)
- Monitoring runtime pipelines — [[Inżynieria Danych|DataOps]] + observability
- Governance i zgodność: Audit trails, linie pochodzenia danych, katalogi danych
- Przyszłość: [[Data Mesh]] vs. monolityczny Data Platform, Cookieless [[Business Intelligence|BI]], Federated Querying