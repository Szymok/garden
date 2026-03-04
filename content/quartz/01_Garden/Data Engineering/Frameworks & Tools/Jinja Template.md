---
title: Jinja Template (Szablonowanie)
created: 2026-02-04
status: evergreen
category: Programming / Python
difficulty: intermediate
language: pl
tags:
  - jinja
  - python
  - templating
  - dbt
  - airflow
aliases:
  - Szablon Jinja
  - Jinja2
---
# 🎯 Definicja
**Jinja** to system szablonów dla Pythona.
Pozwala łączyć statyczny tekst (HTML, SQL, YAML) z dynamicznymi danymi.
Zamiast pisać 50 zapytań SQL (`SELECT * FROM table_2023`, `SELECT * FROM table_2024`...), piszesz jeden szablon z pętlą `for`.

# 🔑 Kluczowe punkty
- **Narzędzie pracy Inżyniera Danych:** [[dbt]], [[Apache Airflow]], Ansible - one wszystkie używają Jinja.
- **Składnia:** `{{ zmienna }}` wypisuje wartość. `{% if %}` robi logikę.
- **Makra:** Możesz pisać funkcje wewnątrz SQL (np. funkcję do przeliczania walut), żeby nie kopiować kodu.

# 📚 Szczegółowe wyjaśnienie
Przykład w dbt (SQL):
```sql
SELECT
  order_id,
  {% if target.name == 'dev' %}
    'TEST_DATA' as environment
  {% else %}
    'PROD_DATA' as environment
  {% endif %}
FROM orders
```
Jinja "skompiluje" to zapytanie inaczej na produkcji, a inaczej u Ciebie na laptopie.

# 💡 Przykład zastosowania
Generowanie e-maila powitalnego:
Szablon: `Cześć {{ imie }}! Twoje zamówienie {{ numer }} jest gotowe.`
Dane: `{imie: "Szymon", numer: "123"}`.
Wynik: `Cześć Szymon! Twoje zamówienie 123 jest gotowe.`

## 📌 Źródła
- Jinja2 Documentation.

## 👽 Brudnopis
- "SQL with superpowers". Tak się mówi o połączeniu SQL + Jinja w dbt. To zmienia SQL z języka zapytań w język programowania (metaprogramowania).
