---
title: Traits (cechy) w Ataccama ONE
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Configuration
difficulty: intermediate
language: en
tags:
  - traits
  - configuration
  - customization
  - mmd
  - metadata
aliases:
  - Konfiguracja Cech
  - Entity Traits
---
# 🎯 Definicja
**[[Traits|Traits]]** (Cechy) w [[Ataccama|Ataccama]] ONE to "naklejki" konfiguracyjne, które przyklejasz do encji w modelu, żeby zmienić ich zachowanie w UI.
Zamiast pisać kod, dodajesz `trait`.
Przykład: Chcesz, żeby encja miała wykres relacji? Dodajesz `relationships:enabled`.

# 🔑 Kluczowe punkty
- **Sterowanie UI:** Zmieniają ikony, nazwy wyświetlane, kolory, przyciski (np. "Duplicate").
- **Dwa typy:**
    1.  Na Encji (np. `fe:mmdEntity` - zmiana ikony całej tabeli).
    2.  Na Atrybucie (np. `fe:mmdProperty` - zmiana nazwy kolumny w UI).

# 📚 Szczegółowe wyjaśnienie
Przykłady popularnych cech:
- `core:copyable`: Dodaje przycisk "Duplicate" na rekordzie.
- `fe:term`: Pozwala kolorować Business Term.
- `fe:mmdProperty`: `{"displayName": "Zatwierdzone Przez"}` zamiast technicznego `appr_by`.

# 💡 Przykład zastosowania
Masz tabelę `c_customer`. W [[ONE Desktop|One Desktop]] nazywa się brzydko.
Dodajesz Trait:
```json
{
  "iconName": "user-group",
  "displayNameSingular": "Klient",
  "displayNamePlural": "Klienci"
}
```
Teraz w przeglądarce (ONE Web) użytkownik biznesowy widzi "Klienci" z ikonką ludzików.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - [[Traits|Traits]] Reference.

## 👽 Brudnopis
- [[Traits|Traits]] są częścią MMDM (Meta Meta Data Model). To sposób na "dekorowanie" modelu danych metadanymi wizualnymi.
