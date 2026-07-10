---

title: Siatka danych  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- architektura danych
- data mesh
- federacja danych
- zarządzanie danymi  
aliases:
- data mesh
- architektura siatki danych
- siatka danych w organizacji

---

# 🎯 Definicja

**[[Data Mesh|Siatka danych]]** (ang. _[[Data Mesh]]_) to zdecentralizowane podejście do architektury danych, w którym odpowiedzialność za dane jest rozproszona między zespoły domenowe. Zamiast centralnego zespołu zarządzającego całym pipeline’m danych, każda jednostka organizacyjna staje się właścicielem swoich danych jako produktu — odpowiedzialna za ich jakość, dostępność i udostępnianie w organizacji.

# 🔑 Kluczowe punkty

- [[Data Mesh|Siatka danych]] zmienia paradygmat: od **centralizacji danych ([[Data Lake|Data Lake]] / DWH)** do **federacji domen danych (Data as a Product)**.
- Bazuje na czterech filarach:
    1. **Domenowość (domain ownership)**
    2. **Dane jako produkt (data as a product)**
    3. **Platforma danych jako samoobsługa (self-serve platform)**
    4. **Zarządzanie międzydomenowe (federated governance)**
- Promuje większą skalowalność i elastyczność — dane są tworzone i zarządzane **blisko źródła biznesowego**.
- Kluczowa rola data product ownerów, interfejsów kontraktowych i katalogów danych.
- Popularna w organizacjach o strukturze wielodomenowej – np. e-commerce, enterprise, fintech.

# 📚 Szczegółowe wyjaśnienie

## Centralizacja vs [[Data Mesh]]

|Cecha|[[Data Lake|Data Lake]] / DWH|[[Siatka danych]] ([[Data Mesh]])|
|---|---|---|
|Odpowiedzialność|Centralny zespół danych|Zespoły domenowe|
|Architektura|Scentralizowana|Rozproszona|
|Skalowalność|Ograniczona przez zespół centralny|Naturalnie rośnie z organizacją|
|Nowe domeny/wdrożenia|Wymagają pracy zespołu centralnego|Zespoły dodają własne produkty danych samodzielnie|
|Cykle czasu dostarczania|Długi, zależne od priorytetów DWH|Krótkie, zależne od zespołu domenowego|

## Przykład domen i produktów danych (organization-centric)

|Domena|[[Produkt Danych|Produkt danych]]|
|---|---|
|Marketing|Kampanie, leady, segmentacja|
|Sprzedaż|Zamówienia, [[KPI]] sprzedażowe|
|Finanse|Analizy kosztów, przychody, faktury|
|Obsługa klienta|Tickety, historie kontaktu|
|Aplikacja mobilna|Aktywność użytkownika, logi wydarzeń|

## Komponenty siatki danych

- **Data Products**: publikowane przez zespoły, z określonym kontraktem (schemat, SLA, testy).
- **Data Platform (self-serve)**: narzędzia udostępniające CI/CD, orkiestrację, katalogi, monitorowanie jakości (np. [[dbt]], [[Airbyte|Airbyte]], [[Dagster]], Great Expectations, DataHub).
- **Federated Governance**: definiuje wspólne minimum: nazewnictwo, polityki dostępu, bezpieczeństwo, lineage.

# 💡 Przykład zastosowania

Międzynarodowa firma kurierska wdrożyła architekturę [[Data Mesh]], przypisując odpowiedzialność za dane do zespołów domenowych: logistyka, terminale, finanse. Zamiast wysyłać surowe dane do centralnego DWH, każda domena publikuje gotowy [[Produkt Danych|produkt danych]] w formacie [[Apache Iceberg|Iceberg]] na S3, który następnie jest rejestrowany w katalogu danych i wykorzystywany przez zespoły [[Business Intelligence|BI]] oraz [[Uczenie Maszynowe|ML]] do dalszych analiz.

# 📌 Źródła

- [https://martinfowler.com/articles/data-monolith-to-mesh.html](https://martinfowler.com/articles/data-monolith-to-mesh.html)
- Thoughtworks: [https://www.thoughtworks.com/en-pl/radar/techniques/data-mesh](https://www.thoughtworks.com/en-pl/radar/techniques/data-mesh)
- Zhamak Dehghani – twórczyni pojęcia "[[Data Mesh]]"
- [https://datameshlearning.substack.com/](https://datameshlearning.substack.com/)

## 👽 Brudnopis

- [[Data Mesh]] = dane jako API, produkt, ownership
- Działa w dużych, złożonych firmach – mikroserwisy dla danych
- Platforma: [[Apache Airflow|Airflow]], [[dbt]], DataHub = mesh-ready stack
- Wyzwania: standaryzacja, katalogi, [[Kontrakty Danych]]
- IDEAL: [[dbt]] + [[Apache Iceberg|Iceberg]] + Kafka + DataHub + access layer
- CI/CD dla produktów danych = testy + deployment + Wersje

---