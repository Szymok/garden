---
title: Odpowiedzialność za Źródła Danych w Ataccama
created: 2026-02-04
status: sapling
category: Data Governance
difficulty: basic
language: pl
tags:
  - ataccama
  - data-sources
  - security
  - architecture
aliases:
  - Zarządzanie źródłami danych Ataccama
---
# 🎯 Definicja
Model odpowiedzialności określający podział ról między platformą Ataccama ONE a klientem w kontekście utrzymania, dostępności i bezpieczeństwa źródeł danych, z którymi integruje się platforma.

# 🔑 Kluczowe punkty
- **Szeroka łączliwość:** Platforma obsługuje relacyjne bazy danych, hurtownie danych oraz systemy Big Data.
- **Rola Ataccamy:** Platforma działa jako *konsument* danych – przetwarza je, ale nimi nie zarządza administracyjnie.
- **Rola Klienta:** Klient odpowiada za dostępność (uptime), backupy, monitoring oraz nadawanie uprawnień dostępowych do źródeł.

# 📚 Szczegółowe wyjaśnienie
W architekturze rozwiązań Data Management kluczowe jest rozróżnienie między narzędziem przetwarzającym (Ataccama) a infrastrukturą przechowującą (Bazy Danych). Notatka podkreśla, że Ataccama ONE nie zastępuje administratora bazy danych (DBA).

Jeśli baza danych źródłowa (np. Oracle, PostgreSQL) ulegnie awarii, Ataccama nie ma możliwości jej naprawy. Rola platformy ogranicza się do bezpiecznego połączenia i wykonania operacji odczytu/zapisu zgodnie z definicją procesów DQ/MDM. Dlatego krytyczne jest, aby organizacja posiadała niezależne procedury Disaster Recovery dla swoich źródeł danych.

# 💡 Przykład zastosowania
Dział IT klienta musi zapewnić:
1. Otwarte porty na firewallu dla serwerów Ataccama.
2. Konto serwisowe z uprawnieniami `SELECT` (dla profilowania) lub `INSERT/UPDATE` (dla MDM).
3. Regularne tworzenie kopii zapasowych bazy danych.

## 📌 Źródła
- "Supported Data Sources" documentation (dokumentacja producenta)

## 👽 Brudnopis
- The Ataccama ONE Platform connects to **numerous data sources for processing**, including relational databases, data warehouses, and big data sources.
- For a comprehensive list of supported data sources, refer to the "Supported Data Sources" documentation.
- **Ataccama does not manage data sources**.
- The **customer is solely responsible for managing access, ensuring their reliability**, including monitoring, backups, and other maintenance.