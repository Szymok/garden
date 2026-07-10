---
title: ETL kontra ELT (Modele Integracji Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: basic
language: pl
tags:
  - etl
  - elt
  - architecture
  - modern-data-stack
aliases:
  - ETL vs ELT
  - Extract Transform Load
  - ETL
  - ELT
  - etl
  - elt
---
# 🎯 Definicja
**ETL** (Extract, Transform, Load) i **ELT** (Extract, Load, Transform) to dwa podejścia do przesyłania danych z punktu A do B. Różnica polega na tym, **kiedy** i **gdzie** odbywa się transformacja (czyszczenie, łączenie).

# 🔑 Kluczowe punkty
- **ETL (Tradycyjne):** Transformujesz dane na serwerze pośrednim *zanim* wgrasz je do hurtowni. Oszczędzasz miejsce w hurtowni, ale tracisz surowe dane.
- **ELT (Nowoczesne):** Wgrywasz surowe dane do hurtowni (Load), a potem transformujesz je [[SQL|SQL]]-em (Transform). Wymaga mocnej hurtowni w chmurze (BigQuery, [[Snowflake|Snowflake]]).
- **Trend:** Świat przechodzi na ELT dzięki taniej chmurze i narzędziom jak [[dbt]].

# 📚 Szczegółowe wyjaśnienie
| Cecha | ETL | ELT |
| :--- | :--- | :--- |
| **Kolejność** | Extract -> Transform -> Load | Extract -> Load -> Transform |
| **Silnik** | Zewnętrzny (np. Informatica, SSIS) | Wewnętrzny ([[Snowflake|Snowflake]], BigQuery) |
| **Surowe dane** | Często tracone / niedostępne | Dostępne w hurtowni (Raw Layer) |
| **Elastyczność** | Mała (zmiana wymaga przebudowy pipeline) | Duża (zmieniasz [[SQL|SQL]] i przeliczasz) |

# 💡 Przykład zastosowania
**Scenariusz ETL:** Bank on-premise. Masz mało miejsca na dyskach. Pobierasz logi, filtrujesz tylko błędy, formatujesz daty i wgrywasz gotową tabelę raportową. Resztę logów kasujesz.
**Scenariusz ELT:** Startup e-commerce. Wgrywasz absolutnie wszystko (każde kliknięcie) do [[Snowflake|Snowflake]]'a (Extract-Load, np. Fivetranem). Analityk pisze potem model [[dbt|dbt]], który wyciąga z tego sprzedaż. Jak za rok zechcesz analizować "porzucone koszyki", dane już tam są – wystarczy nowy [[SQL|SQL]].

## 📌 Źródła
- "Fundamentals of Data Engineering" - Joe Reis.
- [[dbt|dbt]] blog - "ETL vs ELT".

## 👽 Brudnopis
- ELT jest fundamentem **Modern Data Stack**.
- Czasem używa się hybrydy [[EtLT]] (Extract, *mały tweak*, Load, Transform).