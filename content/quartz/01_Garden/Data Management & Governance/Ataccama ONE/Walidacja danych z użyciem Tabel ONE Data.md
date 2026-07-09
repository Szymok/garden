---
title: Walidacja danych z użyciem Tabel ONE Data
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
  - walidacja danych z użyciem tabel ONE Data
  - referencyjne dane w regułach DQ
---

# 🎯 Definicja
Walidacja danych z użyciem tabel ONE Data polega na wykorzystaniu zarządzanych tabel referencyjnych przechowywanych w ONE Data bezpośrednio w regułach DQ i detekcyjnych, z warunkiem is from catalog item/is not from catalog item, co umożliwia natychmiastowe odzwierciedlenie zmian referencji w wynikach reguł oraz prostą modyfikację danych referencyjnych w tej samej platformie. W przeciwieństwie do [[Lookup|lookup]] items, które wymagają ręcznych lub harmonogramowych przebudów, tabele ONE Data propagują aktualizacje do reguł w czasie rzeczywistym i są rekomendowane do zarządzania referencjami.

# 🔑 Kluczowe punkty
- Użyj warunku is from catalog item/is not from catalog item w logice reguł, aby odwołać się do tabel ONE Data jako źródła referencji.
- Tabele ONE Data można edytować wprost (dodawać atrybuty, poprawiać wartości, usuwać duplikaty), a zmiany są widoczne w regułach natychmiast.
- [[Lookup|Lookup]] items wymagają budowy/aktualizacji (manualnej, zaplanowanej lub on data change tylko dla ONE Data), dlatego rekomendowane jest używanie tabel ONE Data zamiast klasycznych lookupów.
- Typowy przepływ: utwórz referencję → zdefiniuj business term → utwórz regułę z warunkiem is from catalog item → włącz DQ evaluation na termie → dodaj term do atrybutów i uruchom DQ.
- Referencyjne tabele można szybko stworzyć z Catalog Item lub od zera, w tym przez deduplikację, a następnie udostępnić je w regułach DQ.

# 📚 Szczegółowe wyjaśnienie

## Dlaczego ONE Data zamiast [[Lookup|lookup]] items
- Edytowalność i zarządzanie: ONE Data przechowuje rzeczywiste dane referencyjne w aplikacji, które można modyfikować bezpośrednio; zmiany natychmiast wpływają na reguły używające warunku is from catalog item.
- Aktualizacje: Lookupy wymagają przebudowy; możliwe tryby to NEVER/SCHEDULED oraz ON DATA CHANGE (dostępne tylko dla ONE Data), ale w wielu scenariuszach nadal jest to osobny krok administracyjny; dokumentacja zaleca używanie ONE Data do referencji, aby reguły korzystały z najnowszych danych.
- Rekomendacja: Preferuj tabele ONE Data jako zarządzane zestawy referencyjne, co upraszcza utrzymanie reguł i eliminuje ręczne reuploady plików [[Lookup|lookup]].

## Jak użyć ONE Data w regułach — warunek is from catalog item
- W regułach DQ lub detekcyjnych zastosuj warunek is from catalog item (lub is not from catalog item) i wskaż tabelę ONE Data jako referencję wartości dopuszczalnych.
- Po zapisaniu, zmiany w tabeli ONE Data propagują się automatycznie do logiki walidacyjnej bez konieczności przebudowy lookupu.

## Procedura end-to-end (5 kroków)
1. Create reference data: Utwórz tabelę referencyjną w ONE Data z CSV, zera lub przez import z istniejącego Catalog Item (opcjonalnie w trybie deduplicated data), a następnie zweryfikuj poprawność.
2. Create business term: Utwórz term odpowiadający referencji (np. Branch code) bezpośrednio z nagłówka atrybutu w ONE Data i opublikuj zmiany.
3. Create rule: Zdefiniuj regułę DQ/detekcyjną wykorzystującą warunek is from catalog item, wskazując tabelę ONE Data jako źródło referencji.
4. Enable DQ evaluation on term: Upewnij się, że reguła jest przypięta do termu i że term jest oznaczony do kontrybucji (jeśli dotyczy) w obliczaniu jakości.
5. Add term and run DQ evaluation: Dodaj term do odpowiednich atrybutów w tabelach produkcyjnych i uruchom DQ Evaluation, aby uzyskać wyniki jakości; dalsze zmiany w ONE Data będą działać w czasie rzeczywistym.

