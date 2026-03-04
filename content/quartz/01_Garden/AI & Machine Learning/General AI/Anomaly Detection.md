---
title: Detekcja Anomalii (Anomaly Detection)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - anomaly-detection
  - data-quality
  - observability
  - ml
aliases:
  - Wykrywanie anomalii
  - Outlier detection
---
# 🎯 Definicja
Technika identyfikacji rzadkich zdarzeń lub obserwacji, które znacząco odbiegają od większości danych (wzorca standardowego). W kontekście Danych (DQ) służy do automatycznego wykrywania błędów bez sztywno zdefiniowanych reguł.

# 🔑 Kluczowe punkty
- **Time-series based:** Analiza trendu w czasie (np. nagły spadek liczby wierszy w tabeli o 50%).
- **Distribution based:** Analiza rozkładu wartości (np. pojawienie się wartości ujemnych w kolumnie "Wiek").
- **Automatyzacja:** Pozwala monitorować tysiące tabel bez pisania tysięcy testów SQL.

# 📚 Szczegółowe wyjaśnienie
Tradycyjne podejście do jakości danych wymaga pisania reguł: `SELECT count(*) FROM table WHERE age < 0`. Jest to pracochłonne i wymaga wiedzy, czego szukać.
Anomaly Detection (część **Data Observability**) uczy się "normalności".
- Dzień 1: 1000 wierszy.
- Dzień 2: 1100 wierszy.
- Dzień 3: 1050 wierszy.
- Dzień 4: **10 wierszy** -> ALERT (Anomalia wolumenu).

Systemy takie jak Ataccama, Monte Carlo czy Soda wykorzystują ML do estymacji oczekiwanych zakresów.

# 💡 Przykład zastosowania
Monitoring przychodów sklepu internetowego.
System wie, że w weekendy sprzedaż rośnie (sezonowość). Jeśli w sobotę sprzedaż będzie na poziomie wtorku – system zgłosi anomalię, mimo że wartość jest "powyżej zera". Zwykła reguła statyczna (`sales > 0`) by tego nie wykryła.

## 📌 Źródła
- Monte Carlo Data - Data Observability.
- Ataccama DQ Monitoring.

## 👽 Brudnopis
- Metody: Z-score, Isolation Forest, Prophet (szeregi czasowe).
- Typy anomalii: Point anomalies (pojedynczy punkt), Contextual anomalies (np. wysoka temperatura w zime jest ok w Australii, ale nie w Polsce), Collective anomalies.
- Row count, Null rate drift, Schema changes.