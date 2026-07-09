---
title: Keycloak (Identity and Access Management)
created: 2026-02-04
status: evergreen
category: Security / IAM
difficulty: intermediate
language: pl
tags:
  - keycloak
  - iam
  - sso
  - open-source
  - security
aliases:
  - RedHat SSO
  - IDP
  - Identity Provider
---
# 🎯 Definicja
**Keycloak** to standardowy w branży, otwartoźródłowy (Open Source) system do zarządzania tożsamością i dostępem (IAM). Służy jako "Bramkarz": sprawdza, kim jesteś (Authentication) i co możesz zrobić (Authorization).

# 🔑 Kluczowe punkty
- **SSO (Single Sign-On):** Logujesz się raz, masz dostęp do wszystkich aplikacji firmowych.
- **Identity Broker:** Może "zapożyczać" tożsamość z Google, Facebooka, Active Directory czy GitHuba.
- **Protokoły:** Obsługuje OpenID Connect (OIDC), OAuth 2.0 i SAML 2.0.

# 📚 Szczegółowe wyjaśnienie
Zamiast pisać moduł "Logowanie" i "Przypominanie hasła" w każdej nowej aplikacji Java/Python, programiści podpinają Keycloaka.
Zalety:
- Centralne zarządzanie użytkownikami (zmieniasz hasło Jana w jednym miejscu, a nie w 50 bazach).
- Bezpieczeństwo (Keycloak dba o szyfrowanie, 2FA/MFA, wykrywanie ataków Brute Force).
W [[Ataccama|Ataccama]] ONE Keycloak jest domyślnym dostawcą tożsamości (instalowanym z platformą).

# 💡 Przykład zastosowania
Firma ma 3 aplikacje: Jira, Wiki i [[Ataccama|Ataccama]].
Bez Keycloaka: Użytkownik ma 3 loginy i 3 hasła.
Z Keycloakiem: Użytkownik wchodzi na Jire -> przekierowanie do Keycloaka -> logowanie -> powrót do Jiry. Wchodzi na Wiki -> działa od razu (bo ma aktywną sesję w Keycloak).

## 📌 Źródła
- [Keycloak.org](https://www.keycloak.org).

## 👽 Brudnopis
- Jest to projekt wspierany przez Red Hat (wersja komercyjna to RH-SSO).
- Wymaga [[Bazy danych|bazy danych]] (zazwyczaj PostgreSQL) do działania.