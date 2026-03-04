---
title: Ansible Inventories (Inwentarze)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - inventory
  - dynamic-inventory
  - groups
  - scaling
aliases:
  - Inwentarz statyczny i dynamiczny
  - Plik hostów Ansible
---
# 🎯 Definicja
**Inventory** to źródło prawdy o Twojej infrastrukturze.
To lista serwerów, którymi zarządza Ansible. Może być prostym plikiem tekstowym (Static) lub programem, który pyta chmurę (Dynamic).

# 🔑 Kluczowe punkty
- **Static Inventory:** Plik `.ini` lub `.yaml`, gdzie wpisujesz IP ręcznie. Dobre na start i dla małych środowisk.
- **Dynamic Inventory:** Skrypt (np. Python), który odpytuje AWS/Azure/VMware: "Jakie mam serwery?". Dobre dla chmury (Autoscaling).
- **Grupy:** Możesz grupować serwery (`[webservers]`, `[dbservers]`).
- **Zagnieżdżanie:** Grupa może zawierać inne grupy (`[production:children] webservers dbservers`).

# 📚 Szczegółowe wyjaśnienie
Przykład Static Inventory (`inventory.ini`):
```ini
[webservers]
node1.example.com
192.168.1.5

[dbservers]
node2.example.com

[production:children]
webservers
dbservers
```

Użycie Dynamic Inventory:
Zamiast pliku tekstowego, podajesz skrypt: `ansible -i my_cloud_script.py all -m ping`.
Ansible uruchamia skrypt, bierze JSON z wyjścia i używa go jako listy hostów.

# 💡 Przykład zastosowania
Masz Auto Scaling Group w AWS. Rano masz 3 serwery, wieczorem 50.
Ręczne wpisywanie IP do pliku jest niemożliwe.
Używasz pluginu `aws_ec2`, który dynamicznie pobiera listę instancji z tagiem `Environment=Production`.

## 📌 Źródła
- Ansible Inventory Guide.

## 👽 Brudnopis
- Nie bój się zaczynać od statycznego pliku. Migracja na dynamiczny jest łatwa, gdy skala tego wymaga.