---
title: Wspierane Systemy Operacyjne
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - os
  - linux
  - compatibility
aliases:
  - Systemy operacyjne Ataccama
  - Linux requirements
---
# 🎯 Definicja
Lista systemów operacyjnych (dystrybucji Linux) oficjalnie wspieranych dla instalacji Kontrolera Ansible oraz Serwerów Docelowych Ataccama ONE.

# 🔑 Kluczowe punkty
- **Standardowe dystrybucje:** Wspierane są standardowe instalacje systemów (np. RHEL, AlmaLinux).
- **Brak modyfikacji:** Systemy "utwardzane" (Hardened) lub mocno zmodyfikowane (Custom Kernels) nie są wspierane, gdyż mogą powodować konflikty z zależnościami.
- **Jednorodność:** Zaleca się stosowanie tej samej dystrybucji na wszystkich serwerach docelowych w klastrze (choć kontroler może być inny).

# 📚 Szczegółowe wyjaśnienie
Instalator Ansible polega na menedżerach pakietów (`yum`/`dnf` lub `apt`). Jeśli system operacyjny ma niestandardowe repozytoria lub zablokowane pewne funkcje (hardening CIS level 2+), skrypty mogą zawieść.
Oficjalna lista wspieranych systemów znajduje się zawsze w dokumentacji "Supported Third-Party Components" (zazwyczaj RHEL 8/9, AlmaLinux, Ubuntu LTS).

# 💡 Przykład zastosowania
Bezpieczny wybór: Red Hat Enterprise Linux 8.x (lub kompatybilny AlmaLinux 8) dla wszystkich węzłów.

## 📌 Źródła
- "Supported Third-Party Components" documentation.

## 👽 Brudnopis
- Both the **Ansible controller and the target servers must run one of the supported operating systems**.
- It is **not recommended to use different Linux distributions** on different target servers within a single installation.
- However, you may use different distributions for the Ansible controller and the target servers.
- The Ansible installation is developed for use on a **standard installation of the selected operating system**.
- Therefore, **using modified, hardened, or derived operating systems is not supported**.