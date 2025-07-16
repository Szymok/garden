---

title: "Ewolucja Schematu"  
created: 2025-07-16  
status: Final  
category: Inżynieria danych  
difficulty: średniozaawansowany  
language: pl  
tags:

- inżynieria danych
- data lake
- ewolucja schematu
- formaty tabel
- schematy danych  
aliases:
- schema evolution
- zmiana schematu danych

---

# 🎯 Definicja

**Ewolucja schematu (schema evolution)** to zdolność systemu do dostosowywania się do zmian w strukturze danych – takich jak dodawanie nowych kolumn, zmiana typów danych czy kolejności atrybutów – bez konieczności przetwarzania lub przepisywania całej tabeli. W kontekście nowoczesnych formatów tabel w jeziorach danych (np. Delta Lake, Apache Iceberg, Apache Hudi), ewolucja schematu odbywa się automatycznie, z zachowaniem spójności i zgodności danych.

# 🔑 Kluczowe punkty

- Pozwala na **dynamiczne dostosowanie** struktury tabeli do zmieniających się danych źródłowych.
- Obejmuje operacje takie jak: **dodawanie kolumn, zmiana typów, przestawienie kolumn, zmiana nazw**.
- Zapewnia elastyczność w **długoterminowym utrzymaniu danych historycznych i strumieniowych**.
- Wspierana przez formaty tabel warstwowych z **metadanymi i logiem zmian** (np. DeltaLog, Iceberg manifest).
- Kluczowa dla procesów ELT, ingestion pipelines oraz integracji danych z wielu źródeł o rozbieżnym schemacie.

# 📚 Szczegółowe wyjaśnienie

## Dlaczego ewolucja schematu jest problemem?

W klasycznych hurtowniach lub systemach plikowych każda zmiana struktury danych (np. nowa kolumna w CSV lub dodatkowe pole w logach) może prowadzić do:

- utraty zgodności,
- błędów ETL,
- potrzeby przetworzenia całego zbioru danych na nowo.

W formatach lakehouse (Delta, Iceberg, Hudi) jest to rozwiązane przez **warstwę metadanych**, która umożliwia zastosowanie zmian bez konieczności modyfikacji już istniejących plików z danymi.

## Typy zmian obsługiwane (w zależności od formatu)

|Typ zmiany|Obsługa (przykład: Delta Lake)|Wsteczna zgodność|
|---|---|---|
|Dodanie kolumny|✅ Tak|✅ Tak|
|Zmiana typu (np. int → long)|🔶 Warunkowo|🔶 Zależy od silnika|
|Zmiana kolejności kolumn|❌ Niewspierana|❌ Często łamie|
|Zmiana nazw kolumn|🔶 Ryzykowna|❌ Często łamie|

## Jak to działa technicznie?

System zapisuje schemat w warstwie metadanych (np. `_delta_log` w przypadku Delta Lake). Gdy użytkownik doda kolumnę z nowym schematem do istniejącej tabeli:

- Dane historyczne pozostają niezmienione (kolumna pusta/null).
- Nowe dane są zapisywane z rozszerzonym schematem.
- Zapytania mogą nadal działać, jeśli silnik interpretuje kolumny opcjonalnie.

Przykład (Delta Lake, PySpark):

```python
df_new.write.option("mergeSchema", "true").format("delta").mode("append").save("/data/events")
```

## Zalety automatycznej ewolucji schematu

- Nie trzeba replikować ani przepisywać całej tabeli.
- Mniejsze koszty operacyjne (compute, I/O).
- Szybsze dostosowanie do zmieniających się systemów źródłowych (logi, API, aplikacje).
- Lepsza odporność na zmienność danych w czasie.

# 💡 Przykład zastosowania

Podczas integracji danych logowania z aplikacji mobilnej, producent aplikacji wprowadził nową wersję, która dodała pole `session_device_info`. Dzięki włączonej ewolucji schematu, wszystkie nowe eventy zawierające to pole zostały zapisane w tabeli w formacie Delta Lake, a starsze eventy nadal były dostępne. Nie trzeba było przetwarzać danych historycznych ani aktualizować zapytań SQL.

## 📌 Źródła

- [https://delta.io/blog/schema-enforcement-and-evolution-in-delta-lake/](https://delta.io/blog/schema-enforcement-and-evolution-in-delta-lake/)
- [https://iceberg.apache.org/docs/latest/schema-evolution/](https://iceberg.apache.org/docs/latest/schema-evolution/)
- [https://docs.databricks.com/delta/schema-evolution.html](https://docs.databricks.com/delta/schema-evolution.html)

## 👽 Brudnopis

- Schema evolution = fundament elastycznego data lake
- mergeSchema=true → aktywacja trybu dodawania kolumn
- Delta / Iceberg / Hudi mają różny poziom wsparcia
- Istotne w strumieniach, ingestion pipeline, logach systemowych
- Time travel + schema versioning → warunek dobrego lineage
- Dobrze łączy się z ACID → dane nadal spójne pomimo ewolucji
- Wsparcie w Spark, Presto, Flink — zależne od integracji z formatem plikowym
- Open table formats = nowe standardy interoperacyjności i elastyczności w inżynierii danych

---