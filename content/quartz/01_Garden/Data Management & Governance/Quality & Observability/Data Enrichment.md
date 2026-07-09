---
title: Data Enrichment (Wzbogacanie Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering/ETL
difficulty: basic
language: pl
tags:
  - enrichment
  - transformation
  - etl
  - external-data
aliases:
  - Wzbogacanie danych
  - Data Augmentation
---
# 🎯 Definicja
**Data Enrichment** (Wzbogacanie Danych) to proces rozszerzania wewnętrznych danych organizacji o dodatkowe informacje pochodzące z zewnętrznych źródeł (np. API, publiczne [[Bazy danych|bazy danych]], dostawcy tacy jak Dun & Bradstreet). Celem jest podniesienie wartości analitycznej danych.

# 🔑 Kluczowe punkty
- **Szerszy kontekst:** Pozwala zobaczyć więcej niż mamy w systemach transakcyjnych (np. dodanie danych demograficznych do historii zakupów).
- **Poprawa jakości:** Często naprawia błędne dane (np. poprawa adresu i dodanie kodu pocztowego).
- **Metody:** Lookupy (Słowniki), API Calls, Joiny z zewnętrznymi tabelami.

# 📚 Szczegółowe wyjaśnienie
Wzbogacanie zazwyczaj odbywa się w fazie **Transform** (w ETL) lub jako osobny proces w MDM.
Typowe rodzaje wzbogacania:
1.  **Geo-Enrichment:** Zamiana adresu IP na Kraj/Miasto. Zamiana adresu ulicy na współrzędne GPS.
2.  **Firmograficzne:** Masz NIP firmy -> pobierasz z REGON/VIES nazwę, branżę, liczbę pracowników, przychód.
3.  **Demograficzne:** Masz imię "Anna" -> przypisujesz Płeć: Kobieta.

# 💡 Przykład zastosowania
Sklep internetowy ma tylko adres dostawy klienta.
Proces Enrichmentu dodaje do rekordu:
1.  Współrzędne GPS (do optymalizacji trasy kuriera).
2.  Typ budynku (dom jednorodzinny vs blok).
3.  Zamożność dzielnicy (do celów marketingowych).
Dzięki temu analitycy mogą odkryć, że "Najwięcej kupują mieszkańcy bloków w dzielnicach X".

## 📌 Źródła
- "Fundamentals of Data Engineering" - Joe Reis.

## 👽 Brudnopis
- W [[Ataccama|Ataccama]] ONE: Komponenty `Lookup`, `Online Web Service`, `Join`.
- Uwaga na RODO: Wzbogacanie danych osobowych o dane profilujące wymaga zgody użytkownika!