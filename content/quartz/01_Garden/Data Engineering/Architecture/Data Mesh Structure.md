---
title: Data Mesh Structure
created: 2026-02-04
status: evergreen
category: Data Engineering / Architecture
difficulty: advanced
language: pl
tags:
  - data-mesh
  - architecture
  - domain-driven-design
  - decentralization
  - federation
aliases:
  - Struktura Data Mesh
  - Siatka Danych
---
# 🎯 Definicja
**[[Data Mesh|Data Mesh]]** to podejście organizacyjno-techniczne, które traktuje dane jako **Produkt**.
Zamiast jednego, wielkiego, centralnego zespołu "Od Danych" (wąskie gardło), masz wiele zespołów domenowych (Sprzedaż, Logistyka, HR), które same dbają o swoje dane i wystawiają je innym.

# 🔑 Kluczowe punkty
- **Domenowość:** Zespół Logistyki najlepiej zna dane logistyczne. Niech oni je czyszczą i udostępniają.
- **Self-Serve Platform:** Centralne IT dostarcza tylko "infrastrukturę" (gotowe klocki: S3, Airflow, Catalog), żeby domeny nie musiały wymyślać koła na nowo.
- **Federated Governance:** Wspólne zasady (Standardy), ale lokalne wykonanie.

# 📚 Szczegółowe wyjaśnienie
Różnica vs [[Data Lake|Data Lake]]:
- **[[Data Lake|Data Lake]]:** Wrzuć wszystko do jednego wora, centralny zespół spróbuje to zrozumieć.
- **[[Data Mesh|Data Mesh]]:** Każdy trzyma swoje, ale udostępnia przez standardowe interfejsy (Data Products).
To jak mikroserwisy, ale dla analityki.

# 💡 Przykład zastosowania
Netflix.
Zespół od "Rekomendacji" produkuje dane o tym, co kto oglądał.
Zespół od "Produkcji Filmowej" bierze te dane (przez API/Tabelę), żeby decydować, jakich aktorów zatrudnić.
Nie proszą centralnego zespołu "zróbcie nam raport". Sami biorą [[Produkt Danych|Produkt Danych]] i robią analizę.

## 📌 Źródła
- Zhamak Dehghani - "[[Data Mesh|Data Mesh]] Principles".

## 👽 Brudnopis
- [[Data Mesh|Data Mesh]] nie jest dla każdego. W małej firmie to overengineering. Wymaga kultury [[DevOps|DevOps]] i dojrzałości.
