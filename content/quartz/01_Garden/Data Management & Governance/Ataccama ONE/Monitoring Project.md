---
title: Monitoring Project (Ataccama DQ)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Data Quality
difficulty: intermediate
language: en
tags:
  - monitoring
  - data-quality
  - rules
  - anomaly-detection
  - ataccama
aliases:
  - DQ Monitoring
  - Projekt Monitoringu
---
# 🎯 Definicja
**Monitoring Project** w Ataccama ONE to kontener na Twoje automatyczne testy jakości danych. To tutaj mówisz systemowi: "Sprawdzaj tabelę `Klienci` codziennie o 2 w nocy. Jeśli liczba błędnych emaili przekroczy 1%, wyślij mi alert".

# 🔑 Kluczowe punkty
- **Reaktywność:** Pozwala śledzić, jak jakość danych zmienia się w czasie (Trend Line).
- **Zasób:** Monitorujesz konkretne `Catalog Items` (Tabele, Pliki).
- **Metody:**
    1.  **DQ Rules:** Sprawdź poprawność (np. "Email ma @").
    2.  **Structure Checks:** Czy schema się nie zmieniła? (np. "Czy kolumna ID nadal istnieje?").
    3.  **Anomaly Detection:** AI wykrywa dziwne skoki (np. "Dziś mamy o 50% mniej rekordów niż zwykle").

# 📚 Szczegółowe wyjaśnienie
Proces:
1.  Tworzysz Projekt.
2.  Dodajesz Items (Tabele).
3.  Konfigurujesz Checks (Reguły).
4.  **Publish:** Musisz opublikować zmiany, żeby weszły w życie.
5.  **Run:** Uruchamiasz ręcznie lub z harmonogramu (Scheduler).

Wyniki widzisz na dashboardzie jako "DQ Score" (jakość ogólna) i listę "Issues".

# 💡 Przykład zastosowania
Migracja danych.
Tworzysz Monitoring Project na tabeli docelowej.
Przed migracją: DQ Score = 0% (pusto).
Po migracji: DQ Score = 95%.
Widzisz, że 5% rekordów ma błędy walidacji. Poprawiasz skrypt migracyjny i uruchamiasz ponownie. Monitoring pokazuje wzrost jakości do 99%.

## 📌 Źródła
- Ataccama User Guide - Monitoring Projects.

## 👽 Brudnopis
- Ważne: Monitoring Project to nie to samo co **Data Observability**. Monitoring jest "Manualny" (Ty definiujesz reguły). Observability jest "Automatyczne" (System sam uczy się, co jest normą).