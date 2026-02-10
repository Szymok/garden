---
title: Ansible Components (Komponenty Ansible)
created: 2026-02-10
status: evergreen
category: DevOps / Ansible
difficulty: basic
language: pl
tags:
  - ansible
  - architecture
  - inventory
  - playbooks
  - modules
aliases:
  - Architektura Ansible
  - Ansible Plugins
---
# 🎯 Definicja
Ansible składa się z kilku kluczowych elementów, które współpracują jak ekipa filmowa.
**Control Node** to Reżyser. **Managed Nodes** to Aktorzy. **Playbook** to Scenariusz.

# 🔑 Kluczowe punkty
1.  **Inventory:** Lista aktorów (serwerów). Plik tekstowy lub skrypt dynamiczny.
2.  **Playbooks:** Scenariusz filmu. Pliki YAML definiujące, co ma się wydarzyć.
3.  **Modules:** Narzędzia pracy. Małe programy (zazwyczaj w Pythonie), które wykonują konkretną pracę (np. `dnf` instaluje paczkę, `copy` kopiuje plik).
4.  **Plugins:** Rozszerzenia silnika Ansible (np. logowanie, łączenie cache).

# 📚 Szczegółowe wyjaśnienie
- **Control Node:** Tu instalujesz Ansible. Tu trzymasz kod.
- **Agentless:** Na Managed Nodes nie instalujesz nic (poza Pythonem i SSH). To ogromna zaleta w porównaniu do Puppet/Chef (gdzie musisz zarządzać agentami).
- **YAML:** Język, w którym piszesz Playbooki. Czytelny dla człowieka ("Human-readable"), przypomina listę zakupów. Wrażliwy na wcięcia!

# 💡 Przykład zastosowania
Reżyser (Control Node) czyta scenariusz (Playbook), patrzy na listę obsady (Inventory) i wydaje polecenia aktorom (Managed Nodes) używając megafonu (SSH), każąc im wykonać konkretne czynności (Modules).

## 📌 Źródła
- Ansible Architecture Docs.
