---
title: Modelowanie Danych (Data Modeling)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - data-modeling
  - erd
  - databases
  - architecture
  - design
aliases:
  - Data Modeling
  - Projektowanie Baz Danych
  - Schematy danych
---
# 🎯 Definicja
**Modelowanie danych** to proces projektowania "planu architektonicznego" dla danych. Zanim zbudujesz bazę danych, musisz narysować, jakie będą tabele, jakie kolumny i jak się ze sobą połączą. Bez modelu system staje się bałaganem.

# 🔑 Kluczowe punkty
- **Poziomy abstrakcji:**
    1.  **Koncepcyjny:** "Klienci kupują Produkty" (dla Biznesu).
    2.  **Logiczny:** "Tabela Klienci ma ID i Nazwisko" (dla Analityków).
    3.  **Fizyczny:** "Tabela `CUST_T01` na partycji D, kolumna `VARCHAR(50)`" (dla DBA).
- **Cel:** Zrozumienie danych, unikanie duplikatów, wydajność.

# 📚 Szczegółowe wyjaśnienie
Dobre modelowanie to sztuka kompromisu między **elastycznością** (łatwo dodać nowe funkcje) a **wydajnością** (szybkie zapytania).
Dwa główne podejścia:
- **OLTP (Relacyjne):** Normalizacja (3NF). Unikanie powtórzeń. Dobre do zapisu (np. system kasowy).
- **OLAP (Wymiarowe):** Denormalizacja (Star Schema). Celowe powtórzenia. Dobre do odczytu (np. raport sprzedaży).

# 💡 Przykład zastosowania
Budujesz sklep internetowy.
Model Koncepcyjny: "Klient składa Zamówienie".
Model Logiczny: Encja `Klient` (Imię, Email), Encja `Zamówienie` (Data, Suma), Relacja 1:N.
Model Fizyczny: `CREATE TABLE customers (...)`.

## 📌 Źródła
- "Data Modeling Essentials" (Simsion & Witt).

## 👽 Brudnopis
- Obecnie popularne jest "Data Modeling in the Modern Stack" ([[dbt]]), gdzie modelowanie odbywa się często już po załadowaniu danych (ELT zamiast ETL).