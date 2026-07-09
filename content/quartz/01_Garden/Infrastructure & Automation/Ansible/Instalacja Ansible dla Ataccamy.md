---
title: Instalacja Ansible (dla Ataccamy)
created: 2026-02-04
status: evergreen
category: DevOps / Ataccama
difficulty: intermediate
language: pl
tags:
  - ansible
  - installation
  - python
  - automation
  - ataccama-one
aliases:
  - Ansible Setup
  - Konfiguracja Ansible
---
# 🎯 Definicja
**Ansible** jest narzędziem wymaganym do instalacji platformy [[Ataccama|Ataccama]] ONE (wersje [[PaaS|PaaS]] i On-Prem). Ponieważ instalator ONE to zbiór skryptów Ansible (Playbooków), musimy najpierw poprawnie skonfigurować środowisko (Controller Node), z którego będziemy zarządzać instalacją.

# 🔑 Kluczowe punkty
- **Python:** Wymagany Python 3.10+.
- **Virtual Environment (venv):** Zalecana instalacja w izolowanym środowisku Python, aby unikać konfliktów bibliotek.
- **Proxy:** Jeśli serwer jest za firewallem korporacyjnym, trzeba skonfigurować zmienne `http_proxy`.
- **System:** Red Hat (RHEL) lub Ubuntu.

# 📚 Szczegółowe wyjaśnienie (Proces)
1. **Paczki systemowe:** Zainstaluj `git`, `python3-pip`, `sshpass` (dla haseł SSH), `unzip`.
2. **Paczka ONE:** Pobierz instalator [[Ataccama|Ataccama]] ONE i rozpakuj go do katalogu `~/one/`.
3. **Venv:**
   ```bash
   python3 -m venv ~/venv
   source ~/venv/bin/activate
   ```
4. **Instalacja Ansible:** Wewnątrz venv zainstaluj ansible (wersja min. 2.15.4) za pomocą plików dostarczonych przez Ataccamę (`requirements.txt` w paczce).
5. **Konfiguracja (`ansible.cfg`):** Skopiuj przykładowy plik konfiguracyjny do katalogu domowego, aby logi trafiały w jedno miejsce.
6. **Weryfikacja:** Uruchom `ansible --version` i prosty ping do serwerów (`ansible all -m ping`).

# 💡 Przykład zastosowania
Administrator dostaje 3 czyste serwery Linux, na których ma postawić Ataccamę.
Zamiast logować się na każdy z osobna, loguje się na swój laptop (lub bastion host), instaluje tam Ansible wg powyższej procedury, uzupełnia plik `hosts` (Inventory) adresami tych 3 serwerów i uruchamia jeden komendę, która instaluje całą platformę.

## 📌 Źródła
- [[Ataccama|Ataccama]] Installation Guide (Ansible Prerequisites).

## 👽 Brudnopis
- Najczęstszy błąd: Brak ustawienia `locale` (UTF-8), co powoduje błędy przy instalacji. Rozwiązanie: `sudo localectl set-locale LANG=en_US.UTF-8`.
- Pamiętaj, że Ansible działa bezagentowo (przez SSH), więc kluczowe jest działające połączenie SSH z kontrolera do serwerów docelowych.