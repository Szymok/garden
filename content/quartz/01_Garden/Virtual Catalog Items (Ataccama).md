---
title: Virtual Catalog Items (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Integration
difficulty: intermediate
language: en
tags:
  - virtual-catalog
  - integration
  - transformation
  - masking
  - views
aliases:
  - Wirtualne Elementy Katalogu
  - VCI
---
# 🎯 Definicja
**Virtual Catalog Item (VCI)** to tabela, która nie istnieje fizycznie w źródle, ale "udaje", że istnieje.
Jest wynikiem Planu Transformacji.
Dla użytkownika biznesowego wygląda jak zwykła tabela. Dla systemu to wynik skryptu uruchamianego w locie (lub zcache'owanego).

# 🔑 Kluczowe punkty
- **Zastosowanie:** Łączenie danych, Filtrowanie, Maskowanie, Obliczanie kolumn, Parsowanie XML/JSON.
- **Edycja:** Tworzone w ONE Desktop, publikowane do ONE Web.
- **Profilowanie:** Możesz profilować VCI tak samo jak zwykłe tabele.

# 📚 Szczegółowe wyjaśnienie
Masz tabelę `Customers` z kolumną `PESEL`.
Nie możesz pokazać PESELu analitykom.
Tworzysz VCI `Customers_Safe`:
Plan: `Reader(Customers) -> Mask(PESEL) -> Writer(VCI)`.
Analitycy dostają dostęp tylko do `Customers_Safe`. Widzą dane, ale z zamazanym PESELEM.

# 💡 Przykład zastosowania
Dział marketingu potrzebuje listy "VIPów".
VIP to klient, który wydał > 1000 PLN.
Nie ma takiej tabeli w bazie.
Tworzysz VCI z logiką SQL/EtL: `SELECT * FROM orders JOIN customers ... WHERE sum > 1000`.
Wynik publikujesz jako VCI "VIP Customers".

## 📌 Źródła
- Ataccama ONE Documentation - Virtual Catalog Items.

## 👽 Brudnopis
- Podobne do "Views" (Widoków) w bazie danych SQL, ale działają na poziomie warstwy aplikacji Ataccama, więc mogą łączyć dane z różnych baz (Federation).
