---
title: Data Quality (Jakość Danych)
created: 2026-02-04
status: evergreen
category: Data Quality
difficulty: basic
language: pl
tags:
  - data-quality
  - dimensions
  - dq
  - quality-assurance
aliases:
  - Jakość Danych
  - DQ
  - Wymiary Jakości Danych
---
# 🎯 Definicja
**Data Quality (DQ)** to [[Miara|miara]] tego, w jakim stopniu dane nadają się do zamierzonego celu (Fitness for Purpose). Dane wysokiej jakości to takie, które wiernie odzwierciedlają rzeczywistość biznesową i pozwalają na podejmowanie trafnych decyzji.

# 🔑 Kluczowe punkty
- **Kontekst:** Jakość jest względna. Dane "historyczne" mogą być nieaktualne, ale poprawne dla historyka. Dla handlowca muszą być "świeże".
- **[[Wymiary|Wymiary]] DQ:** Standardowe kryteria oceny jakości (opisane poniżej).
- **Koszt złej jakości:** Reguła 1-10-100. Zapobieganie kosztuje 1$, naprawa przy wejściu 10$, a naprawa błędu u klienta 100$.

# 📚 Szczegółowe wyjaśnienie
Standardowe [[Wymiary|wymiary]] jakości danych (wg DAMA UK):
1.  **Completeness (Kompletność):** Czy mamy wszystkie wymagane dane? (Brak NULL-i w polach obowiązkowych).
2.  **Uniqueness (Unikalność):** Czy ten sam klient nie występuje 5 razy? (Brak duplikatów).
3.  **Timeliness (Aktualność):** Czy dane są dostępne na czas i czy reprezentują stan bieżący?
4.  **Validity (Poprawność formalna):** Czy dane są zgodne z formatem/słownikiem? (np. kod pocztowy XX-XXX).
5.  **Accuracy (Dokładność):** Czy dane są zgodne z rzeczywistością? (Czy Jan Kowalski naprawdę mieszka przy ul. Długiej, mimo że format adresu jest poprawny?).
6.  **Consistency (Spójność):** Czy dane w systemie A są takie same jak w systemie B?

# 💡 Przykład zastosowania
Kampania mailingowa.
- **Completeness:** 10% klientów nie ma adresu e-mail.
- **Validity:** 5% e-maili nie ma znaku `@`.
- **Accuracy:** 2% e-maili technicznie wygląda OK, ale są "martwe" (odbijają).
- **Uniqueness:** Jan Kowalski dostał 3 takie same maile, bo był wpisany 3 razy.
Efekt: Strata pieniędzy, irytacja klientów, niska konwersja. DQ zajmuje się naprawą tego stanu.

## 📌 Źródła
- DAMA-DMBOK.
- "Data Quality: The Accuracy Dimension" - Jack Olson.

## 👽 Brudnopis
- DQ Firewall: Blokowanie złych danych już na wejściu (np. walidacja formularza na stronie www).
- [[Data [[Profiling|Profiling]]|Data [[Profiling|Profiling]]]] to diagnoza, Data Quality to leczenie (reguły naprawcze/monitorujące).
