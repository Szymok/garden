---

title: Manual Profiling  
created: 2025-05-06  
status:  
category: data quality / data discovery  
difficulty: podstawowy  
language: pl  
tags:

- profilowanie danych
- data quality
- discovery
- data observability  
aliases:
- ręczne profilowanie
- manualne profilowanie
- pełne profilowanie danych

---

# 🎯 Definicja

**Manual Profiling (ręczne profilowanie danych)** to proces ręcznego uruchamiania analiz strukturalnych i jakościowych danych w źródle przy użyciu funkcji platformy katalogowania danych. Profilowanie pozwala użytkownikowi uzyskać szczegółowe informacje o zawartości, strukturze i jakości danych, zanim zostaną one użyte w dalszych procesach analitycznych, integracyjnych lub raportowych.

# 🔑 Kluczowe punkty

- 🧪 Profilowanie może obejmować tylko metadane, próbki danych lub pełną analizę jakościową.
- ✋ W przeciwieństwie do automatycznego profilowania, manual profiling umożliwia dokładniejszą kontrolę zakresu i momentu analizy.
- 🎯 Trzy główne opcje profilowania:
    1. **Import to catalog** — tylko import metadanych (struktura tabel i kolumn),
    2. **Discover** — szybkie profilowanie próbki danych,
    3. **Full Profile** — pełna analiza jakościowa na rzeczywistych danych.

# 📚 Szczegółowe wyjaśnienie

## Główne typy manualnego profilowania

|Tryb|Opis|
|---|---|
|Import to catalog|Importuje tylko metadane (nazwy, typy danych, długości kolumn). Bez analizy jakościowej.|
|Discover (profil próbki)|Analiza próbki danych — umożliwia szybkie poznanie rozkładów danych, typowych wartości, długości itp.|
|Profile (pełne profilowanie)|Pełna analiza danych: null rate, unikalne wartości, min/max, długości, dystrybucje, wzorce, wykrywanie anomalii.|

## Przebieg ręcznego profilowania

1. Użytkownik przechodzi do sekcji **Connection Browser** i wybiera źródło danych.
2. Zaznacza konkretne zasoby (np. tabelę `orders`, `customers`, `products`).
3. Wybiera odpowiednią akcję:
    - 🔹 Import to Catalog
    - 🔹 Discover
    - 🔹 Full Profile
4. System rozpoczyna profilowanie i prezentuje wyniki w dashboardzie jakości danych.

## Wygenerowane dane profilujące mogą obejmować:

- liczbę wierszy i kolumn,
- procent wartości pustych (null rate),
- liczby unikalnych wartości (distinct count),
- przykładowe wartości,
- dominujące wzorce (np. numery telefonów, e-maile),
- zakresy, długości, wartości ekstremalne,
- rozkład statystyczny wartości.

# 💡 Przykład zastosowania

Pracownik działu jakości danych chce sprawdzić jakość nowo podłączonej tabeli `customers`.

- Przechodzi do połączenia z bazą danych → wybiera `customers`
- Uruchamia opcję **Full Profile**
- System wygeneruje:
    - informacje o typach danych i strukturze,
    - alert o 19% rekordów z pustym `email`,
    - największe wartości w `customer_id`, nietypowe rekordy w `phone_number`.

Na tej podstawie Data Steward może:

- zidentyfikować problemy z jakością danych,
- przypisać termin słownikowy (`Customer Email`),
- uruchomić reguły DQ lub uruchomić DQ Score dla tej tabeli.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.informatica.com/products/data-quality.html](https://www.informatica.com/products/data-quality.html)
- [https://docs.collibra.com/](https://docs.collibra.com/)
- [https://learn.microsoft.com/en-us/fabric/data/profiling-overview](https://learn.microsoft.com/en-us/fabric/data/profiling-overview)

# 👽 Brudnopis

- Profilowanie ≠ tylko struktura — to także insighty jakościowe i detekcja anomalii
- Tryb „Discover”: szybkie, lekkie, tylko próbka (<= np. 1000 rekordów)
- Pełne Profilowanie: najbogatsze, cięższe operacyjnie
- Bardzo przydatne przed DQ, ML, mapowaniem terminów — poznaj dane zanim je zautomatyzujesz
- Profilowanie może odpalać downstream: alerty, workflow, rekomendacje glossary terms