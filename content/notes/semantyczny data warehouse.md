---
title: "Data Warehouse Semantyczny"
tags:
- inżynieria danych
---

Data Warehouse Semantyczny łączy w sobie najlepsze praktyki wyznawane przez [Bill Inmon](Bill%20Inmon) dla solidnego, skalowalnego projektowania magazynu danych zbudowanego dla chmury jako abstrakcję [Data Stack](notes/data%20stack.md) z [Modelowanie Danych](notes/modelowanie%20danych) w jego rdzeniu.

![](images/semantic-warehouse.png)
Ilustracja Data Warehouse Semantycznego według [Chad Sanderson na LinkedIn](https://www.linkedin.com/posts/chad-sanderson_im-very-happy-to-unveil-the-semantic-warehouse-activity-6958091220157964288-JSXj/)

Chad Sanders wprowadził po raz pierwszy ten termin w tym [poście na LinkedIn](https://www.linkedin.com/posts/chad-sanderson_im-very-happy-to-unveil-the-semantic-warehouse-activity-6958091220157964288-JSXj/). Niektóre charakterystyczne cechy:
- Dane jako produkt i przechwytywanie świata naturalnego poprzez zdarzenia zamiast przetwarzania wsadowego za pomocą jasno zdefiniowanego schematu
- [Kontrakt Danych](notes/kontrakt%20danych.md) jako podstawa wprowadzenia umów do jego podstawowych tabel źródłowych.
- Współpraca i modelowanie danych w oparciu o przeglądy rówieśników.
- Skoncentrowane na miarach z [Warstwą Miary/Warstwą Logiczną](notes/warstwa%20miar.md) umożliwia wspólne modelowanie danych między biznesem a (danymi) inżynierami oraz abstrahuje złożoność stosu danych.
- Wbudowane bodźce dzięki semantyce i modelowaniu są wymagane, aby generować dobre [Produkty Danych](notes/produkt%20danych.md).

Data Warehouse Semantyczny próbuje rozwiązać następujące problemy:
1. [Nowoczesny Stos Danych](notes/data%20stack.md) (MDS) to zestaw dobrych narzędzi do budowy rzeczy, ale nie pomagają one zapewnić, że to, co jest budowane, jest wysokiej jakości.
2. Większość architektur danych i fundamentów danych nie jest skalowalna. Pierwsza wersja infrastruktury danych (zazwyczaj ustawiana przez inżynierów lub początkujących deweloperów danych) nigdy nie jest refaktoryzowana, ponieważ jest to trudne do zrobienia.
3. Producentów nie obowiązuje (chociaż powinno) jakość danych. Inżynierowie danych nie powinni być pośrednikami w konflikcie między konsumentami.
4. Brak semantyki i kontekstu. Deweloperzy danych spędzają dni lub tygodnie, próbując zrozumieć, jakie dane mamy, co oznaczają, jak się odnoszą do usług i czy dane można ufać.
5. Modelowanie danych nie było obywatelem pierwszej klasy. Modelowanie było trudne do zrealizowania (z powodu #4) i w niektórych przypadkach niemożliwe ze względu na brak danych.
6. Nasz [Data Warehouse](notes/data%20warehouse.md) nie odzwierciedlał rzeczywistego świata. Zamiast tego był składnikiem do produkcji usług i interfejsów API stron trzecich.
7. Brak interoperacyjności z powodu narzędzi, które nie "mówią tym samym językiem". Mamy wiele produktów, z których każdy wymaga swojego środowiska modelowania i braku wspólnego zrozumienia pojęć biznesowych.
8. [Zarządzanie Danymi](notes/data%20governance.md) jest istotne, ale firmy go odrzucają, jeśli staje się przeszkodą. Nie możemy skalować naszego zespołu danych poprzez złożoność.

Zobacz również [Warstwa Semantyczna](notes/warstwa%20semantyczna.md) i [Kontrakt Danych](notes/kontrakt%20danych.md).
