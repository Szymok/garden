---

title: Sources Ataccama  
created: 2025-04-03  
status: 🌱 draft
category: data catalog / zarzÄ…dzanie poÅ‚Ä…czeniami  
difficulty: podstawowy  
language: pl  
tags:

- ÅºrÃ³dÅ‚a danych
- Ataccama ONE
- data catalog
- data discovery
- profiling  
aliases:
- ÅºrÃ³dÅ‚a Ataccama
- Ataccama data sources
- katalog ÅºrÃ³deÅ‚ danych

---

# ðŸŽ¯ Definicja

**Sources** w kontekÅ›cie platformy Ataccama ONE to zarejestrowane ÅºrÃ³dÅ‚a danych, ktÃ³re stanowiÄ… podstawÄ™ do dalszych operacji zarzÄ…dzania danymi â€” takich jak profilowanie, data discovery, katalogowanie, klasyfikacja, ocena jakoÅ›ci oraz dokumentacja techniczna i biznesowa. Å¹rÃ³dÅ‚a moÅ¼na tworzyÄ‡ i konfigurowaÄ‡ manualnie w sekcji **[[Data Catalog]] â†’ Sources**.

# ðŸ”‘ Kluczowe punkty

- ðŸ”Œ [[Data Source|Å¹rÃ³dÅ‚o danych]] definiuje punkt wejÅ›cia do danych â€“ np. baza danych, Data Lake, S3 bucket, JDBC, REST API.
- ðŸ› ï¸ Do jednego ÅºrÃ³dÅ‚a moÅ¼na przypisaÄ‡ wiele poÅ‚Ä…czeÅ„ (connections), nawet rÃ³Å¼nego typu.
- ðŸ‘¥ W ramach ÅºrÃ³dÅ‚a moÅ¼na zarzÄ…dzaÄ‡ poÅ›wiadczeniami i dostÄ™pami dla rÃ³Å¼nych uÅ¼ytkownikÃ³w.
- âš™ï¸ ObsÅ‚ugiwane dziaÅ‚ania to: testowanie poÅ‚Ä…czenia, discovery danych, peÅ‚ne profilowanie, uruchomienie pipelineâ€™u dokumentujÄ…cego.
- ðŸ§¹ MoÅ¼na natychmiastowo usunÄ…Ä‡ ÅºrÃ³dÅ‚o jednym klikniÄ™ciem (â€žInstant deleteâ€).

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Jak dziaÅ‚a sekcja Sources?

Sekcja **Sources** w Ataccama ONE umoÅ¼liwia:

- Dodawanie i konfiguracjÄ™ ÅºrÃ³deÅ‚ danych.
- ZarzÄ…dzanie kilkoma poÅ‚Ä…czeniami pod jedno ÅºrÃ³dÅ‚o (np. rÃ³Å¼ne Å›rodowiska: DEV, PROD).
- PrzeglÄ…d wczeÅ›niej zarejestrowanych ÅºrÃ³deÅ‚, statusÃ³w testu poÅ‚Ä…czeÅ„, historii operacji.
- Uruchamianie Data Discovery i Profilowania w obrÄ™bie wybranego ÅºrÃ³dÅ‚a.
- Inicjowanie flows: dokumentacja, klasyfikacja, lineage.

## ObsÅ‚ugiwane ÅºrÃ³dÅ‚a danych (przykÅ‚adowe)

|Typ ÅºrÃ³dÅ‚a|PrzykÅ‚ad zastosowania|
|---|---|
|Amazon S3|Pliki JSON, Parquet, CSV w chmurze|
|Snowflake|Hurtownia danych analitycznych|
|PostgreSQL / Oracle|Bazy danych transakcyjne|
|Google BigQuery|Analityka danych z Google Cloud|
|Azure Blob Storage|Pliki stagingowe lub pÃ³Å‚strukturalne dane|
|Generic JDBC|Uniwersalne ÅºrÃ³dÅ‚o z danym sterownikiem|
|REST API|Dane SaaS, CRM, systemÃ³w zewnÄ™trznych|

## Elementy zarzÄ…dzania ÅºrÃ³dÅ‚em

- Nazwa ÅºrÃ³dÅ‚a i typ (np. â€žCRM_PROD â€“ PostgreSQL DBâ€).
- Lista poÅ‚Ä…czeÅ„ (Connection Name, URL, status).
- Przypisane poÅ›wiadczenia â€“ do kaÅ¼dego poÅ‚Ä…czenia moÅ¼e byÄ‡ przypisanych wiele credential profiles.
- Aktywne procesy Discover / [[Profiling]] / Documentation History.
- Uprawnienia: kto moÅ¼e uÅ¼yÄ‡ ÅºrÃ³dÅ‚a i w jakim zakresie.
- Monitorowanie: ostatnie dziaÅ‚ania, bÅ‚Ä™dy, harmonogramy.

## PrzykÅ‚ad cyklu Å¼ycia ÅºrÃ³dÅ‚a

1. ðŸ› ï¸ Administrator dodaje ÅºrÃ³dÅ‚o â€žSalesforce_Prod_APIâ€ z poÅ›wiadczeniem OAuth2.
2. ðŸ”Ž UÅ¼ytkownik uruchamia Discovery, by zidentyfikowaÄ‡ strukturÄ™ danych i dodaÄ‡ jÄ… do Katalogu.
3. ðŸ§ª Kolejny uÅ¼ytkownik wÅ‚Ä…cza opcjÄ™ [[Manual Profiling]] na obiektach typu â€žCustomer Recordâ€.
4. ðŸ“Š Analizy DQ oraz przypisanie terminÃ³w sÅ‚ownikowych nastÄ™puje automatycznie.
5. ðŸ§¹ Nieaktualne lub zduplikowane ÅºrÃ³dÅ‚a sÄ… usuwane przy uÅ¼yciu â€žInstant deleteâ€.

# ðŸ’¡ PrzykÅ‚ad zastosowania

```python
# Pseudokod opisujÄ…cy konfiguracjÄ™ ÅºrÃ³dÅ‚a danych w systemie katalogowym
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

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.ataccama.com/platform/data-catalog](https://www.ataccama.com/platform/data-catalog)
- [https://learn.microsoft.com/en-us/fabric/data/connectors-overview](https://learn.microsoft.com/en-us/fabric/data/connectors-overview)
- [https://www.collibra.com/us/en/platform/data-sources](https://www.collibra.com/us/en/platform/data-sources)

# ðŸ‘½ Brudnopis

- â€žSourceâ€ to logiczny kontener dla jednego lub wielu poÅ‚Ä…czeÅ„ do danego systemu.
- Kluczowy obiekt startowy pod wszystkie procesy: [[Profiling]], DQ, observability, lineage.
- MoÅ¼liwoÅ›Ä‡ osobnych creds per env â†’ jedna definicja uÅ¼ywana w wielu flow.
- Warto przypisywaÄ‡ ÅºrÃ³dÅ‚o do domeny danych lub grup ownershipowych.
- Best practice: wersjonowaÄ‡ zmiany i dbaÄ‡ o naming conventions (np. `ENV_SYSTEM_TYP`).