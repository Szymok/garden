---
title: Backup & Recovery System
created: 2026-02-04
status: evergreen
category: Infrastructure
difficulty: basic
language: pl
tags:
  - backup
  - disaster-recovery
  - security
  - operations
aliases:
  - Kopia zapasowa
  - Odtwarzanie danych
---
# 🎯 Definicja
Proces tworzenia i przechowywania kopii danych w celu ich odzyskania w przypadku utraty, uszkodzenia lub awarii systemu.

# 🔑 Kluczowe punkty
- **Zasada 3-2-1:** 3 kopie danych, na 2 różnych nośnikach, w tym 1 poza siedzibą (offsite/chmura).
- **RPO (Recovery Point Objective):** Jak dużo danych możemy stracić? (np. max 15 minut wstecz).
- **RTO (Recovery Time Objective):** Jak szybko musimy wstać po awarii? (np. w ciągu 4 godzin).
- **Testy:** Backup, którego nie da się odtworzyć, jest bezwartościowy. Testuj `RESTORE`.

# 📚 Szczegółowe wyjaśnienie
W kontekście systemów [[Ataccama|Ataccama]]/Big Data:
- **Metadane (Konfiguracja):** Ważniejsze niż same dane. Dane można często pobrać ze źródeł, ale reguły DQ, plany ETL i słowniki (budowane latami) muszą mieć backup.
- **Baza danych (Postgres):** `pg_dump` lub snapshoty cloudowe (RDS).
- **Pliki (Project Files):** Repozytorium Git jest formą backupu kodu, ale pliki konfiguracyjne serwera (`etc/`) też wymagają kopii.

# 💡 Przykład zastosowania
Awaria dysku na serwerze MDM.
1. Instalujemy nowy system operacyjny.
2. Ansible wdraża konfigurację (Infrastructure as Code).
3. Odtwarzamy bazę Postgres z wczorajszego zrzutu (`pg_restore`).
4. System wstaje, tracimy tylko zmiany z dzisiaj (zgodnie z RPO).

## 📌 Źródła
- Google SRE Book - Data Integrity.

## 👽 Brudnopis
- Snapshoty VM vs Backup aplikacji.
- Backup logiczny ([[SQL|SQL]] dump) vs fizyczny (kopiowanie plików bazy).
- Ransomware - backupy muszą być "immutable" (tylko do odczytu) lub odseparowane sieciowo (air-gapped), żeby wirus ich nie zaszyfrował.