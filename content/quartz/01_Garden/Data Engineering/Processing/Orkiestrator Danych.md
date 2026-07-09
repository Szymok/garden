---
title: Orkiestrator Danych (Data Orchestrator)
created: 2026-02-04
status: evergreen
category: Data Engineering / Infrastructure
difficulty: intermediate
language: pl
tags:
  - orchestration
  - airflow
  - dagster
  - pipelines
  - automation
aliases:
  - Data Orchestration
  - Zarządzanie potokami
  - Scheduler
---
# 🎯 Definicja
**Orkiestrator Danych** to Dyrygent w orkiestrze danych. To system, który decyduje: "Najpierw pobierz dane (Instrument A), potem je przetwórz (Instrument B), a na końcu wyślij raport (Instrument C)". Bez orkiestratora zadania wchodzą sobie w drogę i powstaje kakofonia.

# 🔑 Kluczowe punkty
- **DAG (Directed Acyclic Graph):** Mapa zależności. "Zadanie C nie może ruszyć, dopóki A i B się nie skończą".
- **Monitoring:** Jeśli zadanie padnie, orkiestrator wysyła alert i ewentualnie próbuje ponownie (Retry).
- **Historia:** Wiesz, co i kiedy się uruchomiło.

# 📚 Szczegółowe wyjaśnienie
Kiedyś używano `CRON` (prostego zegara w Linuxie). Ale CRON nie wie, że "Zadanie 2 zależy od Zadania 1".
Nowoczesne orkiestratory ([[Apache Airflow]], [[Dagster]], Prefect) są "Code-Based". Definiujesz przepływ danych jako kod w Pythonie. To daje testowalność, wersjonowanie i elastyczność.

# 💡 Przykład zastosowania
Codzienny Raport Sprzedaży.
1.  **Airflow** budzi się o 3:00.
2.  Uruchamia ekstrakcję z Kas Fiskalnych.
3.  Czeka na zakończenie.
4.  Uruchamia transformację w [[Snowflake|Snowflake]] ([[dbt]]).
5.  Jeśli sukces -> Odświeża dashboard w Tableau.
6.  Jeśli błąd -> Wysyła Slacka do inżyniera "Raport opóźniony!".

## 📌 Źródła
- "Fundamentals of Data Engineering".

## 👽 Brudnopis
- Airflow to standard przemysłowy, ale bywa ciężki w utrzymaniu. [[Dagster]] zyskuje popularność dzięki podejściu "[[Data Asset|Data Asset]] Centric" (skupia się na danych, nie tylko na zadaniach).