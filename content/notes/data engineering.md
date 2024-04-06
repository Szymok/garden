---
title: "Inżynieria Danych"
tags:
- inżynieria danych
---
Definicja z książki [Podstawy Inżynierii Danych](https://www.oreilly.com/library/view/fundamentals-of-data/9781098108298/), ponieważ jest to jedno z najnowszych i najbardziej kompletnych źródeł:
> Inżynieria danych to rozwijanie, wdrażanie i utrzymanie systemów i procesów, które przyjmują surowe dane i produkują wysokiej jakości, spójne informacje, które wspierają dalsze przypadki użycia, takie jak analizy i uczenie maszynowe. Inżynieria danych łączy w sobie bezpieczeństwo, zarządzanie danymi, DataOps, architekturę danych, orkiestrację i inżynierię oprogramowania.

Dzisiejszy inżynier danych nadzoruje cały proces inżynierii danych, począwszy od zbierania danych z różnych źródeł, aż po udostępnienie ich dla procesów zależnych. Rola ta wymaga znajomości wielu etapów [Cyklu Życia Inżynierii Danych](notes/cykle%20życia%20data%20engineering.md) oraz zdolności do oceny narzędzi danych pod kątem optymalnej wydajności w wielu wymiarach, w tym ceny, prędkości, elastyczności, skalowalności, prostoty, ponownego wykorzystania i interoperacyjności.

Inżynieria Danych pomaga również przezwyciężyć ograniczenia [Business Intelligence](notes/business%20intelligence.md):
- Większa transparentność, ponieważ narzędzia są głównie open-source
- Częstsze ładowania danych
- Wspieranie możliwości [Uczenia Maszynowego](notes/uczenie%20maszynowe.md)

W porównaniu do istniejących ról byłaby to połączona rola **inżyniera oprogramowania oraz inżyniera do przetwarzania informacji biznesowych w tym zdolności do obsługi big data** w ekosystemie [Hadoop](notes/apache%20hadoop.md), strumieni danych i obliczeń na dużą skalę. Biznes tworzy więcej artefaktów raportowania samodzielnie, ale z większą ilością danych, które muszą być zbierane, oczyszczane i aktualizowane w czasie rzeczywistym, a złożoność wzrasta każdego dnia.

Dlatego też potrzebne są bardziej programistyczne umiejętności, podobne do inżynierii oprogramowania. **Obecnie rosnącym językiem w tej dziedzinie jest [Python](notes/python.md)**, który jest wykorzystywany zarówno w inżynierii danych przy użyciu narzędzi takich jak [[Apache Airflow]], [Dagster](Dagster), [[notes/Prefect]], jak i w naukach o danych za pomocą potężnych bibliotek.

Jako inżynier danych korzystasz przede wszystkim z [SQL](notes/sql.md) prawie do wszystkiego, z wyjątkiem sytuacji, gdy używasz danych zewnętrznych z API. W takim przypadku wykorzystasz narzędzia [ELT](notes/elt.md) lub napiszesz pewne [[notes/potoki przetwarzania danych|potoki danych]] przy użyciu wymienionych wyżej narzędzi.
