---
title: Lista Kontrolna Przed Instalacją (Pre-installation Checklist)
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - checklist
  - installation
  - preparation
aliases:
  - Checklist wdrożeniowa
  - Wymagania przedinstalacyjne Ataccama
---
# 🎯 Definicja
Lista kroków i zasobów, które muszą zostać przygotowane przez klienta przed uruchomieniem skryptów instalacyjnych Ansible platformy [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **Infrastruktura:** Serwery z OS, sieć, DNS (wewnętrzny i zewnętrzny), Firewall.
- **Zasoby:** Storage (/opt, /var), Certyfikaty TLS (Fullchain), Licencje (pliki .plf).
- **Dostępy:** Konta techniczne do baz danych, SSH dla Ansible, VPN dla operatora.

# 📚 Szczegółowe wyjaśnienie
Brak przygotowania któregokolwiek z punktów checklisty zazwyczaj kończy się błędem w połowie instalacji ("fail"). Kluczowe i najczęstsze punkty zapalne to:
1. **Certyfikaty:** Często wygenerowane błędnie (np. self-signed zamiast z CA, albo brak łańcucha zaufania).
2. **DNS:** Serwery nie widzą się po nazwach hostów.
3. **[[Bazy danych|Bazy danych]]:** Użytkownik bazy nie ma praw do tworzenia schematów (CREATE SCHEMA).

# 💡 Przykład zastosowania
Przed przyjazdem konsultanta, zespół IT Klienta powinien "odfajkować":
- [x] VM-ki postawione (RHEL 8).
- [x] DNSy `*.data.firma.com` wskazują na Load Balancer.
- [x] Certyfikat Wildcard `*.data.firma.com` jest w katalogu operatora.
- [x] Baza PostgreSQL w RDS utworzona, mamy usera/hasło.

## 📌 Źródła


## 👽 Brudnopis
- Use this comprehensive list to **verify that all prerequisites are met** before commencing the installation.
- **Prepare the target servers**:
    - Install OS.
    - Prepare the necessary storage.
    - Configure SSH access.
    - Configure the firewall.
- **Prepare the target servers** (continued):
    - Configure DNS (internal/external).
    - Prepare TLS certificates for all external hostnames (valid, not self-signed, fullchain).
    - Prepare the license files.
    - Check access to third-party databases.
- **Ensure the operator has all necessary information**:
    - Fully qualified hostnames.
    - Access credentials (SSH, DB, VPN).
- **Verify that the correct people and components can access the infrastructure as needed**:
    - VPN works.
    - SSH from controller to targets works.
    - Internet access is available.
    - Sudo is enabled.