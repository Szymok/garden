---
title: Business Hierarchy (Hierarchia Biznesowa)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - business-glossary
  - hierarchy
  - metadata
  - organization
aliases:
  - Struktura organizacyjna
  - Hierarchia pojęć
---
# 🎯 Definicja
**Business Hierarchy** to logiczna struktura organizująca terminy biznesowe, jednostki organizacyjne lub domeny danych w relacje nadrzędne i podrzędne (Parent-Child). Służy do nawigacji po Słowniku Danych (Business Glossary).

# 🔑 Kluczowe punkty
- **Taksonomia:** Porządkuje chaos pojęciowy ("Klient" -> "Klient Indywidualny" / "Klient Biznesowy").
- **Ownership:** Często właściciel węzła nadrzędnego (np. "Dział Finansów") jest właścicielem wszystkich pojęć podrzędnych.
- **Wygoda:** Ułatwia użytkownikom znalezienie raportu lub definicji, przeklikując się przez drzewo kategorii (zamiast szukać w 1000 płaskich terminów).

# 📚 Szczegółowe wyjaśnienie
W systemach Data Governance (Ataccama, Collibra), hierarchia nie musi odzwierciedlać struktury HR firmy. Częściej odzwierciedla strukturę domenową (Data Domains).
Przykładowe drzewo:
- Obszar: Sprzedaż
  - Podobszar: Sprzedaż Online
    - Termin: Koszyk
    - Termin: Konwersja
  - Podobszar: Retail
    - Termin: Paragon

# 💡 Przykład zastosowania
Bank wdraża Data Governance.
Tworzy hierarchię: `Bank` -> `Piony` -> `Domeny Danych`.
Dzięki temu, gdy Data Steward z "Pionu Ryzyka" wchodzi do systemu, widzi tylko swój wycinek drzewa i terminy, za które odpowiada, a nie terminy z "Marketingu".

## 📌 Źródła
- DAMA-DMBOK (Data Management Body of Knowledge).

## 👽 Brudnopis
- Poly-hierarchy: Jeden termin może należeć do wielu gałęzi (np. "Pracownik" jest w "HR" i w "Dostępy IT").
- Reguły dziedziczenia (Inheritance): Czy jakość danych dziedziczy się w dół hierarchii?