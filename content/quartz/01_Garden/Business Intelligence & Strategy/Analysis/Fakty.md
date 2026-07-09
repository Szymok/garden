---
title: Fakty (Tabela Faktów)
created: 2026-02-04
status: evergreen
category: Data Warehousing
difficulty: basic
language: pl
tags:
  - facts
  - star-schema
  - measures
  - kimball
aliases:
  - Tabela Faktów
  - Fact Table
  - Miary
---
# 🎯 Definicja
**Tabela Faktów** (Fact Table) to centralna tabela w [[Modelowanie Wymiarowe|modelu gwiazdy]], która przechowuje **dane numeryczne (miary)** dotyczące procesu biznesowego (np. kwota sprzedaży, czas trwania rozmowy) oraz klucze obce do [[Wymiary|wymiarów]] (kto, gdzie, kiedy).

# 🔑 Kluczowe punkty
- **Charakter:** Długa i wąska. Zawiera miliony/miliardy wierszy, ale mało kolumn (głównie ID i liczby).
- **Ziarnistość (Grain):** Określa, co reprezentuje jeden wiersz (np. "jedna pozycja na paragonie" albo "jedna transakcja dzienna").
- **Typy:** Addytywne (można sumować), Pół-addytywne (np. stan magazynu - nie sumujesz po czasie), Bezfaktowe (Factless - np. rejestracja obecności, sama relacja).

# 📚 Szczegółowe wyjaśnienie
Fakt to zdarzenie.
"Klient X kupił Produkt Y w Sklepie Z dnia D za Kwotę K".
W tabeli faktów wygląda to tak:
`{id_klient, id_produkt, id_sklep, id_data, kwota}`.
Wszystkie opisy (Nazwa klienta, adres sklepu) są w tabelach Wymiarów, żeby nie powtarzać ich miliony razy w tabeli faktów (oszczędność miejsca i szybkość).

# 💡 Przykład zastosowania
Analiza ruchu na stronie WWW.
**Fakt:** PageView.
**Ziarno:** Jedno wyświetlenie strony.
**Miary:** Czas spędzony (sekundy).
**[[Wymiary|Wymiary]]:** URL, Browser, User_ID, Geo, Date.
[[SQL|SQL]]: `SELECT Geo.Country, COUNT(*) FROM Fact_PageView JOIN Dim_Geo ... GROUP BY Geo.Country` -> Liczba odwiedzin per kraj.

## 📌 Źródła
- "The [[Data Warehouse|Data Warehouse]] Toolkit" - Ralph Kimball.

## 👽 Brudnopis
- Najważniejsza decyzja przy projektowaniu: wybór Ziarnistości (Grain). Zbyt ogólna (np. agregat miesięczny) uniemożliwia dokładną analizę (drill-down). Zawsze staraj się trzymać najniższe atomowe ziarno w hurtowni.