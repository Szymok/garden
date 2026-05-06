---
title: Granulacja Danych (Grain)
created: 2026-02-04
status: evergreen
category: Data Warehousing
difficulty: basic
language: pl
tags:
  - dimensional-modeling
  - grain
  - aggregation
  - kimball
aliases:
  - Grain
  - Ziarno
  - Poziom Szczegółowości
---
# 🎯 Definicja
**Granulacja** (Ziarno, Grain) to najważniejsza decyzja przy projektowaniu Tabeli Faktów. Określa ona: "Co reprezentuje jeden wiersz w tabeli?". Czy jest to pojedyncze kliknięcie, jedna transakcja, czy może podsumowanie sprzedaży całego dnia dla jednego sklepu?

# 🔑 Kluczowe punkty
- **Złota zasada:** Zawsze staraj się przechowywać dane na **najniższym możliwym poziomie granulacji** (np. pojedyncza transakcja).
- **Agregacja:** Jeśli masz niską granulację (transakcje), zawsze możesz je zsumować do miesiąca. Jeśli masz wysoką (miesiąc), nigdy nie odzyskasz danych o poszczególnych dniach.
- **Wymiary:** Wymiary muszą pasować do granulacji. (Nie możesz użyć wymiaru "Godzina", jeśli ziarnem jest "Dzień").

# 📚 Szczegółowe wyjaśnienie
Błąd początkującego: "Zróbmy tabelę sprzedaży".
Pytanie seniora: "Ale jakie jest ziarno?".
Jeśli ziarno to "Paragon", tabela będzie miała miliardy wierszy, ale pozwoli na analizę koszykową (co kupiono razem).
Jeśli ziarno to "Dzienny utarg sklepu", tabela będzie mała i szybka, ale stracimy informację o tym, który klient co kupił.

# 💡 Przykład zastosowania
Tabela `F_Sprzedaz`:
- Wersja A (Ziarno: Pozycja paragonu): Kolumny `ProduktID`, `Ilosc`, `Cena`, `Data`, `SklepID`.
- Wersja B (Ziarno: Raport dobowy): Kolumny `Data`, `SklepID`, `SumaSprzedazy`.
Wersja A pozwala odpowiedzieć na pytanie: "Ile sztuk produktu X sprzedano?". Wersja B tylko: "Ile zarobił sklep?".

## 📌 Źródła
- "The Data Warehouse Toolkit" - Ralph Kimball.

## 👽 Brudnopis
- Granulacja determinuje rozmiar bazy danych.
- Często stosuje się schemat hybrydowy: Tabela szczegółowa (Atomic) + Tabele agregatów (Aggregates) dla szybkości raportowania.