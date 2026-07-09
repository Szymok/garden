---
title: Ansible Software Management (Zarządzanie Oprogramowaniem)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - dnf
  - apt
  - service
  - systemctl
aliases:
  - Ansible Packages
  - Ansible Services
---
# 🎯 Definicja
**Zarządzanie oprogramowaniem** w Ansible to automatyzacja instalacji (`dnf`, `apt`) i zarządzania usługami (`systemctl`).
Zamiast logować się na 100 serwerów i wpisywać `yum install httpd`, piszesz jeden Task.

# 🔑 Kluczowe punkty
- **`package` module:** Uniwersalny moduł (sam wykrywa, czy to RedHat czy Debian).
- **`dnf` / `apt`:** Moduły specyficzne dla systemów, dają więcej opcji.
- **`service`:** Do startowania, stopowania i restartowania usług (np. Apache, Nginx).
- **[[Idempotentność|Idempotentność]]:** Jeśli pakiet już jest zainstalowany, Ansible nic nie robi.

# 📚 Szczegółowe wyjaśnienie
## Zarządzanie Pakietami
```yaml
- name: Install Apache
  ansible.builtin.dnf:
    name: httpd
    state: present # lub 'latest', lub 'absent' (odinstaluj)
```

## Zarządzanie Usługami
```yaml
- name: Start and Enable Apache
  ansible.builtin.service:
    name: httpd
    state: started # 'started', 'stopped', 'restarted'
    enabled: true  # Czy ma wstawać po restarcie systemu?
```

# 💡 Przykład zastosowania
Playbook aktualizujący wszystkie serwery:
1.  Zaktualizuj wszystkie pakiety (`state: latest`).
2.  Zrestartuj server WWW (`state: restarted`).
3.  Upewnij się, że Firewall działa (`state: started`).

## 📌 Źródła
- Ansible Documentation - `ansible.builtin.dnf`.

## 👽 Brudnopis
- Komenda Ad-hoc: `ansible all -m dnf -a "name=httpd state=latest"`.
- Pamiętaj o `become: true` (sudo), bo instalacja wymaga uprawnień roota.
