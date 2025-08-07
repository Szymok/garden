---

title: Modelowanie Wymiarowe  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- modelowanie wymiarowe
- data warehouse
- Kimball
- star schema
- snowflake schema  
aliases:
- Dimensional Modeling

---

# 🎯 Definicja

**Modelowanie wymiarowe (Dimensional Modeling, DM)** to technika projektowania hurtowni danych skoncentrowana na ułatwieniu raportowania i analiz biznesowych. Bazuje na identyfikacji oraz modelowaniu kluczowych procesów biznesowych i reprezentuje dane w postaci **faktów** i **wymiarów**. Metodę tę spopularyzował Ralph Kimball jako podejście od dołu (“bottom-up”).

# 🔑 Kluczowe punkty

- **Struktura prostych modeli:** Zastosowanie tabel faktów oraz wymiarów upraszcza eksplorację danych.
- **Optymalizacja pod analizy [[Business Intelligence|BI]]:** Ułatwia szybkie i intuicyjne raportowanie.
- **Podejście bottom-up:** Najpierw modeluje się pojedyncze obszary/procesy biznesowe, potem je integruje.
- **Typowe układy:** Schemat gwiazdy (_star schema_) oraz płatka śniegu (_snowflake schema_).
- **Przyjazność dla użytkowników biznesowych:** Łatwość interpretacji struktury danych w raportach.

# 📚 Szczegółowe wyjaśnienie

## Założenia modelowania wymiarowego

Model wymiarowy powstaje poprzez:

- Zdefiniowanie kluczowego procesu biznesowego (np. sprzedaż)
- Określenie miar ilościowych ([[fakty]] — liczby, wartości, kwoty)
- Identyfikację perspektyw analizy ([[wymiary]] — czas, produkt, region)
- Budowę relacji klucz obcy–klucz główny do powiązania faktów z wymiarami

### Tabele faktów i [[wymiary]]

|Typ tabeli|Opis|
|---|---|
|**[[Fakty]]**|Zawierają [[Fakty\|dane ilościowe]]; rejestrują zdarzenia (np. sprzedaż, logi)|
|**[[Wymiary]]**|Opisują szczegóły związane z faktami (np. produkt, klient, czas)|

### Schemat gwiazdy i płatka śniegu

- **Star Schema**: [[Fakty|tabela faktów]] otoczona bezpośrednio przez [[wymiary]]
- **Snowflake Schema**: [[wymiary]] dodatkowo znormalizowane do podwymiarów

## Podejście bottom-up (Kimball) vs. top-down (Inmon)

- **Kimball**: Szybka wartość biznesowa — każde wdrożenie dotyczy 1 procesu, potem integracja poszczególnych obszarów w Data Warehouse.
- **Inmon**: Najpierw modeluje się całość danych przedsiębiorstwa (ER), potem buduje Data Marty.

## Zalety modelowania wymiarowego

- Intuicyjne i czytelne modele dla analityków i użytkowników biznesowych
- Usprawnienie agregacji, raportowania, analizy trendów i porównań okresowych
- Wydajność dzięki prostym relacjom i płaskim tabelom
- Możliwość łatwej rozbudowy i skalowania

# 💡 Przykład zastosowania

Sieć sklepów detalicznych wdraża modelowanie wymiarowe w swojej hurtowni danych. W modelu sprzedażowym [[Fakty|tabela faktów]] rejestruje każdą transakcję, a powiązane tabele wymiarów opisują: klienta, produkt, sklep, datę, pracownika. Dzięki temu menedżer może szybko analizować sprzedaż tygodniową wg miasta, kategorii produktu czy kanału sprzedaży. Każdy raport [[Business Intelligence|BI]] budowany jest na prostych, czytelnych powiązaniach — bez konieczności znajomości złożonego modelu transakcyjnego.

## 📌 Źródła

- [Kimball Group – Fundamentals of Dimensional Modeling](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/dimensional-modeling-techniques/)
- [Microsoft Learn – About dimensional modeling](https://learn.microsoft.com/en-us/azure/architecture/data-guide/relational/data-warehousing#dimensional-modeling)
- [Vertabelo: Wprowadzenie do modelowania wymiarowego](https://vertabelo.com/pl/blog/wprowadzenie-do-modelowania-wymiarowego/)

# 👽 Brudnopis

- DM = prostota dla [[Business Intelligence|BI]], tabele faktów i tabel wymiarów, szybkie raporty, Kimball
- Star schema – [[fakty]] centralnie, [[wymiary]] naokoło; snowflake – [[wymiary]] znormalizowane
- Kimball = bottom-up, szybkie wdrożenia biznesowe, potem integracja (Data Warehouse Bus)
- Inmon = top-down, całościowy ERD, potem data marts
- Przykład: retail – raport sprzedaży tygodniowej wg sklepu, produktu, klienta, kanału
- [[Business Intelligence|BI]] lean-friendly, łatwy rozwój, szybka wartość dla biznesu