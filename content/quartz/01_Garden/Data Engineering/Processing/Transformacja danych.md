---

title: Transformacja danych  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- DataTransformation
- integracja danych
- ETL
- ELT
- DataOptimization
- DataEnrichment  
aliases:
- data transformation

---

# ðŸŽ¯ Definicja

**Transformacja danych** to proces przeksztaÅ‚cania danych z jednej postaci w innÄ…, w celu dostosowania ich do okreÅ›lonego kontekstu analitycznego, biznesowego lub technologicznego. MoÅ¼e obejmowaÄ‡ operacje takie jak oczyszczanie, wzbogacanie, walidacja, formatowanie, scalanie i normalizacja danych, zazwyczaj w ramach podejÅ›Ä‡ ETL, ELT lub ich wariacji.

# ðŸ”‘ Kluczowe punkty

- Fundamentalny etap integracji danych (ETL/ELT/[[EtLT]]).
- Obejmuje operacje syntaktyczne (format) i semantyczne (znaczenie danych).
- ZwiÄ™ksza wartoÅ›Ä‡ danych przez optymalizacjÄ™ ich przydatnoÅ›ci analitycznej.
- Wspiera standaryzacjÄ™, porÃ³wnywalnoÅ›Ä‡ i spÃ³jnoÅ›Ä‡ danych w organizacji.
- CzÄ™sto zautomatyzowana w ramach potokÃ³w danych (data pipeline).

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Techniki transformacji danych

Typowe rodzaje transformacji obejmujÄ…:

|Rodzaj transformacji|PrzykÅ‚ad / Cel|
|---|---|
|Normalizacja|Ujednolicenie formatÃ³w dat, wartoÅ›ci tekstowych|
|Agregacja|Sumy, Å›rednie, [[KPI]] â€“ np. miesiÄ™czna sprzedaÅ¼|
|Wzbogacanie (Enrichment)|Dodanie lokalizacji do danych IP|
|CzystoÅ›Ä‡ danych (Data Cleaning)|Usuwanie duplikatÃ³w i bÅ‚Ä™dnych wartoÅ›ci|
|Mapowanie i zamiana wartoÅ›ci|"Y" â†’ true, "N" â†’ false|
|Scalanie i Å‚Ä…czenie|Join-y kilku zestawÃ³w danych|
|Anonimizacja/Pseudonimizacja|Ukrycie danych osobowych z zachowaniem uÅ¼ytecznoÅ›ci|

## Gdzie wystÄ™puje transformacja danych?

Transformacja danych jest integralnÄ… czÄ™Å›ciÄ… podejÅ›Ä‡ integracyjnych:

- **ETL (Extract, Transform, Load)** â€“ transformacja odbywa siÄ™ przed zaÅ‚adowaniem do systemu docelowego.
- **ELT (Extract, Load, Transform)** â€“ dane sÄ… przetwarzane juÅ¼ po zaÅ‚adowaniu do hurtowni danych (np. [[dbt]] w Snowflake).
- **[[EtLT]]** â€“ hybrydowy model, w ktÃ³rym czÄ™Å›Ä‡ transformacji â€žoczyszczajÄ…cejâ€ dziaÅ‚a juÅ¼ w warstwie ekstrakcji/object storage.

## KorzyÅ›ci z transformacji danych

- **Lepsza jakoÅ›Ä‡ danych:** spÃ³jnoÅ›Ä‡, kompletnoÅ›Ä‡, poprawnoÅ›Ä‡.
- **EfektywnoÅ›Ä‡ przechowywania i przetwarzania:** lepsze wykorzystanie indeksÃ³w, kompresji.
- **ZgodnoÅ›Ä‡ z wymaganiami systemÃ³w downstream (np. hurtownia, model [[Uczenie Maszynowe|ML]]).**
- **Rozszerzona semantyka:** pozwala na lepsze zrozumienie kontekstu (np. klasyfikacja typÃ³w klientÃ³w).

## Rola w analityce danych

Transformacja danych przygotowuje dane do dalszego wykorzystania:

- analizy ad-hoc i dashboardÃ³w,
- eksploracji OLAP (np. w Druid, [[DuckDB]]),
- trenowania modeli [[Uczenie Maszynowe|ML]] (danych wejÅ›ciowych do feature storeâ€™Ã³w).

# ðŸ’¡ PrzykÅ‚ad zastosowania

ZespÃ³Å‚ danych w firmie e-commerce chce umoÅ¼liwiÄ‡ segmentacjÄ™ klientÃ³w ze wzglÄ™du na ich wiek. Dane wejÅ›ciowe zawierajÄ… tekst:

```csv
"ImiÄ™ i opis"; "Bob ma 29 lat"
```

Transformacja danych rozdziela tekst i tworzy nowy zestaw zmiennych:

```sql
imiÄ™: 'Bob'
wiek: 29
grupa_wiekowa: '25-34'
```

Otrzymany zestaw danych staje siÄ™ podstawÄ… dla systemu rekomendacji produktowej oraz kampanii marketingowej opartej na segmentach wiekowych.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [What is Data Transformation â€“ Talend](https://www.talend.com/resources/what-is-data-transformation/)
- [[[ETL kontra ELT|ETL vs ELT]] in Modern Data Architectures â€“ Databricks](https://www.databricks.com/discover/blog/etl-vs-elt-modern-data-architecture)
- [Data Cleaning and Transformation â€“ IBM Glossary](https://www.ibm.com/topics/data-cleaning)

## ðŸ‘½ Brudnopis

- podstawowe dziaÅ‚ania: oczyszczanie, mapowanie, filtrowanie, agregacje, formatowanie
- ETL (transformacja przed) vs ELT (transformacja po â€“ np. [[dbt]])
- enrichment = np. lookup po IP â‡’ lokalizacja
- transformation = zmiana wartoÅ›ci + zapewnienie jakoÅ›ci + semantyka
- transformacja jako warstwa poÅ›rednia: staging â†’ core â†’ mart (moduÅ‚ [[dbt]])
- przykÅ‚ad: NLP parsing tekstu (â€œUÅ¼ytkownik X ma 45 latâ€) â†’ structured table
- agregacje sprzedaÅ¼y miesiÄ™czne, zmiana strefy czasowej, join z CRM, obliczenia ROI, itp.