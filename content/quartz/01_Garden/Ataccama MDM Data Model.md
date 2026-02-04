---
title: Model Danych MDM
created: 2026-02-04
status: sapling
category: Data Governance
difficulty: advanced
language: pl
tags:
  - ataccama
  - mdm
  - data-modeling
  - architecture
aliases:
  - MDM Data Modeling
  - Model fizyczny vs logiczny MDM
---
# 🎯 Definicja
Struktura danych leżąca u podstaw systemu MDM, definiująca sposób przechowywania rekordów źródłowych (Instance Data), rekordów złotych (Master Data) oraz ich powiązań i historii.

# 🔑 Kluczowe punkty
- **Podejścia do modelowania:** Bottom-Up (od systemów źródłowych) vs Top-Down (od wymagań biznesowych).
- **Warstwy przechowywania:** Instance Layer (dane źródłowe) i Master Layer (złote rekordy) są fizycznie przechowywane w Master Data Hub (zazwyczaj relacyjna baza danych).
- **Normalizacja:** Zalecany balans między pełną normalizacją (wydajność zapisu, złożoność) a denormalizacją (szybkość odczytu, redundancja). Model gwiazdy (Star schema) jest często preferowany.

# 📚 Szczegółowe wyjaśnienie
Model danych MDM w Ataccama jest generowany automatycznie przy starcie serwera na podstawie definicji logicznej. Użytkownik nie musi ręcznie tworzyć tabel `DDL`.
- **Instance Data:** Przechowuje historię i aktualny stan rekordów z systemów źródłowych.
- **Master Data:** Przechowuje "Złoty Rekord" (Golden Record) - wynik deduplikacji i konsolidacji.

**Dylemat Normalizacji:**
- Zbyt znormalizowany model: Trudny w utrzymaniu, wolne zapytania (dużo JOINów).
- Zbyt zdenormalizowany model (Flat table): Problemy z reprezentacją relacji 1:N (np. klient ma wiele adresów), duplikacja danych.
Złoty środek: Grupowanie logiczne (Party, Address, Contact) z zachowaniem relacji, ale bez atomizacji każdego atrybutu.

# 💡 Przykład zastosowania
Projektowanie modelu dla danych klienta:
Zamiast jednej wielkiej tabeli `Klient` z polami `Adres1_Ulica`, `Adres2_Ulica`, stwórz encję `Party` i powiązaną encję `Address`. Dzięki temu jeden klient może mieć N adresów bez zmiany struktury bazy.

## 📌 Źródła


## 👽 Brudnopis
Logical model is sufficient: • Physical model may be used as well, but only a part of the information is actually utilized Star model is easier to implement and provides better performance of the solution: • Should fit most model requirements • The top-level entity has a I'.N relationship with satellite entities
General rule:
• Core information identifying master data only, not all available data
Related data or data which needs to be interconnected in each query
Example for MDM (Customer Data Information) implementation:
• Data identifying a customer
• Customer data which needs to be mastered/de-duplicated
Addresses, contacts, IDs, classifications etc
Created automatically when the server starts for the first time. • The generation of the structures for the storage is based on the model defined • Includes a repository Of cleansed, matched and mastered data • The MDM storage structure is transparent to users Implementation details of this structure are completely hidden from the users of the MDM hub Logical transaction is one of the reasons, but not the most important one Currently an open relational structure Both Instance and Master data are stored in the Master Data Hub
Historical data • Repository stores previous versions of both instance and master data Contains data in a defined scope current data • Repository stores the instance records, or source records, from various source systems All records from the source systems are stored in their cleansed form The Matching Key tables for all matched entities Other technical tables
Bottom-Up Approach for Defining MDM Hub Canonical Model The Bottom-Up Approach aligns the MDM Hub canonical model With the entities and attributes Of connected systems. This simplifies data mapping between systems and the Hub but may complicate mapping from the Instance Layer to the Master Data Layer, 1. 2. 3. 4. 5. Understand Connected Systems: Review models and output interfaces of all connected systems. Define the Instance Layer Model: Create a model that encompasses the models Of all connected systems, Develop the Master Data Layer Model: Define this model based on the Instance Layer Model. Validate Output Interfaces: Ensure the Master Data Layer's output interfaces work With consuming systems and applications. Adjust as Needed: Make changes based on the requirements Of consuming systems
Top-Down Approach for Creating a Logical Model The Top-Down Approach offers a design from an MDM perspective. It starts With the Master Data Layer (or Golden Record) and focuses on deriving the model based on user requirements. Steps: Z 3. 4. 5. Identify Users: List all users Of the MDM solution, including systems, applications, business users, and departments. Understand user Needs; Gather and analyze the needs and goals Of these users, Define the Master Data Layer Model: Create a model that addresses user needs and goals. Develop the Instance Layer Model: Based on the Master Data Layer model and the output interfaces Of connected systems, define this model Adjust as Needed; Be prepared to make changes if some user needs cannot be met due to constraints in the output interfaces of connected systems.
Normalized vs. Denormalized Model Extreme examples: Fully Denormalized One table containing all attributes from party, address, contact etc. Fully Normalized • Multiple tables interconnected via relationships

Normalized vs. Denormalized Model Should Sit somewhere between the two extremes • Should be divided based on attribute usage and logical entity information (address, contact, • Too many normalized structures can affect performance because many copy columns are required (it is necessary to take the matching step into account) • TOO many denormalized structures can make it hard or impossible to accurately reflect reality (eg, a party usually has multiple addresses/contacts) Shouldn't be closely related to a source/target system model