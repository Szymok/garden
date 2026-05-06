---

title: Katalog Danych (Data Catalog) w Ataccama  
created: 2025-07-16  
status: 🌱 draft
category: ataccama  
difficulty: Å›redni  
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

---

# ðŸŽ¯ Definicja

**Katalog Danych (Data Catalog)** w Ataccama to centralne, przeszukiwalne repozytorium metadanych â€“ swoista â€œWyszukiwarka Googleâ€ dla wszystkich danych firmowych. Pozwala uÅ¼ytkownikom biznesowym i technicznym na Å‚atwe odnalezienie, zrozumienie i wykorzystanie zasobÃ³w danych dostÄ™pnych w organizacji, niezaleÅ¼nie od ich lokalizacji (Data Lake, magazyn danych, repozytoria rozproszone).

# ðŸ”‘ Kluczowe punkty

- ðŸ—‚ï¸â€¯Scentralizowane repozytorium: gromadzi metadane o tabelach, plikach, zbiorach danych, pipelineâ€™ach, raportach, modelach ML i sÅ‚ownikach biznesowych.
- ðŸ” MoÅ¼liwoÅ›Ä‡ szybkiego wyszukiwania i filtrowania po nazwie, opisie, tagach, wÅ‚aÅ›cicielach, statusie jakoÅ›ci.
- ðŸ” Integracja automatyczna (np. przez integratory, crawlery) z rÃ³Å¼nymi ÅºrÃ³dÅ‚ami danych oraz wsparcie dla synchronizacji metadanych.
- ðŸ‘¥â€¯Precyzyjna kontrola dostÄ™pu (rola, grupa, polityka stewardship) do katalogowanych zasobÃ³w â€“ governance i audyt.
- ðŸ“ˆâ€¯Wizualizacja lineage â€“ graficzny przeglÄ…d przepÅ‚ywu i transformacji danych (kto, gdzie, jak uÅ¼ywa dane).

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Funkcje Katalogu Danych w Ataccama

### 1. Przeszukiwanie i odkrywanie danych

- Szybko odnajdujesz konkretne zasoby m.in. po nazwie, wÅ‚aÅ›cicielu domeny, systemie ÅºrÃ³dÅ‚owym, priorytecie biznesowym.
- Zaawansowane filtry: wg klasyfikacji (np. dane wraÅ¼liwe, GDPR), zgodnoÅ›ci, statusu certyfikacji.

### 2. Mapowanie i zarzÄ…dzanie metadanymi

- KaÅ¼dy zbiÃ³r danych, element biznesowy i system techniczny opatrzony jest kontekstem: definicjÄ…, atrybutami, linkami do dokumentacji.
- Metadane mogÄ… byÄ‡ importowane automatycznie (np. z baz danych, hurtowni, narzÄ™dzi ETL, chmury) lub zarzÄ…dzane manualnie.

### 3. Data Lineage i audyt

- Katalog pozwala Å›ledziÄ‡ przepÅ‚yw danych pomiÄ™dzy systemami, transformacje w procesach ETL/ELT i zaleÅ¼noÅ›ci wyjÅ›Ä‡ (np. od raportÃ³w, dashboardÃ³w, modeli ML).
- Audyt zmian i przeglÄ…d historii dziaÅ‚ania na poziomie obiektÃ³w i metadanych.

### 4. ZarzÄ…dzanie jakoÅ›ciÄ… i zgodnoÅ›ciÄ…

- Wbudowany panel Data Quality â€“ status kompletnoÅ›ci, zgodnoÅ›ci, wskaÅºniki jakoÅ›ci dla danych skatalogowanych.
- MoÅ¼liwoÅ›Ä‡ uruchamiania automatycznych testÃ³w i walidacji.

### 5. WspÃ³Å‚praca, stewardship, workflow

- Przypisanie wÅ‚aÅ›cicieli biznesowych i technicznych do danych (Data Owner, Steward).
- Workflow akceptacji, aktualizacji, recenzji oraz komentowania i wersjonowania metadanych.

### 6. Integracja z Data Lake, Data Warehouse i BI

- ObsÅ‚uguje referencje do danych przechowywanych w S3, ADLS, GCP, Snowflake, BigQuery, lokalnych magazynach itd.
- Katalog jako centralny punkt odkrywania, niezaleÅ¼nie od miejsca przechowywania lub przetwarzania plikÃ³w.

# ðŸ’¡ PrzykÅ‚ad zastosowania

**Case: Odkrywanie i kontrola jakoÅ›ci danych sprzedaÅ¼owych**  
Analityk w firmie e-commerce korzysta z Katalogu Ataccama, aby:

1. ZnaleÅºÄ‡ najnowsze ÅºrÃ³dÅ‚o danych o zamÃ³wieniach z Data Lake.
2. SprawdziÄ‡, kto jest wÅ‚aÅ›cicielem danych oraz jak dane podlegaÅ‚y transformacjom (lineage).
3. ZweryfikowaÄ‡ wskaÅºniki jakoÅ›ci â€“ jakie sÄ… najczÄ™stsze bÅ‚Ä™dy, u kogo zgÅ‚osiÄ‡ niezgodnoÅ›ci.
4. BÅ‚yskawicznie przesÅ‚aÄ‡ zgÅ‚oszenie do Data Stewarda o potrzebie poprawy dokumentacji lub wykonania walidacji.

# ðŸ“Š PrzykÅ‚ad integracji z platformÄ… Ataccama

- Automatyczna synchronizacja metadanych z hurtowniÄ… danych przez integrator.
- Harmonogramy aktualizacji â€“ katalog systematycznie odÅ›wieÅ¼a relacje, lineage, klasyfikacje ochrony danych.
- Platforma pozwala na eksport wybranych zasobÃ³w, nadanie klasyfikacji, udostÄ™pnienie tylko dla uprawnionych osÃ³b.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application](https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application)
- [https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model](https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model)
- [https://ataccama.com/solutions/data-catalog](https://ataccama.com/solutions/data-catalog)
- [https://github.com/opendatadiscovery/awesome-data-catalogs](https://github.com/opendatadiscovery/awesome-data-catalogs)
- Sarah Krasnik, "Choosing a Data Catalog" â€“ Sarahâ€™s Newsletter Substack
- CIDR 2017, "Data Context Service" (p111-hellerstein-cidr17.pdf)

# ðŸ‘½ Brudnopis

- Ataccama ONE = rozbudowany katalog danych + Data Discovery + Quality + stewardship, governance, lineage
- Integracja z rozproszonym Å›rodowiskiem (lake, DWH, BI, pipeline, chmura)
- MoÅ¼liwa synchronizacja z Collibra, Snowflake, ADLS, BigQuery
- Workflow stewardship + workflow zgÅ‚oszeÅ„ danych
- Automatyczny crawling, przeszukiwanie i wersjonowanie metadanych
- Katalog = centrum wiedzy o danych, demokracja danych, core dla DataOps/AI/BI