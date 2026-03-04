---
title: Ansible Lab Setup (Konfiguracja Środowiska)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - lab
  - setup
  - installation
  - ssh
aliases:
  - Instalacja Ansible
  - Ansible Environment Setup
---
# 🎯 Definicja
Przygotowanie **Control Node** (gdzie uruchamiasz Ansible) i **Managed Nodes** (którymi zarządzasz).
Ansible jest **agentless** (nie wymaga instalacji agenta na serwerach docelowych), ale wymaga poprawnej konfiguracji SSH i Pythona.

# 🔑 Kluczowe punkty
- **Wymagania Control Node:** Linux (RHEL, Ubuntu, WSL), Python 3.8+, dostęp do sieci.
- **Wymagania Managed Node:** Python (do wykonywania modułów), SSH (Linux) lub WinRM (Windows).
- **Użytkownik:** Dedykowany użytkownik (np. `ansible`) z uprawnieniami `sudo` bez hasła (`NOPASSWD`).

# 📚 Szczegółowe wyjaśnienie
Kroki instalacji (RHEL):
1.  `subscription-manager register` (Dostęp do repozytoriów).
2.  `dnf install ansible-core`.
3.  Konfiguracja SSH Key-Based Auth: `ssh-copy-id ansible@node1`.

Konfiguracja `ansible.cfg` (priorytety):
1.  `ANSIBLE_CONFIG` (zmienna środowiskowa).
2.  `./ansible.cfg` (katalog bieżący - Zalecane!).
3.  `~/.ansible.cfg` (katalog domowy).
4.  `/etc/ansible/ansible.cfg` (globalny).

# 💡 Przykład zastosowania
Plik `ansible.cfg` w katalogu projektu:
```ini
[defaults]
inventory = ./inventory
remote_user = ansible
host_key_checking = False

[privilege_escalation]
become = True
become_method = sudo
become_user = root
```

## 📌 Źródła
- Ansible Installation Guide.
