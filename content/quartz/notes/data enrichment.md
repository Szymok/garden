---

title: Data Enrichment  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- transformacja danych
- enrichment
- data engineering
- analiza danych  
aliases:
- wzbogacanie danych
- data enrichment

---

# 🎯 Definicja

**Wzbogacanie danych (data enrichment)** to proces transformacji, w którym do istniejącego zbioru danych dodaje się dodatkowe informacje pochodzące z innych źródeł. Celem jest umożliwienie nowych rodzajów analiz, zapytań lub poprawa jakości i wydajności operacji analitycznych.

# 🔑 Kluczowe punkty

- Proces polega na rozszerzaniu rekordów o brakujące lub wartościowe atrybuty pochodzące z innych systemów, baz wiedzy, API lub źródeł zewnętrznych.
- Wzbogacone dane są łatwiejsze w analizie, umożliwiają zaawansowane grupowania (np. według kraju, regionu, kategorii) lub precyzyjniejsze rekomendacje.
- Często występuje w pipeline’ach ETL/ELT, integracji danych, projektach big data i machine learningu.

# 📚 Szczegółowe wyjaśnienie

## Przykłady wzbogacania danych

1. **Geolokalizacja IP**
    
    - Zbiór danych zawiera tylko adresy IP. Wzbogacenie polega na dołączeniu informacji o kraju, regionie i mieście pobranych z zewnętrznej bazy IP-to-country (np. MaxMind GeoIP). Umożliwia to raportowanie według regionu oraz precyzyjne targetowanie marketingowe.
2. **Demografia i scoring klientów**
    
    - Lista klientów zawiera tylko identyfikatory. Enrichment polega na pobraniu (np. z DMP/[[Platforma Danych Klienta|CDP]]) wieku, płci, statusu kredytowego lub innej klasyfikacji. Zastosowanie: segmentacja rynku, personalizacja ofert.
3. **Integracja danych produktowych**
    
    - Dane sprzedażowe zawierają tylko kody SKU. Dodanie informacji o nazwie produktu, kategorii, marce z katalogu głównego umożliwia analizy koszykowe lub rekomendacje.

## Typowy workflow wzbogacania (ETL/ELT)

1. **Extract:** Pobranie danych z systemu źródłowego (np. System B).
2. **Lookup/Join:** Dopasowanie i pobranie brakujących informacji z referencyjnego źródła (np. System A, API).
3. **Transform:** Dodanie nowych pól do istniejących rekordów.
4. **Load:** Zapis przetworzonego, wzbogaconego zbioru do hurtowni danych lub systemu docelowego.

**Przykład:**  
Dane wejściowe z Systemu B:

|ip_address|timestamp|
|---|---|
|31.1.43.123|2025-07-15 14:12|

Lookup w Systemie A:

|ip_address|country|
|---|---|
|31.1.43.123|Polska|

Dane wyjściowe po wzbogaceniu:

|ip_address|timestamp|country|
|---|---|---|
|31.1.43.123|2025-07-15 14:12|Polska|

# 💡 Praktyczne zastosowania

- **Analityka w [[Business Intelligence|BI]]**: tworzenie raportów przekrojowych (np. sprzedaż wg kraju).
- **Data Science/Modelowanie [[Uczenie Maszynowe|ML]]**: wzbogacenie danych wejściowych o cechy zewnętrzne zwiększa precyzję modeli predykcyjnych.
- **Personalizacja**: pogłębione profile klientów, lepsze rekomendacje produktów.
- **Compliance i audyt**: hurtownie danych pełne informacji pozwalają lepiej zarządzać uprawnieniami, zgodnością i jakością.

# 📌 Wskazówki

- Wybieraj źródła wzbogacania wysokiej jakości (np. wiarygodne bazy referencyjne, aktualizowane API).
- Automatyzuj enrichment w pipeline’ach ETL/ELT; unikniesz ręcznego łączenia danych i błędów spójności.
- Zwracaj uwagę na wydajność (joiny, batch vs. online lookup) i zgodność typów danych.
- Zawsze dokumentuj reguły wzbogacania – szczególnie przy złożonych pipeline’ach i wielu źródłach.

# 🛠️ Narzędzia popularne w data enrichment

- **[[dbt]]** – transformacje i wzbogacanie danych w SQL w hurtowniach.
- **Apache Spark, [[Pandas]]** – batchowe przetwarzanie i łączenie danych.
- **Airbyte/Fivetran** – automatyzacja pobierania danych z API i enrichment w ruchu.
- **DataHub/Ataccama ONE, Collibra** – zarządzanie metadanymi i lineage wzbogacanych zbiorów.

# 👽 Brudnopis

- Enrichment ≠ imputacja (uzupełnianie braków) – celem jest rozszerzanie rekordów o informacje spoza macierzystego systemu
- Spotykane w scoringu credit, marketingu, retail/lojalnościowym, fraud detection
- Kluczowa jakość lookupu; wydajność w real time lub batch: joiny/optymalizacja
- Zbieżność z pipeline’ami ETL/ELT – enrichment osobnym etapem tuż przed load/em

---