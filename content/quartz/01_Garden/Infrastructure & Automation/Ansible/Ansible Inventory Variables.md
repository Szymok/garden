---
title: Zmienne Ansible (Inventory Variables)
created: 2026-02-04
status: sapling
category: DevOps
difficulty: intermediate
language: pl
tags:
  - ansible
  - configuration
  - variables
  - automation
aliases:
  - group_vars
  - vars.yml
---
# 🎯 Definicja
Mechanizm parametryzacji automatyzacji Ansible, pozwalający na dostosowanie zachowania ról i playbooków bez modyfikacji ich kodu źródłowego.

# 🔑 Kluczowe punkty
- **Lokalizacja:** Zazwyczaj `group_vars/all/vars.yml` (zmienne globalne) lub `host_vars/` (zmienne per serwer).
- **Priorytet:** Zmienne hosta nadpisują zmienne grupy, a zmienne przekazane z linii komend (`-e`) nadpisują wszystko.
- **Zastosowanie:** Konfiguracja portów, ścieżek, haseł, wersji pakietów.

# 📚 Szczegółowe wyjaśnienie
W projektach takich jak instalator [[Ataccama|Ataccama]] ONE, `vars.yml` to centrum sterowania. To tutaj decydujesz:
- Jaka wersja Javy ma być użyta.
- Gdzie leżą pliki licencji.
- Jakie są dane dostępowe do bazy (choć te powinny być szyfrowane w Ansible Vault!).

Dobrą praktyką jest nieedytowanie domyślnych wartości wewnątrz ról (`defaults/main.yml`), lecz nadpisywanie ich w inwentarzu (`inventories/prod/group_vars/all.yml`). Daje to czysty podział na kod (role) i konfigurację (inventory).

# 💡 Przykład zastosowania
Definicja zmiennej nadpisującej port HTTP:
```yaml
# group_vars/all.yml
nginx_http_port: 8080
nginx_https_port: 8443
```
Ansible użyje tych wartości zamiast domyślnych 80/443 podczas generowania konfigu Nginx.

## 📌 Źródła
- Ansible Documentation - Using Variables.

## 👽 Brudnopis
- Default variables (`defaults/`) vs Group vars (`group_vars/`) vs Host vars vs Extra vars.
- Precedence (kolejność nadpisywania) jest kluczowa przy debugowaniu ("czemu ta zmienna ma starą wartość?").
