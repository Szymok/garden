---
title: Update Rule Reference (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / DQ
difficulty: intermediate
language: en
tags:
  - rules
  - monitoring
  - versioning
  - updates
  - governance
aliases:
  - Aktualizacja Reguł
  - Rule Updates
---
# 🎯 Definicja
**Update Rule Reference** to mechanizm aktualizacji logiki reguł DQ w projektach monitoringu.
Gdy Steward zmienia logikę reguły w bibliotece (np. "E-mail musi mieć @") na nowszą wersję, projekty monitorujące używają "starej" wersji, dopóki jej nie zaktualizujesz.

# 🔑 Kluczowe punkty
- **Ikona Żarówki:** Pojawia się w [[Monitoring Project|Monitoring Project]] przy atrybucie, jeśli jego reguła ma nowszą wersję.
- **Preview Changes:** Możesz zobaczyć różnicę (Diff) przed kliknięciem "Update".
- **Scope:** Możesz zaktualizować jedną regułę, cały Catalog Item lub cały Projekt.

# 📚 Szczegółowe wyjaśnienie
Dlaczego nie robi się tego automatycznie?
Bo zmiana logiki zmienia wyniki DQ.
Jeśli dzisiaj DQ wynosi 90%, a jutro zmienisz regułę na bardziej restrykcyjną, DQ spadnie do 50%.
Biznes wpadnie w panikę ("Dlaczego jakość spadła?!").
Dlatego aktualizacja musi być celowa i kontrolowana.

# 💡 Przykład zastosowania
1. Reguła `Check_Email` w bibliotece sprawdza tylko `@`.
2. Projekt A monitoruje maile. Jakość: 99%.
3. Zmieniasz regułę w bibliotece: `@` oraz końcówka `.com`.
4. Projekt A dalej używa starej reguły. Pojawia się żarówka.
5. Steward klika "Update Rule".
6. Uruchamia Monitoring. Jakość spada do 80% (bo odrzuciło maile `.pl`).
7. Steward pisze notatkę: "Spadek jakości wynika ze zmiany definicji reguły".

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Monitoring Projects.

## 👽 Brudnopis
- To kluczowy element [[Data Governance|Data Governance]]. Zarządzanie zmianą (Change Management) w definicjach jakości.
