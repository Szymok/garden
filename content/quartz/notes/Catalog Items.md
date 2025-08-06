---

title: Catalog Items  
created: 2025-04-03  
status:  
category: data catalog / zarządzanie metadanymi  
difficulty: podstawowy  
language: pl  
tags:

- data catalog
- elementy katalogu
- Ataccama ONE
- metadata  
aliases:
- elementy katalogu
- katalog danych
- katalogowane obiekty

---

# 🎯 Definicja

**Catalog Items** to podstawowe jednostki katalogowania danych w systemach typu [[data catalog]] (np. Ataccama ONE). Reprezentują one konkretne obiekty danych – takie jak tabele, widoki, pliki, [[Reports|raporty BI]] – które zostały odnalezione, zaimportowane lub utworzone podczas procesu data discovery lub manualnej rejestracji źródła danych.

# 🔑 Kluczowe punkty

- 📦 Catalog Item może reprezentować fizyczny lub logiczny zbiór danych: tabela, plik, zestaw dokumentów z API, raport [[Business Intelligence|BI]] itp.
- 🧭 Każdy element posiada bogaty zestaw metadanych: struktura, typy danych, atrybuty, jakość, przypisane [[Glossary Terms|terminy słownikowe]].
- 🔍 Widoczność i zakres informacji zależy od ról i uprawnień użytkownika.
- 🧠 Wspierają procesy profilowania, monitorowania jakości (DQ), klasyfikacji, przypisywania reguł i terminów biznesowych.
- 📊 Podłączone mogą być również: [[Reports|raporty BI]], klasyfikacje PII, lineage, właściwości techniczne.

# 📚 Szczegółowe wyjaśnienie

## Typowe typy Catalog Items

|Typ|Przykład|Opis|
|---|---|---|
|Tabela danych|`sales_db.orders`|Struktura relacyjna z danych źródłowych|
|Plik|`finance_2022.csv`|Pliki z S3, HDFS, lokalne, Parquet, JSON, Excel|
|Widok|`vw_active_customers`|Widoki SQL lub logiczne widoki [[Business Intelligence\|BI]]|
|[[Business Intelligence\|BI]] Report|`PowerBI_SalesDashboard`|Raport podłączony przez REST API lub connector|
|Element [[Master Data Management (MDM)\|MDM]]|`master_product`|Dane wzorcowe (single source of truth)|
|Referencyjny słownik|`country_codes`|Lista stałych wartości wykorzystywana w regułach walidacji|

## Kluczowe właściwości katalogowanego elementu

- Techniczne:
    - [[Data Source|Źródło danych]], połączenie, lokalizacja (schema, path)
    - Typ danych kolumn, klucze, rozmiar
    - Historia zmian struktury
- Metadane biznesowe:
    - Przypisane [[Glossary Terms|terminy słownikowe]]
    - Opisy i definicje
    - Właściciel danych (data owner/steward)
- Jakość i klasyfikacja:
    - Wyniki reguł DQ, testy, scoring
    - Detekcja PII / GDPR / wrażliwość danych
- Powiązania:
    - Lineage (przepływ danych i zależności)
    - Powiązane [[Reports|raporty BI]], reguły, niestandardowe obiekty

## Wbudowane widoki i sekcje

- 📄 **Overview** – Opis, typ, tagi, właściciel, status monitorowania
- 📈 **Quality** – Szczegóły wyników reguł jakości
- 🧬 **Lineage** – Zależności wejść/wyjść z katalogu
- 🧾 **[[Glossary Terms]]** – Terminy powiązane z kolumnami lub całą tabelą
- ⚠️ **Anomalies/Issues** – Problemy wykryte w DQ / observability
- 📂 **Folder Hierarchy** – Folder nadrzędny, zakres widoczności

## Sekcje specjalne

- **Not Monitored** – elementy bez przypisanych reguł DQ ani harmonogramu.
- **Master Data** – katalogowane obiekty ze źródła [[Master Data Management (MDM)|MDM]].
- **Reference Data** – obiekty typu lista wartości, słowniki RDM.
- **Anomaly Overview** – wszystkie elementy z wykrytymi anomaliami.
- **Data Export Projects** – elementy powiązane z projektami eksportu danych.

# 💡 Przykład zastosowania

```python
# Pseudoprzypisanie elementu do folderu + dodanie opisu i terminu
update_catalog_item(
    item_id="finance.transactions_2023",
    folder="Finance/Quarterly",
    description="Zbiór danych przedstawiający transakcje finansowe z Q1 2023.",
    glossary_terms=["Transaction", "Quarterly Report"]
)
```

W Ataccama można to zrobić przez GUI (menu boczne → [[Data Catalog]] → Catalog Item → Edit).

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://learn.microsoft.com/en-us/fabric/data/data-catalog-overview](https://learn.microsoft.com/en-us/fabric/data/data-catalog-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Catalog](https://help.collibra.com/docs/collibra/latest/Data_Catalog)
- [https://www.informatica.com/products/data-quality/data-catalog.html](https://www.informatica.com/products/data-quality/data-catalog.html)

# 👽 Brudnopis

- Catalog Item = podstawowa jednostka organizacyjna danych w katalogu
- Może być zasobem fizycznym lub logicznym
- Fundament do zarządzania jakością, widocznością, dokumentacją i zgodnością
- Integruje się z linią danych (lineage), [[Business Intelligence|BI]], scoringiem DQ, klasyfikacją, politykami dostępu
- Typowy cykl życia: odkrycie → przypisanie terminów → profilowanie → monitoring DQ → publikacja folderowa → użycie w systemie [[Business Intelligence|BI]]/AI