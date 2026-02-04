---
title: Post Processing (Ataccama DQ)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Data Quality
difficulty: intermediate
language: en
tags:
  - post-processing
  - monitoring
  - export
  - integration
aliases:
  - Przetwarzanie wyników DQ
  - Export DQ Results
---
# 🎯 Definicja
**Post Processing** w Ataccama Monitoring Projects to działania, które dzieją się **po** zakończeniu testów jakości danych. Kiedy system policzy już błędy, możesz chcieć wysłać te wyniki do innej bazy, pliku Excel, albo uruchomić proces naprawczy.

# 🔑 Kluczowe punkty
- **Transformation Plans:** Przekształć surowe wyniki DQ (np. dodaj kolumnę z datą, przefiltruj tylko błędy krytyczne) przed eksportem.
- **Integration:** Wyślij wyniki do ONE Data (Data Story), Jira, czy hurtowni danych.
- **Remediation:** Automatycznie twórz zadania dla ludzi "Popraw ten rekord", jeśli błąd jest poważny.

# 📚 Szczegółowe wyjaśnienie
Dostępne opcje:
1.  **Export to File:** Zapisz CSV z błędnymi rekordami na dysku.
2.  **ONE Data Writer:** Zapisz wyniki do tabeli w platformie.
3.  **Custom Plan:** Uruchom dowolny plik `.comp` (Plan ONE Desktop), co daje nieskończone możliwości integracji.

# 💡 Przykład zastosowania
Uruchamiasz nocny monitoring bazy klientów.
Znaleziono 50 klientów bez adresu email.
Post-processing:
1.  Filtruje te 50 rekordów.
2.  Zapisuje je do tabeli `dq_issues_daily` w bazie danych.
3.  Wysyła powiadomienie do zespołu Data Stewards.

## 📌 Źródła
- Ataccama ONE Documentation - Monitoring Projects Post-processing.

## 👽 Brudnopis
- Post-processing to klucz do "Operational DQ". Samo liczenie błędów nic nie daje, jeśli wyniki nie trafiają do ludzi, którzy mogą je naprawić.
