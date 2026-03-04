---
title: Ansible Environment Configuration (Konfiguracja Środowiska)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - env
  - configuration
  - installation
aliases:
  - Konfiguracja Ansible
  - Ansible Env
---
# 🎯 Definicja
Konfiguracja Ansible to nie tylko plik `ansible.cfg`. To całe podejście do tego, jak i gdzie uruchamiasz automatyzację.
Możesz uruchamiać Ansible na **fizycznym serwerze**, **wirtualnej maszynie**, **kontenerze** (Docker), a nawet **WSL** (Windows Subsystem for Linux).

# 🔑 Kluczowe punkty
- **Control Node:** Jedyna maszyna, na której instalujesz Ansible.
- **Linux only:** Control Node musi być systemem Unix-like (Linux/macOS). Windows nie jest natywnie wspierany jako Control Node (użyj WSL).
- **Wymagania:** Python 3.8+ na Control Node, Python 2.6+ na Managed Nodes.

# 📚 Szczegółowe wyjaśnienie
Opcje instalacji:
1.  **System Package Manager:** `dnf install ansible-core` (Stabilne, systemowe).
2.  **Pip:** `pip install ansible` (Najnowsze wersje, per-user lub w venv).
3.  **Kontener:** Obraz Docker z Ansible. Świetne do CI/CD (GitLab Runner), bo zawsze masz czyste środowisko.

Zalety Agentless:
- Szybki start (nic nie instalujesz na celu).
- Mniej do utrzymania/aktualizacji.
- Bezpieczniej (mniej otwartych portów, tylko standardowy SSH).

# 💡 Przykład zastosowania
Firma ma mieszane środowisko: 100 Linuxów, 50 Windowsów.
Stawiasz jeden Control Node (RHEL).
Dla Linuxów używasz SSH.
Dla Windowsów konfigurujesz WinRM.
Zarządzasz wszystkim z jednego miejsca.

## 📌 Źródła
- Ansible Installation Docs.

## 👽 Brudnopis
- Windows jako Control Node? NIE. Użyj WSL2 (Ubuntu). To działa świetnie.