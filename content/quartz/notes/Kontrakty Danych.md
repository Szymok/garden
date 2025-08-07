---

title: Kontrakty Danych  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- Kontrakty Danych
- data contracts
- data stack
- data governance
- verifiable data  
aliases:
- Data Contracts

---

# 🎯 Definicja

**Kontrakt Danych (Data Contract)** to formalna umowa/interfejs pomiędzy zespołem tworzącym i zarządzającym usługą (np. programiści, inżynierowie danych) a jej konsumentami biznesowymi. Określa ona, jakiego typu dane są dostarczane, w jakim formacie i z jakim poziomem jakości, a także wprowadza mechanizmy egzekwowania zgodności i walidacji. Celem kontraktu jest zapewnienie, że dane są stabilne, zrozumiałe, zgodne z wymaganiami analityki i nieulegające przypadkowym zmianom podczas modernizacji systemów produkcyjnych.

# 🔑 Kluczowe punkty

- **Abstrakcja nad danymi:** Oddziela produkcję danych (np. mikroserwisy, bazy operacyjne) od ich konsumpcji analitycznej lub [[Uczenie Maszynowe|ML]], ustalając umowę co do struktury, zakresu i jakości danych.
- **Egzekwowalny interfejs:** Kontrakt można sprawdzać i wymuszać (np. za pomocą Rejestru Schematów, Protobuf, testów jakości, narzędzi typu Great Expectations).
- **Zarządzanie zmianą:** Ułatwia rozsądne wersjonowanie i ewolucję schematów bez ryzyka destrukcyjnych modyfikacji lub awarii w downstream.
- **Element [[Data Governance]]:** Przenosi [[zarządzanie danymi]] z poziomu ogólnych zasad do praktycznych, egzekwowalnych reguł i oczekiwań.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania kontraktów danych

Kontrakt definiuje:

- **Schemat danych:** Struktura pól, ich typy i dopuszczalne wartości.
- **Oczekiwania co do jakości:** Zasady walidacji, np. pola nie mogą być puste, liczba rekordów na dobę powinna zawierać się w określonym zakresie.
- **Zasady kompatybilności:** Jak można zmieniać schemat bez łamania downstream.
- **Sposób dostarczania danych:** Protokół, format (Protobuf, Avro, JSON), częstotliwość.

Przykładowo, w organizacji korzystającej z Apache Kafka i Protobuf, kontrakt jest schematem przechowywanym w Schema Registry, a każda zmiana podlega zatwierdzeniu oraz testom regresji.

## Różnice: kontrakt danych vs produkt danych

|Kontrakt Danych|Produkt Danych|
|---|---|
|Opisuje: **jakie dane, w jakim formacie**|Odpowiada na pytanie: **dlaczego te dane są dostarczane i jaki mają cel**|
|Służy do: egzekwowania stabilności|Dostarczania wartości biznesowej|
|Skupia się na: jakości i integracji|Użyteczności, dokumentacji, konsumpcji|

## Narzędzia i technologie

- **Protobuf, Avro, JSON Schema:** Serde schematów i ewolucji kontraktów.
- **Kafka + Schema Registry:** Rejestracja, wersjonowanie i egzekwowanie kontraktów.
- **Great Expectations:** Definiowanie i testowanie oczekiwań dotyczących danych.
- **API analityczne (GraphQL, REST):** Określanie typu/zakresu zwracanych danych.

## Kontrakty a [[nowoczesny stos danych]]

Kontrakty danych nie zastępują klasycznych potoków ETL/ELT lub narzędzi [[Stos danych|Data Stack]]. Są uzupełnieniem (warstwą walidacji i deklaratywnych interfejsów), a nie alternatywą – ułatwiają wczesne wychwycenie zmian destrukcyjnych i szybki prototyping źródeł danych.

## Kontekst: kontrakt danych vs [[Data Mesh]]

- **[[Data Mesh]]** wprowadza mikroserwisową organizację danych, ale nie narzuca, _jakie_ dane są publikowane, ani nie waliduje ich formy zgodnie z oczekiwaniami konsumenta.
- **Kontrakt Danych** uściśla tę relację: narzuca formalny, weryfikowalny interfejs danych (np. poprzez automatyczne testy i schematy), wspomaga [[Data Governance]] na poziomie implementacyjnym.

# 💡 Przykład zastosowania

W firmie logistycznej zespoły developmentu utrzymujące systemy transportowe dostarczają zdarzenia biznesowe przez Apache Kafka, każde opisane kontraktem (Protobuf + Schema Registry). Konsumenci z działów analityki/[[Uczenie Maszynowe|ML]] mają pewność, że dane o trasach, ładunkach i dostawach zachowują zgodny format, są kompletne i odporne na nieautoryzowane zmiany. Przy zmianie schematu, pipeline [[Uczenie Maszynowe|ML]] automatycznie odrzuci niezgodne dane i wygeneruje alert – zapobiegając incydentom jakościowym.

# 📌 Źródła

- [The Rise of Data Contracts — Chad Sanderson (Substack)](https://dataproducts.substack.com/p/the-rise-of-data-contracts)
- [Data Contracts from Zero to Hero — Towards Data Science](https://towardsdatascience.com/data-contracts-from-zero-to-hero-343717ac4d5e)
- [Confluent Schema Registry Documentation](https://docs.confluent.io/platform/current/schema-registry/)
- [Great Expectations – Open Source Data Testing](https://greatexpectations.io/)

# 👽 Brudnopis

- Kontrakty: umowa producent — konsument danych; schemat, walidacja, egzekwowanie
- Protobuf + Kafka, Schema Registry (Confluent), walidacja jakości, zmiany weryfikowane automatycznie
- Porównanie z [[Data Mesh]]: mesh = organizacja, kontrakt = mechanizm walidacji/zgodności
- Praktyczne narzędzia: Great Expectations, GraphQL/REST Schema, deklaratywne “data contract” jako kod
- Usecase: [[Uczenie Maszynowe|ML]] pipeline źle działa? Można wyłapać breaking change już na wejściu, zamiast w downstream