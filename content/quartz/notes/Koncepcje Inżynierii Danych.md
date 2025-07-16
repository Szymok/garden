---

title: Koncepcje Inżynierii Danych  
created: 2025-07-16  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- koncepcje
- data engineering
- hurtownie danych
- ETL
- ELT
- lakehouse

---

# 🎯 Najważniejsze koncepcje Inżynierii Danych

[[Inżynieria danych]] to dziedzina szybko rozwijająca się, obejmująca projektowanie, budowę i zarządzanie systemami, które przetwarzają, przemieszczają i udostępniają dane w organizacji. Poniżej znajdziesz kluczowe koncepcje i tematy, które kształtują współczesny krajobraz [[Inżynieria Danych|data engineering]].

## 1. Architektury i środowiska danych

- **Magazyn Danych (Data Warehouse):** Strukturalna baza, przystosowana do przechowywania i analizy danych historycznych; kluczowy fundament dla raportowania i analityki biznesowej.
- **Jezioro Danych (Data Lake):** Przechowalnia dla surowych, często półstrukturalnych lub nieustrukturalnych danych.
- **Data Lakehouse:** Hybrydowa architektura łącząca elastyczność jeziora danych (przechowywanie różnych rodzajów danych) ze spójnością i wydajnością hurtowni.

## 2. Warstwa przechowywania i formaty danych

- **Warstwa Przechowywania:** Warstwa odpowiedzialna za fizyczne przechowywanie danych (blokowe, plikowe, obiektowe).
- **Format Plików w Lake (Data Lake File Format):** Popularne formaty to Parquet, ORC, Avro – zoptymalizowane pod przetwarzanie dużych wolumenów danych.
- **Format Tabel w Jeziorze Danych:** Rozwiązania jak Delta Lake, Apache Iceberg lub Apache Hudi oferują transakcyjność i zarządzanie wersjami danych.

## 3. Zarządzanie metadanymi

- **Data Catalog (Katalog danych):** Centralne repozytorium metadanych, umożliwia wyszukiwanie, profilowanie i zarządzanie cyklem życia zasobów danych.

## 4. Stosy i cykle życia

- **Nowoczesny Stos Danych (Modern Data Stack):** Modularny ekosystem narzędzi open-source i cloud-native do integracji, transformacji, katalogowania i obserwacji danych.
- **Otwarty Stos Danych:** Stack zorientowany na interoperacyjność i brak vendor lock-in.
- **Cykl Życia Inżynierii Danych:** Przepływ od pozyskania danych, przez transformacje i testy jakości, po udostępnienie do analityki i ML.

## 5. Paradygmaty przetwarzania i integracji danych

- **ELT (Extract, Load, Transform):** Ekstrakcja i ładowanie najpierw, transformacje na etapie magazynu.
- **ETL (Extract, Transform, Load):** Transformacje przed załadowaniem, klasyczny model hurtowni.
- **EtLT:** Hybryda, gdzie część lekkich transformacji następuje przed ładowaniem, reszta w docelowym systemie.

## 6. Nowoczesne podejścia i wzorce

- **Funkcjonalna [[Inżynieria Danych]]:** Czyste, idempotentne, testowalne pipeline’y inspirowane paradygmatem funkcyjnym.
- **Zasoby Zdefiniowane Programowo (SDA/Software-Defined Assets):** Asset-first data orchestration, deklaratywność i kontrola lineage.

## 7. Warstwa semantyczna i metryk

- **Metrics Layer (Warstwa miary):** Centralna, deklaratywna warstwa definicji metryk i KPI, wspólna dla BI, ML i innych konsumentów.
- **Magazyn Semantyczny:** Data warehouse stawiający na semantykę, miary i wspólny język biznesowy.
- **Wirtualizacja Danych:** Umożliwia jednoczesny dostęp i analizę danych z różnych źródeł bez kopiowania ich.

## 8. Metryki i wskaźniki

- **Miary (Metrics):** Ilościowe wskaźniki raportowania (suma, średnia, liczba unikalnych itp.).
- **KPI (Key Performance Indicators):** Miary kluczowe dla monitorowania postępów w realizacji celów biznesowych.

## 9. Przetwarzanie, optymalizacja i modelowanie

- **Push-Downs i Rollup:** Optymalizacja wykonywania obliczeń jak najbliżej danych źródłowych, agregacja wyników na różnych poziomach szczegółowości.
- **Modelowanie Danych:** Tworzenie modeli logicznych odwzorowujących procesy biznesowe (np. modelowanie wymiarowe, fakty i wymiary).

## 10. Kontrakty Danych

- **Data Contracts:** Weryfikowalne umowy pomiędzy producentami a konsumentami danych, gwarancja zgodności i jakości schematów.

## 11. Modele przetwarzania i narzędzia

- **OLAP vs OLTP:** OLAP do analityki wielowymiarowej, OLTP do operacji transakcyjnych.
- **MapReduce, Apache Hadoop:** Przetwarzanie rozproszone na dużą skalę.

## 12. Programowanie i styl potoków

- **Deklaratywność vs Imperatywność:** Deklaratywne pipeline’y opisują „co” ma zostać osiągnięte, imperatywne — „jak” to wykonać.
- **Notatniki (Notebooks):** Interaktywne środowiska do eksploracji i prototypowania transformacji/analiz danych.

## Tabela Tematów

|Kategoria|Przykładowe tematy i technologie|
|---|---|
|Przechowywanie danych|Data Warehouse, Data Lake, Data Lakehouse, Storage Layer|
|Integracja i przetwarzanie|ETL, ELT, EtLT, MapReduce, Apache Hadoop|
|Modelowanie|Dimensional Modeling, Data Modeling|
|Semantyka i metryki|Metrics Layer, KPI, Semantic Warehouse|
|Orkiestracja & pipeline|Functional [[Inżynieria Danych|Data Engineering]], Software-Defined Assets|
|Zarządzanie i katalogi|Data Catalog, Kontrakt Danych, Warstwa wirtualna|
|Analiza i optymalizacja|OLAP, Push-Down, Rollup, OLTP|
|Programowanie & styl|Deklaratywność, Imperatywność, Notebooks|

# 💡 Na co zwrócić szczególną uwagę?

- Zrozumienie różnic i synergii między hurtownią danych, jeziorem danych a lakehouse.
- Świadomy wybór podejścia ETL vs ELT vs EtLT pod kątem kosztów, elastyczności i audytowalności.
- Znaczenie warstwy semantycznej i centralnej definicji metryk w organizacji — pozwala na spójność i transparentność raportowania.
- Rola kontraktów danych (data contracts) w budowie zaufania i odporności ekosystemu danych.
- Programowanie deklaratywne i asset-first orchestration jako filar skalowalnych, nowoczesnych platform danych.

Zobacz również: [[Inżynieria Danych]] – definicja i podstawy oraz linkowane szczegółowe opisy każdej koncepcji.