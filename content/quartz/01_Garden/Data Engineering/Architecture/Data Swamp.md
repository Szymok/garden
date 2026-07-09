---

title: "Data Swamp"  
created: 2025-07-16  
status: 🌱 draft
category: inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- data swamp
- data governance
- data lake
- data quality  
aliases:
- bagienne jezioro danych

---

# 🎯 Definicja

**Data Swamp** to stan zaawansowanego chaosu w środowisku analitycznym, w którym zgromadzone dane (najczęściej w [[Data Lake|data lake]]) tracą użyteczność na skutek braku odpowiedniego zarządzania, katalogowania oraz kontroli jakości. Zamiast być wartościowym zasobem dla analiz, dane w "bagnie" stają się nieodnalezione, niewiarygodne i nieprzydatne dla biznesu.

# 🔑 Kluczowe punkty

- **Brak zarządzania i odpowiedzialności**: Główna przyczyna powstawania data swamp to porzucenie zasad [[Data Governance|data governance]], brak własności i jednoznacznych ról odpowiedzialności za dane.
- **Utrata dostępności i jakości**: Dane są nieopisane, nieskatalogowane, zduplikowane lub sprzeczne – trudno je znaleźć i zweryfikować, nie są aktualizowane.
- **Zjawisko na bazie [[Data Lake|Data Lake]], ale możliwe także w [[Data Warehouse|Data Warehouse]]**: Niezarządzane [[Data Lake|data lake]] to typowy przypadek, lecz zaniedbane hurtownie danych również mogą stać się bagnem.
- **Ryzyko niskiej wartości biznesowej**: Data swamp prowadzi do nieproduktywnych kosztów przechowania, utraty zaufania do danych oraz spadku efektywności analityków i zespołów AI.
- **Może być skutkiem hybrydowych modeli danych**: Złożone środowiska z elementami [[Data Lake|data lake]] i [[Data Warehouse|data warehouse]] szczególnie narażone są na chaos bez skutecznego zarządzania metadanymi.

# 📚 Pogłębione wyjaśnienie

## Czym różni się Data Swamp od [[Data Lake|Data Lake]]?

|Cecha|[[Data Lake|Data Lake]]|Data Swamp|
|---|---|---|
|Zarządzanie|Czytelna polityka governance, katalogowanie|Brak governance, brak katalogu, chaos|
|[[Jakość Danych|Jakość danych]]|Utrzymywana (monitoring, walidacja)|Zaniedbana, zduplikowana, sprzeczna|
|Wartość biznesowa|Wysoka, wspiera AI/ML/BI|Trudna do wykorzystania, niska wartość|
|Dostępność|Dane znajdywalne, opisywane, metadane|Dane zagubione, niejasne pochodzenie|

## Skąd się bierze Data Swamp?

- Brak właścicieli danych (data owners) i ról stewardów
- Brak centralnego katalogu i nieaktualne/lub brak metadanych
- Brak kontroli dostępu, duplikacja, nieaktualizowane dane
- Niedostateczna integracja procesów ETL/ELT oraz walidacji jakości
- Narzucenie [[Data Lake|data lake]] bez jasnej strategii i procesów zarządzania

## Konsekwencje dla organizacji

- Zaburzone raportowanie i analityka – trudno znaleźć zaufane dane
- Zwiększone koszty przechowywania
- Utrudnione projekty AI, ML, BI – modele uczone na błędnych danych
- Utrata przewagi konkurencyjnej przez opóźnienia w inicjatywach data-driven

# 💡 Praktyczny przykład

**Scenariusz:** Firma wdrożyła duże jezioro danych do przechowywania logów aplikacji, danych IoT i plików z wielu departamentów, ale nie zdefiniowała zasad gromadzenia, opisu, nadawania uprawnień oraz nie dba o katalogowanie.

- Po kilku miesiącach:
    - Analitycy nie wiedzą, które pliki są aktualne i jak są strukturyzowane.
    - Programiści kopiują pliki dla własnych potrzeb, tworząc duplikaty.
    - Dane stają się bezużyteczne, bo nie można im zaufać ani ich znaleźć.
- Rezultat: zespół zwraca się do starych, ręcznych procesów lub zewnętrznych danych. Jezioro staje się „bagnem” – utrzymywanym, ale bezużytecznym kosztem.

# 📌 Źródła

- [https://www.sciencedirect.com/science/article/pii/S2666389922000891](https://www.sciencedirect.com/science/article/pii/S2666389922000891)
- [https://tdwi.eu/pl/blog/jak-zapobiegac-zamianie-data-lake-w-data-swamp/](https://tdwi.eu/pl/blog/jak-zapobiegac-zamianie-data-lake-w-data-swamp/)
- [https://pl.atscale.com/resources/blog/data-swamp-vs-data-lake/](https://pl.atscale.com/resources/blog/data-swamp-vs-data-lake/)
- [https://www.dataversity.net/control-the-data-lake-before-it-becomes-a-data-swamp/](https://www.dataversity.net/control-the-data-lake-before-it-becomes-a-data-swamp/)
- [https://dataconomy.com/2019/07/16/how-to-avoid-the-data-swamp/](https://dataconomy.com/2019/07/16/how-to-avoid-the-data-swamp/)

# 👽 Brudnopis

- Data Swamp = "jezioro bez mapy" -> nieznane pochodzenie, nieznajdywalność, chaos.
- Governance, [[Data Catalog|data catalog]], [[Stewardship|stewardship]] – kluczowe mechanizmy prewencji.
- Możliwe nawet w [[Data Warehouse|Data Warehouse]] (zaniedbane, duplikowane tabele, przestarzałe raporty).
- Największy problem w skali enterprise, hybrydy (lake/warehouse/lakehouse) bez master-data-management.
- Przykłady: dane IoT, logi aplikacyjne, środowiska BI – z czasem powstaje galimatias danych.