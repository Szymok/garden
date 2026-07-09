---
title: Monitoring DQ Reports (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Monitoring
difficulty: intermediate
language: en
tags:
  - reports
  - dq
  - monitoring
  - dashboards
  - anomalies
aliases:
  - Raporty Jakości Danych
  - DQ Reporting
---
# 🎯 Definicja
**Monitoring DQ [[Reports|Reports]]** to automatycznie generowane raporty w [[Ataccama|Ataccama]] ONE, które pokazują stan zdrowia Twoich danych po każdym sprawdzaniu (Run). Widzisz w nich trendy (czy jest lepiej, czy gorzej) i anomalie.

# 🔑 Kluczowe punkty
- **Sections:** Możesz dzielić raport na sekcje logiczne (np. "Dane Kontaktowe", "Dane Finansowe"), żeby Stewardzi nie musieli przekopywać się przez wszystko.
- **History:** Widzisz wykres w czasie. "Wczoraj mieliśmy 99% poprawnych emaili, dzisiaj spadło do 80%".
- **Interactivity:** Możesz kliknąć w słupek błędu i zobaczyć konkretne, zepsute rekordy (Drill-down).

# 📚 Szczegółowe wyjaśnienie
Raporty są dostępne w zakładce **Report** w każdym projekcie monitoringu ([[Monitoring Project|Monitoring Project]]).
Ważne: Po zmianie konfiguracji raportu (np. dodaniu nowej sekcji), musisz uruchomić monitoring (Run) jeszcze raz, żeby zobaczyć zmiany.

# 💡 Przykład zastosowania
Data Steward odpowiedzialny za "Klienta" wchodzi rano w raport.
Widzi czerwoną lampkę w sekcji "Adresy".
Klika. Okazuje się, że wczorajszy import z nowego systemu CRM przyniósł 5000 adresów bez kodu pocztowego.
Eksportuje te rekordy do Excela i wysyła do IT z prośbą o poprawkę importu.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Monitoring documentation.

## 👽 Brudnopis
- Raport powinien być czytelny dla BIZNESU. Nie nazywaj sekcji "Rule_45_A", nazwij ją "Poprawność numerów PESEL".
