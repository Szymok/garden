---

title: "Jakość Danych"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- jakość danych
- data quality
- monitoring danych
- testowanie danych  
aliases:
- data quality
- kontrola jakości danych

---

# 🎯 Definicja

**Jakość danych** to stopień, w jakim dane spełniają założone oczekiwania biznesowe i techniczne co do poprawności, kompletności, spójności i aktualności. Wysoka jakość danych pozwala na podejmowanie trafnych decyzji, budowę zaufania oraz poprawne działanie systemów analitycznych lub automatycznych.

# 🔑 Kluczowe punkty

- Jakość danych to **proces ciągły**, który należy wdrażać na każdym etapie cyklu życia danych.
- Problemy z jakością mogą zostać wykryte przez użytkowników, testy automatyczne albo alerty monitoringu danych.
- Narzędzia do jakości danych umożliwiają tworzenie reguł walidacyjnych i obserwowanie odchyleń metryk w czasie.
- Brak jakości danych prowadzi do błędnych analiz, złych decyzji i utraty zaufania do systemów.
- Do mierzenia jakości używa się metryk takich jak: kompletność, unikalność, poprawność, aktualność, spójność.

# 📚 Szczegółowe wyjaśnienie

## Jak wykrywane są problemy z jakością danych?

1. **Zgłoszenie od użytkownika biznesowego**
    
    - Klasyczny przypadek: odbiorca dashboardu zauważa brakujące dane, anomalie, niezgodności – zgłasza to zespołowi danych.
2. **Błąd testu danych (data test failure)**
    
    - Automatyczne testy danych wykonywane podczas pipeline (np. z `dbt tests`, `Great Expectations`, `Soda`) wykrywają naruszenia zasad, np. brakujące wymagane wartości.
3. **Alert z monitoringu danych ([[Data Observability|data observability]])**
    
    - Systemy monitorujące (np. Monte Carlo, Databand, Bigeye) śledzą zmiany w objętości danych, rozkładach statystycznych, liczbie nulli – i informują o anomalnych odchyleniach.

![Schemat jakości danych](images/data-quality.png)

## Atrybuty jakości danych

|Atrybut|Opis|
|---|---|
|**Kompletność**|Czy brakuje ważnych wartości? Czy kolumny obowiązkowe są zawsze obecne?|
|**Poprawność**|Czy dane mają odpowiedni format i zgodność logiczną (np. data < dziś)?|
|**Spójność**|Czy dane są zgodne ze sobą w całym systemie? (np. status kontra data)|
|**Unikalność**|Czy wartości są niepowtarzalne tam, gdzie powinny być unikatowe (np. ID)?|
|**Aktualność**|Czy dane są świeże i aktualne względem rzeczywistości procesowej?|

## Narzędzia wspierające jakość danych

- **Great Expectations** – framework open-source do pisania i testowania reguł jakości.
- **Soda** – platforma do walidacji i śledzenia jakości danych.
- **Monte Carlo, Databand, Bigeye** – systemy klasy observability danych z alertami i dashboardami.

# 💡 Przykład zastosowania

W systemie e-commerce kluczowy dashboard przestał wyświetlać dane o nowych zamówieniach. Monitor ingestujący dane z logów API wykrył nagły spadek liczby dziennych rekordów oraz wzrost liczby `null` w kolumnie `order_total`. Dzięki alertowi [[DevOps|DevOps]] zauważył problem — pipeline danych nie został uruchomiony po zmianie schematu w źródle. Odpowiednia adnotacja i test schematów zapobiegły nawrotowi problemu.

## 📌 Źródła

- [https://docs.greatexpectations.io/](https://docs.greatexpectations.io/)
- [https://sodadata.io/](https://sodadata.io/)
- [https://www.montecarlodata.com/data-quality/](https://www.montecarlodata.com/data-quality/)

## 👽 Brudnopis

- Jakość danych ≠ jakość modelu – działa niezależnie
- Częste źródła problemów: zmiana schematu upstream, błędy pipelines, błędny input użytkownika
- Testy: not_null, unique, accepted_range
- Observability = warstwa meta nad jakością (poziom [[DataOps|dataops]])
- Z automatu: testy w [[dbt|dbt]], monitoring liczności, schema drift detection
- Efekty złej jakości: złe [[KPI|KPI]], błędne rekomendacje, utrata klientów
- Rule of thumb: każdy pipeline → test + watch
- Rozróżnienie: aktywne (testy, alerty) vs pasywne (ręczne wykrycie, analiza po błędzie)

---