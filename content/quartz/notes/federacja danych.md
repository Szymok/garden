---

title: Federacja Danych  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- federacja danych
- wirtualizacja danych
- silniki federacyjne
- Trino
- Presto
- Spark  
aliases:
- Data Federation

---

# 🎯 Definicja

**Federacja Danych** (Data Federation) to technika integracji umożliwiająca jednoczesny dostęp, pobieranie i analizę danych rozproszonych po różnych źródłach — bez konieczności ich fizycznego kopiowania lub konsolidacji. Polega na utworzeniu wirtualnej warstwy, która agreguje i udostępnia dane z wielu heterogenicznych systemów (bazy relacyjne, hurtownie danych, pliki, API), a wszystko to „na żądanie”, dzięki zapytaniom federacyjnym wykonywanym przez specjalnie przystosowane silniki (np. Trino, Presto, Spark).

# 🔑 Kluczowe punkty

- **Brak kopiowania danych:** Dostęp w czasie rzeczywistym do rozproszonych zbiorów bez ich migracji czy duplikacji.
- **Silniki federacyjne:** Wykorzystuje technologie, które umożliwiają jednoczesne zapytania do różnych typów źródeł danych przy użyciu jednego języka zapytań (zwykle SQL).
- **Jednolity model dostępu:** Agreguje różne typy baz w jeden logiczny widok dostępny dla użytkowników, [[Business Intelligence|BI]], narzędzi data science.
- **Elastyczność i szybkie prototypowanie:** Pozwala szybko tworzyć integracje ad hoc i prototypy raportów bez kosztu budowania pełnych pipeline’ów ETL/ELT.
- **Kluczowa dla architektur hybrydowych i cloud:** Szeroko wykorzystywana w środowiskach multi-cloud i hybrydowych, gdzie dane są rozsiane po wielu platformach.

# 📚 Szczegółowe wyjaśnienie

## Czym różni się federacja od wirtualizacji?

Obie techniki opierają się na ideałch warstwy logicznej nad źródłami danych, jednak:

- **[[Wirtualizacja danych]]** to szerszy termin, obejmujący prezentację dowolnych zbiorów jako logicznej warstwy (np. bazy danych, pliki, API).
- **Federacja danych** koncentruje się na silnikach zapytań, które umożliwiają wykonywanie zapytań (np. SQL) na różnych źródłach w jednym zapytaniu, dbając o rozdział i łączenie wyników.

## Silniki federacyjne — przegląd

|Silnik|Kluczowe cechy|
|---|---|
|**Trino**|Otwartoźródłowy, zoptymalizowany pod federację i duże analizy, szeroka integracja (SQL, S3, [[Delta Lake]], NoSQL)|
|**Presto**|Oryginalny projekt federacji SQL według Facebooka, przoduje w zapytaniach rozproszonych, szybki rozwój społeczności|
|**Spark SQL**|Integracja federacyjna przez JDBC i [[data source]] connectors, szerokie wsparcie dla big data|
|**Denodo**|Komercyjna platforma do federacji i wirtualizacji z zaawansowanymi narzędziami do modelowania|
|**Dremio**|Akceleracja i federacja danych w locie, wsparcie dla narzędzi [[Business Intelligence\|BI]], silnik [[Apache Arrow]]|

## Jak działa federacja danych?

1. Użytkownik lub aplikacja wysyła zapytanie do warstwy federacyjnej wykorzystując standaryzowany język (najczęściej SQL).
2. Silnik federacyjny „tłumaczy” zapytanie, kierując jego fragmenty do odpowiednich źródeł.
3. Częściowe wyniki są pobierane, agregowane i, w razie potrzeby, przetwarzane w warstwie federacyjnej.
4. Końcowy wynik zwracany jest użytkownikowi jak z jednego, zunifikowanego źródła.

## Zalety

- Minimalizacja kosztów transferu – brak pełnych kopiowań zbiorów.
- Szybkie połączenie wielu źródeł pod analizę ad hoc lub prototypowanie dashboardów.
- Unifikacja warstwy semantycznej i ułatwienie zarządzania bezpieczeństwem dostępu.

## Ograniczenia

- Wydajność zależna od najwolniejszego źródła lub jakości połączenia.
- Złożoność zarządzania uprawnieniami i mappingiem schematów.
- Ograniczone możliwości zaawansowanych transformacji w porównaniu do pełnego ETL.

# 💡 Przykład zastosowania

Międzynarodowa korporacja finansowa wykorzystuje silnik Trino do stworzenia zunifikowanego modelu analizy danych. Trino pobiera dane z bazy Oracle (CRM), Hadoop (historyczne logi), plików CSV w S3 i hurtowni Redshift. Analitycy mogą jednym zapytaniem SQL porównywać bieżące transakcje z archiwalnymi dane o klientach bez potrzeby kopiowania wszystkich danych do wspólnej hurtowni. Prototypy raportów oraz modele [[Uczenie Maszynowe|ML]] są budowane na świeżych, federacyjnie połączonych danych, bez potrzeby budowania pipeline’ów przetwarzających wszystkie zbiory.

## 📌 Źródła

- [Trino — Official Documentation](https://trino.io/docs/current/)
- [What is Data Federation? — Denodo](https://www.denodo.com/en/data-federation)
- [Presto — Project Overview](https://prestodb.io/docs/current/)
- [Data Federation Explained — TechTarget](https://www.techtarget.com/searchdatamanagement/definition/data-federation)

# 👽 Brudnopis

- Federacja = silnik query (SQL) łączy wiele backendów, umożliwiając unified access
- Przykład: Trino/PRESTO = query na S3 + Oracle + PostgreSQL naraz, wyniki agregowane na fly
- Różnica z wirtualizacją: federacja = query execution, pushdown, join na różnych źródłach; wirtualizacja = model logiczny/warstwa prezentacyjna
- Zalety: szybkie prototypy, elastyczność, brak potrzeby ETL upfront, koszty tylko zapytania
- Wady: performance zależy od źródeł, możliwe trudności w security/mappingu, nie zastąpi w 100% hurtowni
- Usecase: multi-cloud, ad hoc [[Business Intelligence|BI]], jednorazowe analizy, agregacje online, PoC, eksploracja rozproszonych zbiorów