---
title: Governance Groups (Grupy Zarządzania)
created: 2026-02-04
status: evergreen
category: Data Governance / Security
difficulty: basic
language: pl
tags:
  - access-control
  - groups
  - hierarchy
  - rbac
aliases:
  - Grupy Uprawnień
  - Zespoły Governance
---
# 🎯 Definicja
**Governance Groups** to jednostki organizacyjne (Zespoły, Departamenty, Projekty) zdefiniowane w narzędziu [[Data Governance|Data Governance]] (np. [[Ataccama|Ataccama]], Collibra), służące do grupowania użytkowników i nadawania im uprawnień do zasobów danych.

# 🔑 Kluczowe punkty
- **Hierarchia:** Grupy mogą (i powinny) tworzyć strukturę drzewiastą (Firma -> Dział -> Zespół).
- **Kontekst:** Uprawnienia nadane grupie "Finanse" działają zwykle na zasoby przypisane do domeny "Finanse".
- **Integracja:** Często synchronizowane automatycznie z Active Directory / LDAP.

# 📚 Szczegółowe wyjaśnienie
Grupy upraszczają zarządzanie dostępem (RBAC - Role Based Access Control). Zamiast klikać uprawnienia dla 50 analityków z osobna, dodajesz ich do grupy "Analysts_Marketing", a grupie nadajesz dostęp do folderu "Kampanie".
W systemach Governance (jak [[Ataccama|Ataccama]]), grupy pełnią też rolę **kategorii własności**. Jeśli Grupa "HR" jest właścicielem Terminu, to tylko członkowie grupy HR mogą go edytować.

# 💡 Przykład zastosowania
Nowy pracownik dołącza do zespołu Ryzyka.
Administrator dodaje go w [[Keycloak]] do grupy `Risk_Team`.
W nocy następuje synchronizacja.
Rano pracownik loguje się do Katalogu Danych i automatycznie widzi wszystkie tabele, raporty i definicje należące do domeny Ryzyka, a dane HR są dla niego ukryte.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE [[User Management|User Management]].

## 👽 Brudnopis
- Unikaj "sierot" (użytkowników bez grupy).
- Grupy funkcyjne (np. "Data Stewards") są często lepsze niż organizacyjne ("Departament X"), bo struktura firmy się zmienia, a role nie.