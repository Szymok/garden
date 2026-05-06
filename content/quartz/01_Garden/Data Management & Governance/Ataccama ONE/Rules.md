---

title: Rules  
created: 2025-04-01  
status: 🌱 draft
category: data governance / jakoÅ›Ä‡ danych  
difficulty: Å›redni  
language: pl  
tags:

- reguÅ‚y
- jakoÅ›Ä‡ danych
- wykrywanie terminÃ³w
- transformacja danych
- walidacja  
aliases:
- reguÅ‚y danych
- rules engine
- DQ rules

---

# ðŸŽ¯ Definicja

**Rules (reguÅ‚y)** w kontekÅ›cie zarzÄ…dzania danymi w Ataccama ONE to formalne, logiczne zasady definiujÄ…ce operacje walidacyjne, transformacyjne lub detekcyjne stosowane na danych. ReguÅ‚y sÄ… wykorzystywane do oceny jakoÅ›ci danych, wykrywania terminÃ³w sÅ‚ownikowych oraz zapewnienia zgodnoÅ›ci metadanych i treÅ›ci danych z politykami organizacji.

# ðŸ”‘ Kluczowe punkty

- ðŸ“¦ W Ataccama wyrÃ³Å¼niamy dwa gÅ‚Ã³wne typy reguÅ‚:
    1. [[Detection rules]] â€“ sÅ‚uÅ¼Ä… do wykrywania terminÃ³w sÅ‚ownikowych na poziomie atrybutÃ³w.
    2. [[Data Quality Evaluation rules]] â€“ sÅ‚uÅ¼Ä… do walidacji, monitorowania i oceny jakoÅ›ci danych.
- âš™ï¸ ReguÅ‚y mogÄ… byÄ‡ konfigurowane przez:
    - Condition Builder (interfejs graficzny),
    - Advanced Expression (jÄ™zyk wyraÅ¼eÅ„ logicznych, np. DSL),
    - Component (zaawansowany blok przetwarzania danych).
- ðŸ” ReguÅ‚y moÅ¼na przypinaÄ‡ do terminÃ³w, kolumn, plikÃ³w oraz aktywowaÄ‡ w harmonogramach monitorujÄ…cych.
- ðŸ§  ReguÅ‚y sÄ… stosowane dynamicznie â€” nie modyfikujÄ… danych ÅºrÃ³dÅ‚owych, lecz analizujÄ… ich jakoÅ›Ä‡ i zgodnoÅ›Ä‡.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Typy reguÅ‚ danych

|Typ reguÅ‚y|Cel|PrzykÅ‚ad|
|---|---|---|
|Detekcja terminu (Detection)|Automatyczne przypisanie terminu sÅ‚ownikowego|Wykrycie, Å¼e `email_address` oznacza â€žCustomer Emailâ€|
|Walidacja (DQ Evaluation)|Sprawdzenie, czy dane sÄ… poprawne zgodnie z logikÄ… biznesowÄ…|`date_of_birth < today()`|
|Transformacja|Konwersja wartoÅ›ci (np. `UPPER(email)`)|Zmiana â€žplâ€ na â€žPLâ€|
|Standaryzacja|Ujednolicanie formatÃ³w, np. NIP, data|2023/01/01 â†’ 01-01-2023|
|Korekcja|Automatyczne poprawki znanych bÅ‚Ä™dÃ³w|Zmieniono â€ž0â‚¬â€ na â€ž0.00â€|

## Techniczne formaty konfiguracji

### 1. Condition Builder

Interfejs graficzny pozwalajÄ…cy budowaÄ‡ reguÅ‚y bez kodowania, np.:  
`Column name contains 'email'` AND `Data type is STRING`

### 2. Advanced Expression (DSL)

```python
value.matches("^[A-Za-z0-9_.+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}$")
```

### 3. Component

ZÅ‚oÅ¼ony komponent uÅ¼ycia w pipeline przetwarzania, np. maskowanie, czyszczenie, enrich.

## Cykl Å¼ycia reguÅ‚y

