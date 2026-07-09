---
title: Software-Defined Assets (SDA)
created: 2026-02-04
status: evergreen
category: Data Engineering / Dagster
difficulty: advanced
language: pl
tags:
  - dagster
  - sda
  - declarative
  - orchestration
  - assets
aliases:
  - Zasoby Definiowane Programowo
  - Asset-Based Orchestration
---
# 🎯 Definicja
**Software-Defined Assets (SDA)** to rewolucja w orkiestracji (promowana przez **[[Dagster]]**).
Zamiast pisać **Taski** ("Uruchom skrypt A, potem skrypt B"), definiujesz **Assety** (Dane).
Piszesz kod, który mówi: "To jest tabela `Clients`. Ona powstaje z pliku `raw_clients.csv`".
Orkiestrator sam wie, kiedy i co uruchomić, żeby `Clients` było aktualne.

# 🔑 Kluczowe punkty
- **[[Deklaratywność|Deklaratywność]]:** Mówisz CO chcesz mieć (Tabelę), a nie JAK to zrobić (Kroki).
- **Lineage jako Kod:** Relacje między assetami są wprost w kodzie (`@asset(deps=[raw_clients])`).
- **Wersjonowanie:** Wiesz dokładnie, która wersja kodu wyprodukowała którą wersję danych.

# 📚 Szczegółowe wyjaśnienie
W Airflow masz DAG Zadań: `Task A` -> `Task B`. Nie wiesz, co one robią z danymi, dopóki nie przeczytasz kodu.
W Dagsterze masz Graf Assetów: `Tabela A` -> `Tabela B`. Widzisz przepływ danych na pierwszy rzut oka.
To łączy świat kodu (Python/[[SQL|SQL]]) ze światem danych (Katalog).

# 💡 Przykład zastosowania
Kod w Dagsterze:
```python
@asset
def raw_orders():
    return read_csv("orders.csv")

@asset(deps=[raw_orders])
def daily_sales(raw_orders):
    return raw_orders.groupby("date").sum()
```
System wie, że `daily_sales` zależy od `raw_orders`. Jeśli `raw_orders` się zmieni, system wie, że `daily_sales` jest nieaktualne (stale) i trzeba je przeliczyć.

## 📌 Źródła
- [[Dagster|Dagster]] Docs - Software-Defined Assets.

## 👽 Brudnopis
- To przyszłość Data Engineeringu. Odchodzimy od tępego "uruchamiania skryptów" w stronę "zarządzania stanem danych".