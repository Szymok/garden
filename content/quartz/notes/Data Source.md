---

title: Data Source  
created: 2025-04-03  
status:  
category: data governance / katalog danych  
difficulty: podstawowy  
language: pl  
tags:

- data source
- źródło danych
- metadata
- rejestracja danych  
aliases:
- źródło danych
- data asset

---

# 🎯 Definicja

**Data Source (źródło danych)** to system, zbiór, repozytorium lub fizyczny nośnik, z którego pochodzą dane używane w organizacji — np. baza danych, plik, API, data lake, hurtownia danych czy narzędzie analityczne. Źródło danych jest punktem wejścia dla procesu profilowania, katalogowania i zarządzania danymi w narzędziach data governance i katalogach danych.

# 🔑 Kluczowe punkty

- Data source to pierwsza referencja w katalogu danych czy systemie metadata management — pozwala rejestrować, profilować i monitorować pochodzenie danych.
- W platformach data governance można przeglądać profilowane tabele, pliki i inne zasoby powiązane z danym źródłem.
- Źródła danych mogą być różnorodne: relacyjne bazy danych, pliki (CSV, Parquet, JSON), platformy chmurowe, API, systemy SaaS.
- Każde źródło w katalogu posiada własny blok metadanych (np. typ źródła, lokalizacja, historia zmian, właściciel, status aktualizacji).
- W narzędziach takich jak Ataccama, edycja źródła (np. zmiana parametrów połączenia, harmonogram dokumentowania, usuwanie, wersjonowanie) odbywa się przez graficzny interfejs.

# 📚 Szczegółowe wyjaśnienie

Źródło danych stanowi początkowy punkt integracji danych w organizacji. Po zaimportowaniu (rejestracji) źródła w systemie katalogowym możliwe jest:

- **Profilowanie i discovery** – pełna inwentaryzacja struktur, typów, jakości danych.
- **Automatyczne generowanie oraz utrzymanie metadanych** – system może samodzielnie rozpoznawać strukturę, właścicieli, zależności i historię zmian.
- **Harmonogramowanie i monitorowanie** – możliwe jest ustawienie cyklicznych przeglądów jakości lub generowania dokumentacji.
- **Edycja i zarządzanie** – z poziomu panelu źródła możesz je usunąć, zmienić parametry, zaplanować odświeżanie, czy przeglądać historię wersji.

Centralne repozytorium źródeł danych + powiązane metadane stanowią podstawę nowoczesnego data catalogu oraz fundament do zapewnienia zgodności, jakości i łatwości wyszukiwania danych przez użytkowników biznesowych i technicznych.

## Przykład zestawu metadanych źródła danych

|Pole|Przykład|
|---|---|
|Nazwa źródła|CRM_PROD_DB|
|Typ|PostgreSQL, Snowflake, S3|
|Lokalizacja|jdbc:postgresql://...|
|Status|Aktywne/Odłączone|
|Data rejestracji|2025-04-03|
|Właściciel|[Jan.Kowalski@firma.pl](mailto:Jan.Kowalski@firma.pl)|
|Harmonogram|Codziennie 01:00|
|Historia wersji|Lista zmian metadanych/połączeń|

# 💡 Przykład zastosowania

```python
# Przykład konceptualny: rejestracja źródła danych w systemie katalogowym
register_data_source(
    name="Salesforce_API",
    type="REST API",
    connection_details={
        "endpoint": "https://api.salesforce.com/v1/",
        "auth_type": "OAuth2"
    }
)
# Następnie możliwe: profilowanie, ustawienie harmonogramu synchronizacji, przypisanie właściciela
```

W praktyce – użytkownik w Ataccama ONE/Collibra/Microsoft Purview wybiera „Add Data Source”, podaje parametry połączenia, ustawia synchronizację i rozpoczyna analizę oraz mapowanie metadanych dla tego źródła.

# 📌 Źródła

- [IBM: Metadata Management](https://www.ibm.com/think/topics/metadata-management)
- [Secoda: Metadata Management](https://www.secoda.co/glossary/metadata-management)
- [Denodo: Metadata Management](https://www.denodo.com/en/glossary/metadata-management-definition-importance-best-practices)
- [Informatica: What is metadata management?](https://www.informatica.com/resources/articles/what-is-metadata-management.html)
- [DATAVERSITY: Introduction to Metadata Management](https://www.dataversity.net/an-introduction-to-metadata-management/)
- [DQOps: Metadata Management Framework](https://dqops.com/metadata-management-framework-definition-and-implementation/)
- [Solix: Metadata Management](https://www.solix.com/kb/metadata-management/)

# 👽 Brudnopis

- Data source = początek śledzenia lineage, punkt wejścia dla profilowania i data discovery
- Bez rejestracji źródła – niemożliwe monitorowanie, DQ, obsługa cyklu życia danych
- Często workflow: register → profile → owner assign → schedule → version → monitor
- Metadane źródła = fundament późniejszych automatyzacji i compliance
- W nowoczesnych systemach – zarządzanie źródłem możliwe API/UI, synchronizacja wielokanałowa