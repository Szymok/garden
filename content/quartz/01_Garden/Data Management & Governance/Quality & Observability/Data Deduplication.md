---
title: Data Deduplication (Deduplikacja Danych)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: intermediate
language: pl
tags:
  - deduplication
  - data-quality
  - master-data
  - one-data
aliases:
  - Usuwanie duplikatów
  - Golden Record
---
# 🎯 Definicja
**Deduplikacja danych** to proces identyfikowania i eliminowania powtarzających się rekordów w zbiorze danych, które reprezentują ten sam byt biznesowy (np. tego samego klienta), ale są zapisane w wielu wierszach. Celem jest uzyskanie "jednej wersji prawdy" (Single Source of Truth).

# 🔑 Kluczowe punkty
- **Identyfikacja:** Duplikaty nie zawsze są identyczne (np. "Jan Kowalski" vs "J. Kowalski"). Potrzebne są algorytmy Matching & Merging.
- **Klucze deduplikacji:** Zestaw atrybutów, po których rozpoznajemy duplikat (np. PESEL + Nazwisko).
- **Golden Record:** Wynik deduplikacji – jeden, scalony, najlepszy rekord reprezentujący dany byt.
- **Ataccama ONE:** Oferuje funkcję deduplikacji przy imporcie danych ("Deduplicated Import") oraz zaawansowane reguły Matchingu w silniku DQ.

# 📚 Szczegółowe wyjaśnienie
W kontekście narzędzi Ataccama ONE Data:
Deduplikacja przy imporcie działa na zasadzie grupowania (`GROUP BY`). System zachowuje **pierwsze wystąpienie** dla klucza i (opcjonalnie) uzupełnia puste pola danymi z kolejnych duplikatów (Aggregation Strategy: Prioritize Non-Null).
W kontekście Master Data Management (MDM):
Deduplikacja jest sercem MDM. To tam dzieje się "Fuzzy Matching" (dopasowanie rozmyte), które radzi sobie z literówkami.

# 💡 Przykład zastosowania
Baza marketingowa zebrała leady z trzech kampanii.
Rekord 1: `Jan Nowak, jan@gmail.com, tel: null`
Rekord 2: `Jan Nowak, null, tel: 500-600-700`
Po prostej deduplikacji (opartej o Imię+Nazwisko) możemy otrzymać jeden rekord scalony:
Wynik: `Jan Nowak, jan@gmail.com, tel: 500-600-700` (wzięto najlepsze wartości z obu).

## 📌 Źródła
- Ataccama ONE Data Documentation.
- DAMA-DMBOK (Data Quality dimensions).

## 👽 Brudnopis
- Deduplikacja to nie to samo co `SELECT DISTINCT`. `DISTINCT` usuwa identyczne wiersze. Deduplikacja biznesowa usuwa logiczne powtórzenia.
- "Survivorship rules" - reguły decydujące, która wartość "przeżyje" (np. "Ufaj systemowi CRM bardziej niż Newsletterowi").