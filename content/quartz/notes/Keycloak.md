---

title: Keycloak  
created: 2025-07-14  
status:  
category: security & identity management  
difficulty: średni  
language: pl  
tags:

- Keycloak
- IAM
- zarządzanie tożsamością
- SSO
- autoryzacja  
aliases:
- keycloak
- zarządzanie tożsamością

---

# 🎯 Definicja

**Keycloak** to otwartoźródłowa platforma do zarządzania tożsamością i dostępem (Identity & [[User Management|Access Management]], IAM), wykorzystywana do uwierzytelniania użytkowników, centralizacji zarządzania rolami, uprawnieniami i sesjami oraz integracji z aplikacjami za pomocą single sign-on (SSO). Pozwala zarówno użytkownikom końcowym, jak i administratorom, bezpiecznie logować się do systemów korporacyjnych i zarządzać dostępem do zasobów.

# 🔑 Kluczowe punkty

- **Centralizacja zarządzania użytkownikami:** umożliwia rejestrację, zarządzanie, reset haseł i przypisywanie ról z jednego miejsca.
- **SSO (Single Sign-On):** jedno logowanie do wielu aplikacji i usług.
- **Obsługa integracji:** wsparcie dla protokołów SAML, OpenID Connect, OAuth2 – łatwa integracja z aplikacjami webowymi, API oraz systemami zewnętrznymi.
- **Realmy i [[Roles|role]]:** Realm to logiczna przestrzeń grupująca użytkowników, [[Roles|role]] i uprawnienia dla konkretnej aplikacji lub zestawu aplikacji; rola decyduje o uprawnieniach użytkownika.
- **Delegowane zarządzanie uprawnieniami:** przypisywanie ról oraz zarządzanie politykami dostępu przez API lub konsolę administratora.
- **Bezpieczeństwo:** wsparcie dla MFA, polityk haseł, audytu i automatycznego wygasania sesji.

# 📚 Szczegółowe wyjaśnienie

## Architektura i pojęcia podstawowe

|Pojęcie|Znaczenie|
|---|---|
|**Realm**|Logicza przestrzeń wydzielająca użytkowników, [[Roles\|role]], grupy i polityki bezpieczeństwa dla danego środowiska.|
|**User (Użytkownik)**|Każda osoba (lub system), która loguje się przez Keycloaka do wybranej aplikacji lub portalu.|
|**[[Roles\|Role]] (Rola)**|Zestaw uprawnień przypisanych do użytkownika lub grupy; można mieć wiele ról dla różnych funkcjonalności.|
|**Group (Grupa)**|Zbiór użytkowników dzielących uprawnienia oraz zarządzanych zbiorowo.|
|**Client**|Zarejestrowana aplikacja, która korzysta z Keycloaka do uwierzytelniania i autoryzacji.|

## Jak działa logowanie i zarządzanie?

1. **Logowanie:**  
    Użytkownik kierowany jest na stronę logowania Keycloak (np. `https://twoja-domena/auth/`), uwierzytelnia się jeden raz.
2. **Autoryzacja:**  
    System sprawdza, do jakich realiów i aplikacji użytkownik ma dostęp oraz jakie [[Roles|role]] są mu przypisane.
3. **SSO:**  
    Po sukcesie – dostęp do wszystkich powiązanych aplikacji bez potrzeby ponownego logowania.
4. **Zarządzanie z konsoli:**  
    Administrator keycloaka (np. domeny Ataccama) może dodawać użytkowników, przypisywać [[Roles|role]], zarządzać resetami haseł, ustawiać MFA oraz aktualizować polityki bezpieczeństwa.

## Integracja i użycie

Keycloak można połączyć z:

- systemami HR (import LDAP/AD),
- własnymi aplikacjami przez protokoły SAML/OIDC,
- rozwiązaniami SaaS,
- narzędziami [[Business Intelligence|BI]], platformami do analityki i hurtowniami danych.

# 💡 Przykład zastosowania

**Firmowy ekosystem danych (np. Ataccama):**

- Firma wdraża Ataccama ONE do zarządzania jakością, katalogiem i analityką danych.
- [[Roles|Dostęp użytkowników]] i uprawnienia (np. Data Owner, Data Steward) centralnie kontrolowane przez Keycloak.
- Pracownik, rejestrując się w aplikacji lub logując pierwszy raz przez SSO, automatycznie zyskuje określony [[Sharing access to assets|dostęp do zasobów]] (i ról) w zależności od przydziału w Keycloak.
- Administrator korzysta z Keycloak Admin Console, by grupować użytkowników, definiować realmy dla różnych departamentów oraz powiązać [[Roles|role]] domenowe z rolami aplikacyjnymi.

# 📌 Źródła

- [https://www.keycloak.org/documentation](https://www.keycloak.org/documentation)
- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.baeldung.com/keycloak-roles-groups](https://www.baeldung.com/keycloak-roles-groups)
- [https://medium.com/@dmitryza/keycloak-wprowadzenie-w-10-minut-8d4c447b8387](https://medium.com/@dmitryza/keycloak-wprowadzenie-w-10-minut-8d4c447b8387)

# 👽 Brudnopis

- Keycloak = open source IDM, często domyślny backend IAM w Ataccama, Jirze, platformach opensource.
- Podstawowe pojęcia: realmy (segregacja), user (osoba/system), [[Roles|role]] (uprawnienia), group (dziedziczenie).
- Każdy user, po zalogowaniu, uzyskuje token (ID token, access token) z informacjami o rolach i uprawnieniach.
- Dostęp przez API, CLI, UI (Admin Console).
- Integracja z korporacyjnym LDAP, SSO, polityki MFA, enforce password policy, audyt dostępu.
- W Ataccama realm = AtaccamaONE, adres najczęściej „.../auth”, admin loguje się do konsoli, zarządza userami, rolami, grupami.
- Przykłady ról: MMM_admin, MMM_user, DPP_admin, RDM_user, itd.
- Każdy użytkownik może być w wielu grupach, mieć wiele ról; [[Roles|role]] są kompozytowe (grantują szereg uprawnień); przykład – MMM_user daje domyślne prawo logowania, dalsze uprawnienia przez governance.