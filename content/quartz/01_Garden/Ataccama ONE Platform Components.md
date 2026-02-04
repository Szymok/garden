---
title: Komponenty Platformy Ataccama ONE
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - architecture
  - components
  - monitoring
aliases:
  - Moduły Ataccama
  - Platform stack
---
# 🎯 Definicja
Lista modułów wchodzących w skład instalacji platformy Ataccama ONE, z podziałem na komponenty obowiązkowe (rdzeń systemu) oraz opcjonalne (rozszerzenia funkcjonalne).

# 🔑 Kluczowe punkty
- **Mandatory (Obowiązkowe):** Ataccama ONE (Core DQG suite) oraz Monitoring Stack (Prometheus, Grafana, OpenSearch).
- **Optional (Opcjonalne):** Serwery przetwarzania MDM, RDM, DQIT.
- **Zależności:** Platforma instaluje również bazy danych i kontenery aplikacji (Keycloak) jako zależności.

# 📚 Szczegółowe wyjaśnienie
Platforma jest modułowa. Klient może zainstalować tylko moduł Data Quality (DQ) bez Master Data Management (MDM).
Jednakże, "Monitoring Stack" jest integralną częścią każdej instalacji, zapewniając wgląd w zdrowie usług. Nie można zrezygnować z instalacji Prometheusa/Grafany, chyba że mamy bardzo specyficzny scenariusz (choć jest to odradzane).

Moduł MANTA (Data Lineage) jest instalowany osobno i nie wchodzi w skład standardowego instalatora Ansible Ataccamy (stan na wersję v14/v15).

# 💡 Przykład zastosowania
Typowa instalacja produkcyjna:
- Core: ONE WebApp, DPE.
- Monitoring: Grafana (do wykresów zużycia CPU), Kibana (do logów).
- Optional: MDM Server (jeśli klient kupił licencję na masterowanie danych).

## 📌 Źródła


## 👽 Brudnopis
| Component            | Mandatory | Description                                                    |
| -------------------- | --------- | -------------------------------------------------------------- |
| **Ataccama ONE**     | **Yes**   | Data Governance and Data Quality and Governance product suites |
| **Monitoring stack** | **Yes**   | Prometheus, Grafana, OpenSearch Dashboards                     |

Optional components:
| Component | Mandatory     | Description                                                         |
| --------- | ------------- | ------------------------------------------------------------------- |
| MDM       | No            | Master Data Management                                              |
| RDM       | No            | Reference Data Management                                           |
| DQIT      | No            | Data Quality Issue Tracker                                          |
| MANTA     | Not supported | Third-party tool for data lineage (installed by a separate package) |
