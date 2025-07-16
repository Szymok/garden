---

title: List of Values (Ataccama)  
created: 2025-04-04  
status:  
category: data quality / data governance  
difficulty: podstawowy  
language: pl  
tags:

- wartości referencyjne
- jakość danych
- Ataccama
- data governance
- walidacja  
aliases:
- lista dopuszczalnych wartości
- list of values
- LOV

---

# 🎯 Definicja

**List of Values (LOV)** w kontekście platformy Ataccama odnosi się do zdefiniowanego zbioru dozwolonych lub oczekiwanych wartości dla danego atrybutu danych. Listy te mogą być wykorzystywane przy walidacji danych, klasyfikacji, tworzeniu słowników wartości, filtrowaniu oraz przypisywaniu terminów biznesowych.

# 🔑 Kluczowe punkty

- 📦 LOV to referencyjna lista akceptowalnych lub standardowych wartości dla danego pola (np. statusy: "aktywne", "nieaktywne", "oczekujące").
- 🧪 Wykorzystywana w regułach jakości danych do walidacji — np. czy wartość pola znajduje się na liście dopuszczalnych.
- 🔄 Obsługiwane są zarówno statyczne listy wpisywane ręcznie, jak i dynamiczne listy importowane z plików lub systemów zewnętrznych (np. MDM, API).
- 🔍 LOV są używane w Condition Builder podczas definiowania Detection Rules oraz Data Quality Rules.
- 🧠 Mogą być mapowane do terminów słownika i używane w przypisaniach semantycznych.

# 📚 Szczegółowe wyjaśnienie

## Sposoby użycia List of Values w Ataccama ONE

1. **Walidacja danych w profilowaniu i regułach DQ**
    
    - Przykład: Kolumna `order_status` powinna mieć tylko wartości z listy: `["NEW", "PROCESSING", "SHIPPED", "CANCELLED"]`.
2. **Wykrywanie terminów biznesowych (Detection Rules)**
    
    - LOV może być wskazana jako referencja do zdefiniowania warunku, np. „is from reference data”.
3. **Filtrowanie atrybutów katalogu**
    
    - Można filtrować kolumny zawierające wartości spośród zadanego LOV.
4. **Zarządzanie słownikami wartości**
    
    - W ramach masterowania danych lub spójnych referencji dla integracji między systemami.

## Tworzenie i zarządzanie LOV

- W zakładce "Global Settings → Reference Data" można utworzyć nową List of Values.
- Można ją:
    - zaimportować z CSV/XLS,
    - zintegrować z systemem zewnętrznym (np. SAP, CRM),
    - lub wpisać ręcznie.
- Listy mogą być powiązane z konkretnymi domenami danych lub atrybutami.

## Przykładowe typowe List of Values

|Nazwa LOV|Wartości|
|---|---|
|Country Codes|`["PL", "DE", "US", "FR", "CZ"]`|
|Order Status|`["NEW", "PROCESSING", "SHIPPED"]`|
|Payment Method|`["CARD", "CASH", "TRANSFER"]`|
|GDPR Sensitivity Level|`["LOW", "MEDIUM", "HIGH"]`|

# 💡 Przykład zastosowania

Przykład: Walidacja pola „kraj_pochodzenia” w regule jakości.

```plaintext
Reguła: wartość musi pochodzić z listy referencyjnej "Country Codes".
Konfiguracja: Rule type → Validation; Condition → is in List of Values "Country Codes".
Rezultat: każdy rekord spoza listy zostanie oznaczony jako naruszenie reguły.
```

Lub w pseudokodzie:

```python
if record["kraj_pochodzenia"] not in country_codes_LOV:
    flag_violation(record_id)
```

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.dataversity.net/what-is-reference-data/](https://www.dataversity.net/what-is-reference-data/)
- [https://help.collibra.com/docs/collibra/latest/Reference_Data](https://help.collibra.com/docs/collibra/latest/Reference_Data)

# 👽 Brudnopis

- LOV ≠ słownik terminów — to konkretna lista wartości (referencja), nie definicja semantyczna
- Często używana w integracji z MDM (np. listy państw, klasyfikacje PKD)
- W systemach klasy Ataccama, Collibra — LOV = podstawa do validacji i automatyzacji przypisań
- Przypisane LOV mogą zmieniać się dynamicznie — potrzebne audytowalne wersjonowanie
- Warto powiązać LOV z rolami stewardów i odpowiedzialnością domenową