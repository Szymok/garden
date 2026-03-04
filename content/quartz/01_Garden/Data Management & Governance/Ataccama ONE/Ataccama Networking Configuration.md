---
title: Konfiguracja Sieci i Firewall w Ataccama
created: 2026-02-04
status: sapling
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - networking
  - firewall
  - ansible
  - security
aliases:
  - Konfiguracja Firewall Ataccama
  - Porty Ataccama
---
# 🎯 Definicja
Zasady konfiguracji bezpieczeństwa sieciowego (Firewall/iptables) oraz wymagania dotyczące fizycznej sieci (opóźnienia, routing) dla instalacji Ataccama ONE.

# 🔑 Kluczowe punkty
- **Zarządzanie przez Ansible:** Zalecanym sposobem konfiguracji systemowego firewalla (iptables) jest automatyzacja Ansible (`firewall_manage: true`).
- **Niskie opóźnienia (Latency):** System jest wrażliwy na opóźnienia sieciowe między komponentami.
- **Porty:** Domyślne polityki otwierają tylko niezbędne porty (SSH, HTTP/S, porty usług). Wszystko inne jest blokowane (DROP).

# 📚 Szczegółowe wyjaśnienie
Ataccama ONE w instalacjach On-Prem/IaaS przejmuje kontrolę nad firewallem systemowym węzłów.
Jeśli klient posiada własne rozwiązania (np. UFW, firewalld zarządzane ręcznie), konflikt jest nieunikniony. Ansible Ataccamy spróbuje je wyłączyć i zastąpić regułami `iptables`.
Można to wyłączyć (`firewall_manage: false`), ale wtedy to klient bierze pełną odpowiedzialność za otwarcie setek portów komunikacyjnych (gRPC, Http) między mikroserwisami.

Dla środowisk chmurowych (Azure/AWS), oprócz systemowego firewalla, należy pamiętać o Security Groups / NSG, które muszą przepuszczać ruch.

# 💡 Przykład zastosowania
Otwarcie niestandardowego portu (np. dla integracji zewnętrznej) w `vars.yml`:
```yaml
firewall_custom_rules:
  - port: 12345
    proto: tcp
    source: 10.0.0.0/8
```

## 📌 Źródła


## 👽 Brudnopis
- When configuring the network, consider:
    - **Interconnection**: Target servers must be able to access each other directly using TCP. While a single subnet is recommended, it's not mandatory.
    - **Latency**: Higher network latencies between Ataccama ONE components or data sources will significantly impact performance.
    - **IP Addressing and Licenses**: Ataccama licenses are tied to server IP addresses. Consider long-term plans to avoid issues if servers are migrated.

- As part of the Ansible installation process, a **Linux firewall (iptables) can be automatically configured** if the `firewall_manage` option is set to true.
- In this case, a **firewall for each component is installed** as an Ansible job immediately following the component installation.
- The automatically configured firewall permits access from specific sources to:
    - **SSH** (for management, upgrades, and debugging from any IP address).
    - **TCP ports of installed services** (by default, access is limited for specific sources).
    - **HTTP and HTTPS ports of the frontend server** (access allowed from any IP address).
    - **All ICMP services** (required for proper TCP functioning).
    - Packets of all other protocols and to all other ports are discarded (dropped).
    - You can also **open additional ports**, with per-host granularity and filtering of connection sources.

- The following customer-side requirements must be fulfilled:
    - **SSL certificates must be prepared in advance**.
    - A **DNS zone must be prepared in Azure** with a public IP pointing to the web server.
    - Records about Nginx must exist in the `/etc/hosts` file on every node, pointing to the private IP of the VM.

- Currently, **customer-configured firewalls are not supported**.
- It is necessary to **allow Ansible to configure and manage an iptables-based firewall**.
- Ansible can remove previously installed UFW and firewalld.
- If any other unsupported firewall manager is in use, the **customer must remove it before starting the installation process**.
- You can **define custom firewall rules** if needed.
- For example, to open **ports 11111 and 12345 on all target servers**, you would set:
- A **range of ports can also be opened**.
- For example, to open ports **8080 to 8089 (inclusive)**:
- If only specific hosts require custom open ports, it's recommended to set this variable only for those respective hosts or groups.
- This **overrides the global setting** in `group_vars/all/vars.yml`.
- For instance, in `hosts.yml`, to open port 33333 on one of the three application servers (as an illustration):
- When custom rules are set in multiple locations, **group settings override global settings, and host settings override all other settings**.
- More complex rules can be configured by referring to `roles/firewall-rules/README.md`.
- Firewall management can also be **completely disabled by setting `firewall_manage: false`**.
- In this case, an **appropriate firewall must be configured beforehand**.
- It is **not recommended to manage the firewall on target servers using Ansible _nor_ to enforce additional rules via custom rules or at the network's edge** due to strict configuration.
- The following network connections **must be allowed at the network edge**:
    - **Outgoing connections to all relevant data sources**.
    - **Incoming connections from users to the frontend server** (ports 80 and 443).
    - **Outgoing connections to the NTP servers**.
- All other connections can be restricted.


- Every target server must have a **hostname that is resolvable by all other targets**, including the Ansible controller.
- **Using IP addresses to identify hosts is not supported**.
- Users access the server by connecting to the frontend.
- Individual services are identified by their hostnames.
- All hostnames **must belong to a single domain** (e.g., `one.domain.com`).
- They must also be **resolvable by all target servers** and point to the frontend server.