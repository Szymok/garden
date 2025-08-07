---

title: Bus Matrix (Matryca Szyny Danych)  
created: 2025-07-16  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- bus matrix
- OLAP
- modelowanie wymiarowe
- SSAS
- BI  
aliases:
- Matryca wymiarów i miar
- Matrix wymiar-miara

---

# 🎯 Definicja

**Bus Matrix** (matryca szyny danych) to narzędzie koncepcyjne stosowane w modelowaniu wymiarowym i OLAP, służące do wizualnego przedstawienia powiązań pomiędzy możliwymi **miarami** ([[Fakty|facts]]) a **wymiarami** ([[Wymiary|dimensions]]). Pozwala szybko zidentyfikować, które miary mogą być analizowane w kontekście określonych wymiarów – stanowiąc mapę logiczną modelu analitycznego, szczególnie przydatną w projektowaniu hurtowni danych oraz kostek OLAP (np. Microsoft SSAS).

# 🔑 Kluczowe punkty

- Umożliwia projektantom modelu wymiarowego szybkie zobaczenie, które [[wymiary]] są współdzielone pomiędzy różnymi procesami biznesowymi lub obszarami danych (data marts).
- Pozwala optymalnie planować integrację miar i wymiarów w kostkach OLAP.
- Stanowi podstawę architektury „bus” według Kimballa: identyfikowania wspólnej szyny modeli wymiarowych.

# 📚 Szczegółowe wyjaśnienie

## Struktura Bus Matrix

Matryca prezentowana jest w formie dwuwymiarowej tabeli:

||Wymiar 1|Wymiar 2|Wymiar 3|...|
|---|---|---|---|---|
|**Miara A**|✓|✓|||
|**Miara B**|✓||✓||
|**Miara C**||✓|✓||

- **Wiersze** odpowiadają tabelom faktów (miarom/analitycznym procesom biznesowym, np. Sprzedaż, Zwroty, Aktywności użytkownika).
- **Kolumny** to [[wymiary]] (np. Klient, Produkt, Data, Kanał, Region).
- Zaznaczenie (`✓`) oznacza, że dana [[miara]] jest dostępna do analizy w kontekście danego wymiaru.

## Funkcje i zalety bus matrix

- **Projektowanie modelu wymiarowego:** pozwala na wykrycie i zaprojektowanie wspólnych wymiarów dla wielu procesów (reusable [[Wymiary|dimensions]]).
- **Optymalizacja modelowania OLAP:** wizualizuje możliwości analityczne — pomaga uniknąć duplikowania logiki w różnych kostkach czy data martach.
- **Spójność raportowania [[Business Intelligence|BI]]:** zapewnia, że każdy raport korzystający z danego wymiaru lub miary będzie operował na tych samych definicjach i powiązaniach.

## Przykład konstrukcji bus matrix

||Data|Klient|Produkt|Sklep|Sprzedawca|
|---|---|---|---|---|---|
|Sprzedaż|✓|✓|✓|✓|✓|
|Zwrot|✓|✓|✓|✓||
|Płatność|✓|✓||✓||
|Zamówienia|✓|✓|✓|||

W powyższej matrycy:

- **Sprzedaż** analizujemy per data, klient, produkt, sklep i sprzedawca,
- **Zwrot** nie jest związany bezpośrednio ze sprzedawcą,
- **Płatność** nie ma wymiaru Produkt.

# 💡 Przykład zastosowania Bus Matrix

Firma retail przygotowuje architekturę hurtowni danych i OLAP. Tworzy bus matrix, aby:

- Określić wspólne [[wymiary]] dla różnych miar biznesowych (np. sprzedaż, zwroty, płatności).
- Zaprojektować tzw. „conformed [[Wymiary|dimensions]]” – [[wymiary]] dzielone pomiędzy obszary/analityki (np. Klient, Data).
- Uczyć zespoły [[Business Intelligence|BI]] i Data Science, z jakimi wymiarami mogą korzystać przy budowie dashboardów i analiz.

Efekt: matryca służy jako „mapa drogowa” przy wdrażaniu nowych miar i modelowaniu kostek w Microsoft SSAS czy innych narzędziach OLAP.

# 📌 Źródła

- [Kimball Group – Importance of the Bus Matrix](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/the-data-warehouse-bus-matrix/)
- [Microsoft Docs — OLAP Models and the Bus Matrix](https://learn.microsoft.com/en-us/sql/analysis-services/multidimensional-models/dimensional-models-olap)
- [Star Schema and Bus Matrix – Vertabelo](https://vertabelo.com/blog/star-schema-and-the-bus-matrix/)
- [[[Modelowanie Wymiarowe|Dimensional Modeling]] and Bus Matrix – eTutorials.org](https://etutorials.org/Business+Intelligence/complete+reference/Chapter+8.+Dimensional+Modeling+DWH/8.5+The+Bus+Matrix/)

# 👽 Brudnopis

- Bus Matrix = centralna „szyna” wymiarów i miar dla Data Warehouse/OLAP (Kimball)
- Projektujesz raz – reużywasz wszędzie (conformed [[Wymiary|dimensions]])
- Bez bus matrix: ryzyko powielania wymiarów, chaos w analityce
- Stosowana głównie przy starcie projektów OLAP i [[Business Intelligence|BI]], szczególnie multiple data marts
- Krok: zidentyfikuj [[fakty]]/miary, następnie [[wymiary]], potem buduj matrycę powiązań