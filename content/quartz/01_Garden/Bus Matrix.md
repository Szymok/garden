---
title: Bus Matrix (Macierz Szyny Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - kimball
  - dimensional-modeling
  - data-warehouse
  - architecture
aliases:
  - Data Warehouse Bus Matrix
  - Conformed Dimensions
---
# 🎯 Definicja
**Bus Matrix** to narzędzie projektowe w metodyce Kimballa (Data Warehousing), służące do mapowania procesów biznesowych (Wiersze) na współdzielone wymiary (Kolumny). Definiuje architekturę szyny danych.

# 🔑 Kluczowe punkty
- **Conformed Dimensions:** Święty Graal hurtowni danych. Wymiar "Klient" lub "Data" powinien być taki sam dla Sprzedaży, Marketingu i Logistyki.
- **Modularność:** Pozwala budować hurtownię kawałek po kawałku (Data Marts), które do siebie pasują, bo "wpinają się" w tę samą szynę wymiarów.
- **Unikanie silosów:** Zapobiega sytuacji, gdzie każdy dział ma własną definicję "Produktu".

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie tabelę w Excelu.
Wiersze: Procesy (Sprzedaż, Zapasy, Dostawy).
Kolumny: Wymiary (Data, Sklep, Produkt, Klient, Promocja).
Wstawiamy "X" tam, gdzie proces korzysta z wymiaru.

Jeśli "Sprzedaż" i "Zapasy" mają "X" przy wymiarze "Produkt", to znaczy, że możemy łatwo policzyć "Rotację zapasów" (Sprzedaż / Zapasy), grupując po Produkcie. Warunek: tabela Wymiaru Produktu musi być fizycznie ta sama (lub identyczna logicznie). To jest właśnie **Conformed Dimension**.

# 💡 Przykład zastosowania
Projektujemy DWH dla sieci handlowej.
1. **Fakty Sprzedaży:** Potrzebują: Daty, Sklepu, Produktu, Klienta.
2. **Fakty Magazynowe:** Potrzebują: Daty, Sklepu, Produktu. (Klient nie ma tu sensu).
Bus Matrix pokazuje nam, że Data, Sklep i Produkt są "Wspólnymi Wymiarami". Musimy je zaprojektować tak, żeby pasowały do obu procesów.

## 📌 Źródła
- Ralph Kimball, "The Data Warehouse Toolkit".

## 👽 Brudnopis
- Alternatywa dla Inmona (CIF), który preferuje jeden wielki znormalizowany model.
- Bus Matrix to często pierwszy artefakt przy projektowaniu DWH.