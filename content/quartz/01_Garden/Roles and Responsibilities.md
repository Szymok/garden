---
title: Roles and Responsibilities
created: 2026-02-23
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja

**Role i Odpowiedzialności** w Data Governance określają strukturę zarządzania danymi, w której każda osoba i grupa ma przypisane konkretne zadania, od wyznaczania strategii po codzienne dbanie o jakość i bezpieczeństwo konkretnych zbiorów informacji.

# 🔑 Kluczowe punkty

*   **Komitet Ładu Danych (Data Governance Committee):** Organ decyzyjny zarządzający politykami, budżetem, ryzykiem i komunikacją.
*   **Data Stewards (Opiekunowie danych):** Osoby stosujące zasady ładu wewnątrz jednostek biznesowych (np. Sales, HR, Finance).
*   **Data Owners (Właściciele danych):** Osoby podejmujące ostateczne decyzje dotyczące konkretnych zbiorów danych, np. zatwierdzanie dostępu.
*   **Personel IT i DBA:** Techniczni wykonawcy polityk (szyfrowanie, maskowanie, retencja, backup).
*   **Wiedza to wspólna odpowiedzialność:** Pracownicy biznesowi również są częścią łańcucha bezpieczeństwa i jakości.

# 📚 Szczegółowe wyjaśnienie

Struktura ról jest zazwyczaj hierarchiczna:
1.  **Poziom Strategiczny:** Komitet (Dyrektor Ładu, przedstawiciele IT i Prawa) wyznacza kierunek i dba o zgodność z celami zarządu.
2.  **Poziom Taktyczny:** Data Stewards dbają o to, by zasady były stosowane w ich działach. Muszą znać specyfikę danych w swojej domenie.
3.  **Poziom Operacyjny:** Data Owners zarządzają konkretnymi datasetami. Wiedzą, co zawierają dane i kto powinien mieć do nich wgląd.
4.  **Wsparcie Techniczne:** Administratorzy Baz Danych (DBA) wdrażają techniczne środki kontroli, takie jak maskowanie danych czy monitorowanie dostępów.

Ważne jest zrozumienie, że ład danych to **odpowiedzialność współdzielona**. Bez zaangażowania użytkowników biznesowych (knowledge workers), którzy raportują błędy i sugerują poprawki, system nie będzie efektywny.

# 💡 Przykład zastosowania

**Hierarchia w obszarze Sprzedaży:**
*   **Jednostka biznesowa:** Sprzedaż.
*   **Domeny danych:** Zamówienia, Leady, Klienci.
*   **Zbiory danych (Datasets):** System ERP (dla zamówień), System lojalnościowy (dla punktów klientów).
*   **Rola:** Właściciel danych systemu ERP podejmuje decyzję o przyznaniu dostępu nowemu pracownikowi działu sprzedaży, upewniając się, że jest to zgodne z polityką komitetu.

## 📌 Źródła

## 👽 Brudnopis

Let's talk about the roles and responsibilities inside data governance. First, there's the data governance committee.
