---

title: Screen Layout  
created: 2025-03-31  
status: Final  
category: Ataccama  
difficulty: podstawowy  
language: pl  
tags:

- UI
- configuracja
- ataccama
- layout  
aliases:
- układ ekranu

---

# 🎯 Definicja

**Screen Layout** w Ataccama ONE to konfigurowalny układ (layout) wizualny stron i widoków aplikacji webowej, pozwalający na dostosowanie rozmieszczenia, widoczności i prezentacji widgetów, atrybutów czy właściwości encji bez zmiany modelu metadanych. Layouty są definiowane i zmieniane bezpośrednio w interfejsie użytkownika przez power-userów/adminów.

# 🔑 Kluczowe punkty

- Pozwala edytować rozmieszczenie oraz sposób wyświetlania widgetów i właściwości na stronach encji.
- Edycja layoutu nie wpływa na sam model metadanych — modyfikuje tylko warstwę prezentacji.
- Layout można definiować i zmieniać przez opcję **Edit page > Layout** (dostępne na listingach, ekranach custom, szczegółowych).
- Layouty zapisane są w formacie JSON i muszą być poprawnymi deklaracjami, by uniknąć błędów wyświetlania.
- Dostępne są predefiniowane układy dla kluczowych typów obiektów (np. katalogi, terminy, reguły), możliwa jest pełna customizacja przez użytkownika z uprawnieniami.

# 📚 Szczegółowe wyjaśnienie

## Mechanizmy i architektura

### Tryby i miejsca użycia

- **Listing / Custom Screens:** Definiowanie rozmieszczenia widgetów, zmiana nazw zakładek, ikon, filtrowania domyślnego.
- **Szczegóły encji:** Możliwość ukrywania, grupowania, zmiany kolejności properties/traits.
- **Widżety:** Layout kontroluje, które widgety/komponenty pojawią się na stronie (np. property card, related items, custom cards) oraz w jakim układzie (kolumny/rzędy).
- **Zakładka Fetch [[Rules]]:** Umożliwia wyświetlanie tylko wybranych encji na podstawie określonych reguł filtrowania.
- Dla administratorów dostępna jest opcja natychmiastowego publikowania zmian dla wszystkich użytkowników.

### Edycja Screen Layout

- Przejdź do ekranu lub listingu, który chcesz zmodyfikować.
- W menu trzy kropki wybierz **Edit page**, następnie **Layout**.
- Dodaj/usuń/przestaw widgety (np. podstawowe properties, powiązane elementy).
- Układaj wybrane widgety w wiersze/kolumny.
- Możesz ukrywać określone properties lub agregować wyświetlanie niestandardowych właściwości za pomocą card/widgetu.
- Zmiany layoutu zapisane są lokalnie i publikowane globalnie po zapisaniu.

**Uwaga:** Layout nie wpływa na strukturę danych — ta pozostaje niezmienna w modelu metadanych.

### Przykładowa architektura/język

Layouty definiowane są w JSON; każda sekcja, widget, podział na kolumny/rzędy oraz ich widoczność jest opisana jako osobny obiekt (np. karty, widżety). Przydatne do szybkiej personalizacji ekranów bez ingerencji w backend czy kod aplikacji.

# 💡 Przykład zastosowania

Zespół stewardów danych wdraża nową właściwość ("wrażliwość danych") w metadanych pól katalogowych. Po dodaniu property w modelu, projektant edytuje layout ekranu szczegółowego tabeli przez:

- Przejście do widoku szczegółów tabeli,
- Wybranie **Edit page > Layout**,
- Dodanie nowej karty z wrażliwą właściwością oraz ukrycie kilku zdezaktualizowanych property,
- Uporządkowanie inputów i widgetów, aby zachować przejrzystość dla użytkowników biznesowych.  
    Po zapisaniu i publikacji, wszyscy użytkownicy widzą elegancki, kontekstowy layout z nowymi/właściwymi danymi — bez konieczności angażowania zespołu developerskiego.

## 📌 Źródła

- [Ataccama ONE – Entity Screen Customization](https://docs.ataccama.com/one/latest/ui-customization/entity-screen-customization.html)
- [Ataccama ONE – Home Page Customization](https://docs.ataccama.com/one/latest/ui-customization/home-page.html)
- [Ataccama Community – Layout change of preview pane in OneWeb](https://community.ataccama.com/data-quality-catalog-94/layout-change-of-preview-pane-in-oneweb-1096)

## 👽 Brudnopis

- Layout edytowany przez power usera/admina (“Edit page”, JSON, propagacja globalna)
- Każda encja może mieć dedykowany layout > widgety: property, trait, powiązania (related), custom cards
- Ukrywanie i grupowanie property, wsparcie dla niestandardowych widgetów
- Możliwość customizacji bez kodowania, szybka zmiana na produkcji
- Fetch [[Rules]] = filtracja obiektów po warunkach (np. listing tylko aktywnych)
- Przykład: zmiana layoutu po dodaniu property, reorganizacja widgetów, uproszczenie dla userów
- Layout nie zmienia modelu danych, dotyczy tylko warstwy prezentacji