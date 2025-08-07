---

title: Granulacja danych  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- granulacja
- modelowanie wymiarowe
- ziarno
- data warehouse
- BI  
aliases:
- grain
- data granularity

---

# 🎯 Definicja

**Granulacja danych ([[Seed|ziarno]], ang. grain)** to jasno zdefiniowany poziom szczegółowości, na jakim rejestrujemy pojedynczy wiersz w tabeli faktów w hurtowni danych. Określa ona, co dokładnie reprezentuje każdy rekord – np. pojedynczą transakcję, zamówienie dzienne, kliknięcie użytkownika itp. Wybór granulacji jest fundamentem każdego modelu wymiarowego i warunkuje późniejsze wybory wymiarów oraz miar.

# 🔑 Kluczowe punkty

- Deklaracja granulacji to pierwszy, niezbędny krok projektowania tabeli faktów.
- Określa, czego dokładnie dotyczy każdy rekord (np. sprzedaż na poziomie linii faktury vs. agregacja dzienna).
- Wszystkie wybrane [[wymiary]] i miary muszą być zgodne z zadeklarowaną granulacją.
- Zbyt niska granulacja (za dużo szczegółów) prowadzi do bardzo dużych tabel, a zbyt wysoka (za bardzo zagregowana) ogranicza możliwości analityczne.
- Spójnie zadeklarowana granulacja zapewnia stałość modelu w czasie i klarowność dla użytkowników [[Business Intelligence|BI]].

# 📚 Szczegółowe wyjaśnienie

## Jak określać granulację?

1. **Zadaj pytanie:** Co dokładnie ma reprezentować pojedynczy wiersz tabeli?
    - Przykład: jeden wiersz = pojedyncza linia transakcji sklepu internetowego.
2. **Deklaruj przed wymiarami:** Najpierw określasz [[Seed|ziarno]] (granulację), potem wybierasz [[wymiary]] (np. data, produkt), a nie odwrotnie.
3. **Sprawdź zgodność:** Każdy wymiar czy [[miara]] musi być dostępna na poziomie zadeklarowanej granulacji (np. jeśli [[Seed|ziarno]] to “dzienna sprzedaż sklepu”, nie można podpiąć wymiaru “godzina”).

## Równoważenie niskiej i wysokiej granulacji

- **Niska granulacja** (np. rekord = pojedyncze kliknięcie): maksymalna szczegółowość, ogromne zbiory danych, pełna analityka, ale większe koszty przechowywania i złożoność modelu.
- **Wysoka granulacja** (np. rekord = suma sprzedaży tygodniowej): mniejsza tabela, tańsze przechowywanie, szybkie zapytania, ale ograniczona elastyczność analityczna.
- Decyzja zależy od wymagań biznesowych, kosztów przechowywania i spodziewanych pytań analitycznych.

## Efekty uboczne złej definicji ziarna

- Dodanie każdego nowego wymiaru (kolumny pod kątem wymiaru) prowadzi do wykładniczego wzrostu liczby wierszy (tzw. “eksplozja kombinatoryczna”).
- Próba przechowywania wszystkich możliwych rollupów (np. suma dla każdej kombinacji wymiarów) jest niewydajna – lepiej tworzyć je dynamicznie w warstwie semantycznej lub OLAP.

## Rola granulacji w nowoczesnych architekturach ([[warstwa semantyczna]], warstwa transformacji)

- Najlepszą praktyką jest utrzymywanie wysokiej szczegółowości w warstwie przetwarzania, a agregacji dokonywać dynamicznie “w locie” (np. OLAP cubes).
- [[Warstwa semantyczna]] i [[Narzędzia Business Intelligence|narzędzia BI]] pozwalają na elastyczną analizę bez konieczności trzymania każdego rollupu na dysku.

# 💡 Przykład zastosowania

Przykład projektowania tabeli faktów w e-commerce:  
Zespół definiuje granulację: “Pojedynczy wiersz = sprzedaż jednej linii produktu w ramach pojedynczego zamówienia klienta”. Tylko takie [[wymiary]] i miary, które są dostępne na tym poziomie szczegółowości, mogą być podpięte do tabeli. Wyższe agregacje (np. dzienne, miesięczne) wykonywane są na żądanie przez narzędzia OLAP i [[Business Intelligence|BI]] – nie zachodzi potrzeba przetwarzania ani przechowywania każdej możliwej zagregowanej wersji danych.

## 📌 Źródła

- [Kimball Group – [[Modelowanie Wymiarowe|Dimensional Modeling]] Techniques: Grain](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/grain/)
- [IBM – Identify the measures](https://www.ibm.com/docs/en/ida/9.1.1?topic=phase-step-identify-measures#c_dm_design_cycle_4__c_dm_4_step7)
- [SQLBI – Define the granularity of a fact table](https://www.sqlbi.com/articles/define-the-granularity-of-a-fact-table/)

# 👽 Brudnopis

- Granulacja = poziom szczegółu rekordu tabeli faktów; [[Seed|ziarno]] - deklaracja, co reprezentuje wiersz
- Granulacja → wybieram [[wymiary]] i miary, nie odwrotnie
- Im więcej wymiarów, tym większa eksplozja liczby kombinacji = problem wydajnościowy/przechowywania
- Operuj na najniższej sensownej granulacji, wyższe [[Rollup|agregaty]] “w locie” (OLAP, [[Business Intelligence|BI]])
- Przykład: clickstream (maksymalna), sprzedaż dzienna (agregacja), itp.
- [[Warstwa semantyczna]] = elastyczna analiza, nie musisz preagregować wszystkiego z wyprzedzeniem