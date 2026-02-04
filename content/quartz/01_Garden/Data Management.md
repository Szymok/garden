---
title: Data Management (Zarządzanie Danymi)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: basic
language: pl
tags:
  - data-management
  - governance
  - quality
  - security
  - lifecycle
aliases:
  - Zarządzanie Danymi
  - DAMA-DMBOK
---
# 🎯 Definicja
**Data Management** to wszystko, co robisz, żeby dane były atutem, a nie ciężarem.
Obejmuje zbieranie, przechowywanie, zabezpieczanie, czyszczenie i udostępnianie danych.
To parasol nad Data Engineering, Data Governance, Data Quality i Security.

# 🔑 Kluczowe punkty
- **Dostępność:** Dane muszą być dostępne dla tych, co ich potrzebują (Demokratyzacja).
- **Jakość:** Dane muszą być poprawne (Data Quality).
- **Bezpieczeństwo:** Dane nie mogą wyciec (Security/Compliance).

# 📚 Szczegółowe wyjaśnienie
Według DAMA-DMBOK (Biblii zarządzania danymi), obszary to m.in.:
1.  **Data Governance:** Zasady i polityki ("Kto rządzi?").
2.  **Data Architecture:** Struktura systemów.
3.  **Master Data Management ([[Master Data Management (MDM)|MDM]]):** Zarządzanie "Złotymi Rekordami" (Klient, Produkt).
4.  **Data Quality:** Ciągłe monitorowanie błędów.

# 💡 Przykład zastosowania
Firma ma 3 systemy CRM. Każdy handlowiec wpisuje klientów jak chce.
Efekt: Bałagan. Marketing wysyła 3 maile do tego samego klienta.
Rozwiązanie (Data Management):
1.  Wdrożenie MDM (Scalenie klientów).
2.  Data Governance (Zasada: "Pole NIP jest obowiązkowe").
3.  Data Quality (Raport błędnych NIPów co rano).

## 📌 Źródła
- DAMA-DMBOK2 Guide.

## 👽 Brudnopis
- "Data is the new oil". Ale ropa w stanie surowym jest bezużyteczna. Trzeba ją wydobyć, przetransportować, rafinować i zabezpieczyć. To jest właśnie Data Management.
