---

title: Data Governance  
created: 2025-07-16  
status:  
category: inżynieria danych  
difficulty: średni  
language: pl  
tags:

- inżynieria
- danych
- data quality
- compliance
- bezpieczeństwo danych  
aliases:
- zarządzanie danymi
- governance danych

---

# 🎯 Definicja

**Data Governance (zarządzanie danymi)** to zbiór ról, procesów, zasad, polityk, standardów i metryk, które zapewniają skuteczne i bezpieczne zarządzanie danymi w organizacji. Kluczowym celem jest zapewnienie, że dane są wysokiej jakości, zgodne z przepisami prawa, bezpieczne oraz dostępne dla odpowiednich użytkowników i aplikacji w odpowiednim czasie.

# 🔑 Kluczowe punkty

- 📐 Definiuje kto, co i kiedy – czyli kto może wykonać jakie operacje na jakich danych i w jakim kontekście.
- 🔍 Wspiera jakość danych: kompletność, dokładność, aktualność, spójność.
- 📊 Tworzy fundament analityki, BI i data-driven decision making poprzez spójne definicje danych i ich katalogowanie.
- 🔐 Wspomaga ochronę danych osobowych i zgodność z regulacjami (np. RODO, HIPAA).
- 🤝 Eliminuje silosy danych i wspiera współdzielenie wiedzy i odpowiedzialności w całej organizacji.

# 📚 Szczegółowe wyjaśnienie

## Komponenty Data Governance

1. **Rola i odpowiedzialność**
    
    - Data Owner – właściciel danych: wyznacza standardy jakości i dostępności.
    - Data Steward – zarządza zasobami i cyklem życia danych.
    - Data Consumer – korzysta z danych, zgodnie z przypisanymi uprawnieniami.
2. **Polityki i standardy**
    
    - Definiowanie słowników danych, standardów nazewnictwa, zasad udostępniania.
3. **Procesy i przepływy pracy (workflows)**
    
    - Wypełnianie, weryfikacja, zatwierdzanie i publikacja danych oraz metadanych.
4. **Wordbook i metadane**
    
    - Spójna definicja pól, terminów, jednostek miary – np. “KPI: customer churn rate”.
5. **Zgodność (compliance)**
    
    - Zapewnienie zgodności z regulacjami typu GDPR/RODO, HIPAA, PCI DSS itd.
6. **Zarządzanie jakością danych (Data Quality)**
    
    - Walidacje, alerty, testy spójności danych – automatycznie i manualnie.

## Kluczowe korzyści wg [Talend](https://www.talend.com/resources/what-is-data-governance/)[¹]

- ✅ Poprawa dokładności, kompletności i spójności danych
- ✅ Zwiększone zaufanie do danych w analizach i decyzjach
- ✅ Usunięcie silosów między działami i systemami
- ✅ Wspólne definicje danych (np. "co rozumiemy przez klienta aktywnego")
- ✅ Zgodność z przepisami (np. RODO)
- ✅ Większa dostępność danych — łatwiej je odnaleźć i użyć

# 💡 Przykład zastosowania

**Enterprise Data Catalog i zarządzanie danymi klienta:**

- Firma posiada dane klienta w 4 różnych systemach (CRM, ERP, billing, helpdesk).
- Brak defi­nicji "klienta aktywnego", różne pola mają różne znaczenia.
- Data Governance tworzy wspólny słownik danych i rejestruje go w katalogu.
- Przypisuje Data Ownera dla każdej domeny tematycznej (np. sprzedaż, marketing).
- Dane są wzbogacane, walidowane i prezentowane analitykom w jednolitej formie.

# 📌 Źródła

- [Talend: What is Data Governance?](https://www.talend.com/resources/what-is-data-governance/)
- [https://airbyte.com/blog/data-lake-lakehouse-guide-powered-by-table-formats-delta-lake-iceberg-hudi](https://airbyte.com/blog/data-lake-lakehouse-guide-powered-by-table-formats-delta-lake-iceberg-hudi)
- [https://www.dataversity.net/category/data-topics/data-governance/](https://www.dataversity.net/category/data-topics/data-governance/)
- [https://www.oracle.com/data-governance/](https://www.oracle.com/data-governance/)
- [https://www.collibra.com/us/en/data-governance](https://www.collibra.com/us/en/data-governance)

# 👽 Brudnopis

- Governance ≠ tylko compliance – to też jakość, katalog, odpowiedzialność i workflow
- W Data Mesh – domenowy ownership jest fundamentem
- Narzędzia: Collibra, Alation, Ataccama ONE, Microsoft Purview, Informatica Axon
- KPI: % danych spójnych, % opatrzonych stewardem, czas dostępu do danych, liczba błędów analizy z winy danych
- Governance może objąć też modele ML: governance modeli + danych uczących (bias, provenance, drift)
- Kluczowe dla Lakehouse i podejścia Data as a Product

[¹] Talend — What is Data Governance: [https://www.talend.com/resources/what-is-data-governance/](https://www.talend.com/resources/what-is-data-governance/)