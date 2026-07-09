---
title: Data Governance (Zarządzanie Danymi)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - governance
  - strategy
  - compliance
  - stewardship
aliases:
  - Ład Danych
  - Zarządzanie Danymi
---
# 🎯 Definicja
**Data Governance** (Ład Danych) to system uprawnień i odpowiedzialności za zasoby informacyjne. To nie oprogramowanie, ale **strategia**, która definiuje "Kto, co może robić z jakimi danymi, w jakich sytuacjach i jakimi metodami". Odpowiada za [[Jakość Danych|jakość danych]], bezpieczeństwo i zgodność z regulacjami.

# 🔑 Kluczowe punkty
- **Ludzie, Procesy, Technologia:** Governance to w 80% ludzie i procesy, a tylko w 20% technologia (narzędzia).
- **Role:** Kluczowe postacie to **Data Owner** (biznesowy właściciel), **Data Steward** (opiekun jakości), **Data Custodian** (techniczny opiekun).
- **Cele:** Zwiększenie zaufania do danych, minimalizacja ryzyka (kary za RODO), demokratyzacja dostępu.

# 📚 Szczegółowe wyjaśnienie
Data Governance odpowiada na pytania:
- Co oznacza termin "Aktywny Klient"? (Słownik Biznesowy)
- Gdzie są moje dane? ([[Data Catalog|Data Catalog]])
- Skąd przyszły? ([[Data Lineage|Data Lineage]])
- Czy są poprawne? ([[Data Quality|Data Quality]])
- Kto ma do nich dostęp? (Data Security/Access Control)

Bez DG, organizacja ma "Bagno Danych" ([[Data Swamp|Data Swamp]]), gdzie nikt nie ufa raportom, a każdy dział liczy [[KPI|KPI]] po swojemu.

# 💡 Przykład zastosowania
Bank wprowadza nową politykę kredytową.
Dzięki Governance:
1.  Zdefiniowano, że "Zdolność Kredytowa" jest liczona wg algorytmu X (zapisanego w Słowniku).
2.  Wyznaczono Stewarda, który dba, by dane o dochodach klientów były kompletne.
3.  Zablokowano dostęp do danych wrażliwych dla marketingu (Security Policy).
Gdy przychodzi audyt KNF, bank w 5 minut generuje raport: kto miał dostęp do danych i jak były przetwarzane (Lineage).

## 📌 Źródła
- DAMA-DMBOK ([[Data Management|Data Management]] Body of Knowledge).
- "Data Governance: The Definitive Guide" - Evren Eryurek.

## 👽 Brudnopis
- Non-Invasive Data Governance (Robert Seiner) - podejście, które mówi "nie zmieniaj tego co ludzie robią, tylko zacznij to formalizować i nazywać".
- Governance to proces ciągły, a nie projekt z datą końcową.