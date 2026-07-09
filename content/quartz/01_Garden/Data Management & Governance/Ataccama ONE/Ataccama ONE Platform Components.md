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
Lista modułów wchodzących w skład instalacji platformy [[Ataccama|Ataccama]] ONE, z podziałem na komponenty obowiązkowe (rdzeń systemu) oraz opcjonalne (rozszerzenia funkcjonalne).

# 🔑 Kluczowe punkty
- **Mandatory (Obowiązkowe):** [[Ataccama|Ataccama]] ONE (Core DQG suite) oraz Monitoring Stack (Prometheus, Grafana, OpenSearch).
- **Optional (Opcjonalne):** Serwery przetwarzania MDM, [[RDM|RDM]], DQIT.
- **Zależności:** Platforma instaluje również [[Bazy danych|bazy danych]] i kontenery aplikacji ([[Keycloak|Keycloak]]) jako zależności.

# 📚 Szczegółowe wyjaśnienie
Platforma jest modułowa. Klient może zainstalować tylko moduł [[Data Quality|Data Quality]] (DQ) bez Master [[Data Management|Data Management]] (MDM).
Jednakże, "Monitoring Stack" jest integralną częścią każdej instalacji, zapewniając wgląd w zdrowie usług. Nie można zrezygnować z instalacji Prometheusa/Grafany, chyba że mamy bardzo specyficzny scenariusz (choć jest to odradzane).

Moduł MANTA ([[Data Lineage|Data Lineage]]) jest instalowany osobno i nie wchodzi w skład standardowego instalatora Ansible Ataccamy (stan na wersję v14/v15).

# 💡 Przykład zastosowania
Typowa instalacja produkcyjna:
- Core: ONE WebApp, DPE.
- Monitoring: Grafana (do wykresów zużycia CPU), Kibana (do logów).
- Optional: MDM Server (jeśli klient kupił licencję na masterowanie danych).

## 📌 Źródła


## 👽 Brudnopis
| Component            | Mandatory | Description                                                    |
| -------------------- | --------- | -------------------------------------------------------------- |
| **[[Ataccama|Ataccama]] ONE**     | **Yes**   | [[Data Governance|Data Governance]] and [[Data Quality|Data Quality]] and Governance product suites |
| **Monitoring stack** | **Yes**   | Prometheus, Grafana, OpenSearch Dashboards                     |

Optional components:
| Component | Mandatory     | Description                                                         |
| --------- | ------------- | ------------------------------------------------------------------- |
| MDM       | No            | Master [[Data Management|Data Management]]                                              |
| [[RDM|RDM]]       | No            | Reference [[Data Management|Data Management]]                                           |
| DQIT      | No            | [[Data Quality|Data Quality]] Issue Tracker                                          |
| MANTA     | Not supported | Third-party tool for [[Data Lineage|data lineage]] (installed by a separate package) |
