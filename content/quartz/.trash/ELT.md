---

title: ELT  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- ELT
- integracja danych
- hurtownia danych
- dbt  
aliases:
- Extract Load Transform

---

# 🎯 Definicja

**ELT (Extract, Load, Transform)** to podejście do integracji danych, w którym najpierw wydobywa się dane z systemów źródłowych, następnie ładuje się je w surowej postaci do magazynu danych lub hurtowni, a dopiero potem przekształca (transformuje) już w systemie docelowym. Transformacje wykonywane są na dużych wolumenach danych bezpośrednio w hurtowni, co pozwala na pełne wykorzystanie jej mocy obliczeniowej.

# 🔑 Kluczowe punkty

- **Kolejność operacji:** Najpierw ekstrakcja i ładowanie surowych danych, później transformacja w hurtowni.
- **Wydajność i skalowalność:** Transformacje korzystają z zasobów magazynów danych w chmurze (np. Snowflake, BigQuery).
- **Automatyzacja i modularność:** Łatwiejsza automatyzacja, wersjonowanie i audyt transformacji dzięki narzędziom takim jak dbt.
- **Nowoczesny standard:** ELT wypiera klasyczne ETL w środowiskach opartych o chmurę, szczególnie przy dużej ilości danych.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania ELT

W trybie ELT dane są najpierw wyodrębniane z systemów źródłowych (aplikacje, bazy operacyjne) i w całości kopiowane do docelowego magazynu danych. Dopiero potem, za pomocą narzędzi takich jak dbt, transformacje danych (czyszczenie, agregacje, łączenie tabel itp.) realizowane są na surowych danych już w hurtowni. Pozwala to korzystać z możliwości przetwarzania równoległego oraz elastycznego skalowania oferowanego przez chmurę.

## Technologia i ekosystem

Rozwój ELT jest efektem spadku kosztów przechowywania/obliczeń w chmurze oraz rosnącej popularności chmurowych hurtowni danych (Snowflake, Redshift, BigQuery). Do kluczowych narzędzi wspierających ELT należą:

- **Narzędzia ETL/ELT:** Fivetran, Airbyte, Meltano
- **Transformacje:** dbt (Data Build Tool), Dataform
- **Orkiestracja:** Airflow, Dagster, Prefect

## Przewagi nad ETL

W ETL transformacja wykonywana jest przed załadowaniem danych do hurtowni, co komplikuje proces dla dużych zbiorów danych i ogranicza elastyczność. ELT pozwala oddzielić ładowanie od transformacji, zwiększa przejrzystość i zapewnia lepszą kontrolę nad jakością transformacji oraz testowalność kodu.

# 💡 Przykład zastosowania

Szybko rozwijający się e-commerce korzysta z ELT, aby codziennie ładować miliardy kliknięć i transakcji klientów do hurtowni Snowflake, a następnie za pomocą dbt wykonuje transformacje i modelowanie danych do raportów BI, analityki marketingowej i trenowania modeli machine learning.

## 📌 Źródła

- [dbt Docs – Introduction to ELT](https://docs.getdbt.com/docs/introduction)
- [Google BigQuery Documentation – Loading and Transforming Data](https://cloud.google.com/bigquery/docs/loading-data)

## 👽 Brudnopis

- ELT: ekstrakcja i ładowanie surowych danych, transformacje w docelowym warehouse/DB, np. dbt, Dataform
- Przewaga: wydajność, elastyczność, praca na surowym detalu i później harmonogramowane modele danych
- BigQuery, Snowflake, Redshift – optymalizacja kosztów i mocy, Fivetran i Airbyte – E/L
- Realne usecase: e-commerce, raporty, ML pipeline’y, segmentacje klientów, BI