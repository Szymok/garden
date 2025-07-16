---

title: Keycloak Roles  
created: 2025-07-14  
status:  
category: security & identity management  
difficulty: średni  
language: pl  
tags:

- Keycloak
- role
- tożsamość
- zarządzanie dostępem
- Ataccama  
aliases:
- role Keycloak
- role IAM
- role użytkowników w Keycloak

---

# 🎯 Definicja

**Keycloak Roles** to zestaw ról bezpieczeństwa w systemie Keycloak, przypisywanych użytkownikom lub grupom w celu definiowania poziomów uprawnień w aplikacjach i modułach. W kontekście platformy Ataccama ONE, role zdefiniowane w Keycloak są wykorzystywane do inicjalnej autoryzacji użytkowników i mogą integrować się z rolami governance oraz dostępem do danych i modułów aplikacyjnych.

# 🔑 Kluczowe punkty

- Role Keycloak są podstawą pierwszego poziomu kontroli dostępu w Ataccama ONE (IAM).
- Role mogą być **kompozytowe** — przypisanie jednej roli powoduje nadanie wielu ról wewnętrznych pakietowo.
- Role są powiązane z konkretnymi komponentami/systemami (np. MMM, DPP, RDM).
- Kluczowa rola superużytkownika: **MMM_admin** – umożliwia pełną administrację.
- MMM_user umożliwia **pierwsze logowanie**, co nadaje dostęp jako "Data Consumer" w grupie domyślnej.

# 📚 Szczegółowe wyjaśnienie

## Główne role systemowe Keycloak

|Rola|Opis|
|---|---|
|**MMM_admin**|Superuser z pełnym dostępem do wszystkich modułów i funkcji ONE Web (Metadata Management Module).|
|**MMM_application_admin**|Może konfigurować większość aplikacji (wszystkie zakładki i zasoby), z wyłączeniem zmian systemowych, backupów i modelu danych.|
|**MMM_user**|Uprawnia do pierwszego logowania. Nadaje rolę „Data Consumer” w grupie domyślnej. Dostęp utrzymywany nawet po usunięciu tej roli, jeśli użytkownik ma inne role governance.|

> Rola MMM_user jest często stosowana jako domyślna dla użytkowników logujących się przez zewnętrzny provider tożsamości (np. LDAP, Azure AD) – dopóki nie zostaną przypisane role właściwe dla domen czy grup.

## Wzorzec nazewnictwa ról technicznych

|Moduł Ataccama|Prefix roli|Przykłady ról|
|---|---|---|
|Metadata Management Module (ONE Web)|MMM|`MMM_data-manager`, `MMM_viewer`|
|Data Processing Platform|DPP|`DPP_admin`, `DPP_user`|
|Reference Data Management|RDM|`RDM_user`, `RDM_viewer`|
|Master Data Management|MDM|`MDM_admin`, `MDM_edit`|
|Configuration Service|CS|`CS_admin`, `CS_operator`|
|Data Quality Issue Tracker|DQIT|`DQIT_supervisor`, `DQIT_user`|

## Integracja z rolami governance

Role z Keycloak mogą współistnieć z rolami nadawanymi w systemie ONE (governance roles):

- Governance Roles — przypisywane do zasobów, grup i użytkowników w ONE.
- Keycloak Roles — przypisywane na poziomie tożsamości (IAM), decydują o prawie do logowania, przypisują uprawnienia globalne.

Typowa ścieżka:

1. Nowy użytkownik loguje się (via IAM), ma rolę `MMM_user` → przypisanie do grupy domyślnej.
2. Administrator przypisuje mu dodatkowe role governance w zależności od kontekstu (grupowego, domenowego lub technicznego).

# 💡 Przykład zastosowania

**Nowe logowanie przez SSO z zakresu LDAP:**

- Użytkownik Jan Kowalski loguje się po raz pierwszy — otrzymuje `MMM_user`.
- Po autoryzacji przez Keycloak pojawia się w grupie „Default” jako „Data Consumer”.
- Administrator systemu przypisuje mu:
    - `MMM_application_admin` (Keycloak) — dostęp do konfiguracji aplikacji.
    - Grupową rolę `Data Steward` w domenie sprzedażowej (`Sales Group`).

# 📌 Źródła

- Dokumentacja Ataccama — ONE Identity & Access
- Keycloak Docs: [https://www.keycloak.org/documentation](https://www.keycloak.org/documentation)
- [IAM w Ataccama: przegląd ról i polityk dostępowych](https://docs.ataccama.com/ONE/)
- [https://www.baeldung.com/keycloak-roles-groups](https://www.baeldung.com/keycloak-roles-groups)

# 👽 Brudnopis

- Trzy kluczowe role w MMM: user, admin, application admin
- Rola `MMM_user` = bilet wejścia, potem można odebrać, użytkownik zostaje dzięki governance
- Role "systemowe" integrują się z modulem zarządzania uprawnieniami w ONE — dostęp na poziomie UI, API, katalogu metadanych
- "Composite roles" = zewnętrzne role mogą pakować wewnętrzne zestawy ról (np. `keycloak_infra_admin` → `MMM_admin + CS_admin`)
- Fuzja IAM (Keycloak) z governance (ONE) = pełny model zarządzania dostępem w organizacji z silosami danych