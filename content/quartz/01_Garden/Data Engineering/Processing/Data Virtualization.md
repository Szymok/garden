---
title: Data Virtualization (Wirtualizacja Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: intermediate
language: pl
tags:
  - virtualization
  - federation
  - logical-layer
  - no-copy
  - denodo
  - dremio
aliases:
  - Wirtualizacja Danych
  - Federacja Danych
---
# 🎯 Definicja
**Wirtualizacja Danych** to dostęp do danych bez ich przenoszenia.
Zamiast kopiować dane z CRM, ERP i Excela do jednej Hurtowni (ETL), tworzysz "Wirtualną Warstwę", która odpytuje te systemy w czasie rzeczywistym, udając, że jest jedną bazą.

# 🔑 Kluczowe punkty
- **No Data Movement:** Dane zostają u źródła. Zero kopiowania.
- **Real-Time:** Widzisz dane takie, jakie są teraz w systemie źródłowym.
- **Federated Query:** Jedno zapytanie SQL łączy dane z Oracle (CRM) i pliku CSV (Excel).

# 📚 Szczegółowe wyjaśnienie
Tradycyjne ETL: Kopiuj wszystko do Data Warehouse. Zajmuje to czas i miejsce.
Wirtualizacja: Użytkownik pyta o "Klientów". Wirtualizator w tle pyta Oracle'a, pyta Salesforce'a, skleja wyniki w pamięci RAM i oddaje użytkownikowi.
Technologie: [[Denodo]], Dremio, Trino (Presto). Dremio używa [[Apache Arrow]] do szybkiego przetwarzania w pamięci.

# 💡 Przykład zastosowania
Firma fuzjuje się z drugą.
Firma A ma SAP. Firma B ma Oracle.
Zmigrowanie danych zajmie 2 lata.
Stawiają Wirtualizację (np. Denodo). W tydzień mogą raportować sprzedaż z obu firm łącznie, mimo że systemy są oddzielne.

## 📌 Źródła
- Dremio - What is Data Virtualization?

## 👽 Brudnopis
- Zaleta: Szybkość wdrożenia (Days vs Months).
- Wada: Wydajność (Zapytanie jest tak wolne, jak najwolniejsze źródło). Nie nadaje się do ciężkiej analityki historycznej.
