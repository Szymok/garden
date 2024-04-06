---
title: Data Stack
tags:
  - inżynieria
  - danych
---

Kontrakty Danych to umowy w stylu interfejsu pomiędzy inżynierami oprogramowania/danych, którzy zarządzają usługami, a konsumentami danych, którzy rozumieją, jak działa biznes. Celem jest generowanie dobrze zaprojektowanych, wysokiej jakości, godnych zaufania danych w czasie rzeczywistym.

Jest to **abstrakcja**, która pozwala inżynierom odseparować ich bazy danych i usługi od wymagań analityki i uczenia maszynowego. Unika to incydentów niszczenia produkcji przy modyfikacji schematu, ponieważ są one weryfikowane i egzekwowane.

![](images/data-contract.png)
Ilustracja autorstwa Chada Sandersona w artykule [The Rise of Data Contracts - by Chad Sanderson](https://dataproducts.substack.com/p/the-rise-of-data-contracts)

Chad Sanderson powiedział, że w Convoy używają [Protobuf](Protobuf) i [Kafka](Apache Kafka), aby abstrahować transakcje CRUD. Określają schemat na podstawie tego, *czego potrzebują*, a nie tego, co dostają ze źródła. Podobnie jak [Zasoby Zdefiniowane Programowo (Software-Defined Assets)](software-defined%20assets) opisują [Data Assets](notes/data%20asset) w sposób deklaratywny i ustalają [oczekiwania](https://github.com/dagster-io/dagster/discussions/9543).

Confluent również zbudował podobne funkcje na wierzchu Kafki przy użyciu ich [Rejestru Schematów](https://docs.confluent.io/platform/current/schema-registry/), a terminy takie jak [Warstwa Semantyczna](notes/warstwa%20semantyczna.md) i [API Analityczne](https://www.sspaeti.com/blog/analytics-api-with-graphql-the-next-level-of-data-engineering/#what-is-an-analytics-api) (z [GraphQL](notes/graphql.md)) dążą do osiągnięcia podobnych celów.

Kontrakty Danych nie mają zastępować potoków danych i [Nowoczesnego Stosu Danych (Modern Data Stack)](notes/data%20stack.md), bardziej rozwiązania wsadowego. Są dobre do szybkiego prototypowania. Możesz zacząć definiować kontrakty danych, gdy masz pewną wiedzę o danych.

Ciekawie jest porównać to z [Siatką Danych (Data Mesh)](notes/data%20mesh.md), która jest organizacyjną strukturą z mikroserwisowym podejściem do danych. Siatka Danych nie określa, które dane powinny być wysyłane ani nie waliduje danych wysyłanych z produkcji pod kątem poprawności lub zgodności z oczekiwaniami konsumenta.

Kontrakty Danych są również formą [Gospodarki Danych (Data Governance)]. Ten termin jest bardzo ogólny i staje się bardziej konkretne dzięki wyraźnym kontraktom. Możesz także użyć [Great Expectations](https://greatexpectations.io/), aby określić oczekiwania dotyczące swoich danych, co moim zdaniem jest świetnym sposobem na rozpoczęcie.

## Dyskusja na YouTube z Chadem Sandersonem i Ethanem Aaronem

Chad Sanderson mówi w [Data Contract Battle Royale w/ Chad Sanderson vs Ethan Aaron - YouTube](https://youtu.be/4BEpYAp3Qu4):
- To po prostu wersja bazy danych prawdziwej umowy.
- Prawdziwa umowa to tylko porozumienie między dwiema stronami, gdzie:
	- Istnieje jakiś mechanizm egzekwowania tego.
	- Umowa danych to podobne porozumienie, ale dotyczy ono **osoby produkującej dane i osoby konsumującej dane**, aby dostarczyć określony zestaw danych, który zwykle obejmuje schemat i jakiś mechanizm egzekwowania.
- Różnica między kontraktem danych a produktem danych:
	- **Kontrakt danych**, który mówi *co* to są dane i *jak* zapewnimy ich jakość.
	- **[Produkt Danych (Data Product)](notes/produkt%20danych.md)**, który mówi *dlaczego* potrzebujemy tych danych.

Ethan Aaron twierdzi, że jego problem z kontraktami danych polega na tym, że skupiasz się na zbyt wczesnym definiowaniu interfejsu/kontraktu. Na przykład, jeśli dużo zadań jest wykonywanych przez kilka zespołów lub osób, mamy kontrakt w celu uzgodnienia interfejsu. Argumentowałbym, że to dokładnie są produkty danych, a zamiast uzgadniać jakiś sztuczny kontrakt, decydujemy się na produkt, aby narzędzia i zespoły mogły być odrębne.

## Podsumowanie artykułów na blogach

Doskonałe podsumowanie autorstwa [Mehdi Ouazza](https://www.linkedin.com/in/mehd-io) na temat kontraktów danych [From Zero To Hero](https://towardsdatascience.com/data-contracts-from-zero-to-hero-343717ac4d5e). Ilustruje, jak [[Apache Kafka]] może być interfejsem definiującym kontrakt.

![](images/data-contract-example.png)
Ilustracja z artykułu [Data Contracts — From Zero To Hero](https://towardsdatascience.com/data-contracts-from-zero-to-hero-343717ac4d5e)

Zobacz także [Semaforowe Magazynowanie (Semantic Warehouse)](notes/semantyczne%20magazynowanie.md).
