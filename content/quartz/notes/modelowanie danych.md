---
title: Modelowanie Danych
created: 2025-07-16
status:
  - Final
category: Inżynieria danych
difficulty: średniozaawansowany
language: pl
tags:
  - modelowanie
  - danych
  - inżynieria
  - danych
  - data
  - modeling
  - hurtownia
  - danych
aliases:
  - data modeling
  - projektowanie danych
---

# 🎯 Definicja

**Modelowanie danych** to proces strukturyzowania i organizowania danych w sposób umożliwiający ich efektywne przechowywanie, analizowanie i wykorzystanie. Polega na definiowaniu tabel, relacji, typów danych oraz zasad integralności, które odpowiadają potrzebom biznesowym i technicznym. Stanowi kluczowy etap budowy systemów informatycznych, hurtowni danych oraz platform analitycznych.

# 🔑 Kluczowe punkty

- Modelowanie danych to „język” między działem biznesu a technologią – tłumaczy potrzeby na struktury danych.
- Obejmuje różne poziomy abstrakcji: koncepcyjny, logiczny i fizyczny.
- Jest podstawą do budowy hurtowni danych, pipelines ETL/ELT, analityki i aplikacji.
- Pozwala na zarządzanie złożonością danych i wspiera ich jakość, spójność, zrozumiałość.
- Metody modelowania różnią się w zależności od typu systemu: OLTP, OLAP, NoSQL, raportowanie, data lake.

# 📚 Szczegółowe wyjaśnienie

## Poziomy modelowania danych

1. **Model koncepcyjny (conceptual):**
    
    - Abstrakcyjna reprezentacja danych (np. diagram ER, encje i relacje)
    - Zrozumiały dla użytkowników biznesowych
    - Przykład: „Użytkownik posiada zamówienia”
2. **Model logiczny (logical):**
    
    - Szczegółowy opis tabel, kluczy, atrybutów, typów danych
    - Niezależny od konkretnego DBMS
    - Mapa przyszłej struktury danych w hurtowni lub systemie aplikacyjnym
3. **Model fizyczny (physical):**
    
    - Implementacja w konkretnym systemie bazodanowym
    - Uwzględnia optymalizacje: partycje, indeksy, klucze obce, typy danych specyficzne dla silnika
    - Przykład: `INT NOT NULL`, `INDEX`, `PARTITION BY`

## Techniki modelowania

|Technika|Zastosowanie|
|---|---|
|**Model gwiazdy (star)**|Systemy analityczne, hurtownie danych – szybkie agregacje, miary i wymiary|
|**Model płatka śniegu**|Normalizacja wymiarów w DW, większa złożoność zapytań|
|**3NF (3. postać normalna)**|Systemy OLTP (np. CRM, e-commerce) – minimalizacja redundancji|
|**Vault Data Modeling**|Architektury typu raw layer + historization – dane historyczne i zmiany w czasie|
|**NoSQL / dokumentowe**|Aplikacje mobilne/webowe – elastyczność schematu, denormalizacja struktury|

## Rola modelowania w inżynierii danych

- **Projektowanie hurtowni danych** (np. Snowflake, Redshift, BigQuery)
- **Segmentacja klientów, analiza sprzedaży, raportowanie KPI**
- **Źródło prawdy (single source of truth)** w organizacji
- **Współpraca z analitykami i product managerami** – mapowanie potrzeb na encje

# 💡 Przykład zastosowania

Dział marketingu potrzebuje śledzić skuteczność kampanii reklamowych. Inżynier danych tworzy model gwiazdy z:

- tabelą faktów kampanii (`campaign_stats` – kliki, wyświetlenia, konwersje),
- tabelami wymiarów: `dim_date`, `dim_campaign`, `dim_channel`.  
    Dzięki temu możliwe jest szybkie raportowanie skuteczności według czasu, kanału, regionu, itd.

## 📌 Źródła

- Ralph Kimball – The Data Warehouse Toolkit
- dbt Docs – Analytics Engineering Best Practices [https://docs.getdbt.com/](https://docs.getdbt.com/)
- Snowflake – Data Modeling Guide: [https://docs.snowflake.com/en/user-guide/data-modeling](https://docs.snowflake.com/en/user-guide/data-modeling)

## 👽 Brudnopis

- Model danych = struktura, która odzwierciedla rzeczywistość biznesową
- Kimball vs Inmon: bottom-up vs top-down
- 3NF → normalizacja, OLTP
- Star Schema, Snowflake → OLAP
- Dobrze zamodelowane dane = łatwe raportowanie i brak redundancji
- Narzędzia: dbt, ERDPlus, dbdiagram.io, Lucidchart, SQLModel
- Modele muszą być ewolucyjne – wspierają zmiany w schematach
- Schemat = mapa danych, zgodność + interpretowalność + efektywność

---