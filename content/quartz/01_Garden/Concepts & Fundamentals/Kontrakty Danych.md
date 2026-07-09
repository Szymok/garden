---
title: Kontrakty Danych (Data Contracts)
created: 2026-02-04
status: evergreen
category: Data Governance / Engineering
difficulty: intermediate
language: pl
tags:
  - data-contracts
  - schema-registry
  - data-quality
  - reliability
  - api
aliases:
  - Data Contracts
  - Umowy o dane
  - Schematy walidacyjne
---
# 🎯 Definicja
**Kontrakt Danych** to umowa między **producentem** danych (np. zespołem backendowym wystawiającym mikroserwis) a **konsumentem** (np. zespołem Data Engineering). Umowa ta precyzuje schemat danych (kolumny, typy), SLA (terminowość) i semantykę. Każda zmiana w kontrakcie (np. usunięcie kolumny) wymaga renegocjacji lub ostrzeżenia.

# 🔑 Kluczowe punkty
- **Problem:** "Breaking Changes". Programista zmienia nazwę kolumny w bazie, raporty CEO przestają działać.
- **Rozwiązanie:** Kontrakt blokuje taką zmianę (testy CI/CD) lub wymusza jej wersjonowanie.
- **Implementacja:** Często realizowane przez Schema Registry (np. w Kafka zapobieganie zmianom niekompatybilnym) lub pliki [[YAML|YAML]]/JSON Schema w repozytorium.

# 📚 Szczegółowe wyjaśnienie
Bez kontraktów: [[Inżynieria Danych|Inżynieria Danych]] jest "Sprzątaczem", który musi naprawiać pipeliny po cichych zmianach w źródłach.
Z kontraktami: Dane są traktowane jak **Produkt** (API). Tak jak nie zmienia się publicznego API bez ostrzeżenia, tak nie zmienia się struktury danych wylatujących z serwisu.

# 💡 Przykład zastosowania
Firma e-commerce.
Kontrakt `Orders v1`: `{ order_id: int, total: decimal }`.
Programista chce zmienić `total` na `total_amount`.
System CI/CD (np. [[Data Mesh|Data Mesh]] governance) odrzuca ten commit z błędem: "Naruszenie kontraktu danych Orders v1. Zmiana niekompatybilna wstecznie. Utwórz wersję v2 lub uzgodnij migrację."

## 📌 Źródła
- "Data Contracts" - Chad Sanderson.

## 👽 Brudnopis
- To kluczowy element architektury **[[Data Mesh|Data Mesh]]**.
- Przesuwa odpowiedzialność za [[Jakość Danych|jakość danych]] "w lewo" (Shift Left) - do źródła.