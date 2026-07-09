---
title: Hierarchia Potrzeb Danych (AI Hierarchy of Needs)
created: 2026-02-04
status: evergreen
category: Data Strategy
difficulty: basic
language: pl
tags:
  - strategy
  - maturity
  - maslow
  - data-science
aliases:
  - Piramida Potrzeb Danych
  - AI Hierarchy of Needs-
---
# 🎯 Definicja
**Hierarchia Potrzeb Danych**, często przedstawiana jako piramida (analogia do Piramidy Maslowa), ilustruje, że nie można robić zaawansowanego AI/ML, jeśli nie ma się solidnych fundamentów. Na dole jest **zbieranie danych**, na górze **sztuczna inteligencja**.

# 🔑 Kluczowe punkty
- **Kolejność:** Collect -> Move/Store -> Explore/Transform -> Aggregate/Label -> Learn/Optimize.
- **Wniosek:** "Garbage In, Garbage Out". Najlepszy model AI nie naprawi braku danych lub syfu w hurtowni.

# 📚 Szczegółowe wyjaśnienie
Poziomy piramidy (od dołu):
1.  **Collection:** Logowanie zdarzeń, sensory, bazy transakcyjne. (Musisz mieć dane).
2.  **Flow/Storage:** ETL, [[Data Lake|Data Lake]], Hurtownie Danych. (Dane muszą być dostępne i bezpieczne).
3.  **Exploration/Transformation:** Czyszczenie, [[Anomaly Detection|anomaly detection]], przygotowanie ([[dbt|dbt]]). (Dane muszą być czyste).
4.  **Aggregation/Labeling:** Raporty BI, metryki, segmenty, labeling treningowy. (Wiem, co się stało).
5.  **AI/ML:** Predykcja, automatyzacja. (Wiem, co się stanie).

Wiele firm próbuje skoczyć od razu do pktu 5, pomijając 2 i 3. Kończy się to porażką (Proof of Concept, który nigdy nie wchodzi na produkcję).

# 💡 Przykład zastosowania
Firma chce wdrożyć AI do przewidywania awarii maszyn.
Zatrudniają Data Scientista.
On pyta: "Gdzie są logi z maszyn?".
Firma: "Nie mamy, inżynierowie zapisują je w zeszytach".
Wniosek: Firma jest na poziomie 0. Najpierw trzeba wdrożyć czujniki IoT i bazę danych (Poziom 1 i 2), a za rok pomyśleć o AI.

## 📌 Źródła
- "The AI Hierarchy of Needs" - Monica Rogati (fłynny artykuł na Hackernoon).

## 👽 Brudnopis
- AI jest "wisienką na torcie". Tortem jest solidna [[Inżynieria Danych|inżynieria danych]] (Data Engineering).