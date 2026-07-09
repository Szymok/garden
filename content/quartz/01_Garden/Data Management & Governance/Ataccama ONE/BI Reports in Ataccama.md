---
title: BI Reports in Ataccama
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Catalog
difficulty: basic
language: en
tags:
  - bi
  - reports
  - catalog
  - governance
  - power-bi
aliases:
  - Raporty BI w Katalogu
  - Cataloging Reports
---
# 🎯 Definicja
[[[[Ataccama|Ataccama]] ONE Data|[[Ataccama|Ataccama]] ONE Data]] Catalog potrafi indeksować nie tylko tabele w bazie danych, ale też **Raporty BI** (z Power BI, Tableau, Tableau). Dzięki temu w jednym miejscu szukasz "Sprzedaż" i znajdujesz zarówno tabelę [[SQL|SQL]] `SALES`, jak i dashboard `Sales Executive Report`.

# 🔑 Kluczowe punkty
- **Centralizacja:** Google dla Twoich danych i raportów.
- **Lineage:** Widzisz, skąd raport bierze dane. (Raport X <- Tabela Y <- Baza Z).
- **[[Metadata|Metadata]]:** Możesz opisać raport biznesowo (Kto jest właścicielem? Jakie [[KPI|KPI]] zawiera?).

# 📚 Szczegółowe wyjaśnienie
[[Ataccama|Ataccama]] NIE tworzy raportów BI (od tego jest Power BI).
[[Ataccama|Ataccama]] **kataloguje** raporty.
Importujesz metadane z serwera raportowego. Użytkownik widzi miniaturkę, opis i link do otwarcia raportu w oryginalnym narzędziu.

# 💡 Przykład zastosowania
Nowy analityk szuka "Raportu Churn".
Zamiast pytać kolegów na Slacku, wpisuje w [[Ataccama|Ataccama]] ONE: "Churn".
Znajduje:
1.  Definicję biznesową "Churn" (Glossary).
2.  Tabelę z klientami, którzy odeszli ([[Data Catalog|Data Catalog]]).
3.  Dashboard w Power BI "Miesięczny Churn wg Regionów" ([[Reports|Reports]]).

## 📌 Źródła
- [[[[Ataccama|Ataccama]] ONE Data|[[Ataccama|Ataccama]] ONE Data]] Catalog features.

## 👽 Brudnopis
- To kluczowy element "Data Democratization". Raporty nie są ukryte na dyskach sieciowych czy w prywatnych folderach, tylko widoczne dla całej organizacji (zgodnie z uprawnieniami).
