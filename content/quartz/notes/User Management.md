---

title: User Management  
created: 2025-07-14  
status: draft  
category: AI/Data/Machine Learning/Analytics  
difficulty: średni  
language: pl  
tags:

- concept
- zarządzanie użytkownikami
- dostęp
- uprawnienia
- identity provider  
aliases:
- zarządzanie użytkownikami
- user access control
- access management

---

# 🎯 Definicja

**User Management (zarządzanie użytkownikami)** to proces administracyjny, który obejmuje tworzenie, organizowanie, przypisywanie ról i kontrolowanie dostępu użytkowników do systemów, danych i zasobów w środowiskach analitycznych, AI lub korporacyjnych aplikacjach danych.

# 🔑 Kluczowe punkty

- 🔐 [[Roles|Role]] użytkowników mogą pochodzić z zewnętrznego dostawcy tożsamości (np. [[Keycloak]], LDAP) albo być określane lokalnie.
- 👥 Uprawnienia użytkowników są przypisywane na poziomie grup, obiektów (nodes), a także typów roli (governance [[roles]]).
- ⚙️ Uprawnienia są zarządzane przez [[Roles|role]] oraz poziomy dostępu (Full Access, Operate, View Data, itd.).

# 📚 Szczegółowe wyjaśnienie

Zarządzanie użytkownikami to kluczowy komponent w każdej architekturze data-driven i systemach AI, w których dostęp do danych lub operacji musi być kontrolowany i audytowalny.

Proces user managementu może obejmować:

- Rejestrację i onboardowanie użytkowników (np. przez SSO)
- Przypisanie ról dostępu z poziomu zewnętrznego dostawcy tożsamości (np. `RDM_admin`, `DPP_user`)
- Przypisanie governance [[roles]] w systemie wewnętrznym (np. `Data Steward`, `Owner`)
- Określenie poziomu dostępu do zasobów i operacji na danych: np. tylko podgląd (View Data), pełny dostęp (Full Access), operacje techniczne (Operate Access)
- Grupowanie użytkowników według działów, domen, zakresu odpowiedzialności i projektów

Przykładowa integracja z [[Keycloak]]:

- Administrator loguje się do konsoli zarządzania i przypisuje użytkownikowi rolę `MMM_user` jako startowy dostęp.
- Następnie użytkownik jest dodawany do grupy "Marketing Team" z rolą `Data Steward`, gdzie może zarządzać słownikami danych i metadanymi.

Dostęp do danych lub metadanych można przydzielać też kontekstowo (per asset) za pomocą funkcji Share / Grant Access w systemie.

# 💡 Przykład zastosowania

Administrator przypisuje zespołowi data science tymczasowy dostęp `View Data Access` do katalogu danych historycznych w ramach projektu predykcji churnu. Jeden z analityków zostaje oznaczony jako `Data Owner` w obrębie grupy projektowej, z możliwością zarządzania klasyfikacjami danych i odwoływania dostępu.

Równocześnie dane są klasyfikowane według poziomów ochrony (np. dane wrażliwe) i tylko użytkownicy z odpowiednimi uprawnieniami mogą uzyskać do nich dostęp. Cały proces zarządzania dostępem jest możliwy dzięki precyzyjnemu przypisaniu użytkownika do ról, grup i poziomów akcji.

# 📌 Źródła

- ![[3vaexgje6t7m-01-UsersIdentityproviderroles-2.png]]
- [https://www.keycloak.org/docs/latest/server_admin/](https://www.keycloak.org/docs/latest/server_admin/)
- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.okta.com/identity-101/what-is-user-management/](https://www.okta.com/identity-101/what-is-user-management/)
- Ataccama ONE – User & [[Roles|Role]] Management Best Practices

# 🏷️ Zobacz także

- [[Governance Roles]]
- [[Keycloak]] [[Roles]]
- [[Group Isolation]]
- Data Ownership
- RBAC vs ABAC

---

Chcesz, abym uzupełnił to o konkretną platformę (np. Ataccama, Databricks, Azure, GCP)? Daj znać, a rozbuduję notatkę kontekstowo.