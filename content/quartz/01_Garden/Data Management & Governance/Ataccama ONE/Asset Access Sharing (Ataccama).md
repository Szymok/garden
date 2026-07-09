---
title: Asset Access Sharing (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Governance
difficulty: basic
language: en
tags:
  - sharing
  - access
  - governance
  - security
  - collaboration
aliases:
  - Udostępnianie Zasobów
  - Permissions Inheritance
---
# 🎯 Definicja
**Asset Sharing** to proces, w którym mówisz: "Chcę, żeby Zespół Marketingu widział ten raport".
Domyślnie, w [[Ataccama|Ataccama]] ONE, to co stworzysz (np. Raport DQ), jest prywatne. Musisz to udostępnić (Share), żeby inni to zobaczyli.

# 🔑 Kluczowe punkty
- **Prywatność:** Domyślnie Private. Bezpieczne od początku.
- **Dziedziczenie:** Jeśli udostępnisz coś grupie "Polska", a "Warszawa" jest podgrupą "Polska", to "Warszawa" też to zobaczy.
- **Poziomy:** Read Only, Edit, Full Control.

# 📚 Szczegółowe wyjaśnienie
Struktura grup w [[Ataccama|Ataccama]] (Organization Structure) jest hierarchiczna.
Ustrzegaj się udostępniania wszystkiego grupie głównej (`Organization`), bo zrobisz śmietnik w wynikach wyszukiwania dla całej firmy.
Udostępniaj tylko zainteresowanym (Least Privilege).

# 💡 Przykład zastosowania
Analityk tworzy "Eksperymentalny Raport Sprzedaży".
Na początku dzieli się nim tylko z "Kierownikiem Sprzedaży" (dla Feedbacku).
Po akceptacji, dzieli się z grupą "Dział Sprzedaży" (Read Only), żeby wszyscy mogli korzystać, ale nie zepsuć.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE [[User Management|User Management]] Docs.

## 👽 Brudnopis
- To częsty problem wdrożeniowy: "Nic nie widzę!". Odpowiedź: "Bo nikt Ci nic nie udostępnił". Warto mieć zestaw publicznych, ogólnodostępnych zasobów na start.
