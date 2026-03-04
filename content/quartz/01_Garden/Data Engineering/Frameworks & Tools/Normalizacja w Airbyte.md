---
title: Normalizacja w Airbyte
created: 2026-02-04
status: evergreen
category: Data Integration
difficulty: intermediate
language: pl
tags:
  - airbyte
  - normalization
  - elt
  - dbt
  - json
aliases:
  - Airbyte Normalization
  - Rozbijanie JSON w Airbyte
---
# 🎯 Definicja
**Normalizacja w Airbyte** to proces "sprzątania po integracji". Kiedy pobierasz dane z API (np. Facebook Ads), dostajesz często skomplikowany, zagnieżdżony JSON. Normalizacja w Airbyte automatycznie rozbija ten JSON na klasyczne tabele SQL (np. `Campaigns`, `AdSets`, `Ads`), żebyś mógł je łatwo odpytać.

# 🔑 Kluczowe punkty
- **Raw Data vs Normalized:** Airbyte najpierw wrzuca "brudny" JSON do jednej kolumny (`_airbyte_raw_data`), a potem (opcjonalnie) tworzy z tego ładne tabele.
- **Pod maską:** Używa do tego... [[dbt]]! Airbyte generuje w locie projekt dbt, który robi te transformacje.
- **Relacje:** Automatycznie tworzy klucze obce, łącząc np. tabelę `Orders` z tabelą `LineItems` (która była w środku JSON-a).

# 📚 Szczegółowe wyjaśnienie
Masz 3 opcje w Airbyte:
1.  **Raw Data (No Normalization):** Dostajesz tabelę z jedną kolumną JSON. Radź sobie sam (np. używając funkcji JSON w Snowflake).
2.  **Basic Normalization:** Airbyte robi to za Ciebie. Dobre na start.
3.  **Custom Transformation:** Sam piszesz SQL/dbt, jak to ma wyglądać.

# 💡 Przykład zastosowania
Pobierasz dane z Shopify.
Jeden rekord zamówienia zawiera listę produktów, adres klienta i historię płatności.
Airbyte z włączoną normalizacją stworzy w Twojej bazie:
- `shopify_orders`
- `shopify_order_items` (z kluczem do orders)
- `shopify_customers`
Dzięki temu analityk może zrobić proste `SELECT * FROM orders JOIN items`, zamiast męczyć się z parsowaniem JSON-a.

## 📌 Źródła
- Airbyte Docs - Normalization.

## 👽 Brudnopis
- Uwaga: Basic Normalization bywa wolna przy ogromnych wolumenach. Wtedy lepiej załadować Raw Data i napisać własny, zoptymalizowany model w dbt.