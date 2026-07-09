---
title: Semantic Layer (Warstwa Semantyczna)
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: intermediate
language: pl
tags:
  - semantic-layer
  - data-modeling
  - abstraction
  - business-logic
  - headless-bi
aliases:
  - Warstwa Semantyczna
  - Model Semantyczny
---
# 🎯 Definicja
**[[Warstwa Semantyczna|Warstwa Semantyczna]]** to tłumacz między Bazą Danych (technicznym [[SQL|SQL]]-em) a Biznesem (pojęciami typu "Klient", "Sprzedaż").
Zamiast kazać dyrektorowi pisać `SELECT sum(amt) FROM t_orders WHERE dt > now()`, dajesz mu pole "Dzisiejsza Sprzedaż".
[[Warstwa Semantyczna|Warstwa Semantyczna]] ukrywa skomplikowane złączenia (JOINs) i nazwy tabel.

# 🔑 Kluczowe punkty
- **Abstrakcja:** Ukrywa brudy inżynierii danych.
- **Kontekst:** Nadaje danym znaczenie biznesowe (Semantykę).
- **Relacje:** Wie, że "Klient" ma "Zamówienia", a "Zamówienie" ma "Produkty".

# 📚 Szczegółowe wyjaśnienie
[[Warstwa Semantyczna|Warstwa Semantyczna]] zawiera [[Measure Layer]].
Jest szerszym pojęciem. Obejmuje:
1.  Metryki (Liczby).
2.  [[Wymiary|Wymiary]] (Cechy - np. Kolor, Region).
3.  Relacje (Złączenia między tabelami).
4.  Uprawnienia (Kto widzi co).

# 💡 Przykład zastosowania
Bez warstwy: Analityk musi wiedzieć, że pole `usr_crt_dt` w tabeli `T05_PROD` to data założenia konta.
Z warstwą: Analityk widzi obiekt `User` i pole `Created Date`.
Systemy takie jak Looker (LookML) czy AtScale budują potężne warstwy semantyczne, dzięki którym użytkownicy mogą budować własne raporty (Self-Service) bez znajomości [[SQL|SQL]], po prostu przeciągając kafelki.

## 📌 Źródła
- [[dbt|dbt]] Semantic Layer docs.

## 👽 Brudnopis
- To powrót do korzeni BI (Business Objects, Cognos miały to od lat 90.), ale w nowej, kodowanej wersji (Metrics-as-Code).
