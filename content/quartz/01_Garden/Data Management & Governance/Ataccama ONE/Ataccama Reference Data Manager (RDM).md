---
title: Ataccama Reference Data Manager (RDM)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / RDM
difficulty: intermediate
language: en
tags:
  - rdm
  - reference-data
  - dictionaries
  - lookups
  - master-data
aliases:
  - RDM
  - Zarządzanie Danymi Referencyjnymi
---
# 🎯 Definicja
**[[Ataccama|Ataccama]] [[RDM|RDM]]** to moduł do zarządzania słownikami (Reference Data). Służy do tego, żeby w całej firmie "Polska" zawsze nazywała się "PL" lub "POL", a nie "Polsza" czy "Poland". To "Single Source of Truth" dla list rozwijanych (Lookups).

# 🔑 Kluczowe punkty
- **Centralizacja:** Wszystkie słowniki (Waluty, Kraje, Kody Pocztowe, Statusy Klienta) w jednym miejscu.
- **Publikacja:** Zmiana w [[RDM|RDM]] automatycznie rozsyła się do innych systemów (np. CRM, Billing).
- **Hierarchie:** Obsługa skomplikowanych zależności (np. Województwo -> Powie -> Gmina).

# 📚 Szczegółowe wyjaśnienie
Składa się z:
1.  **[[RDM|RDM]] Web App:** Interfejs dla biznesu. Klikają "Dodaj nowy kod produktu".
2.  **Workflow:** Proces akceptacji (Data Steward musi zatwierdzić zmianę).
3.  **Synchronization:** Mechanizm wysyłania zmian do baz danych Oracle/MSSQL/API.

# 💡 Przykład zastosowania
Bank wprowadza nową walutę "Eurocyfrowe".
Bez [[RDM|RDM]]: Informatycy muszą dodać "EUR_DIG" w 50 różnych systemach ręcznie. Błędy gwarantowane.
Z [[RDM|RDM]]: Data Steward dodaje "EUR_DIG" w [[RDM|RDM]]. Klika "Publish". W nocy wszystkie systemy (Bankomat, Aplikacja Mobilna, Księgowość) pobierają zaktualizowaną tabelę walut.

## 📌 Źródła
- [[Ataccama|Ataccama]] [[RDM|RDM]] Product Page.

## 👽 Brudnopis
- [[RDM|RDM]] to często najłatwiejszy sposób na start z [[Data Governance|Data Governance]]. Łatwiej uporządkować słownik walut niż dane klientów (MDM).
