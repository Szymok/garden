---
title: Lookups
created: 2025-08-08
status: in-review 
category: data-quality
difficulty: intermediate 
language: pl 
tags:
- data-quality
- lookup
- reference-data
- dq-rules
- detection-rules
- ataccama-one 
aliases:
- lookup-items
- lookup-file
- lkp
- is-from-lookup
- lookups-in-rules
---
# 🎯 Definicja 
Lookups (Lookup Items) to pliki/słowniki referencyjne używane w module [[Data Quality]] do porównywania surowych danych z listami wartości w celu oczyszczania, weryfikacji, dopasowania i wzbogacania; w ONE Web obecnie obsługiwane są elementy jednokolumnowe. W regułach DQ i Detection Lookups można wykorzystać w warunkach (np. “is from lookup”/“is not from lookup”) poprzez Condition Builder lub zaawansowane wyrażenia.

# 🔑 Kluczowe punkty

- Lokalizacja: [[Data Quality]] → Lookup Items; to centralne miejsce zarządzania Lookups w ONE Web.
- Zastosowania: wsparcie dla cleansing, verification, matching, enrichment poprzez porównanie danych z listami referencyjnymi.
- Obsługa w Web: obecnie wspierane są Lookups jednokolumnowe (single-column).-
- Użycie w regułach: dostępne w DQ i Detection przez Advanced Expressions lub Condition Builder (is/not from lookup).
- Tworzenie: z atrybutu katalogowego, bezpośrednio z widoku katalogu (Create new lookup), lub upload pliku .lkp (Upload).
- Konfiguracja danych: rebuild strategy (kiedy odświeżać), duplicates handling (First/Omit/Accept), opcje matchingu: remove accents, remove repeated characters, squeeze whitespaces, uppercase.
- Publikacja: po utworzeniu zapisz, opublikuj draft i zbuduj lookup (Build Lookup), aby był używalny w regułach.

# 📚 Szczegółowe wyjaśnienie

- Czym są Lookups i gdzie je znaleźć
    - Lookups to niezarządzane (unmanaged) pliki referencyjne przechowywane w sekcji [[Data Quality]] → Lookup Items, które zawierają sformatowane i oczyszczone wartości porównywane z danymi surowymi.
    - Mogą wspierać oczyszczanie, weryfikację, dopasowanie i wzbogacanie rekordów w procesach DQ.
- Tworzenie Lookup Item — ścieżki
    - Create z istniejącego Catalog Item: wybierz element katalogu i atrybut; w wielu miejscach interfejsu dostępna akcja “Create new lookup” (np. karty Overview, Data, Profile & DQ insights, oraz widok atrybutu).
    - Create z poziomu Lookup Items: [[Data Quality]] → Lookup Items → Create; podaj nazwę/opis, wskaż źródło z katalogu albo wybierz upload.
    - Upload pliku .lkp: przeciągnij i upuść lub wskaż plik; masowy upload pojedynczych pozycji nie jest wspierany, ale można przesyłać wiele Lookup Items kolejno.
    - Alternatywnie buduj .lkp w [[ONE Desktop]] (Lookup Builder), pliki znajdziesz w Files → data → out → [name].lkp i możesz je wgrać do ONE Web.
- Konfiguracja danych Lookup
    - Rebuild strategy: zdefiniuj moment aktualizacji danych lookup (np. ręcznie, przy zmianie źródła, wg harmonogramu) — zgodnie z polityką instancji.
    - Duplicates handling: First (pierwsze wystąpienie), Omit (brak duplikatów), Accept (akceptuj wszystkie).
    - Matching values: Remove accents, Remove repeated characters, Squeeze whitespaces, Upper-case — poprawiają trafność dopasowania.
    - Edycja wersji: można wgrać nową wersję lookupu i publikować; w razie potrzeby przywrócić poprzednią z historii. Edycja .lkp w Desktop wymaga ponownego uruchomienia planu Lookup Builder (pełny refresh); gdy źródło zaginęło, użyj Lookup Reader, zmodyfikuj dane i zbuduj ponownie.
- Użycie Lookups w regułach
    - Condition Builder: operatory “is from lookup” / “is not from lookup” pozwalają warunkować logikę reguł na przynależności wartości do lookupu.
    - Reguły DQ i Detection: lookups są wspierane w obu typach; mogą być również automatycznie generowane podczas implementacji reguł z opcji “is from catalog item”.
