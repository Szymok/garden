---
title: User Management (Zarządzanie Użytkownikami)
created: 2026-02-04
status: evergreen
category: Data Governance / Security
difficulty: basic
language: pl
tags:
  - security
  - rbac
  - keycloak
  - access-control
  - roles
aliases:
  - Zarządzanie Użytkownikami
  - Identity Management
---
# 🎯 Definicja
**User Management** to proces decydowania: "Kto może zobaczyć co".
W systemach danych to nie tylko login i hasło, ale skomplikowana macierz uprawnień (RBAC - Role Based Access Control).

# 🔑 Kluczowe punkty
- **Identity Provider (IdP):** System trzymający tożsamość (np. [[Keycloak]], Active Directory, Okta).
- **Rola:** Zbiór uprawnień (np. "Steward" może edytować, "Viewer" może tylko patrzeć).
- **Grupa:** Zbiór użytkowników (np. "Dział Marketingu").

# 📚 Szczegółowe wyjaśnienie
W nowoczesnych platformach (jak Ataccama ONE), User Management jest często zintegrowany z korporacyjnym SSO.
Użytkownik nie zakłada konta. Loguje się firmowym mailem.
System automatycznie przypisuje mu rolę na podstawie jego działu w Active Directory.
Uprawnienia dzielą się na:
1.  **Funkcyjne:** Co mogę *robić* (np. Tworzyć Reguły).
2.  **Dostępu do danych:** Co mogę *widzieć* (np. Tabela Wynagrodzeń).

# 💡 Przykład zastosowania
Nowy analityk dołącza do firmy.
Admin dodaje go do grupy "Data Science" w AD.
System danych (poprzez synchronizację LDAP/SAML) widzi nowego byta.
Automatycznie daje mu dostęp do `SCHEMA_SANDBOX` i `SCHEMA_PUBLIC`, ale ukrywa `SCHEMA_HR`.

## 📌 Źródła
- Security Engineering (Anderson).

## 👽 Brudnopis
- Najważniejsza zasada: **Principle of Least Privilege**. Daj użytkownikowi najmniejsze możliwe uprawnienia, jakie potrzebuje do pracy. Nie dawaj "Admina" wszystkim, bo to się źle skończy.