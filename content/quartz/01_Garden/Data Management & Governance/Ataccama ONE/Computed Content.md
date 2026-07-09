---
title: Computed Content (Zawartość Obliczeniowa)
created: 2026-02-04
status: evergreen
category: Ataccama/Metadata
difficulty: advanced
language: pl
tags:
  - mmdm
  - metadata
  - sql
  - automation
aliases:
  - Computed Properties
  - Węzły obliczeniowe
---
# 🎯 Definicja
**Computed Content** to wirtualne metadane w modelu [[Ataccama|Ataccama]] ONE, które nie są przechowywane statycznie w bazie, ale są **wyliczane w locie** za pomocą zapytań [[SQL|SQL]] na grafie metadanych. Pozwalają tworzyć dynamiczne relacje i statystyki.

# 🔑 Kluczowe punkty
- **[[SQL|SQL]] na Metadanych:** Używasz [[SQL|SQL]]-a, żeby odpytać repozytorium (np. "Pokaż mi wszystkie tabele, które nie mają właściciela").
- **Dynamiczność:** Jeśli zmienią się dane bazowe (np. ktoś doda właściciela), Computed Content zaktualizuje się automatycznie przy przeliczeniu.
- **Wymagane kolumny:** Zapytanie musi zwracać specyficzne kolumny: `parent_id_i`, `id_i`, `from_h`, `path_i`, `type_i`.

# 📚 Szczegółowe wyjaśnienie
To potężne narzędzie dla Architektów Metadanych. Zamiast pisać skrypty zewnętrzne aktualizujące katalog, piszesz definicję Computed Content.
Scenariusz: Chcesz mieć w każdej Tabeli pole `LiczbaKolumn`.
Nie musisz tego importować.
Definiujesz Computed Content:
`SELECT t.id, COUNT(c.id) FROM Table t JOIN Column c ON ... GROUP BY t.id`.
W interfejsie użytkownik widzi to jako zwykły atrybut, ale pod spodem jest to wynik zapytania.

# 💡 Przykład zastosowania
"Health Check" katalogu.
Tworzysz wirtualny obiekt "Problemy z Jakością Metadanych".
Zapytanie [[SQL|SQL]] znajduje wszystkie Terminy bez definicji i wszystkie Tabele bez przypisanych Terminów.
Wynik wyświetlasz na dashboardzie dla Data Stewardów jako "Lista To-Do".

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE [[Metadata|Metadata]] Modeling Guide.

## 👽 Brudnopis
- Uwaga na wydajność: Skomplikowane zapytania Computed Content mogą zamulić przeglądanie katalogu.
- `id_i` musi być unikalny globalnie (często używa się `CONCAT(parent_id, '_suffix')`).