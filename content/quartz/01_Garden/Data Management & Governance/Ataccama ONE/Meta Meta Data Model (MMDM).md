---
title: MMDM (Meta-Meta Data Model)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Configuration
difficulty: advanced
language: pl
tags:
  - mmdm
  - metadata-model
  - configuration
  - architecture
  - customization
aliases:
  - Meta Model
  - Model Metadanych
---
# 🎯 Definicja
**MMDM (Meta Meta Data Model)** w [[Ataccama|Ataccama]] ONE to "kuchnia", w której definiujesz, jak wygląda system. To tutaj ustalasz, że w Twoim katalogu istnieje coś takiego jak "System", "Tabela" czy "Właściciel Danych". Jeśli chcesz dodać nowe pole "RODO Sensitivity" do każdej Tabeli - robisz to właśnie w MMDM.

# 🔑 Kluczowe punkty
- **Meta-Poziom:** Dane opisują świat (np. Jan Kowalski). Metadane opisują dane (Tabela "Klienci"). MMDM opisuje Metadane (Encja "Tabela" ma atrybut "Nazwa").
- **Customizacja:** Pozwala dostosować Ataccamę do specyficznych potrzeb firmy (np. dodanie nowych klas aktywów).
- **[[Metadata|Metadata]]-Driven Application:** Interfejs Ataccamy (formularze, przyciski) generuje się automatycznie na podstawie tego modelu. Zmieniasz model -> zmienia się UI.

# 📚 Szczegółowe wyjaśnienie
Elementy MMDM:
1.  **Entity (Encja):** Typ obiektu (np. `database`, `table`, `glossary_term`).
2.  **Property (Właściwość):** Cechy obiektu (np. `description`, `owner`, `creation_date`).
3.  **Relationship (Relacja):** Połączenia (np. `database` *zawiera* `tables`).

# 💡 Przykład zastosowania
Firma chce śledzić "Koszt przechowywania" dla każdej tabeli w chmurze.
Administrator wchodzi w MMDM, edytuje encję `Table` i dodaje pole `storage_cost` (typ: Currency).
Po zapisaniu, każdy Data Steward widzi nowe pole na ekranie edycji tabeli i może wpisać tam kwotę.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Development Guide - Configuring [[Metadata|Metadata]] Model.

## 👽 Brudnopis
- Niewłaściwa edycja MMDM może "rozsadzić" aplikację (np. usunięcie encji systemowej `user`). Zalecana ostrożność.