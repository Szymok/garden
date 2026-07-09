---
title: Business Intelligence (BI)
created: 2026-02-04
status: evergreen
category: Data Analysis
difficulty: basic
language: pl
tags:
  - bi
  - analytics
  - reporting
  - decision-making
aliases:
  - Analityka Biznesowa
  - Raportowanie
---
# 🎯 Definicja
**Business Intelligence (BI)** to procesy, technologie i narzędzia służące do przekształcania surowych danych w użyteczne informacje (Insights), które wspierają podejmowanie decyzji biznesowych.

# 🔑 Kluczowe punkty
- **Descriptive Analytics:** BI mówi "Co się stało?" i "Dlaczego?". (AI mówi "Co się stanie?").
- **Dashboardy:** Wizualna, interaktywna forma prezentacji danych (podstawa nowoczesnego BI).
- **Self-Service:** Trend, w którym użytkownicy biznesowi sami tworzą raporty (np. w Power BI/Tableau), zamiast czekać na IT.

# 📚 Szczegółowe wyjaśnienie
Klasyczne BI to raporty PDF wysyłane mailem raz w miesiącu. Nowoczesne BI to interaktywne pulpity, gdzie dyrektor klika w słupek "Sprzedaż 2023" i dashboard filtruje się, pokazując szczegóły dla tego roku.
Architektura BI:
1. Źródła danych (ERP, CRM).
2. ETL/ELT (Integracja).
3. [[Data Warehouse|Data Warehouse]] (Magazyn).
4. [[Warstwa Semantyczna|Warstwa Semantyczna]] (Logika biznesowa).
5. Frontend (Power BI, Tableau, Looker).

# 💡 Przykład zastosowania
Sieć sklepów Żabka.
Kierownik regionalny otwiera rano tablet (Power BI).
Widzi mapę swoich sklepów. Jeden świeci na czerwono (spadek obrotów -20%).
Klika w sklep. Widzi, że spadła sprzedaż hot-dogów.
Klika głębiej. Widzi, że awaria maszyny do parówek nie została zgłoszona.
Dzwoni do sklepu. (Decyzja podjęta na podstawie danych).

## 📌 Źródła
- Gartner Magic Quadrant for ABI Platforms.

## 👽 Brudnopis
- BI vs Data Science: BI patrzy w lusterko wsteczne (historia), DS patrzy przez przednią szybę (predykcja).
- [[Semantic Layer|Semantic Layer]] (LookML, DAX) - klucz do spójności ("Czym właściwie jest Zysk Netto?").