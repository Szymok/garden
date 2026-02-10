---
title: Ansible Facts (Fakty systemowe)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: intermediate
language: pl
tags:
  - ansible
  - facts
  - setup
  - variables
aliases:
  - Ansible Setup Module
  - Zmienne systemowe Ansible
---
# 🎯 Definicja
**Ansible Facts** to informacje o systemie zdalnym, które Ansible zbiera automatycznie przy połączeniu.
Są to: adresy IP, wersja systemu operacyjnego, ilość pamięci RAM, procesor, dyski.

# 🔑 Kluczowe punkty
- **Automatyczne zbieranie:** Zazwyczaj pierwsze zadanie w Playbooku (`Gathering Facts`).
- **Użycie w zmiennych:** Możesz użyć faktu (np. `ansible_os_family`) by zdecydować, czy użyć `apt` (Debian) czy `dnf` (RedHat).
- **Custom Facts:** Możesz definiować własne fakty w `/etc/ansible/facts.d/*.fact`.

# 📚 Szczegółowe wyjaśnienie
Moduł odpowiedzialny za zbieranie faktów to `setup`.
Możesz go uruchomić ręcznie:
`ansible all -m setup` (Zwróci wielki JSON z informacjami).

Przykład Playbooka warunkowego:
```yaml
- name: Install Apache
  dnf:
    name: httpd
  when: ansible_os_family == "RedHat"
```

# 💡 Przykład zastosowania
Chcesz wygenerować raport HTML o swoich 100 serwerach (IP, OS, RAM).
Używasz Ansible Facts, by wyciągnąć te dane z każdego serwera i wstawić je do szablonu Jinja2.

## 📌 Źródła
- Ansible Facts Guide.

## 👽 Brudnopis
- Jeśli Playbook działa wolno, a nie potrzebujesz faktów, wyłącz je: `gather_facts: no`.
