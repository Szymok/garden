---

title: Reports  
created: 2025-05-21  
status:  
category: BI / data governance  
difficulty: podstawowy  
language: pl  
tags:

- raporty
- business intelligence
- data catalog
- BI  
aliases:
- raporty BI
- BI reports

---

# 🎯 Definicja

**Reports (raporty)** to produkty analityczne – dokumenty, wizualizacje lub dashboardy – prezentujące zestaw wniosków, wskaźników i analiz dotyczących danych biznesowych. Raport [[Business Intelligence|BI]] umożliwia użytkownikom biznesowym i technicznym szybki przegląd, analizę i eksplorację danych w przyjaznej, uporządkowanej, często interaktywnej formie.

# 🔑 Kluczowe punkty

- Raporty [[Business Intelligence|BI]] są budowane w dedykowanych narzędziach [[Business Intelligence]] i mogą być integrowane, wyświetlane oraz zarządzane centralnie przez platformę taką jak Ataccama ONE.
- Pozwalają wizualizować dane na wiele sposobów: [[Wizualizacja|wykresy]], dashboardy, tabele, mapy oraz aplikacje interaktywne.
- Platforma ONE umożliwia przegląd raportów, dostosowywanie wizualizacji i metadanych, a także zarządzanie uprawnieniami – bez możliwości edycji zawartości raportu; edycja możliwa tylko w narzędziu [[Business Intelligence|BI]].
- Raporty mogą być cyklicznie aktualizowane i automatycznie synchronizowane, aby zapewnić dostęp do najświeższych wniosków biznesowych.
- Możesz zarządzać i wyszukiwać raporty wg statusu, tagów, zastosowanych terminów, pełnotekstowo lub przez inne metadane.

# 📚 Szczegółowe wyjaśnienie

## Rola raportów w organizacji

- Umożliwiają opisywanie trendów, [[KPI]], podsumowań historycznych i bieżących wyników biznesu.
- Są kluczowym elementem kultury data-driven i zarządzania opartym na faktach – przekładają się na lepsze, trafniejsze decyzje biznesowe.
- Wspierają analizę predykcyjną i identyfikację nowych szans rynkowych.
- Centralne repozytorium raportów (np. w Ataccama ONE) zapobiega duplikowaniu analiz i rozproszonemu zarządzaniu wiedzą.

## Obsługa raportów w Ataccama ONE

- Po podłączeniu narzędzi [[Business Intelligence|BI]], raporty stają się „itemami katalogowymi” w ONE i mogą być przeglądane, indeksowane oraz zarządzane razem z innymi aktywami danych.
- Użytkownik może:
    - przeszukiwać raporty wg statusu, metadanych, terminów słownikowych,
    - przeglądać i dostosowywać widgety/wizualizacje,
    - nadawać metadane i kontekst biznesowy,
    - zarządzać uprawnieniami do raportu (visibility/edit).
- Nie jest możliwa edycja zawartości lub logiki raportu z poziomu ONE – zmiany w raporcie wykonuje się w oryginalnym narzędziu [[Business Intelligence|BI]] (np. Power [[Business Intelligence|BI]], Tableau, Qlik).

## Przykłady zastosowań raportów

- [[Wizualizacja]] sprzedaży wg regionów, kanałów, kategorii produktowych.
- Monitoring [[KPI]] operacyjnych (np. poziomu zapasów, wskaźników konwersji, churnu).
- Dashboardy predykcyjne (np. prognozowanie popytu, churnu, modeli scoringowych).
- Monitorowanie jakości danych zintegrowane z procesami [[data governance]].

# 💡 Przykład zastosowania

**Scenariusz:**  
Zespół [[Business Intelligence|BI]] buduje raport sprzedażowy w Power [[Business Intelligence|BI]]. Raport zostaje zintegrowany z Ataccama ONE jako item katalogowy.

- Analityk może go przeglądać w katalogu, dodać metadane biznesowe i powiązać z odpowiednimi terminami słownika (np. „Sales Amount”, „Product Category”).
- Raport podlega automatycznej aktualizacji co noc.
- Z poziomu ONE manager może wyszukać raport po regionie, statusie „zatwierdzony”, a w razie potrzeby oznaczyć jako aktywo krytyczne lub udostępnić wybranej grupie decydentów – bez konieczności kontaktu z zespołem [[Business Intelligence|BI]].

# 📌 Źródła

- [Ataccama Reports documentation](https://docs.ataccama.com/one/latest/reports/reports.html)
- [https://www.ataccama.com/](https://www.ataccama.com/)
- [https://www.ataccama.com/platform](https://www.ataccama.com/platform)
- [https://humansoft.pl/business-intelligence/](https://humansoft.pl/business-intelligence/)
- [https://www.taxo-acc.pl/baza-wiedzy/co-to-jest-raport-bi/](https://www.taxo-acc.pl/baza-wiedzy/co-to-jest-raport-bi/)
- [https://www.sap.com/poland/products/data-cloud/cloud-analytics/what-is-business-intelligence.html](https://www.sap.com/poland/products/data-cloud/cloud-analytics/what-is-business-intelligence.html)

# 👽 Brudnopis

- Raport ([[Business Intelligence|BI]] report) = agregat/[[federacja danych]] dla biznesu, wyrażony w formie wizualnej; najczęściej: dashboard, tabela, [[Wizualizacja|wykresy]]
- Podstawa: Power [[Business Intelligence|BI]], Tableau, Qlik, Looker, Excel pivot – Ataccama umożliwia centralizację katalogu tych aktywów
- Cyfrowa etykieta – metadane pozwalają tagować raporty względem kontekstu biznesowego ([[KPI]], region, produkt, compliance)
- Nasycenie workflow i governance: kto ogląda, kto zatwierdza, kto udostępnia dalej (rola, dostęp, polisy)
- W Lean BI: repozytorium raportów = podstawa „data marketplace” ułatwiająca szybkie odkrywanie insightów przez użytkowników nietechnicznych