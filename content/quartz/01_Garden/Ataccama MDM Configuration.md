---
title: Konfiguracja Master Data Management (MDM)
created: 2026-02-04
status: sapling
category: Data Governance
difficulty: advanced
language: pl
tags:
  - ataccama
  - mdm
  - configuration
  - instance-layer
  - integration
aliases:
  - MDM Setup
  - Konfiguracja MDM
---
# 🎯 Definicja
Proces definiowania struktury i logiki systemu MDM, obejmujący modelowanie warstwy instancji (dane surowe), mapowanie źródeł, oraz projektowanie przepływów ładowania i transformacji danych.

# 🔑 Kluczowe punkty
- **Instance Layer (Warstwa Instancji):** Kanoniczny interfejs dla wszystkich podłączonych systemów. Przechowuje "surowe" ale ustandaryzowane dane z systemów źródłowych.
- **Podłączanie źródeł:** Definiowanie konektorów, mapowanie encji źródłowych na model MDM oraz tworzenie planów ładowania (Load Plans).
- **Batch & Online:** Obsługa zarówno wsadowego ładowania danych (ETL), jak i interfejsów RW (Read-Write) dla operacji czasu rzeczywistego.

# 📚 Szczegółowe wyjaśnienie
Konfiguracja MDM w Ataccama ONE nie jest prostym "klikaniem". Wymaga przemyślanej architektury:
1. **Analiza źródeł:** Zrozumienie, jakie dane przychodzą (CRM, ERP, Billing).
2. **Projekt Warstwy Instancji:** Stworzenie wspólnego mianownika (modelu) dla tych danych. Np. jeśli CRM ma `Client_Name`, a ERP ma `Cust_Fn`, w warstwie instancji tworzymy `Party_Name`.
3. **Plany Transformacji:** Logika, która fizycznie przenosi i czyści dane z formatu źródłowego do formatu instancji.

# 💡 Przykład zastosowania
Tworzenie encji `Person` w warstwie instancji:
1. Zdefiniuj atrybuty: `firstName`, `lastName`, `birthDate`.
2. Zmapuj źródło SQL `Klienci` (`imie` -> `firstName`).
3. Skonfiguruj Load Plan, który uruchamia się co noc o 2:00.

## 📌 Źródła


## 👽 Brudnopis
Instance Layer Overview The Instance Layer serves as the canonical interface for all connected systems. It handles batch load operations and supports RW (Read-Write) services interfaces derived from this model. • Define and set up the entities that will be included in the Instance Layer. • Establish and configure relationships between these entities,
MDM Configuration: Establish the core elements of Master Data Management. This involves setting up source systems and data models, generating and executing load plans for data import, and implementing necessary data transformations to ensure a cohesive data management framework. Connecting a Source System: Integrate external data sources into the MDM environment. This includes configuring the source systems, mapping data entities from the sources to the MDM model, and defining batch operations and transformations to facilitate smooth data loading and integration.