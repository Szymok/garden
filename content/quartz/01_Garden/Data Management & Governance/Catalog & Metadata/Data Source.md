---
title: Data Source (Źródło Danych)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - data-source
  - metadata
  - connectivity
  - catalog
aliases:
  - Źródło Danych
  - Połączenie
---
# 🎯 Definicja
**Data Source** (Źródło Danych) to punkt wejścia dla każdego systemu zarządzania danymi. Reprezentuje fizyczną lokalizację, skąd pobierane są dane – może to być baza danych (PostgreSQL), hurtownia ([[Snowflake|Snowflake]]), system plików (S3) lub API. W Data Catalogu "Źródło" to obiekt przechowujący parametry połączenia (host, port, user) i metadane techniczne.

# 🔑 Kluczowe punkty
- **Rejestracja:** Aby zarządzać danymi, musisz najpierw zarejestrować ich źródło.
- **Skanowanie:** Systemy (jak [[Ataccama|Ataccama]]) skanują źródło, aby pobrać listę tabel i kolumn (bez pobierania zawartości).
- **Profilowanie:** Po zarejestrowaniu można uruchomić profilowanie, by zrozumieć [[Jakość Danych|jakość danych]].

# 📚 Szczegółowe wyjaśnienie
W [[Ataccama|Ataccama]] ONE hierarchia wygląda tak:
`Source (Baza)` -> `Location (Schema)` -> `Catalog Item (Tabela/Plik)` -> `Attribute (Kolumna)`.
Źródło jest "korzeniem" tego drzewa.
Zarządzanie źródłem obejmuje:
- **Connectivity:** Sterowniki JDBC, poświadczenia (Credentials).
- **Scheduling:** Jak często odświeżać metadane? (np. schema drift detection).
- **Permissions:** Kto może widzieć to źródło w katalogu?

# 💡 Przykład zastosowania
Chcesz objąć [[Data Governance|Data Governance]]'m system CRM Salesforce.
1.  Rejestrujesz nowe Data Source typu "Salesforce".
2.  Podajesz URL API i token.
3.  Uruchamiasz "[[Metadata|Metadata]] Load".
4.  Po chwili w Katalogu widzisz obiekty: `Accounts`, `Contacts`, `Opportunities`.
Teraz stewardzi mogą opisywać te obiekty, choć fizycznie dane nadal siedzą w chmurze Salesforce.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Connecting to Data Sources.

## 👽 Brudnopis
- Ważne rozróżnienie: *Read Credentials* (do skanowania/profilowania) vs *Write Credentials* (do eksportu/naprawy). Zawsze stosuj zasadę najmniejszych przywilejów (Least Privilege).