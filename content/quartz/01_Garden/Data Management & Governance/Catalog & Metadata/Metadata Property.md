---
title: Metadata Property (Rodzaje Właściwości)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Configuration
difficulty: intermediate
language: en
tags:
  - mmdm
  - property-types
  - configuration
  - data-modeling
aliases:
  - Typy atrybutów metadanych
  - Embedded vs Referenced
---
# 🎯 Definicja
Podczas konfigurowania modelu metadanych (MMDM), każda właściwość (Property) musi mieć określony typ. Typ ten decyduje, jak dane są przechowywane w bazie i jak wyglądają w interfejsie użytkownika (np. czy to pole tekstowe, checkbox, czy lista rozwijana).

# 🔑 Kluczowe punkty
- **Scalar Properties:** Proste wartości (String, Integer, Boolean, Date).
- **Rich-Text:** Długi tekst z formatowaniem (HTML) - np. do opisów biznesowych.
- **Object Types:**
    - **Embedded (Wbudowany):** Dziecko żyje i umiera z rodzicem (np. Kolumna w Tabeli).
    - **Referenced (Referencja):** Dziecko jest niezależne (np. Właściciel przypisany do Tabeli).

# 📚 Szczegółowe wyjaśnienie
Najważniejsze rozróżnienie w modelowaniu:
- Użyj **Embedded**, gdy obiekt nie ma sensu istnienia samodzielnie (np. "Adres" w "Osobie"). Jeśli usuniesz Osobę, Adres też znika.
- Użyj **Referenced**, gdy łączysz dwa niezależne byty (np. "Osoba" i "Rola"). Jeśli usuniesz Rola, Osoba nadal istnieje (i odwrotnie).

# 💡 Przykład zastosowania
Tworzysz model dla "Systemu IT".
- Nazwa Systemu -> `String`
- Czy wrażliwy? -> `Boolean`
- Opis techniczny -> `Rich-text`
- Lista serwerów -> `Embedded Object Array` (Serwery należą do systemu).
- Administrator -> `Referenced Object` (Wskazuje na użytkownika z listy pracowników).

## 📌 Źródła
- Ataccama MMDM Configuration Guide.

## 👽 Brudnopis
- `Secret String` to specjalny typ do haseł (widoczny jako `*****`).
- `GID` to unikalny identyfikator w bazie MMM.