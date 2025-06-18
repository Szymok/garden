---
title: "Obserwowalność Danych"
tags:
- inżynieria danych
---
Obserwowalność danych, znana również jako monitoring, ciągle zbiera miary dotyczące twoich danych. Możesz zbierać dane dotyczące liczby wierszy, kolumn i właściwości dla każdego zbioru danych. Możesz również zarządzać metadanymi na temat zestawu danych, takimi jak data ostatniej aktualizacji.

Z doskonałego artykułu [Wybór narzędzia do jakości danych - autorstwa Sarah Krasnik](https://sarahsnewsletter.substack.com/p/choosing-a-data-quality-tool?s=r), wynikają również różne kategorie obserwowalności:
- **Automatyczne profilowanie danych**
	- [Bigeye](https://www.bigeye.com/): unikalne ze względu na szeroki zakres testów progowych i alarmów sterowanych sztuczną inteligencją (ML)
	- [Datafold](https://www.datafold.com/): unikalna integracja z Githubem prezentująca różnice danych między środowiskami za pomocą testów niestandardowych
	- [Monte Carlo](https://www.montecarlodata.com/): unikalność polega na tym, że jest gotowe do działania w przedsiębiorstwach i oferuje wiele integracji z danymi w jeziorach
	- [Lightup](https://www.lightup.ai/): unikalna opcja wdrożenia na własnym serwerze, atrakcyjna dla branż mocno uregulowanych
	- [Metaplane](https://www.metaplane.dev/): unikalne wysokie stopień konfiguracji narzędzia hostowanego, oferujące zarówno gotowe, jak i niestandardowe testy
- **Testowanie potoku danych**
	- [Great Expectations](https://greatexpectations.io/): unikalność polega na społeczności skupionej na jakości danych i automatycznej dokumentacji testów
	- [Soda](https://www.soda.io/): unikalność polega na opcji samodzielnego hostowania w chmurze
	- [Testy dbt](https://docs.getdbt.com/docs/building-a-dbt-project/tests): unikalność polega na integracji z rdzeniem dbt i budowami w chmurze dbt (naturalnie), ale poza ekosystemem dbt jest mniej wszechstronny
- **Monitorowanie infrastruktury**
	- [DataDog](https://www.datadoghq.com/): unikalna implementacja agenta, który może być wdrożony w dowolnym miejscu w celu monitorowania, nawet na poziomie kontenera, z niestandardowym raportowaniem miar Airflow
	- [New Relic](https://newrelic.com/): unikalna integracja jednym krokiem z trzema głównymi chmurami
- **Trochę z każdego**
	- [Databand](https://databand.ai/): unikalna integracja z Airflow i konkretnym monitorowaniem miar Airflow
	- [Unravel](https://www.unraveldata.com/): unikalne wsparcie dla innych źródeł danych, takich jak Spark, jezioro danych i bazy danych NoSQL
	- [Katalogi Danych](notes/katalog%20danych.md): Pomagają w obserwacji istniejących danych

Powiązane terminy to [Gospodarka Danych](notes/data%20governance.md) i [Jakość Danych](notes/data%20quality.md).
