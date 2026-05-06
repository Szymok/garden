---
title: Data Protection Classification (Klasyfikacja Ochrony Danych)
created: 2026-02-04
status: evergreen
category: Data Security/Governance
difficulty: intermediate
language: pl
tags:
  - security
  - classification
  - gdpr
  - rodo
  - pii
aliases:
  - Klasyfikacja Danych
  - Tagi Bezpieczeństwa
---
# 🎯 Definicja
**Klasyfikacja Ochrony Danych** to proces kategoryzowania danych w oparciu o ich wrażliwość i wpływ na organizację w przypadku wycieku. Służy do automatycznego sterowania dostępem (kto co może widzieć) i wymuszania polityk bezpieczeństwa (np. maskowania). Typowe poziomy to: Publiczne, Wewnętrzne, Poufne, Ściśle Tajne.

# 🔑 Kluczowe punkty
- **PII (Personally Identifiable Information):** Dane osobowe, które bezwzględnie wymagają ochrony (RODO).
- **Automatyzacja:** W nowoczesnych systemach (jak Ataccama), klasyfikacja dzieje się automatycznie na podstawie profilowania (np. "Wykryto PESEL -> Nadaj klasę POUFNE").
- **Działanie:** Klasa bezpieczeństwa jest atrybutem metadanych, który "wędruje" z danymi.

# 📚 Szczegółowe wyjaśnienie
W Ataccama ONE (i innych systemach DG), klasyfikacja często wiąże się z tagami.
Jeśli kolumna dostanie tag `Class: Confidential`:
1.  Zwykły użytkownik zobaczy w Katalogu kłódkę lub zamaskowane wartości (`*****`).
2.  System zablokuje eksport tych danych do Excela.
3.  Lineage pokaże, gdzie te dane płyną, żeby upewnić się, że nie trafiają do systemów publicznych.

# 💡 Przykład zastosowania
Dział HR przechowuje dane o wynagrodzeniach.
System automatycznie wykrywa kolumny z kwotami i nazwiskami.
Nadaje im klasyfikację `HR-Sensitive`.
Dzięki temu analityk IT, który ma dostęp do bazy w celu jej optymalizacji, widzi metadane (że tabela istnieje), ale nie widzi samych zarobków (są zamaskowane lub ukryte), bo nie ma uprawnień do klasy `HR-Sensitive`.

## 📌 Źródła
- ISO/IEC 27001 (Information Security Management).
- RODO / GDPR.

## 👽 Brudnopis
- Najczęstszy błąd: "Over-classification" (wszystko jest tajne), co paraliżuje pracę, lub "Under-classification" (wszystko jawne), co grozi wyciekiem.
- Klasyfikacja powinna być prosta (3-4 poziomy max).