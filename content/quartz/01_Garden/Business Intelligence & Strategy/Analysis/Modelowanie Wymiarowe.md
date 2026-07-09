---
title: Modelowanie Wymiarowe (Dimensional Modeling)
created: 2026-02-04
status: evergreen
category: Data Warehousing
difficulty: intermediate
language: pl
tags:
  - kimball
  - star-schema
  - facts
  - dimensions
  - bi
aliases:
  - Dimensional Modeling
  - Schemat Gwiazdy
  - Fakty i Wymiary
---
# 🎯 Definicja
**Modelowanie Wymiarowe** to technika budowy baz danych analitycznych (Hurtowni Danych), zaproponowana przez Ralpha Kimballa. Jej celem jest **wydajność zapytań** i **zrozumiałość dla biznesu**. Dane dzieli się na **[[Fakty|Fakty]]** (coś, co mierzymy, np. kwota sprzedaży) i **[[Wymiary|Wymiary]]** (kontekst, np. Kto? Kiedy? Gdzie?).

# 🔑 Kluczowe punkty
- **[[Fakty|Fakty]] (Facts):** Tabele z liczbowymi metrykami (np. `Kwota`, `Ilość`). Są "ciężkie" (miliardy wierszy).
- **[[Wymiary|Wymiary]] ([[Dimensions|Dimensions]]):** Tabele opisowe (np. `Klient`, `Sklep`). Są "lekkie".
- **Star Schema:** Układ przypominający gwiazdę - Fakt w środku, [[Wymiary|Wymiary]] na ramionach.

# 📚 Szczegółowe wyjaśnienie
W systemach transakcyjnych ([[OLTP|OLTP]]) dane są "poszatkowane" na setki tabel (Normalizacja), żeby oszczędzać miejsce.
W analityce (OLAP) łączymy je w prostsze struktury.
Zapytanie biznesowe: "Pokaż sprzedaż (Fakt) wg Miasta (Wymiar) i Miesiąca (Wymiar)".
W modelu wymiarowym to prosty `JOIN` lokalny, a nie skomplikowana pajęczyna relacji.

# 💡 Przykład zastosowania
Analiza sprzedaży w Biedronce.
**Fakt:** Paragon (ID_Sklepu, ID_Produktu, ID_Daty, Ilość: 2, Kwota: 10.00).
**Wymiar Sklep:** (ID, Miasto: Warszawa, Ulica: Marszałkowska).
**Wymiar Produkt:** (ID, Nazwa: Cola, Kategoria: Napoje).
**Wymiar Czas:** (ID, Dzień: Poniedziałek, Miesiąc: Styczeń).

## 📌 Źródła
- "The [[Data Warehouse|Data Warehouse]] Toolkit" - Ralph Kimball.

## 👽 Brudnopis
- [[Snowflake|Snowflake]] Schema to wariant, gdzie [[Wymiary|wymiary]] są znormalizowane (np. `Produkt` -> `Kategoria` -> `Dział`), ale rzadziej stosowany bo wolniejszy w odczycie.