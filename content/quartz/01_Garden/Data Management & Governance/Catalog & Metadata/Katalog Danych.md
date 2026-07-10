---

title: Katalog Danych (Data Catalog) w Ataccama  
created: 2025-07-16  
status: 🌱 draft
category: ataccama  
difficulty: średni  
language: pl  
tags:

- ataccama
- data catalog
- metadata
- data governance
- data discovery  
aliases:
- katalog danych
- data catalog Ataccama
- Data Catalog

---

# 🎯 Definicja

**Katalog Danych ([[Data Catalog|Data Catalog]])** w [[Ataccama|Ataccama]] to centralne, przeszukiwalne repozytorium metadanych – swoista “Wyszukiwarka Google” dla wszystkich danych firmowych. Pozwala użytkownikom biznesowym i technicznym na łatwe odnalezienie, zrozumienie i wykorzystanie zasobów danych dostępnych w organizacji, niezależnie od ich lokalizacji ([[Data Lake|Data Lake]], magazyn danych, repozytoria rozproszone).

# 🔑 Kluczowe punkty

- 🗂️ Scentralizowane repozytorium: gromadzi metadane o tabelach, plikach, zbiorach danych, pipeline’ach, raportach, modelach ML i słownikach biznesowych.
- 🔍 Możliwość szybkiego wyszukiwania i filtrowania po nazwie, opisie, tagach, właścicielach, statusie jakości.
- 🔁 Integracja automatyczna (np. przez integratory, crawlery) z różnymi źródłami danych oraz wsparcie dla synchronizacji metadanych.
- 👥 Precyzyjna kontrola dostępu (rola, grupa, polityka [[Stewardship|stewardship]]) do katalogowanych zasobów – governance i audyt.
- 📈 [[Wizualizacja|Wizualizacja]] lineage – graficzny przegląd przepływu i transformacji danych (kto, gdzie, jak używa dane).

# 📚 Szczegółowe wyjaśnienie

## Funkcje Katalogu Danych w [[Ataccama|Ataccama]]

### 1. Przeszukiwanie i odkrywanie danych

- Szybko odnajdujesz konkretne zasoby m.in. po nazwie, właścicielu domeny, systemie źródłowym, priorytecie biznesowym.
- Zaawansowane filtry: wg klasyfikacji (np. dane wrażliwe, GDPR), zgodności, statusu certyfikacji.

### 2. Mapowanie i zarządzanie metadanymi

- Każdy zbiór danych, element biznesowy i system techniczny opatrzony jest kontekstem: definicją, atrybutami, linkami do dokumentacji.
- Metadane mogą być importowane automatycznie (np. z baz danych, hurtowni, narzędzi ETL, chmury) lub zarządzane manualnie.

### 3. [[Data Lineage|Data Lineage]] i audyt

- Katalog pozwala śledzić przepływ danych pomiędzy systemami, transformacje w procesach ETL/ELT i zależności wyjść (np. od raportów, dashboardów, modeli ML).
- Audyt zmian i przegląd historii działania na poziomie obiektów i metadanych.

### 4. Zarządzanie jakością i zgodnością

- Wbudowany panel [[Data Quality|Data Quality]] – status kompletności, zgodności, wskaźniki jakości dla danych skatalogowanych.
- Możliwość uruchamiania automatycznych testów i walidacji.

### 5. Współpraca, [[Stewardship|stewardship]], workflow

- Przypisanie właścicieli biznesowych i technicznych do danych (Data Owner, Steward).
- Workflow akceptacji, aktualizacji, recenzji oraz komentowania i wersjonowania metadanych.

### 6. Integracja z [[Data Lake|Data Lake]], [[Data Warehouse|Data Warehouse]] i BI

- Obsługuje referencje do danych przechowywanych w S3, ADLS, GCP, [[Snowflake|Snowflake]], BigQuery, lokalnych magazynach itd.
- Katalog jako centralny punkt odkrywania, niezależnie od miejsca przechowywania lub przetwarzania plików.

# 💡 Przykład zastosowania

**Case: Odkrywanie i kontrola jakości danych sprzedażowych**  
Analityk w firmie e-commerce korzysta z Katalogu [[Ataccama|Ataccama]], aby:

1. Znaleźć najnowsze źródło danych o zamówieniach z [[Data Lake|Data Lake]].
2. Sprawdzić, kto jest właścicielem danych oraz jak dane podlegały transformacjom (lineage).
3. Zweryfikować wskaźniki jakości – jakie są najczęstsze błędy, u kogo zgłosić niezgodności.
4. Błyskawicznie przesłać zgłoszenie do Data Stewarda o potrzebie poprawy dokumentacji lub wykonania walidacji.

# 📊 Przykład integracji z platformą [[Ataccama|Ataccama]]

- Automatyczna synchronizacja metadanych z hurtownią danych przez integrator.
- Harmonogramy aktualizacji – katalog systematycznie odświeża relacje, lineage, klasyfikacje ochrony danych.
- Platforma pozwala na eksport wybranych zasobów, nadanie klasyfikacji, udostępnienie tylko dla uprawnionych osób.

# 📌 Źródła

- [https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application](https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application)
- [https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model](https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model)
- [https://ataccama.com/solutions/data-catalog](https://ataccama.com/solutions/data-catalog)
- [https://github.com/opendatadiscovery/awesome-data-catalogs](https://github.com/opendatadiscovery/awesome-data-catalogs)
- Sarah Krasnik, "Choosing a [[Data Catalog|Data Catalog]]" – Sarah’s Newsletter Substack
- CIDR 2017, "Data Context Service" (p111-hellerstein-cidr17.pdf)

# 👽 Brudnopis

- [[Ataccama|Ataccama]] ONE = rozbudowany katalog danych + Data Discovery + Quality + [[Stewardship|stewardship]], governance, lineage
- Integracja z rozproszonym środowiskiem (lake, DWH, BI, pipeline, chmura)
- Możliwa synchronizacja z Collibra, [[Snowflake|Snowflake]], ADLS, BigQuery
- Workflow [[Stewardship|stewardship]] + workflow zgłoszeń danych
- Automatyczny crawling, przeszukiwanie i wersjonowanie metadanych
- Katalog = centrum wiedzy o danych, demokracja danych, core dla [[DataOps|DataOps]]/AI/BI