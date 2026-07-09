---
title: Screen Layout (Ataccama ONE)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Configuration
difficulty: basic
language: en
tags:
  - ui
  - layout
  - customization
  - widgets
  - user-experience
aliases:
  - Układ Ekranu
  - Konfiguracja Widoku
---
# 🎯 Definicja
**Screen Layout** to sposób, w jaki [[Ataccama|Ataccama]] ONE wyświetla informacje o danych. Możesz decydować, czy "Opis" jest na górze, czy na dole, czy "Statystyki DQ" są widoczne, i jakie karty (Widgets) widzi użytkownik.

# 🔑 Kluczowe punkty
- **No-Code:** Edytujesz układ myszką (Drag & Drop lub prosta konfiguracja JSON w UI), bez deployowania kodu.
- **Kontekst:** Możesz mieć inny układ dla "Klienta" (dużo danych osobowych), a inny dla "Słownika Walut" (prosta tabela).
- **Widgets:** Budujesz ekran z klocków: Properties, Relations, DQ Results, Comments.

# 📚 Szczegółowe wyjaśnienie
Aby zmienić wygląd:
1.  Wejdź np. w szczegóły tabeli.
2.  Kliknij 3 kropki -> **Edit Page / Layout**.
3.  Zmień JSON lub użyj wizualnego edytora.
4.  Zapisz. Zmiana jest widoczna dla wszystkich użytkowników.

# 💡 Przykład zastosowania
Data Stewarda irytuje, że najważniejsza informacja ("Właściciel Danych") jest ukryta na samym dole ekranu.
Admin wchodzi w Edit Page, przesuwa widget "Ownership" na samą górę, obok nazwy tabeli.
Teraz każdy od razu wie, do kogo dzwonić w sprawie tej tabeli.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Customization Guide.

## 👽 Brudnopis
- Layouty są potężne. Możesz ukrywać skomplikowane techniczne pola przed użytkownikami biznesowymi, żeby ich nie przerażać. Czysty UI = lepsza adopcja narzędzia.