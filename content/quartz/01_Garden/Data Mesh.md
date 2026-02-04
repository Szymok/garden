---
title: Data Mesh (Siatka Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering/Architecture
difficulty: advanced
language: pl
tags:
  - data-mesh
  - decentralization
  - domain-driven-design
  - data-product
aliases:
  - Siatka Danych
  - Zhamak Dehghani
---
# 🎯 Definicja
**Data Mesh** to paradygmat architektoniczny i organizacyjny, który odchodzi od centralizacji (wielkiego Data Lake/Warehouse) na rzecz **decentralizacji**. Traktuje dane jak **Produkty** (Data as a Product), za które odpowiedzialne są zespoły domenowe (np. Zespół Sprzedaży, Zespół Logistyki), a nie centralny zespół IT/Data.

# 🔑 Kluczowe punkty
- **Domain Ownership:** Eksperci od biznesu (Domena) znają swoje dane najlepiej, więc powinni nimi zarządzać.
- **Data as a Product:** Dane są wystawiane dla innych jako gotowy, dopracowany produkt (z SLA, dokumentacją, jakością).
- **Self-Serve Data Platform:** Centralny zespół IT nie robi ETL-i, tylko dostarcza *Platformę* (narzędzia), dzięki której domeny mogą same publikować swoje produkty.
- **Federated Governance:** Globalne standardy (np. RODO, nazewnictwo) są ustalane wspólnie, by produkty do siebie pasowały.

# 📚 Szczegółowe wyjaśnienie
W klasycznym modelu (Monolit), centralny zespół Data Engineers jest "wąskim gardłem". Nie znają się na wszystkim (Logistyce, Marketingu, Finansach), a muszą obsługiwać całą firmę.
W Data Mesh:
Zespół "Checkout" (który robi aplikację zakupową) jest też odpowiedzialny za wystawienie analitycznej tabeli `Orders`. Dbają o jej jakość.
Zespół "Analityki" konsumuje ten produkt `Orders` jak zwykłe API, nie musząc prosić IT o "zrzut bazy".

# 💡 Przykład zastosowania
Netflix lub Zalando.
Mają setki zespołów deweloperskich. Nie da się mieć jednego centralnego Data Warehouse. Każdy zespół wystawia swoje dane (np. "Odtworzenia Filmów", "Zwroty Towarów") na wspólnej infrastrukturze. Inne zespoły (np. Rekomendacje) subskrybują te dane.

## 📌 Źródła
- Zhamak Dehghani, "Data Mesh: Delivering Data-Driven Value at Scale".

## 👽 Brudnopis
- Data Mesh to trudna zmiana organizacyjna (zmiana kultury), a nie tylko techniczna.
- Wymaga dojrzałości DevOps w zespołach domenowych.