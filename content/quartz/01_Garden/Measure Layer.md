---
title: Measure Layer (Warstwa Miary)
created: 2026-02-04
status: evergreen
category: Data Engineering / Semantics
difficulty: intermediate
language: pl
tags:
  - metrics
  - measures
  - semantic-layer
  - kpi
  - bi
aliases:
  - Metrics Store
  - Sklep Miar
---
# 🎯 Definicja
**Measure Layer** (Metrics Store) to miejsce, gdzie definiujesz: "Co to jest Przychód Netto". Raz. A potem wszystkie narzędzia w firmie (Excel, Tableau, Python) pytają o niego.
Koniec z sytuacją, gdzie Marketing ma inny "Przychód" niż Finanse.

# 🔑 Kluczowe punkty
- **Single Source of Truth:** Definicja matematyczna metryki jest w kodzie (np. YAML w dbt), a nie w klikanym interfejsie narzędzia BI.
- **Headless BI:** BI staje się tylko wizualizacją. Logika obliczeń jest "głową" oddzieloną od "ciała".
- **API:** Narzędzia pobierają metryki przez API.

# 📚 Szczegółowe wyjaśnienie
Problem: Raport w Tableau liczy zysk `(Cena - Podatek)`. Raport w PowerBI liczy `(Cena * 0.8)`. Wyniki są różne. Decyzje są błędne.
Rozwiązanie: Metrics Layer.
Definicja: `Profit = Price - Tax`.
Tableau pyta: "Daj mi Profit". PowerBI pyta: "Daj mi Profit". Dostają tę samą liczbę.

# 💡 Przykład zastosowania
Narzędzia: [[dbt]] Semantic Layer, Cube.dev, LookML.
Analityk pisze plik `.yml`:
```yaml
metric:
  name: revenue
  calculation: sum(order_total)
  filter: status = 'paid'
```
Teraz każdy w firmie używa metryki `revenue`. Jeśli trzeba zmienić definicję (np. odliczyć zwroty), analityk zmienia jedną linię w pliku YAML. Cała firma ma zaktualizowany raport.

## 📌 Źródła
- The Rise of the Metrics Store (Benn Stancil).

## 👽 Brudnopis
- To jest "święty graal" nowoczesnego BI. Trudne do wdrożenia kulturowo (ludzie lubią dłubać w Excelu), ale niezbędne przy dużej skali.
