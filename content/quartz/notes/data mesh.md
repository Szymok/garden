---

title: "Data Mesh"  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria danych
- data mesh
- architektura danych
- decentralizacja danych
- dane jako produkt  
aliases:
- Siatka danych

---

# 🎯 Definicja

**Data Mesh** to nowoczesna, zdecentralizowana architektura danych, w której dane są organizowane, zarządzane i udostępniane jako **produkty domenowe**. Model ten zakłada, że zespoły domenowe — nie centralne działy danych — są odpowiedzialne zarówno za pozyskiwanie, jak i publikację danych. Główne idee to: **domenowość**, **samodzielność zespołów**, **wspólna platforma infrastrukturalna** i **postrzeganie danych jako produktu**.

# 🔑 Kluczowe punkty

- **Decentralizacja**: każda domena (np. sprzedaż, marketing, logistyka) zarządza i publikuje własne dane.
- **Dane jako produkt**: dane są tworzone i udostępniane z myślą o ich jakości, dokumentacji i użyteczności.
- **Infrastruktura jako platforma**: centralny zespół udostępnia wspólny zestaw narzędzi (np. katalog, monitoring, repozytoria schematów).
- **Zespoły cross-funkcyjne**: w domenach funkcjonują pełne zespoły (data engineers, data product owners), autonomiczne w zakresie zarządzania danymi.
- **Skalowalność i interoperacyjność**: dane są interoperacyjne, zgodne z ustalonymi standardami centralnymi (np. identyfikatory, metadane).

# 📚 Szczegółowe wyjaśnienie

## Krytyka dotychczasowych architektur danych

Zgodnie z [artykułem na MartinFowler.com](https://martinfowler.com/articles/data-monolith-to-mesh.html), tradycyjne hurtownie danych oraz data lake’i:

- Tworzą **monolityczne platformy** o wysokim stopniu sprzężenia funkcjonalnego.
- Centralizują własność danych, eliminując z nich kontekst biznesowy i wiedzę domenową.
- Skutkują długim czasem dostarczania nowych źródeł danych (niska responsywność).
- Wymagają dużych, wyspecjalizowanych zespołów inżynierów danych, pracujących pod presją wielu interesariuszy.

## Cechy architektury Data Mesh

### 1. Dane jako produkt (`Data as a Product`)

Każdy zbiór danych ma swojego właściciela, katalog, schemat, SLO oraz dokumentację. Domena traktuje dane tak samo jak komponent aplikacji: produkt, który musi być godny zaufania, dostępny i monitorowany.

### 2. Domena jako granica (`Domain-oriented ownership`)

Zamiast centralnego zespołu, właścicielami danych są zespoły domenowe odpowiedzialne za konkretne aspekty biznesu. Dane są projektowane i publikowane w kontekście tych domen.

### 3. Samoobsługowa platforma danych (`Self-serve data infrastructure as a platform`)

Wspólna warstwa technologiczna pozwala domenom szybko i niezależnie tworzyć oraz eksponować produkty danych, bez konieczności budowy własnej infrastruktury przetwarzania i przechowywania. W skład tego wchodzi: orkiestracja, monitoring, wersjonowanie, katalogi i bramy dostępu.

### 4. Uniwersalne standardy i federacyjne zarządzanie (`Federated computational governance`)

Chociaż dane są zdecentralizowane, ich interoperacyjność i bezpieczeństwo zapewniane są przez wspólne standardy (np. identyfikatory, typy danych, zasady wersjonowania i udostępniania).

## Główna zmiana paradygmatu

|Tradycyjne Data Lake / DWH|Data Mesh|
|---|---|
|Centralizacja danych|Decentralizacja danych|
|Fokus na ETL|Fokus na dane jako produkt|
|Jeden zespół danych|Zespoły domenowe z autonomią|
|Wyspecjalizowani inżynierowie|Cross-funkcjonalne zespoły|
|Monolit ETL|Rozproszone pipeline’y domenowe|

# 💡 Przykład zastosowania

Enterprise SaaS dostarczający narzędzia HR wprowadza architekturę Data Mesh, w której zespoły odpowiedzialne za „kandydatów”, „proces onboardingu” i „rekrutację” publikują własne produkty danych. Każdy produkt ma opisany schemat, SLA, katalogową rejestrację i standardy jakości danych. Konsumenci danych (analitycy, zespoły ML) mogą niezależnie odnaleźć, przetworzyć i skorzystać z danych — bez udziału centralnego zespołu ETL. Platforma dostarcza wspólne narzędzia do orkiestracji, wersjonowania i monitoringu danych.

## 📌 Źródła

- [Martin Fowler — Data Mesh](https://martinfowler.com/articles/data-monolith-to-mesh.html)
- Zebratech Blog [Data Mesh vs. Data Lake](https://zebratech.io/blog/data-mesh-vs-data-lake)
- Data as a Product — sitowiec

## 👽 Brudnopis

- Architektura Mesh = rozbicie centralnego data lake na zestaw wspierających się produktów danych
- Każda domena publikuje własny zestaw danych wg wspólnej platformy
- Wymaga DevOps/DataOps mindset + szerzenie kultury produktowej
- Katalog danych jako repozytorium dostępnych assetów
- Standardy = klucz do unifikacji: identyfikatory, formaty, metadane
- Infrastructure as a Platform = DuckDB, dbt, Dagster, DataHub, Iceberg
- Koszty operacyjne → mniejsze zespoły, szybsze prototypowanie, lepsza jakość końcowa