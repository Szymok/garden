---
title: Stewardship (Data Governance)
created: 2026-02-04
status: evergreen
category: Data Governance / Roles
difficulty: basic
language: pl
tags:
  - stewardship
  - ownership
  - responsibility
  - data-governance
  - roles
aliases:
  - Data Stewardship
  - Opieka nad Danymi
---
# 🎯 Definicja
**Stewardship** to "opieka" nad danymi.
Dane w firmie nie mogą być "niczyje". Jeśli są niczyje, to są brudne.
**Data Steward** to osoba, która odpowiada za to, żeby dane w jej obszarze (np. "Dane Klienta") były opisane, czyste i bezpieczne.

# 🔑 Kluczowe punkty
- **Ownership:** Każdy zbiór danych musi mieć Właściciela (Owner) - decydenta.
- **Stewardship:** Każdy zbiór musi mieć Stewarda - opiekuna operacyjnego (sprząta, opisuje, rozwiązuje problemy).
- **Data Catalog:** To narzędzie pracy Stewarda. Tu opisuje metadane.

# 📚 Szczegółowe wyjaśnienie
Steward niekoniecznie jest informatykiem. To często osoba z biznesu (np. Analityk Sprzedaży), która najlepiej rozumie znaczenie danych.
Zadania Stewarda:
1.  Definiowanie terminów biznesowych ("Co to jest Aktywny Klient?").
2.  Zatwierdzanie dostępu do danych.
3.  Reagowanie na błędy jakości danych (DQ Issues).

# 💡 Przykład zastosowania
Wprowadzasz nową tabelę `LEADS`.
System automatycznie przypisuje ją do domeny "Marketing".
Data Steward Marketingu dostaje powiadomienie: "Nowa tabela. Opisz ją".
Wchodzi, dodaje opis: "Potencjalni klienci z webinarów", flaguje kolumnę `Email` jako PII.
Dzięki temu inni wiedzą, co to za dane i jak ich używać.

## 📌 Źródła
- DAMA-DMBOK (Data Management Body of Knowledge).

## 👽 Brudnopis
- "Everyone's responsibility is no one's responsibility". Stewardship to sformalizowanie odpowiedzialności. Bez tego Data Governance to tylko sterta dokumentów, których nikt nie czyta.