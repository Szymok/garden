---
title: Konfiguracja Data Observability
created: 2026-02-04
status: evergreen
category: Ataccama/Observability
difficulty: intermediate
language: pl
tags:
  - observability
  - monitoring
  - alerts
  - data-quality
aliases:
  - Data Observability Configuration
  - Ustawienia monitoringu
---
# 🎯 Definicja
**Data Observability** (Obserwowalność Danych) w Ataccama ONE to moduł od "pilnowania" danych. W przeciwieństwie do reguł DQ (które sprawdzają *treść*), Observability sprawdza *metadane i statystyki*: czy dane w ogóle przyszły? Czy wolumen jest taki jak zawsze? Czy schemat się nie zmienił?

# 🔑 Kluczowe punkty
- **AI-Driven:** System sam uczy się "co jest normalne". Jeśli zawsze w poniedziałki przychodzi 10k rekordów, a dziś przyszło 500, system zgłosi anomalię (bez pisania reguły `IF count < 1000`).
- **Metryki:** Row Count, Volume (MB), Schema Change, Freshness (kiedy ostatnia zmiana).
- **Konfiguracja:** Wymaga włączenia na poziomie Źródła (Data Source) lub Tabeli.

# 📚 Szczegółowe wyjaśnienie
Proces konfiguracji:
1. **Włącz Monitoring:** Wchodzisz w Data Source -> Observability -> Enable.
2. **Initial Run:** System musi przemielić historię (lub zebrać próbki przez kilka dni), żeby zbudować "Baseline" (Model bazowy).
3. **Tuning:** Możesz wyregulować czułość (Sensitivity). Jeśli dostajesz za dużo fałszywych alarmów, zmniejsz czułość.
4. **Alerty:** Podpinasz e-mail lub Slacka/Webhook, żeby dostawać powiadomienia o incydentach.

# 💡 Przykład zastosowania
Hurtownia Danych ładowana w nocy.
O 3:00 rano pipeline ETL "padł cicho" (skończył się sukcesem, ale wgrał 0 rekordów).
Tradycyjny Monitoring ETL widzi "Success".
Data Observability o 4:00 rano krzyczy: *"Anomalia Row Count! Oczekiwano ~50,000, otrzymano 0. Odchylenie > 3 sigma."*
Inżynier wstaje i naprawia, zanim biznes przyjdzie do pracy.

## 📌 Źródła
- Ataccama ONE Data Observability Guide.
- Monte Carlo Data (pionierzy terminu).

## 👽 Brudnopis
- Schema Drift: Wykrywanie, że ktoś dodał/usunął kolumnę w systemie źródłowym.
- Freshness: Czy dane są "świeże"? (Checks timestamp column).