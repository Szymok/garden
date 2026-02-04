---
title: Group Isolation (Izolacja Grup)
created: 2026-02-04
status: evergreen
category: Data Governance / Security
difficulty: intermediate
language: pl
tags:
  - security
  - multi-tenancy
  - permissions
  - barriers
aliases:
  - Izolacja Danych
  - Silosowanie
  - Chinese Wall
---
# 🎯 Definicja
**Group Isolation** (Izolacja Grup) to mechanizm bezpieczeństwa w systemach Governance (np. Ataccama), który tworzy "szczelne ściany" między grupami użytkowników. Jeśli grupa "HR" jest izolowana, to nikt spoza tej grupy (nawet z grupy "Finanse") nie zobaczy jej danych, nie będzie mógł przypisać ich Stewarda ani współdzielić z nimi zasobów.

# 🔑 Kluczowe punkty
- **Zastosowanie:** Dane wrażliwe (Płace, Dane Medyczne), Tajne Projekty (R&D), Oddziały w różnych krajach (prawo lokalne).
- **Stewardship:** Steward musi być "wewnątrz" izolowanej grupy.
- **Jednokierunkowość:** Często Administrator (nadrzędny) widzi dół, ale dół nie widzi góry ani boków.

# 📚 Szczegółowe wyjaśnienie
Standardowo w systemach Governance panuje "otwartość" (widzisz metadane, chyba że zabroniono).
Izolacja odwraca zasadę: "Nie widzisz nic, chyba że należysz do grupy".
Blokuje to też przypadkowe wycieki: Użytkownik z izolowanej grupy R&D nie może przez pomyłkę udostępnić tajnego projektu koledze z marketingu, bo system na to nie pozwoli na poziomie logicznym.

# 💡 Przykład zastosowania
Bank ma oddział w Szwajcarii i w Polsce.
Prawo bankowe zabrania dostępu do danych klientów szwajcarskich pracownikom z Polski.
Tworzymy grupę `Switzerland_Ops` z włączoną **Izolacją**.
Polski analityk szukający "Klient Jan Nowak" w katalogu znajdzie tylko Polaka, nawet jeśli w bazie szwajcarskiej istnieje taki sam rekord.

## 📌 Źródła
- Ataccama Documentation - Security & Access Control.

## 👽 Brudnopis
- Jest to forma "Multi-tenancy" na poziomie logicznym aplikacji.
- Bardzo ważne przy fuzjach firm (M&A), gdy dwie firmy korzystają z jednego systemu, ale nie mogą widzieć swoich danych nawzajem.