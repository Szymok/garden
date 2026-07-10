---
title: Zapytania Bazodanowe (Database Queries)
created: 2026-07-10
status: 🌱 draft
category: Data Engineering
difficulty: średni
language: pl
tags:
  - database
  - sql
  - queries
  - data-engineering
aliases:
  - Queries
  - Zapytania
  - Zapytanie
---
# 🎯 Definicja
**Zapytanie bazodanowe** (Query) to precyzyjne polecenie przekazywane do systemu zarządzania bazą danych (DBMS) w celu pobrania, wstawienia, modyfikacji lub usunięcia danych. W inżynierii danych termin ten najczęściej odnosi się do zapytania pobierającego dane (instrukcja `SELECT` w języku SQL) oraz analizy jego wydajności.

# 🔑 Kluczowe punkty
*   **OLTP vs OLAP Queries:** Zapytania transakcyjne (OLTP) są zazwyczaj proste, operują na pojedynczych wierszach i wymagają minimalnego czasu odpowiedzi. Zapytania analityczne (OLAP) operują na milionach wierszy, agregując dane w celu wykrycia trendów.
*   **Optymalizator zapytań (Query Optimizer):** Komponent silnika bazy danych, który analizuje zapytanie i tworzy najbardziej efektywny plan wykonania (Execution Plan), wybierając np. odpowiednie indeksy czy typy złączeń (Hash Join, Merge Join).
*   **Plan wykonania (Execution Plan):** Wizualna lub tekstowa reprezentacja kroków, jakie silnik bazy wykona, aby zwrócić wynik zapytania (np. skanowanie tabeli vs skanowanie indeksu).

# 📚 Szczegółowe wyjaśnienie
Za każdym razem, gdy wysyłamy zapytanie do bazy (np. w standardzie SQL lub przez interfejs API jak GraphQL), przechodzi ono przez kilka etapów:
1.  **Parsowanie (Parsing):** Silnik sprawdza składnię zapytania pod kątem błędów oraz uprawnienia użytkownika.
2.  **Optymalizacja:** Silnik tworzy drzewo logiczne zapytania i szacuje koszt (Cost-Based Optimizer) różnych planów dostępu do danych.
3.  **Generowanie kodu i Wykonanie:** Wybrany fizyczny plan wykonania jest kompilowany i uruchamiany na plikach danych bazy.

W inżynierii danych kluczowym zagadnieniem jest **optymalizacja zapytań** w celu uniknięcia pełnego skanowania tabel (Full Table Scan), co przy dużych zbiorach (Big Data) powoduje ogromne koszty infrastruktury i opóźnienia. W tym celu stosuje się partycjonowanie danych, indeksowanie oraz materializację widoków.

# 💡 Przykład zastosowania
*   **Zapytanie analityczne (OLAP) w Apache Druid:** Uruchomienie zapytania agregującego miliardy logów w milisekundy w celu wygenerowania wykresu ruchu sieciowego dla administratora.
*   **Zapytanie SQL z CTE (Common Table Expression):** Użycie modularnego zapytania SQL z klauzulą `WITH` w celu wyliczenia średniej sprzedaży przed wykonaniem ostatecznego złączenia danych.

## 📌 Źródła
*   [[CTE|Tymczasowe tabele wynikowe (Common Table Expressions)]]
*   [[Apache Druid|Wysokowydajne zapytania w czasie rzeczywistym w Druid]]
