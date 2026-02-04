---
title: Keycloak Roles (Role i Uprawnienia)
created: 2026-02-04
status: evergreen
category: Security / IAM
difficulty: intermediate
language: pl
tags:
  - keycloak
  - security
  - rbac
  - authorization
  - ataccama-one
aliases:
  - Role Keycloak
  - RBAC Keycloak
  - Uprawnienia użytkowników
---
# 🎯 Definicja
**Keycloak Roles** to mechanizm RBAC (Role-Based Access Control) w systemie tożsamości Keycloak. Zamiast nadawać uprawnienia każdemu użytkownikowi z osobna ("Jan może kasować", "Anna może kasować"), tworzymy Rolę "Admin" i przypisujemy ją Janowi i Annie.

# 🔑 Kluczowe punkty
- **Realm Roles:** Role globalne, widoczne dla wszystkich aplikacji w danej domenie (np. `global-admin`).
- **Client Roles:** Role specyficzne dla jednej aplikacji (np. `jira-users`, `one-desktop-users`).
- **Composite Roles:** Rola-matrioszka. Rola `SuperAdmin` może zawierać w sobie rolę `Admin` i `User`.

# 📚 Szczegółowe wyjaśnienie
W kontekście Ataccama ONE:
System używa Keycloaka do logowania. Mapowanie wygląda tak:
1. Użytkownik loguje się w Keycloak.
2. Keycloak wystawia token (JWT), w którym jest pole `roles: ['steward', 'viewer']`.
3. Ataccama ONE odczytuje ten token i na jego podstawie odblokowuje przyciski w interfejsie.
Jeśli zabierzesz rolę w Keycloak, użytkownik straci dostęp natychmiast po wygaśnięciu tokena (zazwyczaj 5-15 min).

# 💡 Przykład zastosowania
Nowy pracownik HR.
Zamiast klikać w 15 systemach, Administrator dodaje go do grupy "HR-Employees" w Keycloak.
Grupa ta ma przypisaną rolę `hr-app-user`.
Pracownik automatycznie może się zalogować do systemu płacowego, urlopowego i ewidencji czasu pracy.

## 📌 Źródła
- Keycloak Documentation - Role Based Access Control.

## 👽 Brudnopis
- Najlepsza praktyka: Przypisuj role do Grup, a Użytkowników do Grup. Unikaj przypisywania ról bezpośrednio do Użytkowników ("Role Explosion").