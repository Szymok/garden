---
title: Architektura Platformy MDM
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - architecture
  - mdm
  - infrastructure
aliases:
  - MDM Architecture
  - Ataccama Components
---
# 🎯 Definicja
Zestaw współpracujących komponentów technicznych tworzących rozwiązanie Ataccama MDM, obejmujący serwery aplikacji, bazy danych, systemy tożsamości oraz interfejsy użytkownika.

# 🔑 Kluczowe punkty
- **MDM Server:** Silnik przetwarzania (backend). Wykonuje operacje DQ, matching, merging i orkiestrację.
- **MDM Web App:** Interfejs dla użytkownika biznesowego (Data Steward).
- **Data Storage:** Relacyjna baza danych (PostgreSQL, MS SQL, Oracle) przechowująca model, dane i metadane.
- **Keycloak:** Zarządzanie tożsamością i dostępem (SSO).

# 📚 Szczegółowe wyjaśnienie
Platforma MDM nie jest monolitem.
- **Warstwa Prezentacji:** WebApp pozwala stewardom na ręczną interwencję (np. rozłączanie błędnie połączonych rekordów).
- **Warstwa Aplikacji:** Serwer MDM to "mózg". To tutaj działają plany stworzone w ONE Desktop.
- **Warstwa Danych:** Baza danych (np. PostgreSQL) jest fundamentem. Przechowuje ona nie tylko dane biznesowe (klientów), ale też konfigurację samego MDM (historię zmian, definicje zadań).

Ważnym elementem jest **ONE Desktop** (niewymieniony wprost jako serwer, ale jako narzędzie klienckie), służące do konfiguracji logiki ("MDM Model").

# 💡 Przykład zastosowania
Użytkownik loguje się do Web App (przez Keycloak). Wyszukuje klienta. Web App wysyła zapytanie do MDM Servera. Server odpytuje bazę danych PostgreSQL i zwraca wynik. Użytkownik poprawia literówkę -> Server zapisuje zmianę i uruchamia proces przeliczania jakości danych.

## 📌 Źródła


## 👽 Brudnopis
![[Pasted image 20260114001127.png]]
Presentation Layer Displays the information through a WebApp to the data stewards and enable them to run and monitor loads and perform export operations. Application Layer Runs all Loading DQ Matching and Merging process and provides batch and online interfaces. Data Storage Layer Cosist of any JDBC compliant database, stores all processed data along with the metadata.
The MDM solution consists of 4 components: Keycloak - third party identity management tool. MDM Server - the Ataccama MDM processing engine. MDM Webapp - the Ataccama MDM web application. Relational database (PostgreSQL, MS SQL, or Oracle) which acts as the backend database for the MDM Solution.

![[Pasted image 20260114001236.png]]

The MDM Server is the core engine responsible for cleansing, validation, matching, merging, and orchestration. It includes a built-in Data Quality engine, ensuring data quality is part of all processing. The MDM Web App provides a user interface for viewing, editing, and managing master data and data quality issues. MDM Storage (PostgreSQL) supports the backend for both server and web app. Keycloak handles identity and access management with single sign-on. The MDM Model defines all core logic and is configured using ONE Desktop. Interfaces support data loading/export (batch), integration (native services), and real-time input (streaming).