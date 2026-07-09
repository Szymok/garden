---
title: Wymagana Konfiguracja Instalacyjna Ataccama
created: 2026-02-04
status: evergreen
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - ansible
  - configuration
  - nginx
  - secrets
  - database
aliases:
  - Konfiguracja inventory Ansible
  - vars.yml Ataccama
---
# 🎯 Definicja
Szczegółowy opis zmiennych konfiguracyjnych w Ansible Inventory (`vars.yml`), które muszą zostać uzupełnione przed uruchomieniem instalacji platformy.

# 🔑 Kluczowe punkty
- **Nginx & Certyfikaty:** Konfiguracja domen i SSL (`nginx_domain`, `nginx_certificates`). Zalecane użycie certyfikatów 'provided'.
- **[[Bazy danych|Bazy Danych]]:** Dane dostępowe do wewnętrznej bazy PostgreSQL (`db_user_one`, `postgresql_admin_user` itp.).
- **Sekrety:** Generowanie haseł i tokenów JWT narzędziem `secrets_generator.py`.
- **Licencje:** Ścieżki do plików licencyjnych.
- **Firewall:** Opcja `firewall_manage` (czy Ansible ma zarządzać iptables).

# 📚 Szczegółowe wyjaśnienie
Plik `vars.yml` jest sercem instalacji.
1. **Nginx:** Punkt wejścia. Należy zdefiniować domenę główną (np. `mdm.bank.pl`). Certyfikaty muszą pasować do tej domeny. Użycie `self-signed` jest dopuszczalne tylko w laboratorium.
2. **Database:** Platforma potrzebuje bazy metadanych. Można użyć lokalnego Postgresa (instalowanego przez Ansible) lub chmurowego (RDS/Azure Flex). W przypadku chmury, potrzebny jest **Bastion Host** (proxy), aby Ansible mógł połączyć się z bazą i założyć schematy.
3. **Secrets:** Nigdy nie wpisuj haseł ręcznie "na oko". Użyj skryptu generatora, aby stworzyć spójny zestaw kluczy szyfrujących (JCEKS, JWT).

# 💡 Przykład zastosowania
Fragment `vars.yml`:
```yaml
nginx_domain: one.mojafirma.pl
nginx_cert_kind: provided
nginx_certificates:
  - cn: '*.one.mojafirma.pl'
    cert: 'wildcard.crt'
    cert_key: 'wildcard.key'

mmm_smtp_enabled: true
mmm_smtp_host: smtp.office365.com
```

## 📌 Źródła
- Official Ansible documentation (inventory setup).
- `tools/README_secrets_generator.md`

## 👽 Brudnopis
**License files** enable you to run the modules you intend to install. [[Ataccama|Ataccama]] will provide these files depending on your license agreement.
**MDM, [[RDM|RDM]], DQIT configuration**: While ONE [[RDM|RDM]] or DQIT can be configured manually after installation, **[[ONE MDM|ONE MDM]] _must_ be configured during installation**.
**Nginx configuration**: `nginx_domain` is crucial. It is **strongly recommended to prepare your certificates in advance and set the variable to `provided`**. Use a **single certificate** (wildcard of SANs) for simplicity.

**Secrets**: To maintain a secure installation, you **must generate fresh secrets**. Use the **`secrets_generator.py` tool**.
**Internal Encryption**: Encryption key stored in a **JCEKS keystore**.
**Firewall**: The auto-configured firewall allows incoming SSH and all ICMP, and opens TCP ports for installed services. It does not limit outgoing connections. You can disable it via `firewall_manage: false`.
**Bastion host**: Optional group for cloud-managed databases. Acts as a proxy to forward [[SQL|SQL]] commands.
**Package Versions**: Declared in `_packages.yml`. Do not modify unless necessary.
**SMTP**: Configured via `mmm_smtp_...` variables.
**Java Options**: Can be customized (e.g., heap memory).