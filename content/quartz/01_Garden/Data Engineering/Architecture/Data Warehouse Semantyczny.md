---
title: Data Warehouse Semantyczny
created: 2026-02-04
status: evergreen
category: Data Engineering/Architecture
difficulty: advanced
language: pl
tags:
  - semantic-layer
  - data-warehouse
  - modeling
  - dbt
aliases:
  - Warstwa Semantyczna
  - Semantic Data Warehouse
---
# 🎯 Definicja
**[[Data Warehouse|Data Warehouse]] Semantyczny** to podejście do budowy hurtowni danych, w którym kluczową rolę odgrywa **[[Warstwa Semantyczna|Warstwa Semantyczna]]** ([[Semantic Layer|Semantic Layer]]). Jest to warstwa abstrakcji między fizycznymi tabelami a użytkownikiem biznesowym. Zamiast zmuszać analityka do pisania `JOIN` i `SUM(CASE...)`, wystawiamy mu gotowe pojęcia biznesowe: "Przychód", "Klient", "Marża".

# 🔑 Kluczowe punkty
- **Jeden język:** Biznes i IT mówią tym samym językiem. Definicja "Przychodu" jest w kodzie (np. w [[dbt|dbt]] [[Semantic Layer|Semantic Layer]]) i jest jedynym źródłem prawdy.
- **Headless BI:** Różne narzędzia (Excel, Tableau, Power BI) łączą się do tej samej warstwy semantycznej, więc pokazują te same liczby (kliec duplikatów logiki w każdym raporcie).
- **Zdarzenia (Events):** Nowoczesne podejście często opiera modelowanie na zdarzeniach ("Klient kupił"), a nie tylko stanach ("Tabela zamówień").

# 📚 Szczegółowe wyjaśnienie
Tradycyjnie:
Tabela [[SQL|SQL]] -> Analityk pisze [[SQL|SQL]] w Tableau -> Analityk pisze inny [[SQL|SQL]] w Pythonie -> Wyniki się różnią.
Semantycznie:
Tabela [[SQL|SQL]] -> **[[Semantic Layer|Semantic Layer]] ([[dbt|dbt]]/Cube)** definiuje: `Metric: Revenue = SUM(amount) WHERE status='paid'` -> Tableau i Python pytają o `Revenue`. Wynik jest zawsze identyczny.
Wspiera to koncepcję **[[Data Mesh|Data Mesh]]** i **[[Kontrakty Danych]]**, gdzie produktem nie jest surowa tabela, ale właśnie ten semantyczny model.

# 💡 Przykład zastosowania
Firma retail.
Definicja "Sprzedaży Całkowitej".
Czy wliczamy zwroty? Czy wliczamy VAT? Czy wliczamy koszty wysyłki?
W [[Semantic Layer|Semantic Layer]] definiujesz to raz.
Gdy CEO patrzy na dashboard w telefonie, a CFO na Excela – widzą dokładnie tą samą liczbę, bo oboje "piją" z tego samego semantycznego kranu.

## 📌 Źródła
- "The Rise of the [[Semantic Layer|Semantic Layer]]" - Benn Stancil.
- [[dbt|dbt]] [[Semantic Layer|Semantic Layer]] Documentation.

## 👽 Brudnopis
- Semantyka to "tłumacz" między tabelami [[Bazy danych|bazy danych]] (trudne) a językiem biznesu (łatwe).
- Narzędzia: [[dbt|dbt]] MetricFlow, Google Looker (LookML), Cube.js, AtScale.