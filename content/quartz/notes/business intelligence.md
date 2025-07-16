---

title: Business Intelligence  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- business intelligence
- BI
- analityka biznesowa
- KPI
- dashboardy  
aliases:
- BI
- Analityka biznesowa

---

# 🎯 Definicja

**Business Intelligence (BI)** to zestaw narzędzi, usług i procesów służących do transformacji danych w użyteczne informacje biznesowe. Celem BI jest umożliwienie organizacjom podejmowania lepszych decyzji opartych na danych poprzez raportowanie, analizy, wizualizacje oraz samoobsługowe eksplorowanie danych przez użytkowników biznesowych.

# 🔑 Kluczowe punkty

- BI przekształca dane surowe w raporty, metryki i wizualizacje wspierające decyzje.
- Główne komponenty BI to: raporty, dashboardy, eksploracje danych, i alerty czasowe.
- BI promuje hasło „jednego źródła prawdy” — spójność danych w całej organizacji.
- Narzędzia BI są dostępne także dla użytkowników nietechnicznych (tzw. samoobsługowe BI).
- BI ściśle współpracuje z inżynierią danych, przekształceniami danych (ETL/ELT) i modelowaniem semantycznym.

# 📚 Szczegółowe wyjaśnienie

## Cele Business Intelligence

### 🧭 Przejrzystość i efektywność

BI pozwala uzyskać prosty i spójny przegląd działalności biznesowej przez prezentację danych w formie czytelnych widżetów, wykresów i tabel.

### 🔄 Automatyzacja

Powtarzalne zadania związane z raportowaniem, budżetowaniem i prognozowaniem są automatyzowane. Dane są aktualizowane dynamicznie – brak konieczności manualnej aktualizacji arkuszy kalkulacyjnych.

### 📈 Roll-up & Drill-down

- **Roll-up**: Zagregowany przegląd wskaźników, np. kwartalna sprzedaż wg regionów.
- **Drill-down**: Możliwość „rozbicia” danych w głąb szczegółów – np. do poziomu konkretnej transakcji.

### 🧩 Jedno źródło prawdy

Cała organizacja bazuje na tych samych, ustandaryzowanych danych i definicjach metryk. Redukuje to chaos informacyjny i błędy w interpretacjach.

### 👥 Empowerment użytkowników

Z pomocą narzędzi BI użytkownicy biznesowi (np. marketing, sprzedaż, HR) mogą samodzielnie analizować dane bez zależności od zespołu IT (self-service BI).

## Język i rola BI

- **Język BI = SQL**: Znajomość zapytań SQL to fundament pracy analityka i inżyniera BI.
- **Analityk BI**: Tworzy raporty, dashboardy, współpracuje z biznesem.
- **Inżynier BI/Inżynier danych**: Udostępnia jakość i transformację danych do modelu hurtowni, dostraja wydajność zapytań.

## Typowe narzędzia BI

- Power BI
- Tableau
- Looker
- Superset
- Qlik Sense
- Metabase

# 💡 Przykład zastosowania

Firma logistyczna korzysta z Power BI do śledzenia wskaźników efektywności dostaw. Menedżerowie mają pulpit z KPI (średni czas dostawy, odsetek reklamacji, wykorzystanie floty), który aktualizuje się codziennie. Gdy metryka „czas dostawy” odbiega od normy, analityk wykonuje drill-down i odkrywa, że problem dotyczy konkretnej trasy w regionie południowym. Dzięki temu decyzje naprawcze są podejmowane szybciej i są oparte na sprawdzonych danych.

## 📌 Źródła

- [What is Business Intelligence – Microsoft](https://powerbi.microsoft.com/en-us/what-is-business-intelligence/)
- [BI 101 – Tableau Learning](https://www.tableau.com/learn/articles/business-intelligence)
- [Business Intelligence vs Data Analytics – IBM](https://www.ibm.com/cloud/learn/business-intelligence)

# 👽 Brudnopis

- BI = transformacja danych w insighty → decyzje
- Cechy: roll-up, drill-down, one source of truth, automation, self-service
- Język: SQL, narzędzia: Power BI, Tableau, Looker, Metabase
- Rola: dashboardy, KPI, współpraca z [[Inżynieria Danych|Data Engineering]]
- Przykład: “czas dostawy” odstaje → drilldown → wykrycie regionu/problemu
- Self-service pozwala każdemu analizować swoje KPI bez wsparcia IT