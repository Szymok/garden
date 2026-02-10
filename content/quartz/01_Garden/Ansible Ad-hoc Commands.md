---
title: Ansible Ad-hoc Commands (Komendy Ad-hoc)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - cli
  - ad-hoc
  - ping
  - command
aliases:
  - Ansible CLI
  - Szybkie komendy Ansible
---
# 🎯 Definicja
**Ad-hoc Commands** to szybkie, jednorazowe polecenia Ansible uruchamiane z terminala.
Idealne do sprawdzenia statusu ("Czy serwery żyją?"), szybkiego restartu lub jednorazowej zmiany, której nie chcesz zapisywać w Playbooku.

# 🔑 Kluczowe punkty
- **Składnia:** `ansible [target] -m [module] -a "[arguments]"`
- **Moduły:**
  - `ping`: Sprawdź połączenie.
  - `command`: Uruchom komendę (bez obsługi rur/pipe).
  - `shell`: Uruchom komendę (z obsługą rur `|`, przekierowań `>`).
  - `copy`: Skopiuj plik.

# 📚 Szczegółowe wyjaśnienie
Opcje CLI:
- `-i inventory`: Wskaż plik inwentarza.
- `-m module`: Jaki moduł użyć (domyślnie `command`).
- `-a "arg=val"`: Argumenty modułu.
- `-b`: Become (sudo).
- `-u user`: Użytkownik SSH.

# 💡 Przykład zastosowania
1.  Ping wszystkich:
    `ansible all -m ping`
2.  Sprawdź uptime:
    `ansible all -a "uptime"` (używa domyślnego modułu `command`).
3.  Zrestartuj serwer (wymaga sudo):
    `ansible db_servers -a "/sbin/reboot" -b`

## 📌 Źródła
- Ansible Ad-hoc Commands Guide.

## 👽 Brudnopis
- `command` vs `shell`: `command` jest bezpieczniejszy (nie wykona przypadkiem `rm -rf *`), ale `shell` daje pełną moc Basha.