1. Tworzenie â†’ 2. Testowanie na zbiorze â†’ 3. Przypisanie do elementu katalogowego â†’ 4. Profilowanie/reguÅ‚a DQ â†’ 5. Alert lub raport

## Gdzie sÄ… stosowane reguÅ‚y?

- Tabele w katalogu danych ([[Catalog Items]])
- Pojedyncze kolumny / atrybuty
- Dane zidentyfikowane jako PII lub krytyczne
- Terminy przypisane w sÅ‚owniku biznesowym
- W raporach obserwowalnoÅ›ci i dashboardach DQ

# ðŸ’¡ PrzykÅ‚ad zastosowania

```python
# ReguÅ‚a walidujÄ…ca adres e-mail (DSL format)
IF NOT value.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$") THEN 
  REPORT "Invalid email format"
```

UÅ¼ytkownik przypina tÄ™ reguÅ‚Ä™ do wszystkich kolumn przypisanych do terminu â€žCustomer Emailâ€. W kaÅ¼dej synchronizacji z danymi rejestrowane sÄ… przypadki niedopasowania â€“ dane moÅ¼na naprawiaÄ‡ w workflow z Data Stewardem.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://learn.microsoft.com/en-us/fabric/data/data-rules-overview](https://learn.microsoft.com/en-us/fabric/data/data-rules-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules](https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules)
- [https://www.talend.com/resources/data-quality-rules-definition/](https://www.talend.com/resources/data-quality-rules-definition/)

# ðŸ‘½ Brudnopis

- W [[InÅ¼ynieria Danych|DataOps]] â†’ rules = repeatable logic block + reusable
- [[Detection rules]] â†’ przypisywane przy Data Discovery / Profilowanie
- DQ Rules â†’ zasilajÄ… dashboard jakoÅ›ci, alerty, raporty kierunkowe
- Dobrze ustawiÄ‡ statusy: Passed / Warning / Failed â†’ automatyzacja flagowania
- Rule repo = centrum wiedzy dziedzinowej + checklist Quality Management Framework---

title: Rules  
created: 2025-04-01  
status: 🌱 draft
category: [[Data Governance]] / jakoÅ›Ä‡ danych  
difficulty: Å›redni  
language: pl  
tags:

- reguÅ‚y
- jakoÅ›Ä‡ danych
- wykrywanie terminÃ³w
- [[Transformacja danych]]
- walidacja  
    aliases:
- reguÅ‚y danych
- rules engine
- DQ rules

---

# ðŸŽ¯ Definicja

**Rules (reguÅ‚y)** w kontekÅ›cie zarzÄ…dzania danymi w Ataccama ONE to formalne, logiczne zasady definiujÄ…ce operacje walidacyjne, transformacyjne lub detekcyjne stosowane na danych. ReguÅ‚y sÄ… wykorzystywane do oceny jakoÅ›ci danych, wykrywania terminÃ³w sÅ‚ownikowych oraz zapewnienia zgodnoÅ›ci metadanych i treÅ›ci danych z politykami organizacji.

# ðŸ”‘ Kluczowe punkty

- ðŸ“¦ W Ataccama wyrÃ³Å¼niamy dwa gÅ‚Ã³wne typy reguÅ‚:
    1. [[Detection rules]] â€“ sÅ‚uÅ¼Ä… do wykrywania terminÃ³w sÅ‚ownikowych na poziomie atrybutÃ³w.
    2. [[Data Quality Evaluation rules]] â€“ sÅ‚uÅ¼Ä… do walidacji, monitorowania i oceny jakoÅ›ci danych.
- âš™ï¸ ReguÅ‚y mogÄ… byÄ‡ konfigurowane przez:
    - Condition Builder (interfejs graficzny),
    - Advanced Expression (jÄ™zyk wyraÅ¼eÅ„ logicznych, np. DSL),
    - Component (zaawansowany blok przetwarzania danych).
- ðŸ” ReguÅ‚y moÅ¼na przypinaÄ‡ do terminÃ³w, kolumn, plikÃ³w oraz aktywowaÄ‡ w harmonogramach monitorujÄ…cych.
- ðŸ§  ReguÅ‚y sÄ… stosowane dynamicznie â€” nie modyfikujÄ… danych ÅºrÃ³dÅ‚owych, lecz analizujÄ… ich jakoÅ›Ä‡ i zgodnoÅ›Ä‡.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Typy reguÅ‚ danych

|Typ reguÅ‚y|Cel|PrzykÅ‚ad|
|---|---|---|
|Detekcja terminu (Detection)|Automatyczne przypisanie terminu sÅ‚ownikowego|Wykrycie, Å¼e `email_address` oznacza â€žCustomer Emailâ€|
|Walidacja (DQ Evaluation)|Sprawdzenie, czy dane sÄ… poprawne zgodnie z logikÄ… biznesowÄ…|`date_of_birth < today()`|
|Transformacja|Konwersja wartoÅ›ci (np. `UPPER(email)`)|Zmiana â€žplâ€ na â€žPLâ€|
|Standaryzacja|Ujednolicanie formatÃ³w, np. NIP, data|2023/01/01 â†’ 01-01-2023|
|Korekcja|Automatyczne poprawki znanych bÅ‚Ä™dÃ³w|Zmieniono â€ž0â‚¬â€ na â€ž0.00â€|

## Techniczne formaty konfiguracji

### 1. Condition Builder

Interfejs graficzny pozwalajÄ…cy budowaÄ‡ reguÅ‚y bez kodowania, np.:  
`Column name contains 'email'` AND `Data type is STRING`

### 2. Advanced Expression (DSL)

```python
value.matches("^[A-Za-z0-9_.+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}$")
```

### 3. Component

ZÅ‚oÅ¼ony komponent uÅ¼ycia w pipeline przetwarzania, np. maskowanie, czyszczenie, enrich.

## Cykl Å¼ycia reguÅ‚y

1. Tworzenie â†’ 2. Testowanie na zbiorze â†’ 3. Przypisanie do elementu katalogowego â†’ 4. Profilowanie/reguÅ‚a DQ â†’ 5. Alert lub raport

## Gdzie sÄ… stosowane reguÅ‚y?

- Tabele w katalogu danych ([[Catalog Items]])
- Pojedyncze kolumny / atrybuty
- Dane zidentyfikowane jako PII lub krytyczne
- Terminy przypisane w sÅ‚owniku biznesowym
- W raporach obserwowalnoÅ›ci i dashboardach DQ

# ðŸ’¡ PrzykÅ‚ad zastosowania

```python
# ReguÅ‚a walidujÄ…ca adres e-mail (DSL format)
IF NOT value.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$") THEN 
  REPORT "Invalid email format"
```

UÅ¼ytkownik przypina tÄ™ reguÅ‚Ä™ do wszystkich kolumn przypisanych do terminu â€žCustomer Emailâ€. W kaÅ¼dej synchronizacji z danymi rejestrowane sÄ… przypadki niedopasowania â€“ dane moÅ¼na naprawiaÄ‡ w workflow z Data Stewardem.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://learn.microsoft.com/en-us/fabric/data/data-rules-overview](https://learn.microsoft.com/en-us/fabric/data/data-rules-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules](https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules)
- [https://www.talend.com/resources/data-quality-rules-definition/](https://www.talend.com/resources/data-quality-rules-definition/)

# ðŸ‘½ Brudnopis

- W [[InÅ¼ynieria Danych|DataOps]] â†’ rules = repeatable logic block + reusable
- [[Detection rules]] â†’ przypisywane przy Data Discovery / Profilowanie
- DQ Rules â†’ zasilajÄ… dashboard jakoÅ›ci, alerty, raporty kierunkowe
- Dobrze ustawiÄ‡ statusy: Passed / Warning / Failed â†’ automatyzacja flagowania
- Rule repo = centrum wiedzy dziedzinowej + checklist Quality Management Framework