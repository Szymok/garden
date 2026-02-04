---
title: Konfiguracja DNS w Ataccama ONE
created: 2026-02-04
status: sapling
category: Tech
difficulty: intermediate
language: pl
tags:
  - ataccama
  - dns
  - infrastructure
  - security
aliases:
  - Domeny Ataccama
  - Ataccama DNS records
---
# 🎯 Definicja
Zestaw wymaganych rekordów DNS oraz certyfikatów TLS niezbędnych do poprawnej komunikacji między mikroserwisami platformy Ataccama ONE oraz zapewnienia dostępu dla użytkowników końcowych.

# 🔑 Kluczowe punkty
- **Standard nazewnictwa:** Wszystkie komponenty używają subdomen w ramach jednej domeny klienta (np. `one.mojafirma.com`, `keycloak.mojafirma.com`).
- **Komunikacja wewnętrzna:** Komponenty komunikują się po nazwach hostów (nie IP), co wymusza poprawną resolucję DNS wewnątrz sieci.
- **TLS/SSL:** Wymagane są ważne certyfikaty dla wszystkich domen publicznych (zalecany Wildcard `*.mojafirma.com`).
- **Reverse Proxy:** Rekordy DNS powinny wskazywać na serwer Nginx (Reverse Proxy), a nie bezpośrednio na kontenery usług.

# 📚 Szczegółowe wyjaśnienie
Ataccama ONE jest systemem rozproszonym opartym na mikroserwisach. Aby usługi takie jak `MMM` (Metadata Management), `RDM` (Reference Data Management) czy `DQIT` (Data Quality Issue Tracker) mogły ze sobą "rozmawiać", muszą się wzajemnie widzieć w sieci.

Platforma wymusza użycie szyfrowania (TLS), dlatego konfiguracja DNS jest ściśle powiązana z certyfikatami. Jeśli certyfikat wygaśnie lub nazwa w DNS nie będzie pasować do nazwy w certyfikacie (CN/SAN), platforma przestanie działać.

Typowe rekordy do utworzenia:
- `one` (Portal wejściowy)
- `keycloak` (Autoryzacja)
- `minio` (S3 Storage)
- `mda`, `rdm`, `dqit` (Aplikacje biznesowe)

# 💡 Przykład zastosowania
Konfiguracja strefy DNS (Bind/Route53):
```dns
; Strefa: data.firma.com
one      IN CNAME nginx-lb.data.firma.com.
keycloak IN CNAME nginx-lb.data.firma.com.
minio    IN CNAME nginx-lb.data.firma.com.
*.data.firma.com IN CNAME nginx-lb.data.firma.com. ; Wildcard dla uproszczenia
```

## 📌 Źródła


## 👽 Brudnopis
- **Ataccama ONE DNS names**:
    - `one.<customer_domain>`
    - `dpm.<customer_domain>`
    - `dpm-grpc.<customer_domain>`
    - `dqf.<customer_domain>`
    - `dqf-grpc.<customer_domain>`
    - `mde.<customer_domain>`
    - `mmm-grpc.<customer_domain>`
    - `orch-console.<customer_domain>`
    - `audit.<customer_domain>`
- **DQIT DNS names**:
    - `dqit.<customer_domain>`
    - `dqit-console.<customer_domain>`
- **RDM DNS names**:
    - `rdm.<customer_domain>`
    - `rdm-console.<customer_domain>`
- **MDM DNS names**:
    - `console.<customer_domain>`
    - `mda.<customer_domain>`
    - `mda-console.<customer_domain>`
    - `mdm-grpc.<customer_domain>`
- **Dependencies DNS names**:
    - `minio.<customer_domain>`
    - `minio-grpc.<customer_domain>`
    - `minio-ui.<customer_domain>`
- **Logging and monitoring DNS names**:
    - `kibana.<customer_domain>`
    - `grafana.<customer_domain>`
    - `monitoring.<customer_domain>`
    - `prometheus.<customer_domain>`
    - `alertmanager.<customer_domain>`
- **Orchestration DNS names (optional)**:
    - `orch.<customer_domain>`

- Since Ataccama ONE exclusively uses hostnames for mutual communication between its components, **all relevant DNS records must be configured in the customer's DNS**.
- You can use **A or CNAME records**.
- As Nginx serves as a reverse proxy for the Ataccama ONE application infrastructure, **DNS records should also include the IP address of the reverse proxy server (Nginx)**.
- User access to the frontend is secured by TLS, and it is **mandatory to use valid TLS certificates** containing relevant hostnames.
- The **customer must provide certificates in their full form** for all required external hostnames.
- The supported configurations for TLS certificates are:
    - A **single wildcard certificate** for all domains (recommended for simplicity).
    - **Separate certificates**, one for each domain.
    - A **single certificate using Subject Alternative Names (SAN)** to list all required domains.
- It is **strongly recommended to track certificate expiration dates**, as an expired certificate can cause the application to malfunction.
- After rotating any certificates, **all components must be restarted** to ensure the new certificates are used.