---
title: Uruchamianie Ansible Playbooks (Ataccama)
created: 2026-02-04
status: evergreen
category: DevOps
difficulty: intermediate
language: pl
tags:
  - ansible
  - playbooks
  - operation
  - maintenance
  - ataccama
aliases:
  - site.yml
  - Wykonywanie playbooków
  - Tagi ansible
---
# 🎯 Definicja
Instrukcja wykonywania głównych procedur instalacyjnych i utrzymaniowych platformy za pomocą komendy `ansible-playbook`.

# 🔑 Kluczowe punkty
- **Główny playbook:** `site.yml` (instaluje wszystko).
- **Komenda:** `ansible-playbook -i <inventory> site.yml`.
- **Tagi:** Pozwalają uruchomić tylko fragment procesu (np. `--tags monitoring` lub `--tags restart`).
- **Start-at-task:** Opcja wznawiania przerwanej instalacji od konkretnego kroku (z zachowaniem ostrożności).

# 📚 Szczegółowe wyjaśnienie
Playbook to skrypt opisujący stan docelowy infrastruktury. W Ataccama ONE mamy kilka playbooków zależnie od typu instalacji (Standalone MDM, DQ&C, Hybrid), ale najczęstszy to `site.yml`.

**Przydatne flagi:**
- `-i`: ścieżka do inwentarza.
- `-u`: użytkownik SSH (np. `centos` lub `ec2-user`).
- `--private-key`: ścieżka do klucza `.pem`.
- `--diff`: pokazuje co dokładnie zmieni się w plikach konfiguracyjnych.
- `-v / -vvv`: poziom logowania (verbose), kluczowe przy błędach.

**Zarządzanie usługami:**
Ansible służy też jako pilot do sterowania klastrem.
`ansible-playbook ... --tags stop` -> Zatrzymuje usługi.
`ansible-playbook ... --tags start` -> Uruchamia usługi.

# 💡 Przykład zastosowania
Pełna instalacja:
```bash
ansible-playbook -i inventories/prod/hosts.yml site.yml
```

Restart tylko usług i odświeżenie licencji:
```bash
ansible-playbook -i inventories/prod/hosts.yml site.yml --tags license,restart
```

## 📌 Źródła
- Ansible Documentation - Playbooks.

## 👽 Brudnopis
- Logika idempotempotencji: ponowne uruchomienie playbooka "naprawia" konfigurację, nie psuje jej (zazwyczaj).
- Raporty: `summaries/` directory zawiera HTML z podsumowaniem wdrożenia.
- Limity: Nie używaj `--start-at-task` dla dynamicznych include'ów.
- Firewall: Zmiana reguł firewalla wymaga przeinstalowania ról (full run).