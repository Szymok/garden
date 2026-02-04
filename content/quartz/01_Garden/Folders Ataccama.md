---
title: Folders Ataccama (Struktura Folderów)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - ataccama
  - organization
  - hierarchy
  - permissions
aliases:
  - Struktura Katalogu
  - Organizacja Danych
---
# 🎯 Definicja
**Foldery w Ataccama ONE** to podstawowy mechanizm organizacji zasobów w Data Catalogu. Podobnie jak w systemie Windows/Linux, pozwalają grupować elementy (Tabele, Reguły, Profile) w hierarchiczną strukturę, ułatwiając nawigację i zarządzanie uprawnieniami.

# 🔑 Kluczowe punkty
- **Logiczna separacja:** Pozwalają oddzielić dane HR od danych Sprzedażowych.
- **Uprawnienia:** Możesz nadać uprawnienia do całego folderu (np. "Tylko dział HR widzi folder HR").
- **Dziedziczenie:** Obiekty w folderze mogą dziedziczyć pewne cechy lub uprawnienia.

# 📚 Szczegółowe wyjaśnienie
Dobre praktyki struktury katalogów:
1.  WEDŁUG DOMEN: Marketing, Sales, Finance, HR.
2.  WEDŁUG WARSTWY: Raw (Bronze), Curated (Silver), Golden (Gold).
3.  WEDŁUG SYSTEMÓW: SAP, Salesforce, Jira.

Folder nie jest tylko "workiem". W Ataccama ONE folder może mieć swojego Właściciela (Steward), co automatycznie czyni go odpowiedzialnym za wszystkie zasoby w środku.

# 💡 Przykład zastosowania
Folder `Marketing / Kampanie 2024`.
W środku:
- Tabela `AdWords_Export`.
- Reguła Jakości `Check_CTR_Positive`.
- Raport `ROI_Lipiec`.
Użytkownik z działu Finansów nie ma dostępu do tego folderu, więc nie widzi tych danych w wynikach wyszukiwania (Security Trimming).

## 📌 Źródła
- Ataccama ONE User Guide.

## 👽 Brudnopis
- Unikaj zbyt głębokich struktur (> 4 poziomy), bo nikt tam nie zajrzy.
- Płaska struktura + dobre tagowanie (Glossary) jest zazwyczaj lepsze niż głębokie drzewo folderów.