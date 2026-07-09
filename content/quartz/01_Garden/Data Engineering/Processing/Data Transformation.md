---
title: Data Transformation (Transformacja Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering / ETL
difficulty: basic
language: pl
tags:
  - transformation
  - etl
  - cleaning
  - normalization
  - aggregation
aliases:
  - Transformacja danych
  - Przekształcanie danych
---
# 🎯 Definicja
**[[Transformacja danych|Transformacja Danych]]** to środkowa litera w E**T**L.
To zmiana surowych danych (Raw) w dane użyteczne (Information).
Surowe: `2023-01-01, 100, USD`.
Po transformacji: `{"date": "2023-01-01", "amount_pln": 400, "category": "High Value"}`.

# 🔑 Kluczowe punkty
- **Oczyszczanie:** Usuwanie duplikatów, naprawa literówek (`W-wa` -> `Warszawa`).
- **Standaryzacja:** Wszystkie daty do formatu ISO 8601 (`YYYY-MM-DD`).
- **Wzbogacanie:** Doklejenie danych geo do kodu pocztowego.
- **Anonimizacja:** Zamiana nazwiska na Hash (RODO).

# 📚 Szczegółowe wyjaśnienie
W nowoczesnym **Modern Data Stack** (ELT), transformacja dzieje się wewnątrz hurtowni danych (np. za pomocą [[dbt]]).
Kiedyś (ETL) transformacja działa się na serwerze pośrednim (Informatica, Talend) przed wgraniem do bazy.

# 💡 Przykład zastosowania
Sklep internetowy.
Tabela `orders_raw`: Cena netto. VAT jako kod "A", "B".
Transformacja ([[SQL|SQL]]):
1.  `CASE WHEN vat_code = 'A' THEN 0.23 ELSE 0 END` (Logika biznesowa).
2.  `price_net * 1.23` (Wyliczenie Brutto).
3.  `JOIN customers` (Dodanie miasta klienta).
Wynik: Tabela `orders_mart` gotowa pod raport w Tableau.

## 📌 Źródła
- [[dbt|dbt]] documentation / guides.

## 👽 Brudnopis
- Transformacja to miejsce, gdzie "dane" stają się "prawdą biznesową". To tu zapadają decyzje, jak liczymy przychód.
