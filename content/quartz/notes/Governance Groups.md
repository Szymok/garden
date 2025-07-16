---

title: Governance Groups  
created: 2025-07-14  
status:  
category: data governance  
difficulty: podstawowy  
language: pl  
tags:

- governance
- grupy
- hierarchia
- zarządzanie dostępem  
aliases:
- grupy governance
- grupy zarządzania

---

# 🎯 Definicja

**Governance Groups** (grupy zarządzania) to hierarchiczne struktury organizujące użytkowników w zespoły robocze, jednostki biznesowe lub dowolne inne grupy, służące do definiowania uprawnień i ról w kontekście zarządzania danymi lub uprawnieniami dostępowymi. Grupy pozwalają odwzorować relacje zespołowe, operacyjne lub projektowe niezależnie od formalnej struktury organizacyjnej.

# 🔑 Kluczowe punkty

- Grupy tworzy się w formie **hierarchii** — całość opiera się na strukturze drzewa, ułatwiającej delegowanie uprawnień i obowiązków na różnych poziomach.
- **Grupa może mieć wielu potomków, ale tylko jednego rodzica** – nie ma ograniczenia co do liczby poziomów w hierarchii.
- **Każdy członek może mieć inną rolę w każdej grupie** (np. w jednym zespole jest właścicielem, w innym – edytorem).
- Grupy nie muszą odzwierciedlać struktury organizacyjnej firmy – mogą być tworzone funkcjonalnie (projekty, departamenty, inicjatywy).
- Głównym celem jest precyzyjna kontrola dostępu: w grupie są użytkownicy, którzy współdzielą operacje na tych samych danych.
- Zarządzanie grupami wymaga odpowiednich uprawnień administracyjnych (np. ONE Administrator).

# 📚 Szczegółowe wyjaśnienie

## Hierarchia grup

- **Struktura drzewa:** Umożliwia odwzorowanie relacji między zespołami lub projektami. Przykładowo, organizacja zawiera grupy nadrzędne (np. "Organization"), pod którymi mieszczą się grupy projektowe, departamenty, a dalej mniejsze zespoły robocze.
- **Brak ograniczenia liczby poziomów:** Możliwe jest tworzenie bardzo złożonych i głębokich struktur — przydatne w dużych organizacjach lub w przypadku kilku warstw podprojektów.
- **Elastyczność:** Grupy mogą być dowolnie tworzone i przekształcane, bez związku z oficjalną hierarchią służbową.

## Role w grupie

- Każdy użytkownik posiada indywidualnie przypisaną **rolę** (np. Owner, Editor, Steward) w każdej grupie, do której należy.
- Możliwa jest przynależność użytkownika do wielu grup równocześnie, z różnymi rolami.

## Zarządzanie grupami

- Administrator (np. z rolą ONE Administrator) może dodawać/usuwać członków, przypisywać role i tworzyć podgrupy.
- Lista grup oraz zarządzanie przypisaniami odbywa się przez Global Settings → User Management → Groups.

# 💡 Przykład zastosowania

W dużej firmie IT:

1. Grupa "Organization" obejmuje całość firmy.
2. Pod nią wydzielone są grupy projektowe ("Group A" – projekt wdrożenia, "Group D" – R&D).
3. W grupie "Group A" są utworzone kolejne podgrupy: "Group B" (backend team), "Group C" (frontend team).
4. Użytkownik Jan Kowalski jest:
    - Owner w "Group A"
    - Editor w "Group B"
    - Member w "Group D"
5. Zespół zarządza uprawnieniami i własnością danych na poziomie każdego projektu według roli i hierarchii grupy.
6. W razie potrzeby tworzy się dodatkowe sub-grupy np. do obsługi tymczasowych inicjatyw, zachowując spójność z modelem uprawnień.

# 📌 Źródła

- Prezentacja Ataccama „Group hierarchies”
- Ataccama ONE: Global Settings > User Management > Groups
- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- Praktyki RBAC/ABAC implementowane w systemach zarządzania dostępem

# 👽 Brudnopis

- Grupy = elastyczna struktura uprawnień, nie zawsze = ścieżka służbowa
- Każdy użytkownik: rola osobno w każdej grupie (Owner/Editor/Steward/Member)
- Możliwa wielokrotna przynależność (np. projekt cross-team)
- Drzewo bez limitu głębokości; potomkowie i jeden rodzic
- Zarządzanie (dodawanie/edycja) z poziomu global settings > user management
- Zastosowania: kompleksowe uprawnienia, compliance, analityka dla projektów/produktów, realny podział kosztów i odpowiedzialności