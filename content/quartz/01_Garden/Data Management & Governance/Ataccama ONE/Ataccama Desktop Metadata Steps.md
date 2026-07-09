---
title: Komponenty Metadanych w Ataccama Desktop
created: 2026-02-04
status: seed
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - metadata
  - ide
  - development
aliases:
  - Ataccama ONE Desktop Metadata
  - Metadata Reader/Writer
---
# 🎯 Definicja
Zestaw kroków (steps) dostępnych w środowisku deweloperskim [[Ataccama|Ataccama]] [[ONE Desktop|ONE Desktop]] (IDE), służących do interakcji z repozytorium metadanych platformy (ONE Web Application) oraz elementami katalogu danych.

# 🔑 Kluczowe punkty
- **Catalog Item Reader:** Odczyt danych z zarejestrowanych w katalogu elementów (do wykorzystania w planach transformacji).
- **ONE [[Metadata|Metadata]] Reader:** Pobieranie metadanych o obiektach (np. role, polityki, statusy, definicje) z platformy webowej.
- **ONE [[Metadata|Metadata]] Writer:** Tworzenie lub aktualizacja metadanych w platformie webowej z poziomu logiki IDE.

# 📚 Szczegółowe wyjaśnienie
Te komponenty umożliwiają budowanie zaawansowanej logiki "meta-zarządzania" ([[Metadata|metadata]]-driven development). Zamiast przetwarzać same dane biznesowe, deweloper może tworzyć plany, które:
1. **Analują konfigurację systemu** (np. "pobierz listę wszystkich reguł DQ" używając *ONE [[Metadata|Metadata]] Reader*).
2. **Automatyzują konfigurację** (np. "utwórz nowe glosariusze dla każdej tabeli w bazie" używając *ONE [[Metadata|Metadata]] Writer*).
3. **Używają zarejestrowanych zasobów** (używając *Catalog Item Reader* jako źródła danych zamiast bezpośredniego połączenia JDBC).

# 💡 Przykład zastosowania
Scenariusz automatyzacji:
Chcesz seryjnie zaktualizować status wszystkich haseł w słowniku biznesowym na "Zatwierdzone".
1. Użyj **ONE [[Metadata|Metadata]] Reader**, aby pobrać ID wszystkich haseł ze statusem "Draft".
2. W planie zmień wartość atrybutu status.
3. Użyj **ONE [[Metadata|Metadata]] Writer**, aby wysłać zaktualizowane obiekty z powrotem do ONE Web App.

## 📌 Źródła


## 👽 Brudnopis
Catalog Item Reader Provisions data extracted from any existing Catalog Item to be further used in plans. ONE [[Metadata|Metadata]] Reader Reads [[Metadata|metadata]] of any entity from the ONE Web application (e.g., policies, user [[Roles|roles]], status of any property...). Use it to extract important data for further processing via the IDE defined logic — components, workflows etc. ONE [[Metadata|Metadata]] Writer Writes [[Metadata|metadata]] of an entity to the ONE Web application and manages changes to it from the IDE perspective.