---
title: Moduły Bezpieczeństwa Systemu (SELinux/AppArmor)
created: 2026-02-04
status: sapling
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - security
  - os-configuration
  - linux
aliases:
  - SELinux Ataccama
  - AppArmor
---
# 🎯 Definicja
Wymagania dotyczące systemowych modułów bezpieczeństwa jądra Linux (LSM) w kontekście działania platformy [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **SELinux/AppArmor:** Nie są wspierane (Not Supported).
- **Wymagana akcja:** Należy je wyłączyć (Disabled) lub ustawić w tryb permisywny (Permissive), jeśli całkowite wyłączenie nie jest możliwe.

# 📚 Szczegółowe wyjaśnienie
Platforma [[Ataccama|Ataccama]] ONE korzysta z wielu niestandardowych ścieżek dostępu, portów i procesów Javy, które dynamicznie alokują zasoby. Standardowe polityki SELinux (w RHEL/CentOS) lub AppArmor (w Ubuntu) zazwyczaj blokują te operacje, powodując trudne do zdiagnozowania błędy "Permission Denied" nawet dla użytkownika root.
Stworzenie dedykowanych polityk SELinux jest możliwe, ale leży całkowicie po stronie klienta i nie jest objęte wsparciem producenta.

# 💡 Przykład zastosowania
W systemie RHEL:
Edycja pliku `/etc/selinux/config`:
`SELINUX=disabled`
Następnie wymagany restart serwera.

## 📌 Źródła


## 👽 Brudnopis
- The [[Ataccama|Ataccama]] ONE Platform requires access to various directories and ports.
- Therefore, the use of **SELinux, AppArmor, and similar technologies is not supported and must be disabled**.
- The specific list of directories and ports will vary depending on customer needs and might differ with each installation.