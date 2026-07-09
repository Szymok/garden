---

title: Wirtualizacja Danych  
created: 2025-07-15  
status: 🌱 draft
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- wirtualizacja danych
- data virtualization
- federacja danych
- semantyka
- Apache Arrow  
aliases:
- Data Virtualization

---

# 🎯 Definicja

**Wirtualizacja Danych** to technika agregowania, prezentowania i zarządzania dostępem do danych pochodzących z wielu, często heterogenicznych systemów źródłowych w sposób jednolity i zcentralizowany – bez fizycznego przenoszenia czy kopiowania danych. Użytkownicy oraz aplikacje korzystają z wirtualnej warstwy logicznej, która udostępnia dane na żądanie i maskuje złożoność i różnorodność źródeł.

# 🔑 Kluczowe punkty

- Dane pozostają w źródłowych systemach – nie są kopiowane ani agregowane przed zapytaniem.
- Warstwa wirtualizacji umożliwia tworzenie semantycznych modeli biznesowych (np. kostki OLAP, widoki logiczne) dostępnych dla różnych narzędzi [[Business Intelligence|BI]] i użytkowników.
- Zapytania są tłumaczone i wykonywane w locie na odpowiednich źródłach; często optymalizowane przez mechanizmy [[Push-Down]] i buforowanie w pamięci.
- Idealna dla środowisk z wieloma systemami źródłowymi o stosunkowo wysokiej wydajności i spójnych czasach odpowiedzi.
- Ściśle powiązana z federacją danych (konsolidacja wielu źródeł) i technikami [[Push-Down]] (delegacja operacji do źródeł danych).

# 📚 Szczegółowe wyjaśnienie

## Jak działa wirtualizacja danych?

1. **Połączenie z wieloma źródłami:**  
    Warstwa wirtualizacji integruje różnorodne źródła – bazy relacyjne, hurtownie danych, API, pliki, cloud storage.
2. **[[Warstwa Semantyczna]]:**  
    Projektujesz modele danych, które odpowiadają strukturze biznesowej (np. tabele logiczne, kostki), niezależnie od fizycznej lokalizacji i formatu źródeł.
3. **On-demand execution:**  
    Zapytania kierowane do warstwy wirtualnej są tłumaczone i optymalizowane, a cała logika wykonania (joiny, agregacje) realizowana jest bezpośrednio na źródłach, jeśli to możliwe.
4. **Buforowanie i optymalizacja:**  
    Technologie takie jak [[Apache Arrow]] buforują i przetwarzają zestawy wyników w pamięci RAM, poprawiając wydajność i redukując czas odpowiedzi.
5. **Brak kopiowania danych:**  
    Fizyczna migracja i wcześniejsze agregacje są zbędne; dane trafiają do użytkownika tylko w momencie zapytania.

## Typowe narzędzia i technologie

- **Dremio:** Platforma łącząca wirtualizację danych z analityką w locie, zoptymalizowana pod OLAP i modelowanie semantyczne.
- **Denodo:** Rozbudowane narzędzie do federacji i wirtualizacji danych, wspierające szeroką gamę źródeł.
- **Presto/Trino:** Silniki federacyjne umożliwiające rozproszone kwerendy na wielu backendach.

### Kluczowa rola [[Apache Arrow]]

- [[Apache Arrow]] zapewnia wspólny format pamięci, szybki transfer i przetwarzanie danych wektorowych – optymalizacja pod warstwy wirtualne i ad hoc query.

## Zastosowania

- Raportowanie [[Business Intelligence|BI]] z wielu źródeł bez centralnego Data Warehouse.
- Analizy ad hoc na danych rozproszonych po systemach operacyjnych firmy.
- Szybkie prototypowanie i iteracja zapytań bez kosztu ETL.

## Integracja z federacją danych i push-downs

- **[[Federacja Danych]]**: Konsolidacja i łączenie zapytań na zbiorach z różnych źródeł w czasie rzeczywistym, bez ETL.
- **[[Push-Down]]**: Delegowanie kosztownych operacji (filtrowanie, agregacja) do źródłowych silników baz danych.
- **[[Warstwa Semantyczna]]**: Pozwala użytkownikom odwoływać się do modeli logicznych, a nie do detali technicznych źródeł.

# 💡 Przykład zastosowania

Międzynarodowa firma technologiczna korzysta z Dremio, aby zintegrować dane z baz Oracle, SAP oraz plików Parquet w S3 – bez fizycznego kopiowania danych do centralnej hurtowni. Zespoły [[Business Intelligence|BI]] mają dostęp do ujednoliconego modelu semantycznego, mogą tworzyć kostki OLAP i dashboardy w Power [[Business Intelligence|BI]], a zapytania analityczne są realizowane w locie, z push-downem logicznych operacji do systemów źródłowych i optymalizacją przy użyciu [[Apache Arrow]].

## 📌 Źródła

- [Dremio – What is Data Virtualization?](https://www.dremio.com/wiki/data-virtualization/)
- [Denodo – What is Data Virtualization?](https://www.denodo.com/en/data-virtualization)
- [[[Apache Arrow]] – Dokumentacja](https://arrow.apache.org/)
- [TechTarget – Data Virtualization explained](https://www.techtarget.com/searchdatamanagement/definition/data-virtualization)

# 👽 Brudnopis

- Virtualization = [[Business Intelligence|BI]] i analityka bez ETL, [[Push-Down]] na źródłach, [[Apache Arrow]]
- Modele semantyczne σ join/federacja kilku źródeł w jednym query context
- Dremio, Denodo, IBM Data Virtualization Manager
- Warstwy: źródła → federacja → logika biznesowa/model → ekspozycja do [[Business Intelligence|BI]]/query
- Przewaga: szybkie prototypy, query na aktualnych danych, brak kopiowania/latency ETL
- Wady: performance ograniczony przez źródła, raczej nie stosować dla obciążeń operacyjnych/masowych batch
- Real-case: FAQ, dashboardy Ad Hoc, testowanie nowych źródeł, fast POC dla [[Inżynieria Danych|DataOps]]