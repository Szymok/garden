---

title: Produkt Danych  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- produkt danych
- inżynieria danych
- data mesh
- zarządzanie danymi  
aliases:
- data product

---

# 🎯 Definicja

**Produkt Danych (ang. Data Product)** to zdefiniowany, dostarczony i zarządzany artefakt oparty na danych, który przynosi bezpośrednią wartość użytkownikowi końcowemu lub innej jednostce organizacyjnej. DJ Patil, pierwszy Chief Data Scientist USA, określił produkt danych jako „produkt, który ułatwia osiągnięcie celu końcowego poprzez dane” .

W podejściu Data Mesh dane są traktowane jako produkt, który ma właściciela, gwarantowaną jakość, katalog, dokumentację i interfejs API, a jego wartość jest weryfikowana poprzez faktyczne użycie.

# 🔑 Kluczowe punkty

- **Dostarczalny artefakt:** np. tabela, raport BI, model ML, API z danymi — coś, co ma odbiorcę i wartość użytkową.
- **Wbudowana jakość i katalog:** Produkt danych powinien być opatrzony opisem, SLA, kontaktami, wersjami.
- **Własność domenowa:** Zgodnie z Data Mesh, produkty są utrzymywane przez zespoły domenowe (source-aligned).
- **Zorientowanie na użycie:** Musi rozwiązywać rzeczywisty problem lub wspierać decyzje.
- **Integracja z infrastrukturą danych:** Produkty danych są elementem ekosystemu – powstają na bazie pipeline’ów, warstw semantycznych i metadanych.

# 📚 Szczegółowe wyjaśnienie

## Rola Produktu Danych w architekturze danych

Produkty danych są "konsumpcyjną" warstwą architektury danych — dostarczają użytkownikowi końcowemu konkretny, łatwo dostępny i zrozumiały wynik prac inżynierii danych. Niezależnie czy to raport w Power BI, API REST zwracające metrykę finansową czy zbiór danych używany do trenowania modelu ML — każdy z nich stanowi samodzielny, mierzalny produkt.

## Cechy wysokiej jakości Produktu Danych

- **Dokumentacja i opis znaczenia metryk**
- **Jasne zarządzanie wersjami**
- **Stały monitoring jakości (profilowanie, alerting)**
- **Zespół właścicielski lub steward**
- **Prosty interfejs integracji** (np. SQL view, endpoint API)
- **Zdefiniowane SLA i zgodność z normami (np. GDPR)**

## Przykłady Produktów Danych

- Dashboard sprzedażowy w Lookerze z miarami konwersji
- Model predykcji rezygnacji klienta
- Tabela modelowa z miarami LTV klienta dostępna w warstwie semantycznej (np. w dbt)
- Endpoint API zwracający status produktu z kalkulowanym wskaźnikiem ryzyka

# 💡 Przykład zastosowania

W firmie typu retail zespół danych publikuje produkt danych: tabelę modelową „customer_lifetime_value_model_v1”, zawierającą obliczony wskaźnik LTV wraz z segmentacją transakcyjną. Tabela jest aktualizowana co noc, udostępniona w hurtowni danych Snowflake, posiada metadane w katalogu (np. Atlan) i spełnia SLA <15min opóźnienia. Jest wykorzystywana przez zespół marketingu do uruchamiania kampanii targetowanych przez narzędzia typu reverse ETL.

## 📌 Źródła

- [DJ Patil – Twitter](https://twitter.com/dpatil)
- [Introduction to Data Products – datameshlearning.com](https://www.datameshlearning.com/glossary/data-product)
- [Martinfowler.com – Data Mesh](https://martinfowler.com/articles/data-mesh-principles.html)

## 👽 Brudnopis

- Produkt danych = coś, co ma odbiorcę i wartość → tabela, model, raport, API
- DJ Patil: "ułatwia osiągnięcie celu poprzez dane"
- Data Mesh: ownership, SLA, discoverability, dokumentacja → produkt jak software
- Przykłady: model przewidywania churnu, raport menedżerski z kluczowymi KPI, endpoint odpytywalny przez zespół operacyjny
- Kontekst: kluczowy element demokratyzacji danych i nowoczesnych architektur danych (mesh, lakehouse)