---

title: Kursor (Cursor)  
created: 2025-07-16  
status: 🌱 draft
category: airbyte  
difficulty: podstawowy  
language: pl  
tags:

- airbyte
- synchronizacja przyrostowa
- ETL
- kursor
- data engineering  
aliases:
- cursor
- wskaÅºnik synchronizacji

---

# ðŸŽ¯ Definicja

**Kursor (Cursor)** w inÅ¼ynierii danych i narzÄ™dziach takich jak Airbyte to specjalny wskaÅºnik (pole) uÅ¼ywany podczas synchronizacji przyrostowej, ktÃ³ry umoÅ¼liwia Å›ledzenie, ktÃ³re rekordy danych zostaÅ‚y juÅ¼ zreplikowane miÄ™dzy ÅºrÃ³dÅ‚em a celem. Pozwala to kopiowaÄ‡ tylko nowe lub zaktualizowane rekordy w kaÅ¼dej iteracji procesu synchronizacji.

# ðŸ”‘ Kluczowe punkty

- **Kursor Å›ledzi postÄ™p synchronizacji inkrementalnej** â€“ zapamiÄ™tuje ostatni zreplikowany rekord na podstawie wybranego pola (np. `updated_at`).
- **ZnaczÄ…co optymalizuje przepÅ‚yw danych** â€“ zamiast peÅ‚nej replikacji, przesyÅ‚ane sÄ… wyÅ‚Ä…cznie nowe/zmienione dane.
- **Pole kursora powinno byÄ‡ monotonicznie rosnÄ…ce** (np. data utworzenia/aktualizacji, numer sekwencyjny, id).
- **Airbyte automatycznie uÅ¼ywa wartoÅ›ci kursora w zapytaniach** do systemu ÅºrÃ³dÅ‚owego â€“ pobierajÄ…c tylko Å›wieÅ¼e rekordy.
- **Synchronizacja oparta na kursorach** to standard w skalowalnych, efektywnych pipelineâ€™ach ETL/ELT.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Jak dziaÅ‚a kursor w synchronizacji przyrostowej?

1. **Pierwsza synchronizacja:**
    - Airbyte pobiera wszystkie rekordy ze ÅºrÃ³dÅ‚a i zapisuje najwyÅ¼szÄ… wartoÅ›Ä‡ kursora.
2. **Kolejne synchronizacje:**
    - Zapytania do ÅºrÃ³dÅ‚a zawierajÄ… warunek na pole kursora, np. `WHERE updated_at > [ostatni zapisany kursor]`.
    - Pobierane sÄ… jedynie zmienione lub Å›wieÅ¼o dodane rekordy.

**PrzykÅ‚ad praktyczny:**

- Pole kursora: `updated_at` (timestamp).
- Ostatnia synchronizacja: max(`updated_at`) = 2025-07-12 16:00.
- Nowe zapytanie: rekordy z `updated_at` > 2025-07-12 16:00.

## Zalety stosowania kursora

- Redukcja obciÄ…Å¼enia sieci i systemÃ³w â€“ nie przesyÅ‚asz duplikatÃ³w.
- Szybsze przetwarzanie duÅ¼ych zbiorÃ³w (np. w codziennych pipelineâ€™ach BI).
- Zmniejsza ryzyko pominiÄ™cia lub podwÃ³jnej replikacji rekordÃ³w (gdy pole kursora monotoniczne i unikalne).
- Pozwala na ciÄ…gÅ‚y streaming lub zaplanowane batchowe odÅ›wieÅ¼anie danych.

## WybÃ³r pola kursora

- Najlepiej sprawdza siÄ™ kolumna typu data/godzina (`updated_at`, `created_at`), ale rÃ³wnie dobrze moÅ¼e to byÄ‡ rosnÄ…ca liczba (np. id).
- Pole musi byÄ‡ odporne na cofanie siÄ™ wartoÅ›ci i powinno jasno wskazywaÄ‡ kolejnoÅ›Ä‡ â€œnowoÅ›ciâ€ rekordu.
- Å¹le dobrane pole kursora moÅ¼e skutkowaÄ‡ utratÄ… czÄ™Å›ci danych lub ponownÄ… replikacjÄ… tych samych rekordÃ³w.

# ðŸ’¡ PrzykÅ‚ad zastosowania w Airbyte

**PrzykÅ‚ad 1:**  
Synchronizacja bazy Postgres z hurtowniÄ… Snowflake:

- Pole kursor: `last_modified`
- Airbyte rejestruje max(`last_modified`) po kaÅ¼dym tasku.
- Przy kolejnym uruchomieniu pipeline, pobiera tylko rekordy gdzie `last_modified` > ostatni kursor.

**PrzykÅ‚ad 2:**  
API do systemÃ³w SaaS (np. CRM):

- API czÄ™sto udostÄ™pnia pole `lastSyncToken` lub `since_timestamp`.
- Airbyte automatycznie uzupeÅ‚nia wartoÅ›Ä‡ kursora na podstawie poprzedniego eksportu.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://airbyte.com/tutorials/incremental-data-synchronization](https://airbyte.com/tutorials/incremental-data-synchronization)
- [https://docs.airbyte.com/understanding-airbyte/sync-modes/incremental](https://docs.airbyte.com/understanding-airbyte/sync-modes/incremental)
- [https://docs.airbyte.com/connector-development/cursor-field](https://docs.airbyte.com/connector-development/cursor-field)
- [https://mode.com/sql-tutorial/sql-cursors/](https://mode.com/sql-tutorial/sql-cursors/)

# ðŸ‘½ Brudnopis

- Kursor = wskaÅºnik synchronizacji, zapisuje â€œdo ktÃ³rego momentu przetworzono daneâ€
- Standard nie tylko w Airbyte, ale teÅ¼ Fivetran, Informatica, Talend, Apache NiFi
- Typowe sytuacje: codzienne zasilanie DWH, inkrementalny monitoring zmian (CDC)
- Wyzwaniem: typ pola, obsÅ‚uga opÃ³ÅºnieÅ„ (lag), duplikaty, soft-delete
- â€œKursor czasowyâ€ preferowany, ale moÅ¼na uÅ¼ywaÄ‡ niepowtarzalnego id
- W Airbyte obsÅ‚uga field cursor na poziomie connectora i konfigurowalna w UI