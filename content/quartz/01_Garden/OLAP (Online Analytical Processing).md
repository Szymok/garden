---
title: OLAP (Online Analytical Processing)
created: 2026-02-04
status: evergreen
category: Data Warehousing
difficulty: intermediate
language: pl
tags:
  - olap
  - analytics
  - cubes
  - multidimensional
  - aggregation
aliases:
  - Przetwarzanie Analityczne
  - Kostki OLAP
  - Sześcian OLAP
---
# 🎯 Definicja
**OLAP** to technologia pozwalająca na błyskawiczną analizę danych z wielu perspektyw ("Wielowymiarowo"). To silnik, który stoi za tabelami przestawnymi w Excelu i zaawansowanymi raportami BI. Służy do odpowiadania na pytanie "Dlaczego?" (Why?), w przeciwieństwie do OLTP, które służy do zapisu "Co?" (What?).

# 🔑 Kluczowe punkty
- **Cube (Kostka):** Dane są przygotowane (pre-agregowane) w postaci wielowymiarowej kostki. Dzięki temu nie trzeba ich liczyć za każdym razem od nowa.
- **Drill-Down:** Wchodzenie w szczegóły (Rok -> Kwartał -> Miesiąc).
- **Slice & Dice:** Krojenie danych (Pokaż tylko Sprzedaż Produktu X w Mieście Y).

# 📚 Szczegółowe wyjaśnienie
Tradycyjne bazy danych (SQL) są wolne przy analityce, bo muszą skanować miliony wierszy. OLAP "oszukuje", bo ma już policzone sumy pośrednie.
Rodzaje:
- **MOLAP (Multidimensional):** Dane w specjalnym formacie binarnym (najszybsze).
- **ROLAP (Relational):** Dane w zwykłych tabelach (wolniejsze, ale bardziej skalowalne).
- **HOLAP (Hybrid):** Połączenie obu.

# 💡 Przykład zastosowania
Dyrektor finansowy chce zobaczyć zysk firmy.
Klika "2023" -> wynik pojawia się natychmiast.
Klika "Europa" -> wynik natychmiast.
Klika "Polska" -> wynik natychmiast.
Gdyby to było zwykłe SQL, na każdy klik czekałby 30 sekund. Dzięki kostce OLAP, każda kombinacja (Rok/Region) jest już "w pamięci" systemu.

## 📌 Źródła
- "OLAP Solutions: Building Multidimensional Information Systems".

## 👽 Brudnopis
- Dzisiaj granica się zaciera. Nowoczesne bazy kolumnowe (Snowflake, ClickHouse) są tak szybkie, że często nie potrzebują tradycyjnych kostek OLAP ("No-OLAP").