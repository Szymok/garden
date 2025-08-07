---

title: Glossary Terms  
created: 2025-05-21  
status:  
category: data governance / business glossary  
difficulty: podstawowy  
language: pl  
tags:

- słownik terminów
- data governance
- business glossary
- definicje biznesowe
- metadata  
aliases:
- terminy słownikowe
- pojęcia biznesowe
- glossary items

---

# 🎯 Definicja

**Glossary Terms (terminy słownikowe)** to jednoznacznie zdefiniowane pojęcia wykorzystywane w organizacji do opisywania, klasyfikowania i rozumienia danych oraz procesów. Tworzą one słownik biznesowy (Business Glossary), który łączy semantykę domeny biznesowej z danymi technicznymi i wspiera spójność komunikacji między zespołami.

# 🔑 Kluczowe punkty

- 📘 Terminy są wykorzystywane do opisywania pól, tabel, domen danych i procesów.
- 🔄 Mogą być przypisywane ręcznie lub automatycznie (na podstawie nazw i zawartości danych).
- 🧠 Wspierają klasyfikację, zarządzanie jakością danych, audyt oraz zgodność (np. GDPR).
- 🧩 Obsługują relacje hierarchiczne: terminy nadrzędne, pochodne, równoważniki wewnątrz/w obrębie domen.
- 🧭 Ich funkcja wykracza poza opis — powiązane są z regułami DQ, właścicielami (stewardami) oraz zastosowaniem w katalogu danych.

# 📚 Szczegółowe wyjaśnienie

## Gdzie można przypisać terminy słownikowe?

Terminy są przypisywane do:

- 📦 Elementów katalogu danych (tabel, plików, systemów).
- 🔠 Atrybutów danych (np. kolumn w tabelach).
- 📐 Projektów, reguł jakości, zbiorów metadanych.

## Sposoby przypisywania terminów

1. **Manualne**
    
    - Steward lub analityk samodzielnie przypisuje termin do pola/obiektu.
2. **Automatyczne**
    
    - Na podstawie reguł:
        - opartych na metadanych (np. nazwa kolumny zawiera "email"),
        - opartych na danych (np. wzorce danych odpowiadają numerowi telefonu),
        - opartych na jednym i drugim (inteligentne dopasowanie AI/[[Uczenie Maszynowe|ML]]).

## Zakładki dostępne w widoku terminu

|Zakładka|Zawartość|
|---|---|
|**Overview**|[[Informacje ogólne]], relacje, właściciele, propozycje przypisań, statystyki występowania|
|**Occurrence**|Lista miejsc przypisania terminu (katalog, atrybuty, systemy)|
|**Data Quality**|Przegląd jakości danych w miejscach, gdzie termin został przypisany|
|**History**|Historia zmian terminu, przegląd wersji i edycji|
|**Settings**|Ustawienia wykrywania terminu oraz konfiguracja zasad jakości danych|
|**Relationships**|Powiązania z innymi terminami (nadrzędność, dziedziczenie, pochodne itd.)|

## Zależności hierarchiczne

Glossary Terms mogą funkcjonować w wielu hierarchiach równoczesnych. Przykład:

- "Klient"  
    ↳ "Klient detaliczny"  
    ↳ "Klient biznesowy"  
    ↳ "Klient typu SME"

Relacje typu: `parent of`, `derived from`, `equivalent of`, `defined in`, itd., pozwalają zachować semantyczną spójność w całej strukturze organizacyjnej.

# 💡 Przykład zastosowania

**Przypisanie terminu „Customer Email” do kolumny „email_address” w tabeli „users”:**

- System (np. Ataccama ONE) wykrywa na podstawie wzorca nazewnictwa i danych sugerowane przypisanie terminu.
- Data Steward akceptuje przypisanie.
- Od tego momentu:
    - Reguły jakości przypisane do „Customer Email” obowiązują dla tej kolumny.
    - Termin pojawia się na dashboardzie jakości danych.
    - Kolumna jest oznaczona jako dane osobowe (np. PII).
    - Możliwe jest filtrowanie zasobów wg terminów.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://help.collibra.com/docs/collibra/latest/Business_Glossary](https://help.collibra.com/docs/collibra/latest/Business_Glossary)
- [https://dataconomy.com/2022/03/business-glossary-vs-data-catalog-explained/](https://dataconomy.com/2022/03/business-glossary-vs-data-catalog-explained/)
- [https://learn.microsoft.com/en-us/fabric/data/business-glossary](https://learn.microsoft.com/en-us/fabric/data/business-glossary)

# 👽 Brudnopis

- Terms = most między biznesem a danymi → uspójnienie języka między IT, [[Business Intelligence|BI]] i zarządem
- W nowoczesnych systemach (Collibra, Ataccama, Alation): terminy wyzwalają workflow i kontrolę jakości
- AI suggestion + validation loop = Smart Glossary
- History = lineage pojęciowe, zmiany znaczenia, merge/split z innymi pojęciami
- Wspierają [[data catalog]], data quality, policy enforcement, data access, DQ [[Analiza Danych|dashboards]]