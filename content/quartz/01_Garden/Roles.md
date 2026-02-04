---

title: Roles  
created: 2025-05-21  
status:  
category: data governance / zarządzanie dostępem  
difficulty: podstawowy  
language: pl  
tags:

- role użytkowników
- kontrola dostępu
- governance
- metadane
- katalog danych  
aliases:
- role
- typy ról
- dostęp użytkowników

---

# 🎯 Definicja

**Roles (role)** to zestawy uprawnień przypisywane użytkownikom lub grupom, które definiują, co dana osoba może robić w systemie danych — w tym przeglądać, edytować, usuwać, komentować i zarządzać obiektami w katalogu danych, słowniku biznesowym, projektach, przepływach pracy czy konfiguracji.

# 🔑 Kluczowe punkty

- 🔐 Role wskazują zakres kontroli użytkownika nad elementami systemu — np. edycja metadanych, akceptacja zmian, uruchamianie reguł.
- 🧱 Role mogą być przypisywane globalnie (np. przez system IAM: [[Keycloak]], AD) lub kontekstowo tylko dla danej grupy, katalogu lub projektu.
- 🎛️ Każda rola agreguje zestaw uprawnień ("action set") — można tworzyć role predefiniowane lub zdefiniowane przez użytkownika.
- 📁 Użytkownicy z daną rolą mogą mieć inny poziom dostępu do obiektów w katalogu: full, edit, view, comment-only.

# 📚 Szczegółowe wyjaśnienie

## Przykładowe role w systemie zarządzania danymi (np. Ataccama ONE)

|Rola|Zakres działania|
|---|---|
|`MMM_admin`|Pełny dostęp, konfiguracja katalogu, struktury, synchronizacji i zarządzania|
|`MMM_data-manager`|Edycja i publikacja metadanych, współpraca ze stewardami i właścicielami|
|`Data Steward`|Zarządzanie terminami, jakością danych, przypisaniami w słowniku|
|`Data Owner`|Odpowiedzialność biznesowa, zatwierdzanie, zarządzanie reputacją danych|
|`Data Consumer`|Odczyt danych i metadanych, możliwość komentowania|

W praktyce, system automatycznie ustawia domyślną widoczność nowo dodanych obiektów w katalogu dla określonych ról — np. tylko `admin` i `data-manager` będą mogli je edytować.

## Sterowanie dostępem i zakres ról

Rola = zbiór uprawnień do tzw. „akcji”:

| Akcja użytkownika           | Czy dostępna? (zależnie od roli) |
| --------------------------- | -------------------------------- |
| `View metadata`             | ✅ viewer, steward                |
| `Edit metadata`             | ✅ data-manager, steward          |
| `Assign glossary terms`     | ✅ steward                        |
| `Run rules / DQ checks`     | ✅ steward, manager               |
| `Configure detection rules` | ❌ tylko `admin`                  |
|                             |                                  |

## Integracja z tożsamością

W systemach obsługujących SSO/IAM:

- Role mogą pochodzić z zewnętrznego systemu (np. [[Keycloak]] role: `MMM_user`, `ONE_engine_admin`).
- Możliwe jest przypisywanie roli automatycznie przy pierwszym logowaniu.
- Role mogą być przekładane lub synchronizowane z systemem RBAC w katalogu danych.

# 💡 Przykład zastosowania

```python
# Przypisanie roli użytkownika w pseudokodzie lub API

assign_role(
  user="jan.kowalski@example.com",
  context="data_catalog",
  role="MMM_data-manager"
)

# Użytkownik z tą rolą zyska możliwość edycji metadanych katalogowych
```

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.keycloak.org/docs/latest/server_admin/](https://www.keycloak.org/docs/latest/server_admin/)
- [https://learn.microsoft.com/en-us/entra/identity/role-based-access-control](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control)

# 👽 Brudnopis

- Rola = action bundle: zbiór uprawnień → określa co użytkownik może robić i gdzie
- Role: lokalne / systemowe / dziedziczone z IAM (np. [[Keycloak]], Azure AD)
- Domyślne przypisanie visibility i editable: MMM_data-manager i wyżej zaraz po dodaniu obiektów
- Można przesłaniać uprawnienia przez `Share` lub `Assign role` API
- Model skalowalny: user → przynależność do grup/realmu → przypisanie roli kontekstowej
- Narzędzia: Ataccama ONE, Collibra, Alation, Informatica – wspierają kontekstowe RBAC/ABAC