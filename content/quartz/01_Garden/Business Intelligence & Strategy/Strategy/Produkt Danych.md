---

title: Produkt Danych  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- produkt danych
- inÅ¼ynieria danych
- data mesh
- zarzÄ…dzanie danymi  
aliases:
- data product

---

# ðŸŽ¯ Definicja

**Produkt Danych (ang. Data Product)** to zdefiniowany, dostarczony i zarzÄ…dzany artefakt oparty na danych, ktÃ³ry przynosi bezpoÅ›redniÄ… wartoÅ›Ä‡ uÅ¼ytkownikowi koÅ„cowemu lub innej jednostce organizacyjnej. DJ Patil, pierwszy Chief Data Scientist USA, okreÅ›liÅ‚ produkt danych jako â€žprodukt, ktÃ³ry uÅ‚atwia osiÄ…gniÄ™cie celu koÅ„cowego poprzez daneâ€ .

W podejÅ›ciu Data Mesh dane sÄ… traktowane jako produkt, ktÃ³ry ma wÅ‚aÅ›ciciela, gwarantowanÄ… jakoÅ›Ä‡, katalog, dokumentacjÄ™ i interfejs API, a jego wartoÅ›Ä‡ jest weryfikowana poprzez faktyczne uÅ¼ycie.

# ðŸ”‘ Kluczowe punkty

- **Dostarczalny artefakt:** np. tabela, raport BI, model ML, API z danymi â€” coÅ›, co ma odbiorcÄ™ i wartoÅ›Ä‡ uÅ¼ytkowÄ….
- **Wbudowana jakoÅ›Ä‡ i katalog:** Produkt danych powinien byÄ‡ opatrzony opisem, SLA, kontaktami, wersjami.
- **WÅ‚asnoÅ›Ä‡ domenowa:** Zgodnie z Data Mesh, produkty sÄ… utrzymywane przez zespoÅ‚y domenowe (source-aligned).
- **Zorientowanie na uÅ¼ycie:** Musi rozwiÄ…zywaÄ‡ rzeczywisty problem lub wspieraÄ‡ decyzje.
- **Integracja z infrastrukturÄ… danych:** Produkty danych sÄ… elementem ekosystemu â€“ powstajÄ… na bazie pipelineâ€™Ã³w, warstw semantycznych i metadanych.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Rola Produktu Danych w architekturze danych

Produkty danych sÄ… "konsumpcyjnÄ…" warstwÄ… architektury danych â€” dostarczajÄ… uÅ¼ytkownikowi koÅ„cowemu konkretny, Å‚atwo dostÄ™pny i zrozumiaÅ‚y wynik prac inÅ¼ynierii danych. NiezaleÅ¼nie czy to raport w Power BI, API REST zwracajÄ…ce metrykÄ™ finansowÄ… czy zbiÃ³r danych uÅ¼ywany do trenowania modelu ML â€” kaÅ¼dy z nich stanowi samodzielny, mierzalny produkt.

## Cechy wysokiej jakoÅ›ci Produktu Danych

- **Dokumentacja i opis znaczenia metryk**
- **Jasne zarzÄ…dzanie wersjami**
- **StaÅ‚y monitoring jakoÅ›ci (profilowanie, alerting)**
- **ZespÃ³Å‚ wÅ‚aÅ›cicielski lub steward**
- **Prosty interfejs integracji** (np. SQL view, endpoint API)
- **Zdefiniowane SLA i zgodnoÅ›Ä‡ z normami (np. GDPR)**

## PrzykÅ‚ady ProduktÃ³w Danych

- Dashboard sprzedaÅ¼owy w Lookerze z miarami konwersji
- Model predykcji rezygnacji klienta
- Tabela modelowa z miarami LTV klienta dostÄ™pna w warstwie semantycznej (np. w dbt)
- Endpoint API zwracajÄ…cy status produktu z kalkulowanym wskaÅºnikiem ryzyka

# ðŸ’¡ PrzykÅ‚ad zastosowania

W firmie typu retail zespÃ³Å‚ danych publikuje produkt danych: tabelÄ™ modelowÄ… â€žcustomer_lifetime_value_model_v1â€, zawierajÄ…cÄ… obliczony wskaÅºnik LTV wraz z segmentacjÄ… transakcyjnÄ…. Tabela jest aktualizowana co noc, udostÄ™pniona w hurtowni danych Snowflake, posiada metadane w katalogu (np. Atlan) i speÅ‚nia SLA <15min opÃ³Åºnienia. Jest wykorzystywana przez zespÃ³Å‚ marketingu do uruchamiania kampanii targetowanych przez narzÄ™dzia typu reverse ETL.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [DJ Patil â€“ Twitter](https://twitter.com/dpatil)
- [Introduction to Data Products â€“ datameshlearning.com](https://www.datameshlearning.com/glossary/data-product)
- [Martinfowler.com â€“ Data Mesh](https://martinfowler.com/articles/data-mesh-principles.html)

## ðŸ‘½ Brudnopis

- Produkt danych = coÅ›, co ma odbiorcÄ™ i wartoÅ›Ä‡ â†’ tabela, model, raport, API
- DJ Patil: "uÅ‚atwia osiÄ…gniÄ™cie celu poprzez dane"
- Data Mesh: ownership, SLA, discoverability, dokumentacja â†’ produkt jak software
- PrzykÅ‚ady: model przewidywania churnu, raport menedÅ¼erski z kluczowymi KPI, endpoint odpytywalny przez zespÃ³Å‚ operacyjny
- Kontekst: kluczowy element demokratyzacji danych i nowoczesnych architektur danych (mesh, lakehouse)