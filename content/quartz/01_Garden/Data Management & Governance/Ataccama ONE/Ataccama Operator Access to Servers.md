---
title: Dostęp Operatorski do Serwerów
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - security
  - ssh
  - access-control
aliases:
  - Root access requirements
  - SSH access Ataccama
---
# 🎯 Definicja
Wymagania dotyczące uprawnień dostępowych dla osoby (lub automatu) przeprowadzającej instalację platformy (Operatora).

# 🔑 Kluczowe punkty
- **Root/Sudo:** Operator musi mieć dostęp do wszystkich serwerów docelowych jako superużytkownik (root) z poziomu kontrolera Ansible.
- **SSH Keys:** Zalecane jest uwierzytelnianie kluczem publicznym SSH (bez hasła) dla bezpieczeństwa i automatyzacji.
- **Brak MFA:** Na czas instalacji należy wyłączyć Multi-Factor Authentication (MFA) dla sesji SSH, aby Ansible nie utknął na prośbie o token.

# 📚 Szczegółowe wyjaśnienie
Ansible działa bezagentowo, łącząc się po SSH. Aby zainstalować pakiety (yum/apt), skonfigurować usługi (systemd) i firewall (iptables), musi mieć uprawnienia roota.
Warto zauważyć, że komunikacja **między** serwerami docelowymi (np. Serwer A -> Serwer B) nie wymaga SSH. SSH jest potrzebne tylko na linii Kontroler -> Serwery.

# 💡 Przykład zastosowania
Dobrym standardem jest utworzenie użytkownika technicznego `ansible_user`, dodanie go do grupy `sudoers` z opcją `NOPASSWD` i wgranie klucza SSH z maszyny kontrolera.

## 📌 Źródła


## 👽 Brudnopis
- The **operator** responsible for installing or maintaining the Ataccama ONE Platform must be able to **access all target servers as a superuser (i.e., root) from the Ansible controller using SSH**.
- **SSH access is not required for communication _between_ target servers**.
- It is **recommended to keep SSH access enabled after installation** for future upgrades, optimisation, and debugging.
- **Authentication using a public key is recommended** over password authentication due to its higher security.
- To ensure a smoother process, it is **not recommended to enable multifactor authentication** during the installation.