- Publikacja i budowa
    - Po konfiguracji: Save → Publish draft → Build Lookup, aby materiał był dostępny dla reguł i projektów monitorujących.
    - Utrzymanie: rozważ harmonogram odbudowy i politykę zarządzania duplikatami zgodną z semantyką danych referencyjnych.
- Dobre praktyki
    - Normalizacja: włącz uppercase, trim/squeeze whitespaces, remove accents/repeats, aby ograniczyć fałszywe rozbieżności.
    - Audytowalność: dokumentuj źródło lookupu, strategię rebuild, reguły wykorzystujące lookup i wersjonowanie.
    - Cykl życia: często zmieniające się słowniki trzymaj jako źródła zarządzane i automatyzuj rebuildy; Desktop → Upload do Web zapewnia spójność między środowiskami.

# 💡 Przykład zastosowania

- Scenariusz: Walidacja kraju zamieszkania względem słownika ISO
    
    1. Utworzenie: [[Data Quality]] → Lookup Items → Create; nazwa “ISO_COUNTRY_CODE”; wybierz Upload i załaduj jednokolumnowy .lkp z kodami ISO alpha-2.
    2. Konfiguracja: duplicates handling = Omit; matching options: Upper-case, Squeeze whitespaces; rebuild strategy = manual na start.
    3. Reguła DQ: w Condition Builder dla atrybutu country_code ustaw “is from lookup: ISO_COUNTRY_CODE”; PASS/FAIL wg członkostwa w lookupie.
    4. Detection: użyj tego lookupu w regule detekcji do przypinania termu tylko dla wartości z listy.
    5. Utrzymanie: gdy zmienia się lista, zbuduj .lkp w [[ONE Desktop]] (Lookup Builder) i wgraj nową wersję do ONE Web; wersje możesz przywracać z historii.

## 📌 Źródła

- Lookup Items — dokumentacja ONE: tworzenie, upload, budowa, użycie w regułach.
- Use Lookups in [[Rules]] — konfiguracja duplicates handling i matching options.
- Lookup Items and [[Rules]] — artykuł Community: tworzenie, upload nowej wersji, historia wersji, opcje matchingu.
- Scheduling Lookup Item Rebuilds and Managing Lookup Files — workflow Desktop → Web, lokalizacja plików .lkp.
- Edit Existing Lookup Files — Community: edycja/przebudowa, pełny refresh, Lookup Reader/Builder.
- How to update look up file? — przykłady w Desktop do budowy .lkp.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Lookups, Dictionary files (lists or reference data) called Lookups are placed in the [[Data Quality]] section - Lookup Items. - Lookup items allow you to use unmanaged reference data in ONE, Lookup items can be compared to raw data in order to help with: o Data cleansing Verification Matching Enrichment Create lookup item (1/2) Currently, only one column Lookup Items are supported in the ONE Web application. Lookups can be used for both DQ or [[Detection rules]] through Advanced Expressions or Condition Builder. TO employ Lookup Items in Rule Logic condition user can choose the "is (not) from lookup" option when using the Condition Builder. TO create a new lookup, user can: Create a new lookup from an existing Catalog item using the create button. Select an existing catalog item's attribute and transform it into a lookup. Upload a lookup file (.lkp) using the Upload button. Create lookup item (2/2) 2, 3. 2. 3, In [[Data Quality]] Lookup Items select Create. Provide general information about the lookup item, such as name and description (optional). Select whether you want to create the lookup from a catalog item attribute, or upload a lookup file. A. If you select Choose from [[Catalog Items]], select the required catalog item and attribute B. If you select Upload from computer, drag and drop the lookup file to the space provided, or browse files. In Data configuration, define the following: Rebuild strategy: Choose when the A. lookup data is updated. Duplicates handling B. Select Save. Publish the draft Select Build Lookup,”

- Pytania do weryfikacji:
    - Czy włączyć wszystkie matching options (remove accents/repeats, squeeze whitespaces, uppercase), czy tylko wybrane dla danego słownika? — do weryfikacji.
    - Jaka strategia rebuildu (manual/on change/scheduled) jest zgodna z Waszym cyklem publikacji słowników? — do weryfikacji.
    - Czy wymagana jest automatyzacja budowy .lkp w Desktop i pipeline uploadu do ONE Web (CI/CD)? — do weryfikacji.