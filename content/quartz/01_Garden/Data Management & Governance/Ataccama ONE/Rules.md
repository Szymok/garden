---

title: Rules  
created: 2025-04-01  
status: 🌱 draft
category: data governance / jakość danych  
difficulty: średni  
language: pl  
tags:

- reguły
- jakość danych
- wykrywanie terminów
- transformacja danych
- walidacja  
aliases:
- reguły danych
- rules engine
- DQ rules

---

# 🎯 Definicja

**Rules (reguły)** w kontekście zarządzania danymi w Ataccama ONE to formalne, logiczne zasady definiujące operacje walidacyjne, transformacyjne lub detekcyjne stosowane na danych. Reguły są wykorzystywane do oceny jakości danych, wykrywania terminów słownikowych oraz zapewnienia zgodności metadanych i treści danych z politykami organizacji.

# 🔑 Kluczowe punkty

- 📦 W Ataccama wyróżniamy dwa główne typy reguł:
    1. [[Detection rules]] – służą do wykrywania terminów słownikowych na poziomie atrybutów.
    2. [[Data Quality Evaluation rules]] – służą do walidacji, monitorowania i oceny jakości danych.
- ⚙️ Reguły mogą być konfigurowane przez:
    - Condition Builder (interfejs graficzny),
    - Advanced Expression (język wyrażeń logicznych, np. DSL),
    - Component (zaawansowany blok przetwarzania danych).
- 🔁 Reguły można przypinać do terminów, kolumn, plików oraz aktywować w harmonogramach monitorujących.
- 🧠 Reguły są stosowane dynamicznie — nie modyfikują danych źródłowych, lecz analizują ich jakość i zgodność.

# 📚 Szczegółowe wyjaśnienie

## Typy reguł danych

|Typ reguły|Cel|Przykład|
|---|---|---|
|Detekcja terminu (Detection)|Automatyczne przypisanie terminu słownikowego|Wykrycie, że `email_address` oznacza „Customer Email”|
|Walidacja (DQ Evaluation)|Sprawdzenie, czy dane są poprawne zgodnie z logiką biznesową|`date_of_birth < today()`|
|Transformacja|Konwersja wartości (np. `UPPER(email)`)|Zmiana „pl” na „PL”|
|Standaryzacja|Ujednolicanie formatów, np. NIP, data|2023/01/01 → 01-01-2023|
|Korekcja|Automatyczne poprawki znanych błędów|Zmieniono „0€” na „0.00”|

## Techniczne formaty konfiguracji

### 1. Condition Builder

Interfejs graficzny pozwalający budować reguły bez kodowania, np.:  
`Column name contains 'email'` AND `Data type is STRING`

### 2. Advanced Expression (DSL)

```python
value.matches("^[A-Za-z0-9_.+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}$")
```

### 3. Component

Złożony komponent użycia w pipeline przetwarzania, np. maskowanie, czyszczenie, enrich.

## Cykl życia reguły

1. Tworzenie → 2. Testowanie na zbiorze → 3. Przypisanie do elementu katalogowego → 4. Profilowanie/reguła DQ → 5. Alert lub raport

## Gdzie są stosowane reguły?

- Tabele w katalogu danych ([[Catalog Items]])
- Pojedyncze kolumny / atrybuty
- Dane zidentyfikowane jako PII lub krytyczne
- Terminy przypisane w słowniku biznesowym
- W raporach obserwowalności i dashboardach DQ

# 💡 Przykład zastosowania

```python
# Reguła walidująca adres e-mail (DSL format)
IF NOT value.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$") THEN 
  REPORT "Invalid email format"
```

