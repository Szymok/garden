---

title: Detection Rules  
created: 2025-04-01  
status:  
category: data governance / słownik terminów  
difficulty: podstawowy  
language: pl  
tags:

- wykrywanie terminów
- glossary terms
- reguły detekcyjne
- data discovery
- katalog danych  
aliases:
- reguły wykrywania
- detection rules
- reguły przypisywania terminów

---

# 🎯 Definicja

**Detection Rules** (reguły wykrywania) to reguły logiczne używane w procesie automatycznego przypisywania terminów słownikowych do atrybutów technicznych (np. kolumn w tabelach) w katalogu danych. Wykorzystywane są podczas procesu data discovery i służą do semantycznej klasyfikacji danych bez ingerencji ręcznej.

# 🔑 Kluczowe punkty

- 🧠 Używane wyłącznie do automatycznego wykrywania i przypisywania terminów słownikowych (Glossary Terms).
- ⚙️ Nie są stosowane do sprawdzania jakości danych (tj. nie są używane w monitorowaniu ani raportowaniu DQ).
- 🕸️ Można je łączyć z algorytmami AI, które sugerują przypisania na podstawie podobieństw i wzorców.
- 🌐 Tworzy się je wyłącznie w interfejsie webowym (ONE Web) — nie są dostępne w One Desktop ani jako komponent do pobrania.
- 🧩 Bazują na regułach opartych na metadanych, danych lub obu (nazwa kolumny, typ danych, wartości, długości itd.).

# 📚 Szczegółowe wyjaśnienie

## Główne zastosowanie

Detection Rules są aktywowane w czasie profilowania danych lub uruchamiania procesu wykrywania (data discovery). Ich celem jest automatyczna identyfikacja, że dana kolumna odpowiada znanemu terminowi, np.:

- Kolumna `email_address` → przypisany termin: „Customer Email”
- Kolumna `birth_date` → przypisany termin: „Date of Birth (DOB)”

## Typowe warunki używane w regule

- Nazwa kolumny zawiera określony ciąg (`contains`, `startsWith`, `endsWith`)
- Długość danych w kolumnie mieści się w zadanym zakresie
- Wartości danych pasują do wzorca (np. regex)
- Typ danych jest zgodny z oczekiwanym (np. `STRING`, `DATE`)
- Kolumna zawiera dane z referencyjnej listy wartości (LOV)

## Formaty konfiguracji

1. **Condition Builder** (graficzny kreator warunków)  
    Przykład:
    
    - Column name contains "email"
    - Data type is "STRING"
2. **Advanced Expression** (DSL)  
    Przykład:
    
    ```plaintext
    value.matches("^[A-Za-z0-9._%+-]+@.+$")
    ```
    
3. **Progi (Thresholds)** – definiowanie, z jaką pewnością AI musi zgadzać się z regułą, aby przypisanie zostało wykonane automatycznie.
    

## Co NIE jest możliwe z Detection Rules:

- ❌ Nie można ich stosować do **walidacji lub monitorowania jakości danych** (do tego służą Data Quality Evaluation Rules).
- ❌ Nie można ich używać jako komponentów w planach ONE Desktop.
- ❌ Nie można ich wykorzystać do wyzwalaczy ani generowania alertów.
- ❌ Nie można ich pobrać, eksportować ani uruchamiać manualnie na atrybucie — stosowane są automatycznie w czasie wywołania odkrywania danych (discovery).

# 💡 Przykład zastosowania

### Przykład 1: (Condition Builder)

Zasada dla wykrycia terminu „Customer Email”:

- Kolumna zawiera słowo „email”
- Typ danych = `STRING`
- Liczba znaków > 5
- Wartości pasują do wzorca e-mail

### Przykład 2: (DSL – wyrażenie zaawansowane)

```plaintext
column_name.contains("phone") AND data_type == "STRING"
```

Stosując taką regułę do kolumn `user_phone`, `mobile_number_phone`, system wykryje termin „Customer Phone Number”.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://www.collibra.com/blog/business-glossary-vs-data-catalog](https://www.collibra.com/blog/business-glossary-vs-data-catalog)
- [https://www.dataversity.net/glossary-term/detection-rule/](https://www.dataversity.net/glossary-term/detection-rule/)
- [https://learn.microsoft.com/en-us/fabric/data/data-categorization](https://learn.microsoft.com/en-us/fabric/data/data-categorization)

# 👽 Brudnopis

- To nie są "rules" DQ – tylko do etapu "interpretacji" danych
- Działają blisko AI (ich skuteczność można wzmacniać przez feedback loop)
- Rekomendacja: używać wielu warunków oraz progów z ostrożnością
- Typowy pipeline: discovery → detection → przypisanie → walidacja stewards
- Kluczowy krok w semi-automatycznym katalogowaniu dużych środowisk danych