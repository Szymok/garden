---
title: Governance Roles (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Governance
difficulty: basic
language: en
tags:
  - roles
  - permissions
  - authorization
  - rbac
  - keycloak
aliases:
  - Role w systemie
  - Uprawnienia
  - System Roles
---
# 🎯 Definicja
**[[Roles|Roles]]** w [[Ataccama|Ataccama]] ONE definiują, "kto co może". Czy Janek może edytować definicję "Klienta"? Czy może tylko ją czytać? Czy Kasia może usunąć tabelę z katalogu?

# 🔑 Główne Role
1.  **System Admin:** Bóg systemu. Może wszystko.
2.  **Data Steward:** Opiekun danych. Może edytować opisy, akceptować zmiany, zarządzać jakością.
3.  **Data Analyst / Consumer:** Czytelnik. Może szukać, oglądać, zgłaszać uwagi (Comments), ale nic nie zepsuje.
4.  **Guest:** Często domyślna rola z minimalnym dostępem (tylko publiczne dane).

# 📚 Szczegółowe wyjaśnienie
Uprawnienia są często mapowane z Active Directory (AD) lub [[Keycloak|Keycloak]].
Przykład: Jeśli jesteś w grupie AD `Marketing_Managers`, automatycznie dostajesz w [[Ataccama|Ataccama]] rolę `Data Steward` dla obszaru Marketingu.
To się nazywa **RBAC** (Role-Based Access Control).

# 💡 Przykład zastosowania
Firma wdraża [[Data Governance|Data Governance]].
Nie chcesz, żeby każdy zmieniał definicje [[KPI|KPI]] "Zysk Netto".
Ustawiasz:
- Edycja "Zysk Netto": Tylko `Finance_Steward`.
- Podgląd: Wszyscy (`All_Users`).
Dzięki temu analitycy wiedzą, że definicja jest wiarygodna i chroniona.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Permissions Guide.

## 👽 Brudnopis
- Dobra praktyka: "Principle of Least Privilege". Dawaj najniższe uprawnienia, jakie są potrzebne do pracy. Nie dawaj `Admina` każdemu, "żeby nie marudzili, że coś nie działa".
