---
title: Zależności i Wymagania Ansible (Ataccama)
created: 2026-02-04
status: sapling
category: DevOps
difficulty: basic
language: pl
tags:
  - ansible
  - dependencies
  - ataccama
  - requirements
aliases:
  - Wymagania kontrolera Ansible
---
# 🎯 Definicja
Lista oprogramowania i zasobów niezbędnych na maszynie kontrolera (oraz maszynach docelowych) do poprawnego uruchomienia skryptów instalacyjnych [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **Kontroler:** Musi posiadać `python3`, `pip`, `git`, `curl` oraz binaria `ansible`.
- **System:** Dedykowana mała maszyna (VM) lub laptop operatora (pod Linux/WSL/macOS). Windows bez WSL nie jest zalecany.
- **Sieć:** Dostęp SSH do serwerów docelowych.

# 📚 Szczegółowe wyjaśnienie
Ansible jest "agentless", ale wymaga, by na maszynie sterującej (Controller) było odpowiednie środowisko Python. [[Ataccama|Ataccama]] dostarcza skrypty w paczce ZIP, ale zależności Pythonowe (`pip install -r requirements.txt`) trzeba dociągnąć z sieci.
Kluczowe jest, aby wersja Ansible była kompatybilna z wersją playbooków (zazwyczaj Ansible Core 2.13+).

# 💡 Przykład zastosowania
Przygotowanie środowiska pracy operatora:
1. `sudo apt install python3-pip git`
2. `pip3 install ansible`
3. Sprawdzenie: `ansible --version`

## 📌 Źródła
- [[Ataccama|Ataccama]] Installation Guide.

## 👽 Brudnopis
- Windows Users: Użyj WSL2 (Ubuntu). Nie używaj Cygwin.
- VPN: Stabilne połączenie jest krytyczne, jeśli kontroler jest poza siecią LAN serwerów (zerwane połączenie = przerwany playbook).