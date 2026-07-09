---
title: Odwrócony ETL (Reverse ETL)
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: intermediate
language: pl
tags:
  - reverse-etl
  - data-activation
  - crm
  - marketing-automation
  - hightouch
aliases:
  - Reverse ETL
  - Data Activation
  - Aktywacja Danych
---
# 🎯 Definicja
**Odwrócony ETL (Reverse ETL)** to proces wysyłania danych **z Hurtowni Danych ([[Data Warehouse|Data Warehouse]]) z powrotem do systemów operacyjnych** (CRM, Marketing, Support). To zamykanie pętli danych.

# 🔑 Kluczowe punkty
- **Kierunek:** Tradycyjny ETL: Aplikacja -> Hurtownia. Reverse ETL: Hurtownia -> Aplikacja.
- **Cel:** "Data Activation". Sprawienie, by dane pracowały na froncie, a nie tylko kurzyły się na dashboardach dla zarządu.
- **Narzędzia:** Hightouch, Census (lub własne skrypty).

# 📚 Szczegółowe wyjaśnienie
Po co to robić?
Hurtownia ([[Snowflake|Snowflake]]) ma "pełen obraz" klienta (dane ze strony www, z płatności, z supportu). System CRM (Salesforce) ma tylko dane sprzedażowe.
Reverse ETL bierze np. obliczony w hurtowni "Lifetime Value" i wkleja go do Salesforce'a, żeby handlowiec wiedział, z kim rozmawia.

# 💡 Przykład zastosowania
1.  **Analiza:** Model ML w hurtowni wykrywa, że Klient X prawdopodobnie zrezygnuje z usług (Churn Risk: High).
2.  **Reverse ETL:** Wysyła tę flagę do systemu Zendesk.
3.  **Akcja:** Gdy Klient X pisze do supportu, zgłoszenie od razu trafia do priorytetowej kolejki "VIP Retention Team".

## 📌 Źródła
- "Reverse ETL: The Modern Data Stack's Missing Piece".

## 👽 Brudnopis
- "Nie każ handlowcom logować się do Tableau. Daj im dane tam, gdzie pracują (w CRM)."