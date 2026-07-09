---
title: Glossary Terms (Terminy Słownikowe)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - business-glossary
  - semantics
  - definitions
  - standardization
aliases:
  - Termin Biznesowy
  - Business Term
  - Słownik Pojęć
---
# 🎯 Definicja
**Termin Słownikowy** (Glossary Term) to "święta" definicja pojęcia używanego w firmie (np. "Aktywny Klient", "Marża Brutto"). Służy do tego, aby IT, Biznes i Zarząd rozumieli te same słowa w ten sam sposób. Jest podstawowym elementem Business Glossary.

# 🔑 Kluczowe punkty
- **Jednoznaczność:** Eliminuje sytuację, gdy Dział Sprzedaży liczy "Przychód" inaczej niż Dział Księgowości.
- **Własność:** Każdy termin musi mieć Właściciela (Data Owner), który decyduje o jego definicji.
- **Powiązanie z Danymi:** Termin biznesowy jest mapowany na fizyczne kolumny w bazie danych (np. Termin "Email Klienta" -> Tabela `users`, kolumna `contact_email`).

# 📚 Szczegółowe wyjaśnienie
W [[Data Governance|Data Governance]]:
1.  **Physical Data Dictionary:** Opisuje technikalia (Typ pola: Integer, Długość: 50).
2.  **Business Glossary:** Opisuje biznes (Co to znaczy? Jak to liczymy?).
Termin spina te dwa światy. Dzięki temu, gdy patrzysz na techniczną kolumnę `LTV_CALC`, widzisz przypięty termin "Lifetime Value" z definicją: "Suma przychodów od klienta minus koszty obsługi".

# 💡 Przykład zastosowania
Raport sprzedaży pokazuje "Zysk: 1 mln".
Prezes pyta: "Czy to zysk netto czy brutto?".
Analityk najeżdża myszką na pole w raporcie (zintegrowanym z katalogiem) i widzi dymek z definicją Terminu: "Zysk Brutto (EBITDA)". Konflikt zażegnany.

## 📌 Źródła
- DAMA-DMBOK ([[Data Management|Data Management]] Body of Knowledge).

## 👽 Brudnopis
- Budowa słownika to proces polityczny, nie techniczny. Najtrudniejsze jest uzgodnienie definicji "Klienta" między działami marketingu (każdy lead) a finansów (taki co zapłacił fakturę).