---
title: Walidacja danych z uÅ¼yciem Tabel ONE Data
created: 2025-08-09
status: 🌱 draft
  - Draft
category: Data Quality
difficulty: podstawowy
language: pl
tags:
  - ONE
  - Data
  - reference
  - data
  - DQ
  - rules
  - lookup
  - vs
  - ONE
  - Data
  - catalog
  - item
aliases:
  - walidacja danych z uÅ¼yciem tabel ONE Data
  - referencyjne dane w reguÅ‚ach DQ
---

# ðŸŽ¯ Definicja
Walidacja danych z uÅ¼yciem tabel ONE Data polega na wykorzystaniu zarzÄ…dzanych tabel referencyjnych przechowywanych w ONE Data bezpoÅ›rednio w reguÅ‚ach DQ i detekcyjnych, z warunkiem is from catalog item/is not from catalog item, co umoÅ¼liwia natychmiastowe odzwierciedlenie zmian referencji w wynikach reguÅ‚ oraz prostÄ… modyfikacjÄ™ danych referencyjnych w tej samej platformie. W przeciwieÅ„stwie do lookup items, ktÃ³re wymagajÄ… rÄ™cznych lub harmonogramowych przebudÃ³w, tabele ONE Data propagujÄ… aktualizacje do reguÅ‚ w czasie rzeczywistym i sÄ… rekomendowane do zarzÄ…dzania referencjami.

# ðŸ”‘ Kluczowe punkty
- UÅ¼yj warunku is from catalog item/is not from catalog item w logice reguÅ‚, aby odwoÅ‚aÄ‡ siÄ™ do tabel ONE Data jako ÅºrÃ³dÅ‚a referencji.
- Tabele ONE Data moÅ¼na edytowaÄ‡ wprost (dodawaÄ‡ atrybuty, poprawiaÄ‡ wartoÅ›ci, usuwaÄ‡ duplikaty), a zmiany sÄ… widoczne w reguÅ‚ach natychmiast.
- Lookup items wymagajÄ… budowy/aktualizacji (manualnej, zaplanowanej lub on data change tylko dla ONE Data), dlatego rekomendowane jest uÅ¼ywanie tabel ONE Data zamiast klasycznych lookupÃ³w.
- Typowy przepÅ‚yw: utwÃ³rz referencjÄ™ â†’ zdefiniuj business term â†’ utwÃ³rz reguÅ‚Ä™ z warunkiem is from catalog item â†’ wÅ‚Ä…cz DQ evaluation na termie â†’ dodaj term do atrybutÃ³w i uruchom DQ.
- Referencyjne tabele moÅ¼na szybko stworzyÄ‡ z Catalog Item lub od zera, w tym przez deduplikacjÄ™, a nastÄ™pnie udostÄ™pniÄ‡ je w reguÅ‚ach DQ.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Dlaczego ONE Data zamiast lookup items
- EdytowalnoÅ›Ä‡ i zarzÄ…dzanie: ONE Data przechowuje rzeczywiste dane referencyjne w aplikacji, ktÃ³re moÅ¼na modyfikowaÄ‡ bezpoÅ›rednio; zmiany natychmiast wpÅ‚ywajÄ… na reguÅ‚y uÅ¼ywajÄ…ce warunku is from catalog item.
- Aktualizacje: Lookupy wymagajÄ… przebudowy; moÅ¼liwe tryby to NEVER/SCHEDULED oraz ON DATA CHANGE (dostÄ™pne tylko dla ONE Data), ale w wielu scenariuszach nadal jest to osobny krok administracyjny; dokumentacja zaleca uÅ¼ywanie ONE Data do referencji, aby reguÅ‚y korzystaÅ‚y z najnowszych danych.
- Rekomendacja: Preferuj tabele ONE Data jako zarzÄ…dzane zestawy referencyjne, co upraszcza utrzymanie reguÅ‚ i eliminuje rÄ™czne reuploady plikÃ³w lookup.

## Jak uÅ¼yÄ‡ ONE Data w reguÅ‚ach â€” warunek is from catalog item
- W reguÅ‚ach DQ lub detekcyjnych zastosuj warunek is from catalog item (lub is not from catalog item) i wskaÅ¼ tabelÄ™ ONE Data jako referencjÄ™ wartoÅ›ci dopuszczalnych.
- Po zapisaniu, zmiany w tabeli ONE Data propagujÄ… siÄ™ automatycznie do logiki walidacyjnej bez koniecznoÅ›ci przebudowy lookupu.

