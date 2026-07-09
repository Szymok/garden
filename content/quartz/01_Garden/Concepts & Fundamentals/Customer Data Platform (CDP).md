---
title: Customer Data Platform (CDP)
created: 2026-02-04
status: evergreen
category: Marketing Technology
difficulty: intermediate
language: pl
tags:
  - cdp
  - marketing
  - data-integration
  - single-customer-view
  - segmentation
aliases:
  - Platforma Danych Klienta
  - Single View of Customer
---
# 🎯 Definicja
**CDP (Customer Data Platform)** to system, który zbiera dane o kliencie ze wszystkich miejsc (strona www, aplikacja, kasa w sklepie, email), łączy je w jeden "Złoty Profil" i udostępnia go marketerom do działania.

# 🔑 Kluczowe punkty
- **Single Customer View:** Widzisz, że "Jan Kowalski z Facebooka" to ten sam "Jan K. ze sklepu stacjonarnego".
- **Dostępność:** Dane są gotowe do użycia (aktywacji) w czasie rzeczywistym (np. wyślij pusha, gdy Jan wejdzie do galerii).
- **To nie CRM:** CRM służy handlowcom do notowania rozmów. CDP służy systemom do automatyzacji marketingu na masową skalę.

# 📚 Szczegółowe wyjaśnienie
CDP rozwiązuje problem "Silosów Danych". Marketing nie musi prosić IT o "zrzut bazy", żeby wysłać maila.
Proces:
1.  **Ingest:** Pobierz dane (zdarzenia, atrybuty).
2.  **Identity Resolution:** Połącz tożsamości (Cookie ID + Email + Phone).
3.  **Segment:** Stwórz grupę "Klienci VIP zagrożeni odejściem".
4.  **Activate:** Wyślij tę listę do Google Ads i Mailchimp.

# 💡 Przykład zastosowania
Klient ogląda buty na stronie (Zdarzenie WWW), ale nie kupuje.
Dwie godziny później dostaje email z rabatem na te buty.
Tydzień później kupuje je w sklepie stacjonarnym (Zdarzenie Offline).
CDP wie, że to ta sama osoba i przestaje wyświetlać mu reklamy tych butów (oszczędność budżetu), a zaczyna reklamować skarpetki (Cross-sell).

## 📌 Źródła
- CDP Institute.

## 👽 Brudnopis
- Nowy trend: **Composable CDP**. Zamiast kupować gotowe pudełko (np. Segment), budujesz CDP na własnej hurtowni danych ([[Snowflake|Snowflake]]) używając narzędzi Reverse ETL (Hightouch).
