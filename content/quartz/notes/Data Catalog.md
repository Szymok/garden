---

title: Data Catalog  
created: 2025-04-03  
status:  
category: ataccama  
difficulty: podstawowy  
language: pl  
tags:

- katalog danych
- ataccama
- metadata management
- data discovery  
aliases:
- katalog danych
- Data Catalog Ataccama

---

# 🎯 Definicja

**Data Catalog ([[Catalog Items|Katalog Danych]])** to centralna, zorganizowana przestrzeń służąca do przechowywania, przeglądania i zarządzania metadanymi dotyczącymi zasobów danych w organizacji — takich jak tabele, kolumny, źródła danych, lineage i zależności semantyczne. W Ataccama ONE [[Catalog Items|katalog danych]] jest częścią szerszego komponentu o nazwie **Knowledge Catalog** i umożliwia organizacjom efektywne odnajdywanie, opisywanie i analizowanie danych.

# 🔑 Kluczowe punkty

- **Centralna rejestracja zasobów danych**: tabele, bazy, raporty, modele, zbiory danych.
- **Metadane techniczne i biznesowe**: Data Catalog przechowuje zarówno informacje systemowe (schemas, types), jak i opisy użytkownika (definicje, właściciele, tagi, klasyfikacje).
- **Integracje z wieloma źródłami danych**: źródła fizyczne (Snowflake, PostgreSQL, S3 itd.) i wirtualne (API).
- **Odkrywanie i [[Data Profiling|profilowanie danych]]**: możliwość analizowania jakości danych oraz ich zawartości bez potrzeby wykonywania zapytań.
- **Wsparcie dla lineages i stewardingu**: śledzenie pochodzenia danych oraz przypisanie właścicieli i odpowiedzialności.

# 📚 Szczegółowe wyjaśnienie

## Czym jest Data Catalog w Ataccama?

W Ataccama, [[Catalog Items|katalog danych]] oferuje:

- pełne zarządzanie metadanymi w ramach jednego interfejsu,
- wizualizację dziedziczenia danych (lineage),
- przypisanie właścicieli danych (stewardów),
- automatyczne podpowiedzi terminów słownikowych (term suggestions),
- integrację z narzędziami klasyfikacyjnymi (data classification, scoring).

Elementami składowymi katalogu danych są:

- 📦 **[[Catalog Items]]** — logiczne jednostki danych, np. tabela, pole, pipeline.
- 🌐 **Sources** — fizyczne źródła danych (bazy danych, Lake, pliki).
- 🧠 **Term Suggestions** — podpowiedzi słownikowe dla metadanych, np. mapowanie kolumn na terminy słownika biznesowego.
- 🔗 **Lineage Import** — integracja i import widoku pochodzenia danych (lineage) z narzędzi zewnętrznych lub pipelines.

## Główne funkcje

- Konfigurowanie połączeń do różnych źródeł danych (JDBC/API).
- Automatyczne i ręczne wzbogacanie metadanych (np. tagi, właściciele, opisy).
- Przeglądanie danych i ich profili (rozrzut wartości, null, typy).
- Wyszukiwanie danych przy pomocy języka [[AQL]] i filtrów.
- Obsługa stewardingu i klasyfikacji danych (np. PII, dane wrażliwe).
- Integracja z data quality, monitoringiem i warstwą semantyczną.

# 💡 Przykład zastosowania

Zespół ds. zgodności w firmie bankowej korzysta z Ataccama Data Catalog, aby centralnie zarządzać zbiorami danych zawierającymi informacje wrażliwe. Zostały skonfigurowane połączenia z hurtowniami danych (Snowflake, Oracle) – dane są automatycznie importowane i profilowane. Dzięki temu:

- kolumny zawierające numery PESEL, adresy i dane finansowe są automatycznie oznaczone jako PII,
- przypisano stewardów danych, którzy opisują ich znaczenie biznesowe,
- lineage pokazuje zależności — w jaki sposób dane przepływają między warstwami,
- użytkownicy raportów [[Business Intelligence|BI]] zawsze znają pochodzenie i poziom jakości wykorzystywanych danych.

## 📌 Źródła

- [Ataccama ONE Docs – Searching using [[AQL]]](https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application/searching-using-aql)
- [Ataccama Platform Overview](https://www.ataccama.com/products/one)

# 👽 Brudnopis

- Data Catalog = metadane, widoczność techniczna i semantyczna danych
- Komponent: Knowledge Catalog → Data Catalog jako warstwa struktury
- Integracja: źródła, lineage, tagi, klasyfikacja PII, właściciele i dokumentacja
- Atrakcyjne dla: Stewardów, Zespołów Danych, Zgodności i Governance (np. RODO)
- [[AQL]]: [[AQL|Advanced Query Language]] do znalezienia zależności, jakości itp.
- Kluczowe w dużych organizacjach – przeciwdziałanie shadow data, wiele źródeł, SPOG system (single point of governance)