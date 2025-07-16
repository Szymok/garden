---

title: ETL (Extract, Transform, Load)  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- ETL
- integracja danych
- przekształcanie danych
- data pipeline
- hurtownie danych  
aliases:
- ekstrakcja transformacja ładowanie

---

# 🎯 Definicja

**ETL (Extract, Transform, Load)** to klasyczny paradygmat integracji danych, w którym dane są najpierw wydobywane ze źródła, potem przekształcane zgodnie z wymaganiami biznesowymi, a na końcu ładowane do systemu docelowego — zazwyczaj do hurtowni danych. Przez wiele lat był to dominujący sposób budowy potoków danych analitycznych.

# 🔑 Kluczowe punkty

- Dane są transformowane **przed** załadowaniem do systemu docelowego.
- Proces ma charakter sekwencyjny: **Extract → Transform → Load**.
- ETL jest nadal popularny w środowiskach, gdzie kontrola i jakość danych na wejściu są krytyczne.
- Wymaga zdefiniowanego schematu (schema-on-write), co utrudnia pracę z danymi nieustrukturyzowanymi.
- Współcześnie często zastępowany przez ELT, szczególnie w środowiskach opartych na chmurze.

# 📚 Szczegółowe wyjaśnienie

## Jak działa ETL?

1. **Extract (Ekstrakcja):**  
    Dane są pobierane ze źródeł takich jak bazy relacyjne, pliki CSV, API czy systemy legacy.
    
2. **Transform (Przekształcanie):**  
    W tej fazie dane są oczyszczane, standaryzowane, łączone lub wzbogacane. Może też obejmować mapowanie do standardowego schematu, walidację typów, agregacje.
    
3. **Load (Ładowanie):**  
    Ostatecznie dane są zapisywane do systemu docelowego — np. hurtowni danych lub tabeli raportowej.
    

![](images/etl-tool.pngL – przeszłość vs współczesność

|Klasyczne ETL (2000–2015)|Nowoczesne podejścia|
|---|---|
|Informatica, IBM DataStage, SSIS|Airflow, Dagster, dbt + Orkiestrator|
|UI/drag-and-drop pipelines|Konfiguracyjne DSL (YAML, SQL, Python)|
|Rozbudowane GUI i skrypty|Modularna, testowalna logika|

## Zalety tradycyjnego ETL

- Transformacje wykonywane przed załadowaniem zmniejszają objętość danych.
- Procesy są deterministyczne i powtarzalne.
- Ułatwiają walidację danych "na wejściu" (jakość danych z systemów źródłowych).

## Wady i ograniczenia (współcześnie)

- Wysoki koszt utrzymania transformacji poza hurtownią.
- Problemy z elastycznością — dane muszą być gotowe do załadowania.
- Utrudnione debugowanie i śledzenie lineage bez centralnego repozytorium.

# 💡 Przykład zastosowania

Firma ubezpieczeniowa pobiera dane polis z systemu CRM, oczyszcza je lokalnie (m.in. usuwa nieaktualne rekordy, mapuje kody ryzyka), a następnie ładuje je do tabeli faktów w hurtowni danych (np. Oracle). Całość jest realizowana przez proces SSIS zaplanowany codziennie o 2:00 w nocy. W tym przypadku wykonywanie transformacji przed ładowaniem ma sens – dane w hurtowni są już czyste, zoptymalizowane i nie dopuszcza się nieprzetworzonych rekordów.

# 📌 Źródła

- [ETL vs. ELT — dbt Blog](https://www.getdbt.com/blog/etl-vs-elt/)
- [Informatica ETL Basics](https://www.informatica.com/services-and-training/glossary-of-terms/etl.html)
- [Wikipedia – ETL](https://en.wikipedia.org/wiki/Extract,_transform,_load)

# 👽 Brudnopis

- ETL = klasyczny model: extract → transform → load
- Przekształcenie przed zapisem → większa kontrola, ale ograniczona elastyczność
- Wady: schemat na starcie (schema-on-write); problemy z json, semi-structured data
- Historia: popularny od lat 70.; dominacja do lat 2010
- Rewitalizacja przez load-once → transform później (ELT, dbt)
- Kompatybilne z praktykami jakości danych, profilowaniem, oczyszczaniem upstream
- Narzędzia: Informatica PowerCenter, SSIS, Pentaho, Talend (GUI) → dziś Airbyte, Dagster, dbt