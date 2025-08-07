---

title: Anomaly Detection  
created: 2025-05-21  
status:  
category: data quality / data observability  
difficulty: średni  
language: pl  
tags:

- jakość danych
- anomaly detection
- data profiling
- monitoring danych
- wykrywanie anomalii  
aliases:
- wykrywanie anomalii
- detekcja anomalii
- analiza odchyleń

---

# 🎯 Definicja

**Anomaly Detection (wykrywanie anomalii)** to proces identyfikacji nieoczekiwanych, nietypowych lub odstających wartości, trendów lub zachowań w danych. W kontekście zarządzania jakością danych, anomaly detection pozwala wykryć błędy, niezgodności i zjawiska, które odbiegają od spodziewanych wartości lub trendów historycznych.

# 🔑 Kluczowe punkty

- 🔍 Anomaly detection wykrywa niespodziewane wartości (null, zero, liczby ujemne, przepięcia rozkładu), które mogą świadczyć o problemach z danymi źródłowymi lub przetwarzaniem.
- ⚙️ Stosowane automatycznie po **profilowaniu danych** lub w ramach cyklicznego **monitoringu DQ** (Data Quality).
- 📈 Wspiera dwa typy modeli:
    - **Model niezależny od czasu** – porównuje obserwację do rozkładu danych bez uwzględnienia trendów czasowych.
    - **Model zależny od czasu (time-series)** – identyfikuje anomalie względem trendów czasowych (potrzebuje min. 6 cykli profilu danych).
- 🧠 Mechanizmy AI/[[Uczenie Maszynowe|ML]] stosowane są do wykrywania nietypowych wzorców bez predefiniowanych reguł.
- 🚨 Detekcja anomalii może wywołać alerty i integrować się z systemami observability i dashboardami jakości danych.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Anomaly Detection?

Po zbieraniu metryk z profilowania danych system porównuje nowe wartości z poprzednimi wynikami lub ustalonymi normami. Model wykrywa anomalie w takich przypadkach jak:

- gwałtowny spadek liczby rekordów (`row_count`),
- wzrost liczby nulli (`null_rate`),
- nieoczekiwana zmiana w rozkładzie wartości nominalnych (`value_distribution`),
- pojawienie się nietypowych wartości (np. negatywne identyfikatory, `0`, `9999999` jako cena).

## Rodzaje modeli anomalii

|Typ|Opis|Wymagania|
|---|---|---|
|Time-independent|Detekcja anomalii względem rozkładu danych/historii bez osi czasu|Brak minimalnych runów|
|Time-dependent|Detekcja oparta na analizie szeregów czasowych i sezonowości|≥6 uruchomień profilu|
|Reguły logiczne (fallback)|Ustalona granica lub wartość uznawana za błąd|Konfiguracja ręczna|

### Porównanie modeli

|Cechy|Time-independent|Time-dependent|
|---|---|---|
|Tryb standardowy|✅|❌ (na żądanie)|
|Czułość na trendy sezonowe|❌|✅|
|Szybkość wykrycia|✅|⚠️ zależna od historii|
|Wymagana historia|brak|≥6 cykli|

# 💡 Przykład zastosowania

```python
# Pseudokod opisujący uruchomienie wykrywania anomalii na polu ilości sztuk w sprzedaży

run_anomaly_detection(
    dataset="sales.daily_orders",
    metric="quantity",
    model="time_series",
    on_event="profiling_complete",
    alert_threshold="auto"
)
```

Przy każdej analizie jakości danych (profilowaniu lub monitoringu) wykrywane są nagłe skoki ilości, zerowe wartości, odstępstwa od trendu tygodniowego itp.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.montecarlodata.com/docs/](https://www.montecarlodata.com/docs/)
- [https://towardsdatascience.com/anomaly-detection-beginner-guide-fa850a109ec0](https://towardsdatascience.com/anomaly-detection-beginner-guide-fa850a109ec0)
- [https://www.soda.io/](https://www.soda.io/)
- [https://docs.soda.io/soda/metrics/anomaly-detection.html](https://docs.soda.io/soda/metrics/anomaly-detection.html)

# 👽 Brudnopis

- Celem: automatyczne wykrycie „nieprawidłowości”, bez pisania reguł (ale można komplementarnie)
- Bardzo często stosowane przy row_count, null_rate, expected_value, max/min drift
- „Time-aware” model = true observability, sezonowość, outliers w trendzie
- Alerty downstream: e-mail, Slack, webhook → integracja z Data Steward Workflow
- Idealne do automatycznej klasyfikacji testów krytycznych vs. informacyjnych
- Część większego systemu observability jakości danych (Data Quality + Trends + Alerts)