## Tworzenie/pozyskanie danych referencyjnych
- Import z Catalog Item do ONE Data: From Catalog Item → Full/Data only/Deduplicated data; przy Full można także wczytać tylko Invalid records do remediacji; podczas deduplikacji przenoszone są termy/reguły na atrybuty, a DQ wyniki będą dostępne w nowej tabeli.
- Dostęp i praca z tabelami: Tabele ONE Data dostępne są w ONE Data oraz w [[Data Catalog|Data Catalog]] (Open in ONE Data), co ułatwia konfigurację i odpalanie DQ.

## Reguły, termy i ewaluacja
- Reguły DQ/detekcyjne definiuje się centralnie, wiążąc je z termami lub bezpośrednio z atrybutami; ewaluacja DQ uruchamiana jest z katalogu, projektów monitoringu albo w tabelach ONE Data.
- W ONE Data po pierwszym Full [[Profiling|Profiling]] & DQ Evaluation edycje są walidowane na bieżąco na poziomie komórek/wierszy, natomiast metryki atrybutów/Overall Quality odświeżają się po kolejnym rerunie DQ.

# 💡 Przykład zastosowania
Organizacja utrzymuje listę poprawnych Branch code w tabeli ONE Data „branches_ref”, utworzonej przez import z Catalog Item i ewentualną deduplikację; powstaje term Branch code, a reguła DQ używa warunku is from catalog item wskazując „branches_ref”; term przypina się do atrybutów branch_code w tabelach transakcyjnych; po uruchomieniu DQ Evaluation wyniki jakości wskazują rekordy z niepoprawnymi kodami, a zmiany w „branches_ref” (np. dodanie nowej gałęzi) natychmiast wpływają na walidację bez konieczności przebudowy lookupu.

## 📌 Źródła
1. Validate Data Using ONE Data Tables — warunek is from catalog item, korzyści i kroki end-to-end
2. Import Data from a Catalog Item — tryby Full/Data only/Deduplicated, przenoszenie termów/reguł i DQ, Invalid records
3. Use Lookups in [[Rules|Rules]] — aktualizacje lookupów, ON DATA CHANGE tylko dla ONE Data, rekomendacja użycia tabel ONE Data
4. [[Lookup|Lookup]] Items — charakterystyka, ograniczenia aktualizacji i rebuild strategy, rekomendacja ONE Data
5. Get Started with ONE Data — dostęp do tabel ONE Data i praca z katalogu
6. DQ Evaluation in ONE Data — uruchamianie DQ, metryki i walidacja on-the-fly
7. Rule Types: DQ and Detection — przypinanie reguł do termów/atrybutów i ewaluacja

## 👽 Brudnopis
- Cel: porównać ONE Data vs [[Lookup|lookup]] w kontekście referencji; podkreślić real-time update i prostotę edycji w ONE Data.
- Warunek reguły: is from catalog item/is not from catalog item; wskazanie tabeli ONE Data jako referencji.
- Procedura 1–5: create reference → term → rule → enable DQ on term → add term & run DQ.
- Sourcing referencji: import z Catalog Item (Full/Data only/Deduplicated, Invalid records), przeniesienie termów/reguł przy deduplikacji.
- DQ w ONE Data: Full [[Profiling|Profiling]] & DQ Evaluation; on-the-fly na komórkach/wierszach; rerun dla metryk agregowanych.
- Lookupy: wymagają rebuild; ON DATA CHANGE dostępny dla ONE Data; generalnie rekomendacja: używaj ONE Data tables do referencji.
- Dostęp: Open in ONE Data z katalogu ułatwia workflow.