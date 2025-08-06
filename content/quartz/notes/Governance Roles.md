---

title: Governance Roles  
created: 2025-07-14  
status:  
category: data governance  
difficulty: średni  
language: pl  
tags:

- governance
- zarządzanie dostępem
- role
- uprawnienia
- dane  
aliases:
- role governance
- role zarządzające
- role zarządzania danymi

---

# 🎯 Definicja

**Governance [[Roles]]** ([[Roles|role]] zarządzania) to zestawy uprawnień definiujące, jakie akcje użytkownik lub grupa użytkowników może wykonać na danych zasobach w systemie zarządzania danymi. [[Roles|Role]] te są przypisywane bezpośrednio do użytkowników lub grup (np. za pośrednictwem integracji z systemem tożsamości, jak [[Keycloak]]) i służą do kontrolowania dostępu oraz ról w procesach zarządzania jakością i cyklem życia danych.

# 🔑 Kluczowe punkty

- [[Roles|Role]] governance można przypisać użytkownikom lub rolom zewnętrznym (np. z [[Keycloak]]).
- Określają one poziomy dostępu do danych obiektów (nodes), takich jak systemy, zasoby danych, raporty, słowniki pojęć itp.
- Tylko użytkownicy z rolą **ONE Administrator** mogą zarządzać rolami governance.
- [[Roles|Role]] definiują uprawnienia od odczytu metadanych po pełen dostęp obejmujący modyfikację struktur aplikacyjnych.
- Zakres uprawnień obejmuje m.in.: odczyt danych, edycję, operacje systemowe, publikację, przypisywanie stewardów.

# 📚 Szczegółowe wyjaśnienie

## Typowe [[Roles|role]] governance

|Rola|Opis|
|---|---|
|**ONE Administrator**|Ma pełny dostęp do konfiguracji systemu, może zarządzać modelami, grupami i typami danych. Główny zarządca aplikacji i struktury danych.|
|**ONE Operator**|Może wykonywać operacje systemowe na zasobach (np. indeksowanie, synchronizacja z LDAP), ale nie ma dostępu do samych danych.|
|**Data Owner**|Reprezentuje odpowiedzialność biznesową za dane w obrębie domeny lub jednostki (np. dział, domena danych). Ustala oczekiwania jakościowe i nadzoruje innych uczestników procesu.|
|**Data Steward**|Zarządza cyklem życia zasobów danych (technicznych i biznesowych), monitoruje jakość danych, publikuje, opisuje, kataloguje.|
|**Data Consumer**|Ograniczone uprawnienia do przeglądania jedynie metadanych; nie mogą edytować ani przeglądać treści danych. Często użytkownik końcowy lub analityk.|

## Poziomy dostępu w ramach roli

|Poziom dostępu|Opis|
|---|---|
|**Full Access**|Pełne uprawnienia: tworzenie, edycja, publikacja, udostępnianie, usuwanie zasobów.|
|**Editing Access**|Możliwość edycji wersji roboczych, bez publikowania, udostępniania ani usuwania.|
|**Operate Access**|Uruchamianie działań technicznych (np. reindeksacja, synchronizacja użytkowników) bez wglądu do danych.|
|**View Data Access**|Podgląd metadanych i danych rzeczywistych, bez edycji.|
|**Share View Access**|Umożliwia udostępnianie danych innym użytkownikom w trybie tylko do odczytu.|
|**View Page Access**|Uprawnienia do wyświetlania stron głównych (landing pages) i ich segmentów.|
|**View Metadata Access**|Dostęp jedynie do metadanych (np. typ pola, data ostatniej aktualizacji).|
|**Share Metadata Access**|Udostępnianie metadanych innym użytkownikom w trybie tylko do odczytu.|

## Zasady przypiszania ról

- Rola może być przypisana:
    - użytkownikowi (indywidualnie),
    - grupie użytkowników,
    - roli pochodzącej z systemu IAM (np. [[Keycloak]]).
- Nadanie roli wpływa tylko na zakres uprawnień do elementów wskazanych na poziomie kontekstu (np. system, słownik, tabela).

# 💡 Przykład zastosowania

W organizacji z wdrożoną platformą [[data governance]]:

- Joanna (Data Steward) ma pełen dostęp do słowników danych domeny "Finanse" — może edytować definicje, mapować systemy baz danych i publikować katalogi biznesowe.
- Marek (Data Consumer) widzi tylko metadane katalogu, bez możliwości ich edycji i bez dostępu do rzeczywistych danych osobowych czy transakcyjnych.
- Administrator (ONE Admin) kontroluje przypisanie ról, strukturę grup, sychronizację uprawnień z systemem tożsamości.

# 📌 Źródła

- Dokumentacja Ataccama ONE: Governance [[Roles]] – Global Settings
- Dokumentacja Narzędzi RBAC / IAM jak [[Keycloak]]
- [https://dataedo.com/kb/data-glossary/data-steward-data-owner-data-consumer](https://dataedo.com/kb/data-glossary/data-steward-data-owner-data-consumer)
- [https://www.immuta.com/blog/data-governance-roles-responsibilities/](https://www.immuta.com/blog/data-governance-roles-responsibilities/)

# 👽 Brudnopis

- [[Roles|Role]] = agregat uprawnień według typu użytkownika i typu zasobu
- [[Roles|Role]] można przypisać bezpośrednio lub zintegrować z extern. systemami ([[Keycloak]], LDAP)
- Hierarchia ról: Administrator > Owner > Steward > Operator > Consumer
- Poziomy działań: view, share, edit, publish, delete, operate (różnicowane na dane vs. metadane)
- Typowe przypadki użycia: zarządzanie katalogami danych, uprawnienia do słowników, polityki udostępniania metadanych i danych rzeczywistych.