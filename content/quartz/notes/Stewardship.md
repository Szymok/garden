---
title: Stewardship  
created: 2025-07-14  
status: Final  
category: Data Governance  
difficulty: podstawowy  
language: pl  
tags:

- stewardship
- data ownership
- data governance
- zarządzanie danymi  
aliases:
- zarządzanie odpowiedzialnością za dane
---

# 🎯 Definicja

**Stewardship** w kontekście zarządzania danymi odnosi się do przypisywania odpowiedzialności za zasoby danych konkretnym grupom lub osobom, tzw. _data stewards_. Pozwala to na jasne określenie właścicieli danych, ich ról oraz poziomów dostępu w ramach organizacji, co ułatwia utrzymanie ładu, jakości i zgodności danych z przepisami.

# 🔑 Kluczowe punkty

- Określa właścicieli zasobów danych oraz ich [[Roles|role]] w zarządzaniu (governance).
- Umożliwia automatyczną konfigurację poziomów dostępu do danych.
- Jest integralnym elementem mechanizmów kontroli dostępu i odpowiedzialności w systemach zarządzania danymi.
- Działa zarówno dla nowych, jak i odziedziczonych zasobów danych.
- Wspiera transparentność oraz efektywne zarządzanie jakością danych w organizacji.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania Stewardship

Funkcjonalność stewardship pozwala na przypisanie grupy właścicielskiej do danego zasobu danych (np. zestawu danych, raportu lub pipeline'u). W ramach tej grupy użytkownicy mają przypisane konkretne [[Governance Roles|role governance]], które determinują poziom dostępu oraz zakres odpowiedzialności za dany zasób.

## Zarządzanie dostępem i rolami

Po przypisaniu grupy właścicielskiej:

- _Grupa właścicielska_ automatycznie otrzymuje pełen dostęp do zasobu.
- _[[Governance Roles|Role governance]]_ (np. Data Owner, Steward) determinują indywidualne poziomy dostępu danych członków tej grupy.
- Można modyfikować właścicielstwo istniejących danych – dostęp do opcji Stewardship znajduje się typowo w zakładce "Overview" danego zasobu.

## Dziedziczenie i konfiguracja

W przypadku zasobów, które nie są tworzone bezpośrednio (np. zimportowanych danych), właścicielstwo (i stewardship) jest dziedziczone z zasobów nadrzędnych. Systemy pozwalają również na przypisanie stewardship podczas tworzenia nowego zasobu.

## Rola w ekosystemie danych

Stewardship stanowi podstawę nowoczesnego [[Data Governance]] poprzez:

- Regulowanie dostępu do danych.
- Wspomaganie identyfikowalności (lineage) i audytowalności.
- Ułatwienie wyznaczania ról i odpowiedzialności w złożonych strukturach danych.

# 💡 Przykład zastosowania

W firmie ubezpieczeniowej każde [[Data Source|źródło danych]] dotyczące klientów (np. dane CRM, informacje o polisach, dane o interakcjach) posiada przypisaną grupę stewardship. Grupa ta zawiera przedstawicieli działu zgodności, analityków danych oraz właścicieli biznesowych. Każdy członek ma określoną rolę, np. "Data Steward", który może edytować metadane, oraz "Data Owner", który odpowiada za zgodność z RODO. Dzięki temu zachowany jest porządek i przejrzystość w zarządzaniu dostępem oraz jakością danych.

## 📌 Źródła

- Ataccama Documentation – Stewardship Overview: [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [[Data Governance]] Institute: [https://www.datagovernance.com/adg_data_stewardship/](https://www.datagovernance.com/adg_data_stewardship/)

## 👽 Brudnopis

- Stewardship to przypisanie właścicielstwa zasobu do grupy z określonymi rolami.
- Poziom dostępu zależy od roli governance (Data Owner, Data Steward itd.).
- Można przypisać stewardship przy tworzeniu zasobu, a dla istniejących – poprzez zakładkę "Overview".
- Dziedziczenie stewardship z zasobu nadrzędnego.
- Po opublikowaniu zasobu właściciel otrzymuje pełen dostęp – konfigurowalny.
- Praktyczne zastosowania: zapewnienie zgodności, transparentności, strukturalnej odpowiedzialności za dane.