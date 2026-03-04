---
title: Ansible Inventory - Definicja Hostów
created: 2026-02-04
status: sapling
category: DevOps
difficulty: basic
language: pl
tags:
  - ansible
  - infrastructure
  - configuration
  - ataccama
aliases:
  - hosts.yml
  - Grupy hostów Ansible
---
# 🎯 Definicja
Plik inwentarza (`hosts.yml` lub `hosts.ini`) definiuje strukturę infrastruktury zarządzanej przez Ansible, mapując adresy IP lub nazwy domenowe serwerów na logiczne grupy (np. `webservers`, `databases`).

# 🔑 Kluczowe punkty
- **Grupy:** Logiczne zbiory serwerów pełniących tę samą rolę (np. `one_app` dla aplikacji głównej).
- **Zmienne hosta:** Parametry specyficzne dla konkretnej maszyny (np. `ansible_host=192.168.1.10`).
- **Hierarchia:** Jeden serwer może należeć do wielu grup.

# 📚 Szczegółowe wyjaśnienie
W kontekście instalacji Ataccama ONE, plik `hosts.yml` jest mapą drogową dla instalatora. Określa, gdzie zainstalować który moduł.
Częste grupy w instalacjach Ataccama:
- `one_app`: Główny serwer aplikacji (Java).
- `one_database`: Serwer bazy danych (Postgres).
- `processing`: Silniki przetwarzania (DPE).
- `monitoring_server`: Prometheus/Grafana.

Brak serwera w grupie "optional" (np. `dqit_server`) oznacza, że ten moduł nie zostanie zainstalowany.

# 💡 Przykład zastosowania
Fragment pliku `hosts.yml`:
```yaml
all:
  children:
    one_app:
      hosts:
        app01.prod.local:
    one_database:
      hosts:
        db01.prod.local:
    monitoring:
      hosts:
        mon01.prod.local:
```
W tym przypadku `app01` obsłuży aplikację, a `db01` bazę danych. Można też umieścić wszystko na jednej maszynie (Single Server Deployment).

## 📌 Źródła
- Ansible Documentation - How to build your inventory.

## 👽 Brudnopis
- Pliki zazwyczaj w `~/one/ansible/inventories/<env>/hosts.yml`.
- Test połączenia: `ansible all -m ping -i hosts.yml`.
- Grupy obowiązkowe vs opcjonalne (zależnie od licencji).
