---
title: Data Observability (Obserwowalność Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering/Quality
difficulty: intermediate
language: pl
tags:
  - observability
  - monitoring
  - data-quality
  - reliability
aliases:
  - Obserwowalność danych
  - Monitoring Jakości
---
# 🎯 Definicja
**Data Observability** to zdolność do pełnego zrozumienia stanu danych w systemie na podstawie ich zewnętrznych sygnałów. To przeniesienie koncepcji Observability z DevOps (Logs, Metrics, Traces) do świata danych. Odpowiada na pytanie: "Czy moje dane są zdrowe i czy pipeline działa poprawnie?" zanim zadzwoni wściekły klient.

# 🔑 Kluczowe punkty
- **5 Filarów Data Observability:**
    1.  **Freshness:** Czy dane są aktualne? (Czy Job się spóźnił?)
    2.  **Distribution:** Czy wartości są w normie? (Czy średnia kwota transakcji nagle nie spadła o 90%?)
    3.  **Volume:** Czy liczba wierszy jest oczekiwana? (Czy wgraliśmy 0 rekordów?)
    4.  **Schema:** Czy struktura się zmieniła? (Czy ktoś usunął kolumnę?)
    5.  **Lineage:** Co się zepsuło "po drodze"? (Gdzie jest źródło błędu?)

# 📚 Szczegółowe wyjaśnienie
Tradycyjny monitoring mówi: "Serwer działa".
Data Observability mówi: "Serwer działa, zadanie SQL się udało, ALE wgraliśmy same NULL-e w kolumnie `kwota`, co jest anomalią".
Narzędzia takie jak Monte Carlo, Metaplane czy moduł Data Observability w Ataccama ONE używają ML do uczenia się "normalnego zachowania" danych i alertują tylko o rzeczywistych odstępstwach, minimalizując szum.

# 💡 Przykład zastosowania
Codziennie ładujesz kursy walut z API NBP.
Pewnego dnia API zmienia format JSON-a. Twój ETL nie wywala błędu (bo jest źle napisany), ale ładuje puste wartości.
Zwykły monitoring milczy ("Success").
Data Observability krzyczy: "Alert! Tabela `exchange_rates` ma Volume=100 (jak zwykle), ale kolumna `rate` ma 100% NULL (zazwyczaj 0%). Freshness OK.". Dzięki temu naprawiasz błąd rano, a nie po miesiącu, gdy raporty finansowe wyjdą błędne.

## 📌 Źródła
- "Data Observability" - Barr Moses (Monte Carlo).

## 👽 Brudnopis
- Data Observability jest kluczowe w [[Data Mesh]], gdzie mamy wiele rozproszonych produktów danych.
- "Data Downtime" - czas, kiedy dane są błędne lub niedostępne. Observability ma to skracać.