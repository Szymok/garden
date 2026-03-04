---
title: Data Remediation (Naprawa Danych w ONE Data)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - remediation
  - data-cleaning
  - one-data
  - manual-fix
aliases:
  - Remediacja Danych
  - Ręczna naprawa danych
---
# 🎯 Definicja
**Data Remediation** to proces naprawy błędnych danych. W przeciwieństwie do automatycznego czyszczenia (gdzie skrypt poprawia tysiące rekordów), remediacja często wymaga interwencji człowieka (Stewarda), który musi podjąć decyzję, jak poprawić konkretny rekord (np. zadzwonić do klienta i zapytać o poprawny adres). W Ataccama ONE odbywa się to w module **ONE Data**.

# 🔑 Kluczowe punkty
- **Workflow:** Wykrycie błędu (Monitoring) -> Załadowanie do ONE Data -> Ręczna korekta -> Walidacja -> Eksport do źródła.
- **Interaktywność:** Gdy Steward poprawia dane w tabeli, reguły DQ przeliczają się w czasie rzeczywistym ("On-the-fly validation"), pokazując czy rekord jest już zielony (poprawny).
- **Zastosowanie:** Błędy, których nie da się naprawić automatem (np. literówki w nazwach firm, których nie ma w słowniku).

# 📚 Szczegółowe wyjaśnienie
Proces w Ataccama ONE:
1.  Monitoring DQ wykrywa 500 rekordów "Invalid" w hurtowni.
2.  Data Steward klika "Load to ONE Data" (filtrując tylko te błędne).
3.  Otwiera tabelę w przeglądarce. Widzi podświetlone na czerwono komórki.
4.  Może użyć "Bulk Edit" (masowa zmiana) lub poprawiać ręcznie.
5.  Gdy naprawi, eksportuje czyste rekordy z powrotem do bazy (nadpisując te błędne) lub do tabeli stagingowej.

# 💡 Przykład zastosowania
Baza kontaktów VIP.
Reguła wykryła, że dla klienta "Prezes XYZ" brakuje numeru telefonu.
Automat tego nie wymyśli. Steward musi znaleźć wizytówkę, wpisać numer ręcznie w ONE Data. System od razu sprawdzi format (+48...). Jeśli OK, Steward zatwierdza zmianę.

## 📌 Źródła
- Ataccama ONE Data Documentation.

## 👽 Brudnopis
- To narzędzie typu "Data Stewardship" / "Data Curation".
- Ważne jest zachowanie Audit Trail (kto i kiedy zmienił dane ręcznie), co ONE Data zapewnia.