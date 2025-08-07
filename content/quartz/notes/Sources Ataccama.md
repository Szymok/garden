---

title: Sources Ataccama  
created: 2025-04-03  
status:  
category: data catalog / zarządzanie połączeniami  
difficulty: podstawowy  
language: pl  
tags:

- źródła danych
- Ataccama ONE
- data catalog
- data discovery
- profiling  
aliases:
- źródła Ataccama
- Ataccama data sources
- katalog źródeł danych

---

# 🎯 Definicja

**Sources** w kontekście platformy Ataccama ONE to zarejestrowane źródła danych, które stanowią podstawę do dalszych operacji zarządzania danymi — takich jak profilowanie, data discovery, katalogowanie, klasyfikacja, ocena jakości oraz dokumentacja techniczna i biznesowa. Źródła można tworzyć i konfigurować manualnie w sekcji **[[Data Catalog]] → Sources**.

# 🔑 Kluczowe punkty

- 🔌 [[Data Source|Źródło danych]] definiuje punkt wejścia do danych – np. baza danych, Data Lake, S3 bucket, JDBC, REST API.
- 🛠️ Do jednego źródła można przypisać wiele połączeń (connections), nawet różnego typu.
- 👥 W ramach źródła można zarządzać poświadczeniami i dostępami dla różnych użytkowników.
- ⚙️ Obsługiwane działania to: testowanie połączenia, discovery danych, pełne profilowanie, uruchomienie pipeline’u dokumentującego.
- 🧹 Można natychmiastowo usunąć źródło jednym kliknięciem („Instant delete”).

# 📚 Szczegółowe wyjaśnienie

## Jak działa sekcja Sources?

Sekcja **Sources** w Ataccama ONE umożliwia:

- Dodawanie i konfigurację źródeł danych.
- Zarządzanie kilkoma połączeniami pod jedno źródło (np. różne środowiska: DEV, PROD).
- Przegląd wcześniej zarejestrowanych źródeł, statusów testu połączeń, historii operacji.
- Uruchamianie Data Discovery i Profilowania w obrębie wybranego źródła.
- Inicjowanie flows: dokumentacja, klasyfikacja, lineage.

## Obsługiwane źródła danych (przykładowe)

|Typ źródła|Przykład zastosowania|
|---|---|
|Amazon S3|Pliki JSON, Parquet, CSV w chmurze|
|Snowflake|Hurtownia danych analitycznych|
|PostgreSQL / Oracle|Bazy danych transakcyjne|
|Google BigQuery|Analityka danych z Google Cloud|
|Azure Blob Storage|Pliki stagingowe lub półstrukturalne dane|
|Generic JDBC|Uniwersalne źródło z danym sterownikiem|
|REST API|Dane SaaS, CRM, systemów zewnętrznych|

## Elementy zarządzania źródłem

- Nazwa źródła i typ (np. „CRM_PROD – PostgreSQL DB”).
- Lista połączeń (Connection Name, URL, status).
- Przypisane poświadczenia – do każdego połączenia może być przypisanych wiele credential profiles.
- Aktywne procesy Discover / [[Profiling]] / Documentation History.
- Uprawnienia: kto może użyć źródła i w jakim zakresie.
- Monitorowanie: ostatnie działania, błędy, harmonogramy.

## Przykład cyklu życia źródła

1. 🛠️ Administrator dodaje źródło „Salesforce_Prod_API” z poświadczeniem OAuth2.
2. 🔎 Użytkownik uruchamia Discovery, by zidentyfikować strukturę danych i dodać ją do Katalogu.
3. 🧪 Kolejny użytkownik włącza opcję [[Manual Profiling]] na obiektach typu „Customer Record”.
4. 📊 Analizy DQ oraz przypisanie terminów słownikowych następuje automatycznie.
5. 🧹 Nieaktualne lub zduplikowane źródła są usuwane przy użyciu „Instant delete”.

# 💡 Przykład zastosowania

```python
# Pseudokod opisujący konfigurację źródła danych w systemie katalogowym
create_source(
    name="Azure_Finance_Data Lakehouse|Lakehouse",
    type="Azure Blob Storage",
    connections=[
        {"name": "prod-conn", "container": "finance", "auth": "KeyVaultRef"},
        {"name": "dev-conn", "container": "finance-dev", "auth": "KeyLocal"}
    ],
    default_credentials="prod-conn",
    profiling_enabled=True,
    visibility="Project Only"
)
```

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.ataccama.com/platform/data-catalog](https://www.ataccama.com/platform/data-catalog)
- [https://learn.microsoft.com/en-us/fabric/data/connectors-overview](https://learn.microsoft.com/en-us/fabric/data/connectors-overview)
- [https://www.collibra.com/us/en/platform/data-sources](https://www.collibra.com/us/en/platform/data-sources)

# 👽 Brudnopis

- „Source” to logiczny kontener dla jednego lub wielu połączeń do danego systemu.
- Kluczowy obiekt startowy pod wszystkie procesy: [[profiling]], DQ, observability, lineage.
- Możliwość osobnych creds per env → jedna definicja używana w wielu flow.
- Warto przypisywać źródło do domeny danych lub grup ownershipowych.
- Best practice: wersjonować zmiany i dbać o naming conventions (np. `ENV_SYSTEM_TYP`).