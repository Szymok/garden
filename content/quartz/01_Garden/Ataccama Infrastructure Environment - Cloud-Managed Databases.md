---
title: Wsparcie dla Baz Danych Managed (Cloud)
created: 2026-02-04
status: sapling
category: Infrastructure
difficulty: intermediate
language: pl
tags:
  - cloud
  - database
  - aws-rds
  - azure-sql
  - ataccama
aliases:
  - AWS RDS
  - Azure Database for PostgreSQL
---
# 🎯 Definicja
Możliwość wykorzystania usług bazodanowych zarządzanych przez dostawcę chmury (PaaS), takich jak AWS RDS lub Azure Database for PostgreSQL, jako repozytorium dla platformy Ataccama ONE, zamiast instalacji PostgreSQL na maszynie wirtualnej.

# 🔑 Kluczowe punkty
- **Pre-provisioning:** Klient musi sam utworzyć instancję bazy przed instalacją aplikacji.
- **Wsparcie:** Tylko PostgreSQL (w odpowiedniej wersji). Inne usługi managed (np. OpenSearch Service) nie są oficjalnie wspierane przez instalator.
- **Konfiguracja:** Wymaga podania endpointu bazy w `vars.yml` i (często) użycia Bastion Hosta.

# 📚 Szczegółowe wyjaśnienie
Użycie RDS zamiast własnego Postgresa na EC2 zdejmuje z administratora obowiązki backupu, patchowania OS i HA.
Instalator Ansible nie tworzy instancji RDS (nie używa Terraform). Oczekuje gotowego adresu `host:port` oraz użytkownika z uprawnieniami `CREATEDB`/`CREATEROLE` (lub stworzonymi wstępnie bazami).

# 💡 Przykład zastosowania
Firma migruje do AWS.
Zamiast stawiać VM-kę z Linuxem pod bazę, tworzą **Aurora PostgreSQL Cluster**.
W pliku `vars.yml` wpisują:
`one_db_host: my-cluster.cluster-xyz.eu-central-1.rds.amazonaws.com`
Ansible łączy się tam i tworzy schematy.

## 📌 Źródła
- Ataccama Cloud Deployment Guide.

## 👽 Brudnopis
- Managed Service vs Self-Hosted: Managed droższe, ale mniej pracy.
- OpenSearch: Ataccama wymaga specyficznych pluginów, więc AWS OpenSearch Service często nie działa (wymagany self-hosted na EC2).
