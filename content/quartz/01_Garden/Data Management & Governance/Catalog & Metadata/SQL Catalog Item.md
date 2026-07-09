---
title: SQL Catalog Item (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Catalog
difficulty: intermediate
language: en
tags:
  - sql
  - virtual-data
  - catalog
  - views
  - transformation
aliases:
  - Wirtualny Element Katalogu
  - SQL Item
---
# 🎯 Definicja
**[[SQL|SQL]] Catalog Item** w [[Ataccama|Ataccama]] ONE to "wirtualna tabela". Nie istnieje fizycznie w bazie, jest wynikiem zapytania [[SQL|SQL]] zapisanego w katalogu.
Działa jak `VIEW` w bazie danych, ale jest zarządzane przez [[Data Catalog|Data Catalog]].

# 🔑 Kluczowe punkty
- **Bez ETL:** Nie musisz prosić IT o stworzenie nowej tabeli w hurtowni. Wpisujesz [[SQL|SQL]] w katalogu i masz "nowy zbiór danych".
- **Szybkie prototypowanie:** Analityk może stworzyć sobie widok "Klienci VIP z Warszawy", sprofilować go i sprawdzić jakość, zanim poprosi inżynierów o wdrożenie.
- **Lineage:** System wie, skąd pochodzą dane (parsuje [[SQL|SQL]]).

# 📚 Szczegółowe wyjaśnienie
Tworzysz nowy Item w katalogu.
Wybierasz typ: `SQL`.
Wpisujesz query:
```sql
SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.year = 2024
```
Klikasz Save. Od teraz możesz na tym "wytworze" puszczać [[Profiling|Profiling]], DQ Monitoring, nakładać Glossary Termy, tak jakby to była prawdziwa tabela.

# 💡 Przykład zastosowania
Biznes potrzebuje raportu DQ dla "Klientów Aktywnych" (którzy kupili coś w ostatnim roku).
W bazie jest tylko tabela `ALL_CUSTOMERS` (10 mln rekordów, w tym martwe dusze).
Zamiast monitorować całość (drogo/wolno), tworzysz [[SQL|SQL]] Catalog Item filtrujący tylko aktywnych.
Monitorujesz ten mniejszy zbiór. Raport jest precyzyjny i dotyczy tylko tego, co interesuje biznes.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Catalog Documentation.

## 👽 Brudnopis
- Uwaga na wydajność. Każde działanie na tym Itemie (np. [[Profiling|Profiling]]) uruchamia ten [[SQL|SQL]] w bazie źródłowej. Jeśli [[SQL|SQL]] jest ciężki, "zabijesz" bazę produkcyjną.