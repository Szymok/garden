---

title: Master Data Management (MDM)  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: średni  
language: pl  
tags:

- master data
- mdm
- jakość danych
- data governance
- data integration  
aliases:
- MDM
- zarządzanie danymi podstawowymi
- Master Data Management

---

# 🎯 Definicja

**Master Data Management (MDM)** to zestaw procesów, technologii i polityk do definiowania i zarządzania tzw. danymi podstawowymi (master data) w organizacji. Celem MDM jest zapewnienie jednej, spójnej, poprawnej i aktualnej wersji kluczowych danych dla całego przedsiębiorstwa — na przykład informacji o klientach, produktach, dostawcach czy lokalizacjach.

# 🔑 Kluczowe punkty

- 🧩 Tworzy „jedyną wersję prawdy” (single source of truth) dla najważniejszych encji biznesowych.
- 🔄 Integruje dane pochodzące z różnych systemów (ERP, CRM, MDM, e-commerce, hurtownie).
- 🧼 Wspiera kontrolę jakości danych — deduplikacja, walidacja, standaryzacja, reguły spójności.
- 🛡️ Ma kluczowe znaczenie dla zgodności z regulacjami (np. RODO), audytu, [[Business Intelligence|BI]] oraz systemów rekomendacyjnych.
- ⚙️ Często realizowany przy pomocy specjalistycznych platform MDM (np. Informatica, IBM InfoSphere, Ataccama ONE MDM, SAP Master [[Data Governance]]).

# 📚 Szczegółowe wyjaśnienie

## Co to są dane podstawowe (master data)?

Dane podstawowe to statyczne, długotrwałe dane opisujące najważniejsze jednostki w organizacji:

- Klienci
- Produkty
- Dostawcy
- Pracownicy
- Umowy
- Lokalizacje geograficzne
- Jednostki organizacyjne

To dane często używane i konieczne do prawidłowego działania wielu procesów biznesowych. W każdej organizacji rozproszone są w wielu systemach, często niezgodne i zduplikowane.

## Kluczowe procesy MDM

|Proces|Opis|
|---|---|
|Integracja danych|Łączenie danych z różnych źródeł w jedną strukturę|
|[[Data Profiling\|Profilowanie danych]]|Diagnoza jakości danych (kompletność, unikalność, typy błędów)|
|Standaryzacja danych|Ujednolicanie nazw, formatów, reprezentacji|
|Deduplikacja i matchowanie|Wyszukiwanie i scalanie zduplikowanych rekordów (np. klientów)|
|Golden Record|Tworzenie referencyjnej wersji rekordu na podstawie źródeł|
|Data [[Stewardship]]|Zatwierdzanie zmian, walidacje manualne przez właścicieli danych|

## Style wdrożeń MDM

- **Centralized** — dane master przechowywane i zarządzane z jednego źródła.
- **Registry-style** — dane pozostają w systemach źródłowych, a MDM zarządza metadanymi i mapowaniem.
- **Coexistence** — mieszanina obu podejść; dane mogą być edytowane zarówno w systemach źródłowych, jak i w MDM.
- **Consolidation** — MDM służy jako centralny rejestr konsolidacyjny, synchronizujący dane w batchach.

# 💡 Przykład zastosowania

**[[Zarządzanie danymi]] klientów (Customer MDM):**  
W firmie telekomunikacyjnej informacje o kliencie mogą znajdować się:

- w CRM: imię i nazwisko, kontakt, historia rozmów
- w systemie bilingowym: numer konta, płatności, taryfa
- w systemie reklamacyjnym: zgłoszenia, status spraw

MDM umożliwia:

- zmapowanie rozłącznych źródeł danych,
- wykrycie i scalenie duplikatów klientów,
- ustandaryzowanie pól (np. format numeru telefonu),
- stworzenie ujednoliconego profilu klienta dostępnego w całej firmie.

# 📌 Źródła

- [https://en.wikipedia.org/wiki/Master_data_management](https://en.wikipedia.org/wiki/Master_data_management)
- [https://www.gartner.com/en/information-technology/glossary/master-data-management-mdm](https://www.gartner.com/en/information-technology/glossary/master-data-management-mdm)
- [https://www.informatica.com/products/master-data-management.html](https://www.informatica.com/products/master-data-management.html)
- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://www.sap.com/products/technology-platform/master-data-governance.html](https://www.sap.com/products/technology-platform/master-data-governance.html)

# 👽 Brudnopis

- Data Fabric i [[Data Mesh]] często korzystają z MDM jako punkty spójności.
- Modern MDM integruje AI/[[Uczenie Maszynowe|ML]] do deduplikacji, predykcji złotych rekordów.
- Ataccama MDM obsługuje match [[rules]], workflows, masterowanie, korekty przez stewardów.
- MDM to nie baza danych — to meta warstwa zarządzania i konsolidacji danych referencyjnych.
- Kluczowe jest zdefiniowanie właścicieli (Data Owners) i opiekunów domen (Stewards).