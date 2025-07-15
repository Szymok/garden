---

title: EtLT  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- EtLT
- integracja danych
- transformacja danych
- ELT
- architektura danych  
aliases:
- Extract tweak Load Transform

---

# 🎯 Definicja

**EtLT (Extract, tweak, Load, Transform)** to hybrydowe podejście do integracji danych, będące rozszerzeniem modelu ELT. EtLT zakłada wprowadzenie lekkiej, technicznej "dostosowawczej" transformacji danych (zwanej "tweak") jeszcze **przed** załadowaniem do systemu docelowego – np. hurtowni danych lub lakehouse’a. Główna transformacja analityczna odbywa się dalej, już w docelowym systemie.

# 🔑 Kluczowe punkty

- **Tweak = szybkie przekształcenie techniczne** wykonywane między ekstrakcją a ładowaniem.
- **EtLT = ELT + sanityzacja danych** na wcześniejszym etapie przetwarzania.
- Umożliwia **rozwiązanie problemów z jakością, typowaniem lub wydajnością** przed załadowaniem danych do celu.
- Zachowuje elastyczność **transformacji końcowej w hurtowni/warstwie semantycznej**.
- Popularne przy integracji dużych wolumenów z niespójnymi schematami (np. dane JSON, API, strumienie Kafka).

# 📚 Szczegółowe wyjaśnienie

## Etapy przepływu danych w EtLT

|Etap|Opis|
|---|---|
|**Extract (E)**|Pozyskanie danych ze źródeł (API, bazy, pliki, Kafka, itp.)|
|**Tweak (t)**|Lekka transformacja: sanityzacja typów, rozszyfrowanie, flattening|
|**Load (L)**|Ładowanie do Data Lake / staging area (np. cloud storage, warehouse)|
|**Transform (T)**|Właściwe przekształcenie danych w celu analitycznym (np. dbt)|

## Rodzaje „tweaków” wykonywanych przed załadowaniem

- Zamiana null/NaN na wartość placeholder
- Ujednolicenie formatów dat (np. ISO 8601)
- Zamiana typów z dynamicznych na ustalone (np. string → integer)
- Flattening zagnieżdżonych struktur JSON
- Anonimizacja lub maskowanie kluczowych pól
- Detekcja i usunięcie rekordów uszkodzonych

## Rola EtLT w nowoczesnym stosie danych (Modern Data Stack)

Przetwarzanie EtLT jest powszechnie wykorzystywane w architekturach, gdzie:

- Dane przychodzą z systemów z nieprzewidywalną strukturą (np. SaaS, logi, dane eventowe).
- Przechowywane są na staging area typu object storage (S3, GCS) jako krok pośredni.
- Kluczowe dane wędrują przez platformy integracyjne typu **Airbyte**, **Fivetran**, **Meltano**, które obsługują tweak na poziomie konektorów.

EtLT stanowi kompromis między kosztownym ETL a elastycznym, ale chaotycznym ELT.

# 💡 Przykład zastosowania

Zespół danych integruje informacje z REST API systemu CRM, które przesyła dane w formacie JSON. Zanim dane trafią do hurtowni danych BigQuery, są „tweakowane”:

- Zagnieżdżone JSON-y są flattenowane i mapowane do określonych typów danych.
- Niekompletne rekordy (brak e-maila) są oznaczane jako „do walidacji”.
- Wartości textowe są ucinane do stałej długości, aby uniknąć przekroczenia schematu w BigQuery.

Dopiero po tych krokach dane ładowane są do warstwy stagingowej, gdzie kolejne transformacje (w dbt) budują warstwę modelową i semantyczną.

## 📌 Źródła

- [EtLT – Modern Data Stack Pattern – Fishtown Analytics](https://blog.getdbt.com/etl-vs-elt-vs-etlt/)
- [Airbyte Technical Documentation: Extract-Transform-Load](https://docs.airbyte.com/)
- [ETL vs ELT vs EtLT – Monte Carlo Data](https://www.montecarlodata.com/blog/data-transformation-patterns)

## 👽 Brudnopis

- EtLT = tweak przed Load, np. sanity check, flattening, type coercion
- Spojrzenie praktyczne: Airbyte connector → zagnieżdżone JSON flatten → staging tabel → dbt
- Wielu użytkowników myśli, że robi ELT – ale z tweakami robią EtLT
- Przykłady tweak: fix schema drift, flatten events, łapanie źle sformatowanych emaili
- Dobrze działa z Data Lake/Lakehouse – staging na Bucket (S3, GCS), dbt w ciemno łapie gotowe typy
- Alternatywa dla pre-transformacji w logicznej warstwie aplikacyjnej (ETL old style)