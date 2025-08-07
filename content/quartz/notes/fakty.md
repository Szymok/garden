---

title: Fakty  
created: 2025-07-16  
status: Final  
category: Data Modeling  
difficulty: podstawowy  
language: pl  
tags:

- modelowanie danych
- hurtownia danych
- data warehouse  
aliases:
- tabela faktów
- facts
- dane ilościowe

---

# 🎯 Definicja

**Fakty** to dane ilościowe, mierzalne wartości przechowywane w środowisku hurtowni danych, które opisują zdarzenia zachodzące w czasie — np. sprzedaże, transakcje, zużycia, wizyty. Są one centralnym elementem modelu hurtowni danych i są powiązane z tzw. tabelami wymiarów (dimension tables), które opisują kontekst tych faktów (kto, co, kiedy, gdzie).

# 🔑 Kluczowe punkty

- Fakty są zorientowane wokół **procesu biznesowego** (np. zakup, zamówienie, logowanie).
- Są **mierzalne** — zazwyczaj liczbowe (ilość, wartość, czas trwania, cena).
- Używane są do **analityki, raportowania, agregacji i miar [[KPI]]**.
- Istnieją różne typy faktów: addytywne, póładdytywne, nieaddytywne.
- Fakty są **łączone z wymiarami** za pomocą kluczy obcych (foreign keys).

# 📚 Szczegółowe wyjaśnienie

## Przykład: tabela faktów sprzedaży

|sale_id|customer_id|product_id|store_id|date_id|quantity|total_amount|
|---|---|---|---|---|---|---|
|1|10001|P001|S001|20250102|2|50.00|

- **sale_id** – identyfikator faktu (rekordu)
- **customer_id, product_id, store_id, date_id** – klucze obce do tabel wymiarów
- **quantity, total_amount** – dane ilościowe (miary)

## Rodzaje faktów

|Typ faktu|Opis|
|---|---|
|**Addytywne**|Dodawalne w każdym wymiarze (np. ilość sprzedaży, suma przychodu)|
|**Póładdytywne**|Dodawalne tylko w niektórych wymiarach (np. saldo – po czasie nie)|
|**Nieaddytywne**|Nie da się ich sumować (np. średnia temperatura, procent konwersji)|

## Fakty vs. [[wymiary]]

|Fakty|[[Wymiary]]|
|---|---|
|Ilościowe, mierzalne|Opisowe, kontekstowe|
|np. sprzedaż, koszt, ilość|np. klient, produkt, sklep, czas|
|Zmieniają się często|Rzadziej aktualizowane (wolnozmienne)|
|Duże objętości danych|Raczej mniejsze tabele referencyjne|

# 💡 Przykład zastosowania

W hurtowni danych dla sieci handlowej tabela faktów rejestruje wszystkie transakcje sprzedaży. Analitycy mogą zsumować dane wg daty i produktu, aby uzyskać trendy sprzedaży lub policzyć łączną wartość zamówień wg klientów — co zasila dashboardy [[Business Intelligence|BI]] i raporty [[KPI]].

## 📌 Źródła

- Kimball Group — The Data Warehouse Toolkit
- Star Schema Fundamentals: [https://www.vertabelo.com/blog/data-modeling/star-schema/](https://www.vertabelo.com/blog/data-modeling/star-schema/)
- Microsoft Learn – Introduction to star schema: [https://learn.microsoft.com/en-us/power-bi/guidance/star-schema](https://learn.microsoft.com/en-us/power-bi/guidance/star-schema)

## 👽 Brudnopis

- Fakty to „czynności mierzalne” – punkty transakcyjne: sprzedaż, wizyta, koszt
- Są centralnym punktem modelu gwiazdy (star schema)
- Don’t confuse: fakt ≠ zdarzenie logiczne → fakt to wartość + kontekst ([[wymiary]])
- Kluczowy podział: addytywność względem wymiarów
- Istotne przy projektowaniu agregacji, miar w systemach [[Business Intelligence|BI]]
- Często przechowywane jako dane partycjonowane po czasie (date_id)
- Współgrają z walidacją typu [[Slowly Changing Dimension (SCD)|SCD]] (wolnozmienne [[wymiary]])

---