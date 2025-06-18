---
title: "Integracja Danych"
tags:
- inżynieria danych
---

Integracja danych to proces łączenia danych z różnych źródeł w jedno zintegrowane widzenie. Może to być osiągnięte poprzez ręczną integrację, wirtualizację danych, integrację aplikacji lub poprzez przeniesienie danych z wielu źródeł do jednego zintegrowanego celu. Poniżej omówione są te metody integracji danych.

## Ręczna integracja 
Przed wdrożeniem systematycznego podejścia do integracji danych, organizacje mogą początkowo korzystać z ręcznej integracji, próbując zrozumieć dane rozproszone po różnych systemach. Polega to na tym, że analitycy ręcznie logują się do systemów źródłowych, analizują i/lub eksportują dane z tych systemów oraz tworzą raporty na podstawie swoich wyników. 

Ręczna integracja jako strategia integracji danych ma kilka wad. Oprócz długiego czasu trwania, analitycy wymagają dostępu do wielu systemów operacyjnych, co tworzy ryzyko bezpieczeństwa. Ponadto analitycy mogą uruchamiać kosztowne operacje analizy na systemach, które nie są zoptymalizowane pod kątem takich obciążeń, co może zakłócać działanie tych systemów. Wreszcie, dane w systemach źródłowych mogą często się zmieniać, co oznacza, że ręcznie generowane raporty szybko staną się przestarzałe. 

## Wirtualizacja danych
Organizacje mogą także rozważyć przyjęcie rozwiązania wirtualizacji danych do integracji swoich danych. W tym rodzaju integracji danych dane z wielu źródeł pozostawiane są na swoim miejscu i są dostępne poprzez warstwę wirtualizacji, dzięki czemu _wyglądają_ one jako pojedyncze źródło danych. Warstwa wirtualizacji wykorzystuje adaptery, które tłumaczą zapytania wykonywane na warstwie wirtualizacji na format, który każdy podłączony system źródłowy może wykonać. Następnie warstwa wirtualizacji łączy odpowiedzi z tych systemów źródłowych w jedno wyniki. Ta strategia integracji danych jest czasem używana, gdy narzędzie BI, takie jak Tableau, musi uzyskać dostęp do danych z wielu źródeł danych.

Jedną z wad wirtualizacji danych jest to, że obciążenia analizy są wykonywane na systemach operacyjnych, co może zakłócać ich działanie. Inną wadą jest to, że warstwa wirtualizacji może działać jako wąskie gardło w wydajności operacji analitycznych.

## Integracja aplikacji
Innym rozwiązaniem integracji danych jest bezpośrednie połączenie wielu aplikacji między sobą i przenoszenie danych bezpośrednio między nimi. Jest to znane jako integracja aplikacji, a łączenie można wykonać za pomocą komunikacji punkt-punkt, za pośrednictwem warstwy pośredniczącej, takiej jak enterprise service bus (ESB), lub za pomocą narzędzia do integracji aplikacji. 

Integracja aplikacji może skutkować wieloma kopiami tych samych danych w wielu źródłach, co może zwiększyć koszty oraz spowodować dużą ilość ruchu punkt-punkt między różnymi systemami. Ponadto, podobnie jak w przypadku poprzednich typów integracji danych, wykonywanie obciążeń analizy bezpośrednio na systemach operacyjnych może zakłócać ich działanie.

## Przenoszenie danych do zintegrowanego celu
Przesyłanie danych z różnych źródeł w przedsiębiorstwie do zcentralizowanego systemu, takiego jak baza danych, hurtownia danych, data lake lub data lakehouse, skutkuje **jednym jednolitym miejscem dostępu i analizy wszystkich informacji przepływających przez organizację**. W Airbyte jesteśmy zwolennikami tej metody integracji danych, a następna sekcja tego artykułu jest poświęcona omówieniu jej korzyści w większym szczegółu.

Poniżej znajduje się ogólny schemat [replikacji danych](https://airbyte.com/blog/what-is-data-replication) z wielu źródeł do Google BigQuery. 

![data-integration](images/data-integration.jpg)
Replikacja danych do centralnego celu
