---

title: Transformacja danych  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- DataTransformation
- integracja danych
- ETL
- ELT
- DataOptimization
- DataEnrichment  
aliases:
- data transformation

---

# 🎯 Definicja

**Transformacja danych** to proces przekształcania danych z jednej postaci w inną, w celu dostosowania ich do określonego kontekstu analitycznego, biznesowego lub technologicznego. Może obejmować operacje takie jak oczyszczanie, wzbogacanie, walidacja, formatowanie, scalanie i normalizacja danych, zazwyczaj w ramach podejść ETL, ELT lub ich wariacji.

# 🔑 Kluczowe punkty

- Fundamentalny etap integracji danych (ETL/ELT/EtLT).
- Obejmuje operacje syntaktyczne (format) i semantyczne (znaczenie danych).
- Zwiększa wartość danych przez optymalizację ich przydatności analitycznej.
- Wspiera standaryzację, porównywalność i spójność danych w organizacji.
- Często zautomatyzowana w ramach potoków danych (data pipeline).

# 📚 Szczegółowe wyjaśnienie

## Techniki transformacji danych

Typowe rodzaje transformacji obejmują:

|Rodzaj transformacji|Przykład / Cel|
|---|---|
|Normalizacja|Ujednolicenie formatów dat, wartości tekstowych|
|Agregacja|Sumy, średnie, KPI – np. miesięczna sprzedaż|
|Wzbogacanie (Enrichment)|Dodanie lokalizacji do danych IP|
|Czystość danych (Data Cleaning)|Usuwanie duplikatów i błędnych wartości|
|Mapowanie i zamiana wartości|"Y" → true, "N" → false|
|Scalanie i łączenie|Join-y kilku zestawów danych|
|Anonimizacja/Pseudonimizacja|Ukrycie danych osobowych z zachowaniem użyteczności|

## Gdzie występuje transformacja danych?

Transformacja danych jest integralną częścią podejść integracyjnych:

- **ETL (Extract, Transform, Load)** – transformacja odbywa się przed załadowaniem do systemu docelowego.
- **ELT (Extract, Load, Transform)** – dane są przetwarzane już po załadowaniu do hurtowni danych (np. dbt w Snowflake).
- **EtLT** – hybrydowy model, w którym część transformacji „oczyszczającej” działa już w warstwie ekstrakcji/object storage.

## Korzyści z transformacji danych

- **Lepsza jakość danych:** spójność, kompletność, poprawność.
- **Efektywność przechowywania i przetwarzania:** lepsze wykorzystanie indeksów, kompresji.
- **Zgodność z wymaganiami systemów downstream (np. hurtownia, model ML).**
- **Rozszerzona semantyka:** pozwala na lepsze zrozumienie kontekstu (np. klasyfikacja typów klientów).

## Rola w analityce danych

Transformacja danych przygotowuje dane do dalszego wykorzystania:

- analizy ad-hoc i dashboardów,
- eksploracji OLAP (np. w Druid, DuckDB),
- trenowania modeli ML (danych wejściowych do feature store’ów).

# 💡 Przykład zastosowania

Zespół danych w firmie e-commerce chce umożliwić segmentację klientów ze względu na ich wiek. Dane wejściowe zawierają tekst:

```csv
"Imię i opis"; "Bob ma 29 lat"
```

Transformacja danych rozdziela tekst i tworzy nowy zestaw zmiennych:

```sql
imię: 'Bob'
wiek: 29
grupa_wiekowa: '25-34'
```

Otrzymany zestaw danych staje się podstawą dla systemu rekomendacji produktowej oraz kampanii marketingowej opartej na segmentach wiekowych.

## 📌 Źródła

- [What is Data Transformation – Talend](https://www.talend.com/resources/what-is-data-transformation/)
- [ETL vs ELT in Modern Data Architectures – Databricks](https://www.databricks.com/discover/blog/etl-vs-elt-modern-data-architecture)
- [Data Cleaning and Transformation – IBM Glossary](https://www.ibm.com/topics/data-cleaning)

## 👽 Brudnopis

- podstawowe działania: oczyszczanie, mapowanie, filtrowanie, agregacje, formatowanie
- ETL (transformacja przed) vs ELT (transformacja po – np. dbt)
- enrichment = np. lookup po IP ⇒ lokalizacja
- transformation = zmiana wartości + zapewnienie jakości + semantyka
- transformacja jako warstwa pośrednia: staging → core → mart (moduł dbt)
- przykład: NLP parsing tekstu (“Użytkownik X ma 45 lat”) → structured table
- agregacje sprzedaży miesięczne, zmiana strefy czasowej, join z CRM, obliczenia ROI, itp.