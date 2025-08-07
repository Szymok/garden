---

title: Data Quality Evaluation Rules  
created: 2025-04-01  
status:  
category: data quality / governance  
difficulty: średni  
language: pl  
tags:

- jakość danych
- reguły walidacyjne
- data governance
- DQ rules  
aliases:
- reguły jakości danych
- DQ evaluation rules
- reguły ewaluacyjne DQ

---

# 🎯 Definicja

**Data Quality Evaluation [[Rules]]** (reguły ewaluacji jakości danych) to zestandaryzowane reguły walidacyjne stosowane do oceny poprawności, spójności, kompletności i zgodności danych w ramach obiektów katalogowych ([[Catalog Items]]). Reguły te są podstawowym narzędziem pomiaru i monitorowania jakości danych w systemach [[data governance]], takich jak Ataccama ONE.

# 🔑 Kluczowe punkty

- ✅ Stosowane bezpośrednio do danych lub pośrednio — przez mapowanie na termin słownikowy (Glossary Term).
- 🧪 Ocena danych według kryteriów: czy dane spełniają konkretne warunki logiczne/wzorcowe.
- 📊 Wspierają monitoring danych i budowę dashboardów jakości danych (DQ Dashboards).
- 🔁 Mogą być uruchamiane ręcznie lub w ustalonym harmonogramie.
- 💾 Reguły mogą być tworzone i zarządzane zarówno z poziomu aplikacji webowej, jak i narzędzia ONE Desktop.

# 📚 Szczegółowe wyjaśnienie

Reguły oceny jakości danych stanowią jeden z kluczowych filarów platformy Ataccama ONE.

## Główne zastosowania

- **Walidacja danych operacyjnych** (np. brakujące wartości, niespójności dat).
- **Monitorowanie danych krytycznych** — np. dane klientów, transakcji, wskaźników finansowych.
- **Zgodność z terminami słownikowymi** — przypisanie reguły do terminu np. „PESEL”, „Customer Email”.
- **Wspomaganie klasyfikacji wrażliwości danych** — np. PII, dane wrażliwe.

## Główne typy reguł

|Typ|Opis|
|---|---|
|Validation Rule|Sprawdza, czy wartość spełnia logiczne warunki (np. nie jest NULL, format email OK)|
|Pattern Rule|Porównuje dane do ustalonego wzorca (np. regex na NIP, e-mail)|
|Range Rule|Sprawdza, czy wartości liczbowo/czasowo mieszczą się w akceptowalnym zakresie|
|Referential Rule|Sprawdza, czy wartość występuje na liście wartości referencyjnych (LOV)|
|Uniqueness Rule|Sprawdza unikalność wartości w kolumnie|
|Cross-column Rule|Sprawdza relacje między kolumnami (np. start_date < end_date)|

## Gdzie można je zastosować

- Do pojedynczych kolumn (np. `email_address`)
- Do terminów słownikowych („Customer Email”) — wtedy stosowane automatycznie na wszystkich powiązanych atrybutach
- Do całych tabel lub plików danych
- W projektach jakości danych (Data Quality Monitoring Projects)

## Jak są tworzone

- **Web UI (ONE Web)** — przez kreator Condition Builder lub Advanced Expression (DSL)
- **ONE Desktop** — jako komponent w planie walidacyjnym

Każda reguła może zawierać definicję logiczną, nazwę użytkową, klasyfikację, typ wyniku (Passed / Failed / Warning) oraz parametry (np. wartości progowe alertów).

# 💡 Przykład zastosowania

### Reguła jakości dla e-mail

```plaintext
IF value matches pattern ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ THEN Passed ELSE Failed
```

Przypisana do terminu „Customer Email” zastosuje się automatycznie np. do kolumn `email_address`, `contact_email`.

### W pseudokodzie:

```python
define_rule(
  name="Valid Email Format",
  scope="Glossary Term: Customer Email",
  logic="MatchesRegex(\"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$\")"
)
```

Wyniki reguł są raportowane na dashboardach DQ, zliczane jako Passed/Failed i mogą służyć jako trigger w alertach lub workflow stewardów danych.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules](https://help.collibra.com/docs/collibra/latest/Data_Quality_Rules)
- [https://learn.microsoft.com/en-us/fabric/data/data-rules-overview](https://learn.microsoft.com/en-us/fabric/data/data-rules-overview)
- [https://www.informatica.com/products/data-quality.html](https://www.informatica.com/products/data-quality.html)

# 👽 Brudnopis

- DQ Eval Rule = główna metoda mierzenia realnej jakości danych w czasie
- Zależne od: zasobu, terminu, jakości referencyjnej, parametrów
- Można zagnieżdżać reguły, łączyć logicznie, przypisywać do planów DQ, tworzyć alerty
- Dobrze zaprojektowany zasób + dobrze przypisane terminy = DQ Rules same się uruchamiają
- Lepiej używać terminów niż kolumn — automatyzacja, dziedziczenie, skalowalność