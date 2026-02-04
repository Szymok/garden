---
title: Component Rules (Reguły Komponentowe Ataccama)
created: 2026-02-04
status: sapling
category: Ataccama/DQ
difficulty: advanced
language: pl
tags:
  - ataccama
  - dq-rules
  - components
  - one-desktop
aliases:
  - Detection Rules
  - Validation Components
---
# 🎯 Definicja
**Component Rules** to reużywalne fragmenty logiki w Ataccama ONE, które mogą być używane do **Detekcji** (jaki to typ danych?) lub **Ewaluacji** (czy dane są poprawne?). Są tworzone jako pliki `.comp` w ONE Desktop.

# 🔑 Kluczowe punkty
- **Detection Rules:** Służą do automatycznego przypisywania terminów słownikowych (Glossary Terms) do kolumn. Np. "Jeśli kolumna ma 11 cyfr i zaczyna się od 'PL', oznacz ją jako PESEL". Nie oceniają jakości, tylko *klasyfikują*.
- **DQ Evaluation Rules:** Służą do oceny jakości. Zwracają status `VALID` / `INVALID`. Mogą być podpięte pod Terminy.
- **Web vs Desktop:** Proste reguły wyklikasz w przeglądarce (Web App). Skomplikowane (z logiką Lookup, regexami) budujesz w ONE Desktop jako komponenty.

# 📚 Szczegółowe wyjaśnienie
Proces tworzenia zaawansowanej reguły DQ:
1. **ONE Web:** Tworzysz "Validation Component" (definiujesz wejście/wyjście). Status: "Draft".
2. **ONE Desktop:** Pobierasz komponent. Widzisz go w zakładce `Components`.
3. **Logika:** W środku "pudełka" układasz klocki (kroki), np. `Regex Matching` -> `Condition`.
4. **Publish:** Wysyłasz gotowy komponent z powrotem do Web App.
5. **Użycie:** W Data Quality Rule wybierasz typ "Component" i wskazujesz swój plik.

# 💡 Przykład zastosowania
Reguła walidacji kodu IBAN.
Ponieważ walidacja IBAN wymaga skomplikowanej matematyki (modulo 97), nie zrobisz tego prostym SQL-em w przeglądarce.
Tworzysz komponent `Validate_IBAN.comp` w ONE Desktop, używasz wbudowanej funkcji `isIban()`, publikujesz. Teraz każdy analityk w firmie może użyć tej reguły, nie wiedząc jak działa w środku.

## 📌 Źródła
- Ataccama ONE Documentation - Component Rules.

## 👽 Brudnopis
- Reguły detekcji NIE mogą być używane w Monitoring Projects.
- Wewnątrz komponentu nie wolno zmieniać wejść/wyjść (Integration Input/Output).