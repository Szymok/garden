---
title: Definicja Ataccama MDM
created: 2026-02-04
status: sapling
category: Data Governance
difficulty: basic
language: pl
tags:
  - ataccama
  - mdm
  - definition
  - single-source-of-truth
aliases:
  - Co to jest Ataccama MDM
  - Master Data Management definition
---
# 🎯 Definicja
Kompleksowa platforma do zarządzania danymi mistrzowskimi (Master Data Management), integrująca funkcje jakości danych (Data Quality), katalogowania i zarządzania danymi w celu stworzenia "jednego źródła prawdy" (Single Source of Truth) w organizacji.

# 🔑 Kluczowe punkty
- **Jakość Danych (DQ) wewnątrz:** MDM Ataccamy ma wbudowany silnik DQ. Jakość nie jest osobnym procesem, lecz integralną częścią masteringu.
- **Metadata-Driven:** System sterowany metadanymi, konfigurowalny przez narzędzia graficzne (ONE Desktop), a nie tylko przez kodowanie.
- **Wielodomenowość:** Możliwość zarządzania różnymi domenami danych (Klienci, Produkty, Lokalizacje) w jednym narzędziu.

# 📚 Szczegółowe wyjaśnienie
Problem: Organizacje mają dane w silosach. Dane się nie zgadzają.
Rozwiązanie: Ataccama MDM. 
System ten pobiera dane z wielu miejsc, czyści je, łączy (deduplikuje) i udostępnia poprawioną wersję.
Unikalną cechą Ataccamy jest silne powiązanie z Data Quality. Nie możesz mieć dobrego MDM bez dobrego DQ. Platforma pozwala nie tylko "skleić" rekordy, ale też na bieżąco monitorować ich jakość i angażować ludzi (Data Stewards) do rozwiązywania problemów, których maszyna nie rozwiąże sama.

# 💡 Przykład zastosowania
Bank ma system CRM i system transakcyjny. W CRM jest "Jan Nowak, Warszawa", w transakcyjnym "J. Nowak, ul. Marszałkowska, W-wa".
Ataccama MDM łączy to w jeden obiekt: "Jan Nowak, ul. Marszałkowska, Warszawa", który jest następnie dystrybuowany do wszystkich systemów.

## 📌 Źródła


## 👽 Brudnopis
What is MDM? In short, you have data coming from multiple sources all the time. As a result, we have multiple data sets that don't relate to each other or have different naming conventions. MDM answers which set is reflective of the information that you're trying to gain by organizing all the data into one source and one truth.

Managing Master Data Goal Multiple source systems provide data in inconsistent format, often referring to a single instance but differ in its format and quality. GOAL: find a way to select the best values across all data sources to create a single "truth" — master record
![[Pasted image 20260113235906.png]]

Ataccama Master Data Management (MDM) is a robust, scalable, and highly available platform built to centralize and streamline master data management tasks across an organization. It is developed as a fully metadata-driven system, incorporating a metadata editor, a data processing engine, and the ONE plan executor, while also inheriting the full capabilities of ONE Desktop. The platform emphasizes Data Quality as an integral part of the MDM process, offering comprehensive Data Quality Management through its natively integrated data quality engine. Ataccama MDM typically operates as a standalone engine (server), but it also includes a web application that enables users to browse, search, view, create, edit, and resolve data issues directly through an intuitive interface.
The web interface supports advanced data governance, empowering business users and data stewards to manage master data effectively and efficiently. MDM can be further extended with additional Ataccama tools and third-party systems to support a wide range of administrative and operational tasks. These integrations cover areas such as administration (e.g., via the MDM-native Admin center), issue and exception resolution, data interaction (browsing, editing, authoring), and middleware functions for Data Integration (DI), Enterprise Application Integration (EAI), and Business Process Management (BPM).

MDM creates a single, trusted version of critical business data, resolving inconsistencies across multiple source systems. It helps unify, cleanse, and organize fragmented data to produce accurate and reliable master records. The main goal is to select the best values from all sources to generate a "single source of truth." Ataccama MDM is a scalable, metadata-driven platform designed to consolidate and manage master dat effectively. It combines Master Data Management with integrated Data Quality capabilities through a native data quality engine. The system includes a metadata editor, data processing engine, and ONE plan executor, and inherits ONE Desktop functions. A web application allows users to browse, search, edit, and resolve data issues with ease. Ataccama MDM integrates with other Ataccama tools and third-party systems for administration and data governance.