## Procedura end-to-end (5 krokÃ³w)
1. Create reference data: UtwÃ³rz tabelÄ™ referencyjnÄ… w ONE Data z CSV, zera lub przez import z istniejÄ…cego Catalog Item (opcjonalnie w trybie deduplicated data), a nastÄ™pnie zweryfikuj poprawnoÅ›Ä‡.
2. Create business term: UtwÃ³rz term odpowiadajÄ…cy referencji (np. Branch code) bezpoÅ›rednio z nagÅ‚Ã³wka atrybutu w ONE Data i opublikuj zmiany.
3. Create rule: Zdefiniuj reguÅ‚Ä™ DQ/detekcyjnÄ… wykorzystujÄ…cÄ… warunek is from catalog item, wskazujÄ…c tabelÄ™ ONE Data jako ÅºrÃ³dÅ‚o referencji.
4. Enable DQ evaluation on term: Upewnij siÄ™, Å¼e reguÅ‚a jest przypiÄ™ta do termu i Å¼e term jest oznaczony do kontrybucji (jeÅ›li dotyczy) w obliczaniu jakoÅ›ci.
5. Add term and run DQ evaluation: Dodaj term do odpowiednich atrybutÃ³w w tabelach produkcyjnych i uruchom DQ Evaluation, aby uzyskaÄ‡ wyniki jakoÅ›ci; dalsze zmiany w ONE Data bÄ™dÄ… dziaÅ‚aÄ‡ w czasie rzeczywistym.

## Tworzenie/pozyskanie danych referencyjnych
- Import z Catalog Item do ONE Data: From Catalog Item â†’ Full/Data only/Deduplicated data; przy Full moÅ¼na takÅ¼e wczytaÄ‡ tylko Invalid records do remediacji; podczas deduplikacji przenoszone sÄ… termy/reguÅ‚y na atrybuty, a DQ wyniki bÄ™dÄ… dostÄ™pne w nowej tabeli.
- DostÄ™p i praca z tabelami: Tabele ONE Data dostÄ™pne sÄ… w ONE Data oraz w Data Catalog (Open in ONE Data), co uÅ‚atwia konfiguracjÄ™ i odpalanie DQ.

## ReguÅ‚y, termy i ewaluacja
- ReguÅ‚y DQ/detekcyjne definiuje siÄ™ centralnie, wiÄ…Å¼Ä…c je z termami lub bezpoÅ›rednio z atrybutami; ewaluacja DQ uruchamiana jest z katalogu, projektÃ³w monitoringu albo w tabelach ONE Data.
- W ONE Data po pierwszym Full Profiling & DQ Evaluation edycje sÄ… walidowane na bieÅ¼Ä…co na poziomie komÃ³rek/wierszy, natomiast metryki atrybutÃ³w/Overall Quality odÅ›wieÅ¼ajÄ… siÄ™ po kolejnym rerunie DQ.

# ðŸ’¡ PrzykÅ‚ad zastosowania
Organizacja utrzymuje listÄ™ poprawnych Branch code w tabeli ONE Data â€žbranches_refâ€, utworzonej przez import z Catalog Item i ewentualnÄ… deduplikacjÄ™; powstaje term Branch code, a reguÅ‚a DQ uÅ¼ywa warunku is from catalog item wskazujÄ…c â€žbranches_refâ€; term przypina siÄ™ do atrybutÃ³w branch_code w tabelach transakcyjnych; po uruchomieniu DQ Evaluation wyniki jakoÅ›ci wskazujÄ… rekordy z niepoprawnymi kodami, a zmiany w â€žbranches_refâ€ (np. dodanie nowej gaÅ‚Ä™zi) natychmiast wpÅ‚ywajÄ… na walidacjÄ™ bez koniecznoÅ›ci przebudowy lookupu.

## ðŸ“Œ Å¹rÃ³dÅ‚a
1. Validate Data Using ONE Data Tables â€” warunek is from catalog item, korzyÅ›ci i kroki end-to-end
2. Import Data from a Catalog Item â€” tryby Full/Data only/Deduplicated, przenoszenie termÃ³w/reguÅ‚ i DQ, Invalid records
3. Use Lookups in Rules â€” aktualizacje lookupÃ³w, ON DATA CHANGE tylko dla ONE Data, rekomendacja uÅ¼ycia tabel ONE Data
4. Lookup Items â€” charakterystyka, ograniczenia aktualizacji i rebuild strategy, rekomendacja ONE Data
5. Get Started with ONE Data â€” dostÄ™p do tabel ONE Data i praca z katalogu
6. DQ Evaluation in ONE Data â€” uruchamianie DQ, metryki i walidacja on-the-fly
7. Rule Types: DQ and Detection â€” przypinanie reguÅ‚ do termÃ³w/atrybutÃ³w i ewaluacja

## ðŸ‘½ Brudnopis
- Cel: porÃ³wnaÄ‡ ONE Data vs lookup w kontekÅ›cie referencji; podkreÅ›liÄ‡ real-time update i prostotÄ™ edycji w ONE Data.
- Warunek reguÅ‚y: is from catalog item/is not from catalog item; wskazanie tabeli ONE Data jako referencji.
- Procedura 1â€“5: create reference â†’ term â†’ rule â†’ enable DQ on term â†’ add term & run DQ.
- Sourcing referencji: import z Catalog Item (Full/Data only/Deduplicated, Invalid records), przeniesienie termÃ³w/reguÅ‚ przy deduplikacji.
- DQ w ONE Data: Full Profiling & DQ Evaluation; on-the-fly na komÃ³rkach/wierszach; rerun dla metryk agregowanych.
- Lookupy: wymagajÄ… rebuild; ON DATA CHANGE dostÄ™pny dla ONE Data; generalnie rekomendacja: uÅ¼ywaj ONE Data tables do referencji.
- DostÄ™p: Open in ONE Data z katalogu uÅ‚atwia workflow.