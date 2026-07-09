---
title: Style Implementacji MDM
created: 2026-02-04
status: sapling
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - ataccama
  - mdm
  - architecture
  - strategy
aliases:
  - MDM Styles
  - Consolidation vs Co-existence
  - Style wdrażania MDM
---
# 🎯 Definicja
Różne wzorce architektoniczne (style) wdrażania systemu Master [[Data Management|Data Management]], różniące się stopniem centralizacji kontroli nad danymi oraz sposobem ich synchronizacji z systemami źródłowymi.

# 🔑 Kluczowe punkty
- **Consolidation (Konsolidacja):** Zbieranie danych w jednym miejscu w celach analitycznych/B.I. Zmiany w MDM z reguły nie wracają do systemów źródłowych.
- **Centralized (Scentralizowany):** MDM staje się jedynym miejscem tworzenia i edycji danych mistrzowskich. Pełna kontrola.
- **Co-existence (Współistnienie):** Dane są edytowane w wielu systemach, a MDM dba o ich synchronizację i spójność.
- **Mixed (Mieszany):** Kombinacja powyższych (np. część rekordów tworzona centralnie, część agregowana).

# 📚 Szczegółowe wyjaśnienie
Wybór stylu zależy od kultury organizacji i dojrzałości procesów.
- **Consolidation** jest najbezpieczniejszy na start – tworzymy "Złoty Rekord" do raportowania, nie ingerując w systemy operacyjne.
- **Co-existence** jest trudny technicznie, bo wymaga dwukierunkowej synchronizacji (gdy zmienisz nazwisko w CRM, MDM musi to wykryć i potencjalnie rozpropagować do Billing System).
- **Centralized** to cel ostateczny wielu organizacji, gdzie CRM staje się tylko "czytnikiem" danych klienta, a ich zakładanie odbywa się przez proces MDM (często wsparty workflow w [[Ataccama|Ataccama]] ONE).

# 💡 Przykład zastosowania
Firma ubezpieczeniowa posiada 3 systemy polisowe.
- Styl **Consolidation**: W nocy dane są zrzucane do MDM, aby marketing wiedział, że Jan Kowalski ma 3 polisy.
- Styl **Centralized**: Agent nie może założyć klienta w systemie polisowym; musi wypełnić wniosek w MDM, który po walidacji "zesyła" ID klienta do systemu polisowego.

## 📌 Źródła


## 👽 Brudnopis
Consolidation: • Definition: In a consolidation MDM style, data from multiple sources is aggregated and consolidated into a central repository. This involves cleansing, deduplicating, and enriching data to create a unified view. e Key Feature: Data is physically combined in a central location, improving [[Data Quality|data quality]] and consistency for downstream applications. Co-Existence: • Definition: Co-existence involves maintaining master data in multiple systems while ensuring that these systems can share and synchronize data. It balances between central control and local system autonomy. • Key Feature: Master data exists in both centralized and local systems, with mechanisms for synchronization and integration to ensure consistency.
Centralized: • Definition: A centralized MDM style involves managing all master data within a single central repository. All data creation, maintenance, and access are controlled from this central point. • Key Feature: All master data is stored and managed centrally, providing a single source of truth and often leading to a more controlled and consistent data environment. Mixed Style: • Definition: Mixed Style in MDM combines the characteristics of Centralized, Co-existence, and Consolidation styles. It supports both 'consolidated records' (input from centralized hubs) and •authored recordS (created directly in the master layer). Key Feature: Master data exists and is editable in both the MDM hub and source systems. It allows users to create missing records, such as a new party entity or related entities like addresses, contacts, or consents, directly in the master layer, ensuring flexibility and completeness of data.