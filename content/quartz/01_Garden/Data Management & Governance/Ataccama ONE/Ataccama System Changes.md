---
title: Zarządzanie Zmianami Systemowymi (System Changes)
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - administration
  - metadata
  - migration
  - updates
aliases:
  - Ataccama System Upgrades
  - No Model Mode
---
# 🎯 Definicja
Mechanizm aplikowania zmian w modelu metadanych (Metadata Model) lub aktualizacji wersji systemu, wymagający przełączenia aplikacji w tryb serwisowy ("No Model Mode").

# 🔑 Kluczowe punkty
- **Dwa typy zmian:** System Upgrade Commands (techniczne aktualizacje wersji) oraz User Changes (zmiany w modelu danych, np. nowe encje).
- **Tryb pracy:** Aplikacja przechodzi w *No Model Mode*, co oznacza niedostępność dla zwykłych użytkowników na czas migracji.
- **Backup:** System wymusza potwierdzenie wykonania snapshotu bazy danych przed rozpoczęciem procedury.

# 📚 Szczegółowe wyjaśnienie
Kiedy Data Steward zmienia model (np. dodaje pole "NIP" do encji Klient), zmiana ta musi zostać odzwierciedlona w strukturze bazy danych. Nie dzieje się to "w locie".
Proces wygląda tak:
1. Zmiany są kolejkowane jako "Pending Changes".
2. Administrator uruchamia procedurę "Run changes".
3. Aplikacja blokuje dostęp, wykonuje skrypty `ALTER TABLE` na bazie.
4. Po sukcesie wraca do "Application Mode".

Jeśli coś pójdzie nie tak, aplikacja zostanie w trybie "No Model Mode" i trzeba zajrzeć w logi (Application Log) i przywrócić bazę ze snapshotu.

# 💡 Przykład zastosowania
Aktualizacja wersji Ataccama ONE z 14.5 do 14.6:
1. Administrator wgrywa nowe pliki binarne na serwer (przez Ansible).
2. Po restarcie usługa wykrywa, że wersja kodu jest nowsza niż wersja bazy.
3. Wchodzi w tryb serwisowy.
4. W UI "System Changes" pojawia się lista skryptów migracyjnych.
5. Klikasz "Run changes" -> baza jest aktualizowana -> system wstaje.

## 📌 Źródła


## 👽 Brudnopis
There are two types of system changes: System upgrade commands (new system version) and User changes (metadata model changes).
In both cases, metadata model changes are published and propagated to the database only after the metadata model has been successfully validated.
**Procedure**:
1. Global Settings > System Changes.
2. Check Current/Pending/Applied changes.
3. Arrange Execution Order (Edit, Skip, Delete).
4. Run changes -> Switches to **No Model Mode**.
5. **Backup Confirmation** (Create DB snapshot is strongly recommended/mandatory step).
6. Wait for success -> Switches back to Application Mode.