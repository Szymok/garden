---
title: Master Data Management (Zarządzanie Danymi Podstawowymi)
created: 2026-02-04
status: evergreen
category: Master Data Management
difficulty: intermediate
language: pl
tags:
  - mdm
  - golden-record
  - data-governance
  - single-source-of-truth
  - customer-360
aliases:
  - MDM
  - Dane Podstawowe
  - Golden Record
---
# 🎯 Definicja
**Master Data Management (MDM)** to "serce" ekosystemu danych. To procesy i technologie, które gwarantują, że w całej firmie istnieje **tylko jedna, prawdziwa wersja** informacji o Klientach, Produktach czy Pracownikach.

# 🔑 Kluczowe punkty
- **Master Data:** Dane rzadko zmienne, kluczowe dla biznesu (np. Jan Kowalski, PESEL: 123).
- **Problemy:** Duplikaty (Jan Kowalski vs J. Kowalski), nieaktualne dane, silosy (CRM ma inny adres niż system wysyłkowy).
- **Rozwiązanie:** MDM łączy te dane, czyści je i tworzy **Złoty Rekord** (Golden Record).

# 📚 Szczegółowe wyjaśnienie
MDM to nie tylko baza danych, to proces:
1.  **Deduplikacja:** System widzi "Jan Kowalski" i "Jan A. Kowalski" pod tym samym adresem. Łączy ich w jedną osobę.
2.  **Survivorship:** Decyduje, który numer telefonu jest "prawdziwy" (np. ten z systemu bilingowego, bo jest nowszy).
3.  **Dystrybucja:** Rozsyła ten poprawny numer z powrotem do wszystkich systemów (CRM, ERP).

# 💡 Przykład zastosowania
Bank.
Masz konto osobiste i firmowe.
Bez MDM: Dla banku jesteś dwoma różnymi osobami. Dzwonią do Ciebie dwa razy z tą samą ofertą.
Z MDM: Bank widzi "Jana Kowalskiego" jako jedną osobę z dwoma produktami (Widok 360 stopni). Oferta jest dopasowana, a Ty jesteś mniej zirytowany.

## 📌 Źródła
- "Master Data Management and Data Governance" (Alex Berson).

## 👽 Brudnopis
- MDM to często najdroższy i najtrudniejszy projekt w firmie, bo wymaga współpracy politycznej między działami ("Kto jest właścicielem danych klienta? Sprzedaż czy Marketing?").