Użytkownik przypina tę regułę do wszystkich kolumn przypisanych do terminu „Customer Email”. W każdej synchronizacji z danymi rejestrowane są przypadki niedopasowania – dane można naprawiać w workflow z Data Stewardem.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://learn.microsoft.com/en-us/fabric/data/data-rules-overview](https://learn.microsoft.com/en-us/fabric/data/data-rules-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules](https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules)
- [https://www.talend.com/resources/data-quality-rules-definition/](https://www.talend.com/resources/data-quality-rules-definition/)

# 👽 Brudnopis

- W [[Inżynieria Danych|DataOps]] → rules = repeatable logic block + reusable
- [[Detection rules]] → przypisywane przy Data Discovery / Profilowanie
- DQ Rules → zasilają dashboard jakości, alerty, raporty kierunkowe
- Dobrze ustawić statusy: Passed / Warning / Failed → automatyzacja flagowania
- Rule repo = centrum wiedzy dziedzinowej + checklist Quality Management Framework---

title: Rules  
created: 2025-04-01  
status: 🌱 draft
category: [[Data Governance]] / jakość danych  
difficulty: średni  
language: pl  
tags:

- reguły
- jakość danych
- wykrywanie terminów
- [[Transformacja danych]]
- walidacja  
    aliases:
- reguły danych
- rules engine
- DQ rules

---

# 🎯 Definicja

**Rules (reguły)** w kontekście zarządzania danymi w Ataccama ONE to formalne, logiczne zasady definiujące operacje walidacyjne, transformacyjne lub detekcyjne stosowane na danych. Reguły są wykorzystywane do oceny jakości danych, wykrywania terminów słownikowych oraz zapewnienia zgodności metadanych i treści danych z politykami organizacji.

# 🔑 Kluczowe punkty

- 📦 W Ataccama wyróżniamy dwa główne typy reguł:
    1. [[Detection rules]] – służą do wykrywania terminów słownikowych na poziomie atrybutów.
    2. [[Data Quality Evaluation rules]] – służą do walidacji, monitorowania i oceny jakości danych.
- ⚙️ Reguły mogą być konfigurowane przez:
    - Condition Builder (interfejs graficzny),
    - Advanced Expression (język wyrażeń logicznych, np. DSL),
    - Component (zaawansowany blok przetwarzania danych).
- 🔁 Reguły można przypinać do terminów, kolumn, plików oraz aktywować w harmonogramach monitorujących.
- 🧠 Reguły są stosowane dynamicznie — nie modyfikują danych źródłowych, lecz analizują ich jakość i zgodność.

# 📚 Szczegółowe wyjaśnienie

## Typy reguł danych

|Typ reguły|Cel|Przykład|
|---|---|---|
|Detekcja terminu (Detection)|Automatyczne przypisanie terminu słownikowego|Wykrycie, że `email_address` oznacza „Customer Email”|
|Walidacja (DQ Evaluation)|Sprawdzenie, czy dane są poprawne zgodnie z logiką biznesową|`date_of_birth < today()`|
|Transformacja|Konwersja wartości (np. `UPPER(email)`)|Zmiana „pl” na „PL”|
|Standaryzacja|Ujednolicanie formatów, np. NIP, data|2023/01/01 → 01-01-2023|
|Korekcja|Automatyczne poprawki znanych błędów|Zmieniono „0€” na „0.00”|

## Techniczne formaty konfiguracji

### 1. Condition Builder

Interfejs graficzny pozwalający budować reguły bez kodowania, np.:  
`Column name contains 'email'` AND `Data type is STRING`

### 2. Advanced Expression (DSL)

```python
value.matches("^[A-Za-z0-9_.+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,}$")
```

### 3. Component

Złożony komponent użycia w pipeline przetwarzania, np. maskowanie, czyszczenie, enrich.

## Cykl życia reguły

1. Tworzenie → 2. Testowanie na zbiorze → 3. Przypisanie do elementu katalogowego → 4. Profilowanie/reguła DQ → 5. Alert lub raport

## Gdzie są stosowane reguły?

- Tabele w katalogu danych ([[Catalog Items]])
- Pojedyncze kolumny / atrybuty
- Dane zidentyfikowane jako PII lub krytyczne
- Terminy przypisane w słowniku biznesowym
- W raporach obserwowalności i dashboardach DQ

# 💡 Przykład zastosowania

```python
# Reguła walidująca adres e-mail (DSL format)
IF NOT value.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$") THEN 
  REPORT "Invalid email format"
```

Użytkownik przypina tę regułę do wszystkich kolumn przypisanych do terminu „Customer Email”. W każdej synchronizacji z danymi rejestrowane są przypadki niedopasowania – dane można naprawiać w workflow z Data Stewardem.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://learn.microsoft.com/en-us/fabric/data/data-rules-overview](https://learn.microsoft.com/en-us/fabric/data/data-rules-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules](https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules)
- [https://www.talend.com/resources/data-quality-rules-definition/](https://www.talend.com/resources/data-quality-rules-definition/)

# 👽 Brudnopis

- W [[Inżynieria Danych|DataOps]] → rules = repeatable logic block + reusable
- [[Detection rules]] → przypisywane przy Data Discovery / Profilowanie
- DQ Rules → zasilają dashboard jakości, alerty, raporty kierunkowe
- Dobrze ustawić statusy: Passed / Warning / Failed → automatyzacja flagowania
- Rule repo = centrum wiedzy dziedzinowej + checklist Quality Management Framework