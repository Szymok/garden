---
title: Rule Suggestions (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Automation
difficulty: intermediate
language: pl
tags:
  - automation
  - suggestions
  - ai
  - dq-rules
  - efficiency
aliases:
  - Sugestie Reguł
  - Automatyczne Przypisywanie Reguł
---
# 🎯 Definicja
**Rule Suggestions** to system "podpowiedzi" w [[Ataccama|Ataccama]] ONE. Gdy podłączasz nową tabelę, system mówi: "Hej, ta kolumna wygląda jak Email. W innych projektach używasz do Emili reguły `Validate_Email`. Czy chcesz ją tu zastosować?".

# 🔑 Kluczowe punkty
- **Oszczędność czasu:** Nie musisz ręcznie szukać reguł. Klikasz "Accept".
- **Spójność:** Cała firma używa TEJ SAMEJ reguły do Emaili, a nie 5 różnych wersji.
- **Źródła wiedzy:** Sugestie biorą się z Glossary (Terminy), Słowników (Data Types) i historycznych użyć w innych projektach.

# 📚 Szczegółowe wyjaśnienie
Jak to działa?
1.  Podpinasz tabelę `CLIENTS`.
2.  [[Data Catalog|Data Catalog]] (AI) wykrywa, że kolumna `mail_addr` to `Business Term: Email`.
3.  Monitoring Projekt widzi to powiązanie. Wie, że `Business Term: Email` ma przypisaną domyślną regułę DQ.
4.  Wyświetla ikonkę żarówki z sugestią.

# 💡 Przykład zastosowania
Nowy Data Steward konfiguruje monitoring dla 50 systemów.
Ręczne klikanie zajęłoby tydzień.
Dzięki Rule Suggestions, system sam proponuje 90% konfiguracji. Steward tylko przegląda i zatwierdza ("Accept All"). Czas: 1 dzień.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Automated [[Data Quality|Data Quality]].

## 👽 Brudnopis
- To jeden z najlepszych argumentów za posiadaniem zintegrowanej platformy (Catalog + DQ). Oddzielne narzędzia tego nie potrafią.