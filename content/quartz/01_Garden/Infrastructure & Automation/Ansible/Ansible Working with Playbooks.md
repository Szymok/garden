---
title: Ansible Working with Playbooks (Praca z Playbookami)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - playbooks
  - yaml
  - automation
aliases:
  - Tworzenie Playbooków
  - Ansible Playbook
---
# 🎯 Definicja
**Playbook** to lista zadań (Tasks) zapisana w pliku YAML.
To "scenariusz" dla Ansible. W przeciwieństwie do komend Ad-hoc (jednorazowych), Playbooki są zapisywane, wersjonowane (Git) i wielokrotnego użytku.

# 🔑 Kluczowe punkty
- **Struktura:** 
  - **Play:** Dotyczy konkretnej grupy hostów (np. "Webservers").
  - **Tasks:** Lista kroków do wykonania (np. "Zainstaluj PHP", "Skopiuj Config").
- **Moduły:** Klocki budulcowe (`file`, `lineinfile`, `copy`, `dnf`).
- **Idempotentność:** Możesz uruchomić Playbook 100 razy. Jeśli system jest już skonfigurowany, Ansible nic nie zmieni.

# 📚 Szczegółowe wyjaśnienie
Przykładowy Playbook `setup_web.yml`:
```yaml
---
- name: Setup Webserver
  hosts: webservers
  become: true
  tasks:
    - name: Ensure Apache is installed
      dnf:
        name: httpd
        state: present
    
    - name: Ensure index.html exists
      copy:
        content: "Hello World"
        dest: /var/www/html/index.html
```

# 💡 Narzędzia
- **Vim Config:** Dodaj `autocmd FileType yaml setlocal ai ts=2 sw=2 et` do `.vimrc`, żeby mieć poprawne wcięcia (2 spacje).
- **Lineinfile:** Moduł do edycji konkretnej linii w pliku konfiguracyjnym (chirurgiczna precyzja, zamiast nadpisywać cały plik).

## 📌 Źródła
- Ansible Intro to Playbooks.

## 👽 Brudnopis
- Pamiętaj: Spacje, nie tabulatory! YAML nienawidzi tabulatorów.
