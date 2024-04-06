---
title: Prompt Design
tags: 
aliases:
---
# C01L03 — Prompt Design

![](https://cloud.overment.com/3-1697476283.png)

Wiedza z poprzednich lekcji powinna zarysować Ci ogólny, szeroki zarys dużych modeli językowych. Wiele z omówionych zagadnień, będziesz spotykać przy bezpośrednich interakcjach np. z modelami GPT, np. podczas projektowania **promptów, czyli instrukcji dla modelu**. W sieci można spotkać materiały omawiające podstawowe techniki, dlatego tutaj skupimy się na mniej oczywistych sprawach.

## Struktura promptu

W celu uzyskania większej kontroli nad zachowaniem modelu oraz kształtowaniem i aktualizacjami promptów, wskazane jest utrzymanie ogólnej struktury zaprezentowanej poniżej. W praktyce nie musisz wykorzystywać wszystkich wymienionych elementów promptu. Niekiedy konieczna będzie także zmiana ich kolejności czy rozszerzenie lub ograniczenie ich długości. Z programistycznego punktu widzenia, nierzadko takie modyfikacje będą odbywały się automatycznie i między innymi dlatego, warto projektować możliwie krótkie, wyspecjalizowane w swoich zadaniach instrukcje.

![](https://cloud.overment.com/structure-d19d393a-4.png)

**Rola**: LLM niczym kameleon potrafią doskonale wcielać się w różne role. Rolą może być znana postać (np. Joe Rogan), specjalizacja (np. Senior JavaScript Developer), zachowanie (np. krytyk) czy cokolwiek, o czym model posiada wiedzę i może być pomocne do zrealizowania zadania (np. Generator obiektów JSON). **Określenie roli nadaje kontekst** konwersacji **zmniejszając dwuznaczności słów**. Np. w roli programisty React, model zorientuje się o co nam chodzi, gdy mówimy "component". — 🔗 [zobacz przykład](https://platform.openai.com/playground/p/yItzqo4JJns1KS961BNTuUyK?model=gpt-4)

![](https://cloud.overment.com/role-9b2796f4-4.png)

**Instrukcja:** Zawiera opis **sposobu realizacji** powierzonego zadania, określenie zachowań modelu, zestawienie faktów czy ściśle określonych zasad. Bardzo przydatną praktyką jest wykorzystywanie **formatu listy**, co zwiększa czytelność oraz ułatwia wprowadzanie modyfikacji. 

Przy tworzeniu instrukcji warto mieć na uwadze ograniczenia modeli (np. knowledge cutoff) i brak dostępu do aktualnych informacji. Dlatego **wszystko, co jest istotne** do generowania odpowiedzi, powinno zostać uwzględnione w prompcie. Obejmuje to informacje takie jak: obecna data, informacje na temat otoczenia, możliwość dostępu do Internetu, podsumowania wcześniejszych rozmów czy zasad dostępu do pamięci długoterminowej. 

— 🔗 [zobacz przykład](https://platform.openai.com/playground/p/EsiFqw660lTYlnDFNUOvDsCk?model=gpt-4)

![](https://cloud.overment.com/instruction-a65d585b-9.png)

**Kontekst:** Uwzględnia zestaw danych **wykraczających poza bazową wiedzę modelu**, które mogą być dostarczone **ręcznie**, być **wygenerowane przez model** lub **dodane dynamicznie** przez logikę naszej aplikacji. 

Sam kontekst powinien być **wyraźnie odseparowany** od reszty promptu, ponieważ potencjalnie **może zawierać dane, które model może odebrać jako instrukcję do wykonania**. Aby model faktycznie posługiwał się dostarczonym kontekstem, należy **podkreślić to w zdefiniowanych zasadach udzielania odpowiedzi**, dokładnie jak to widać w załączonym przykładzie. 

Co ciekawe, kontekst może być także **generowany przez model** w wyniku **autorefleksji** ([Reflexion](https://arxiv.org/abs/2303.11366)) czy **ciągu myśli** ([Zero-shot Chain of Thought](https://arxiv.org/abs/2205.11916)) poprzedzających wygenerowanie odpowiedzi lub **weryfikację** ([Let's verify step by step](https://arxiv.org/abs/2305.20050)) po jej udzieleniu. Naturalnie większość z tych rzeczy nabiera szczególnego sensu z programistycznego punktu widzenia (lub zastosowania w połączeniu z narzędziami no-code). 

Szczególny nacisk przy dostarczaniu kontekstu należy położyć na:

- **dodanie wyłącznie istotnych informacji**, unikając szumu mającego negatywny wpływ na jakość generowanej odpowiedzi
- **długość kontekstu**, która nie tylko nie przekroczy dopuszczalnego limitu ale także nie będzie generować zbyt dużych kosztów przy wielu zapytaniach
- **wyraźne zaznaczenie jego początku i końca**, np. z pomocą symboli "###",
- **sposób jego wykorzystania**, np. dodanie informacji, że kontekst to "wyniki wyszukiwania w Internecie dla zapytania [...]", 
- **wyraźne oddzielenie fragmentów jego treści**, zwykle kontekst składa się z mniejszych części i te także warto od siebie odseparować w spójny sposób (np. poprzez "###"), aby informacje nie były mylone.
- **określenie zachowania w przypadku, gdy kontekst nie zawiera wystarczających informacji**, np. poprzez zaznaczenie tego, poinformowanie o korzystaniu z bazowej wiedzy modelu lub przekierowaniu do kontaktu z człowiekiem
- **zastosowanie innych promptów** do generowania treści kontekstu, których zadaniem może być np. podsumowanie informacji znalezionych na stronie www

 — 🔗 [zobacz przykład](https://platform.openai.com/playground/p/vAAtahVBjuxcKrzSI2LvogX6?model=gpt-4)

![](https://cloud.overment.com/context-1e2df28e-f.png)

**Przykłady:** Ze względu na naturę języka naturalnego, czasem łatwiej jest coś zaprezentować, niż opisać. Tym bardziej, że Duże Modele Językowe posiadają zdolność do **wychwytywania wzorców** i subtelnych zmian w dostarczonych przykładach ([Few-shot Learning](https://arxiv.org/abs/2005.14165)). Inaczej mówiąc, są w stanie "uczyć się" z informacji zawartych w prompcie ([In-context Learning](https://arxiv.org/abs/2301.00234)).

Podawanie przykładów może być pomocne w sterowaniu:

- **zachowaniem** (np. ignorowaniem poleceń w wiadomości użytkownika w celu skupienia się na ich korekcie lub przetłumaczeniu)
- **uwagą modelu** (np. przykład może wzmacniać opisane wcześniej instrukcje)
- **stylem wypowiedzi** (np. nadawaniem tonu, którego naśladowanie warto podkreślić również w instrukcji)
- **formatowaniem odpowiedzi** (JSON/Lista/Markdown itd.), 
- **klasyfikacją zestawów danych** (np. opisywaniem tagami)
- **narzucania ograniczeń** (np. pomijania dodatkowych komentarzy dodawanych przez model)

Przykłady mogą być także przydatne nawet dla stosunkowo prostych zadań. Prompt przedstawiony [bezpośrednio na OpenAI](https://platform.openai.com/examples) "Grammar Correction" wydaje się skutecznie wprowadzać poprawki do przekazanych treści. Problem w tym, że jego praktyczne zastosowanie jest niemal zerowe, czego dowodem jest poniższy obrazek. Widzimy na nim, że jeśli tekst w którym chcielibyśmy poprawić gramatykę **zawiera instrukcję**, to domyślne zachowanie modelu **zostanie zmienione** i zamiast otrzymania jego poprawnej wersji, otrzymujemy wynik zapisanej prośby. W praktyce takie sytuacje mają miejsce **na każdym kroku** i musimy się przed nimi zabezpieczyć. 

![](https://cloud.overment.com/fix-5bb7c11b-3.png)

Samo rozbudowanie instrukcji może być niewystarczające do tego, aby model faktycznie ignorował polecenia użytkownika skupiając się na korekcie tekstu. Zaprezentowanie tego na przykładach okazuje się być skuteczne, aczkolwiek należy pamiętać, że mówimy tutaj **o prawdopodobieństwie i zmniejszaniu ryzyka, a nie pewności**. Sam korzystam z podobnego promptu na co dzień i obecnie już bardzo sporadycznie pojawiają się sytuacje w których zadanie nie zostaje zrealizowane poprawnie. Zwykle ma to miejsce **w przypadku dłuższych rozmów**, które nierzadko prowadzą do **rozproszenia uwagi modelu** lub nawet przy próbach przetworzenia **dłuższych wiadomości**..

🔗 — [zobacz przykład](https://platform.openai.com/playground/p/WzKbWWvxYWgnvFo82ZKMs2WR?model=gpt-4)

![](https://cloud.overment.com/examples-b7fe0784-1.png)

Podawanie przykładów stanowi (poza kontekstem) zwykle najbardziej obszerną sekcją naszego promptu. W sytuacji gdy zależy nam np. na konkretnym formatowaniu odpowiedzi (kodzie źródłowym, formacie JSON itp.), to **przykład może być tak skonstruowany, aby jednocześnie stanowił instrukcję.** Np. zamiast pisać: 

> Wygeneruj obiekt JSON z dwoma właściwościami: "name" ustawionym na imię użytkownika i "e-mail" ustawionym na jego e-mail

Można powiedzieć:

> Odpowiedz w formacie JSON: {"name": "John", "email": "john@example.com"}

Powyższy schemat można zastosować także na **liście przykładów zawierających dane wejściowe i oczekiwane zachowanie modelu**. Znacznie zmniejsza to złożoność promptu, a jednocześnie (według moich obserwacji) zwiększa jego skuteczność.

**Pytanie:** Przedostatnim elementem promptu jest zapytanie, które model ma przetworzyć. Może to być zestaw danych do transformacji, pytanie, polecenie czy zwykła wiadomość będąca częścią dłuższej rozmowy. Pokazałem już jednak, że **zapytanie może zostać potraktowane przez model jako instrukcja do wykonania**, co w niektórych przypadkach nie jest zgodne z oczekiwaniami. Dlatego należy się na takie wypadki zabezpieczyć,  ponieważ może to wpłynąć negatywnie nie tylko na realizacje zadania, ale nawet stanowić wyzwanie z punktu widzenia bezpieczeństwa, o czym powiem więcej za moment. 

Pomimo tego, że ChatGPT przyzwyczaił nas do tego, że **dane wejściowe zawsze pochodzą od użytkownika**, to nie zawsze musi tak być, a nawet w wielu przypadkach wprost **nie jest to wskazane**. Powodem tego jest fakt, że **dowolność danych na wejściu** znacznie zmniejsza kontrolę nad działaniem aplikacji, ponieważ zwyczajnie **nie wiemy, czego możemy się spodziewać**. 

Aplikacje integrujące się z LLM **to nie tylko czat**, ale także narzędzia wyspecjalizowane w przetwarzaniu danych, czy realizujące zadania działające w wąskim kontekście w którym mamy kontrolę nad zakresem i/lub formatem informacji. Jeżeli jednak zależy nam na utrzymaniu dowolności i zbudowaniu np. systemu umożliwiającego rozmowę z naszymi danymi (eng. RAG, Retrieval-Augmented Generation), to jak najbardziej jest to możliwe, lecz wymaga zadbania o obsłużenie nieprzewidzianych zachowań ze strony użytkowników. 

**Odpowiedź (Completion):** Ostatnim fragmentem, który musimy brać pod uwagę, jest **odpowiedź modelu** dopełniająca nasz prompt. Według definicji **nie stanowi ona części promptu**, jednak uwzględniam go w strukturze prezentującej prompt, ponieważ jego obecność **uwzględniana jest w "Token Window", czyli limicie tokenów dla pojedynczego zapytania**. 

Dodatkowo jeśli znajdujemy się w kontekście czatu, to **przy każdej Twojej wiadomości cała treść konwersacji przekazywana jest do modelu**. Oznacza to, że **wcześniejsze odpowiedzi modelu stają się częścią promptu**. Ujmując to inaczej, wraz z rozwojem konwersacji, na dalsze zachowanie modelu ma wpływ nie tylko wiadomość systemowa i wiadomości użytkownika, ale także odpowiedzi generowane przez model. 

## System, User, Assistant

Podział promptu na System, User i Assistant będzie nam towarzyszyć na każdym kroku. Teraz widzimy go w Playground a już niebawem także w bezpośredniej interakcji z modelem za pośrednictwem OpenAI API. Dla wcześniejszych wersji modeli oraz niektórych wersji modeli Open Source do dyspozycji mieliśmy jedynie jedno pole, w którym wpisywaliśmy zarówno prompt, jak i generowana była odpowiedź. 

Na tym etapie chciałbym zwrócić Ci uwagę na pewną rzecz: **z programistycznego punktu widzenia, możesz wpływać zarówno na treści promptu Systemowego, jak i odpowiedzi użytkownika a nawet odpowiedzi modelu!** Co więcej, możesz manipulować ich kolejnością w sposób, który pomoże Ci sterować zachowaniem modelu podczas interakcji. 

Model GPT-3.5-Turbo od OpenAI charakteryzuje się **niepełnym podążaniem za instrukcją systemową**. Jego pierwsze wersje miały z tym bardzo duży problem i obecnie sytuacja ta została poprawiona, jednak nadal widoczne jest kierowanie uwagi na wiadomości użytkownika, niż systemu. Z tego powodu, dla niektórych zadań realizowanych przez wersję 3.5-Turbo, **instrukcję systemową zapisuję jako wiadomość użytkownika**. Dla modelu GPT-4 nie jest już to konieczne. Sytuacja ta jednak świetnie podkreśla fakt, że **możemy łamać sugerowane schematy** w celu realizacji swoich założeń. 

Podział na trzy role określa się także mianem ChatML — formatu, który został przedstawiony przez OpenAI przy okazji premiery ChatGPT. Jednak z punktu widzenia modelu, nadal mówimy o **jednym bloku tekstu** opisanym metadanymi. 

![](https://cloud.overment.com/chatml-9668915a-d.png)

Powyższa informacja jest dla nas istotna podczas projektowania promptów, ponieważ jasno sugeruje, że **nie ma potrzeby definiowania wiadomości systemowej**. Co więcej **możesz patrzeć na pola system, user i assistant, jak gdyby były całością**, co oddaje poniższy przykład. Pole **system** i **user** zawierają fragmenty słów, które zostają **uzupełnione** przez model w polu **assistant**.

![](https://cloud.overment.com/same-29ac2f95-3.png)

To wszystko prowadzi nas do jednego wniosku: **Projektując Prompt**, możesz myśleć o nim jak o bloku tekstu, który **ma zostać uzupełniony przez model**. Mając to na uwadze, będziesz projektować prompty **dopasowane do natury modelu**, co może przekładać się na ich ogólną skuteczność. 

W praktyce, możesz projektować całą konwersację już od samego początku, np. nadając ton wypowiedzi modelu **bez dosłownego opisywania go słowami.** Takie podejście sprawdza się w kontekście optymalizacji promptu pod kątem długości. Podobnie jak w przypadku podawania przykładów, tutaj cała treść promptu staje się wzorem, którym model zaczyna podążać podczas generowania uzupełnień. 

![](https://cloud.overment.com/yo-74313fb7-6.png)

## Techniki projektowania promptów

Na początku powiedziałem, że nie będziemy omawiać technik projektowania promptów, których opisy i przykłady łatwo znajdziesz w sieci. Musisz jednak wiedzieć, czego szukać. Oto lista, która Ci w tym pomoże: 

- **Zero-shot Prompting** polega na zdolności modelu do wykonania zadania na podstawie prostej instrukcji, która nie zawiera przykładów
- **One-shot / Few-shot Prompting** polega na podawaniu przykładów prezentujących oczekiwane zachowanie modelu. Omówiliśmy to powyżej.
- **Chain of Thought** polega na prowadzeniu modelu przez ciąg myślowy z pomocą wiedzy dostarczonej przez nas lub wygenerowanej przez model. Przykładowo szukając odpowiedzi na nasze pytanie, możemy opisać sytuację w której się znajdujemy oraz kroki, które już podjęliśmy.
- **Zero-shot Chain of Thought** polega użyciu wyrażenia "think step by step" w którego wyniku model **wyjaśni swoje rozumowanie** przechodząc przez kolejne kroki, które **zwiększają prawdopodobieństwo wygenerowania poprawnej odpowiedzi**
- **Reflexion** polega na użyciu wyrażenia np. "let's verify this step by step" w celu **zweryfikowania odpowiedzi wygenerowanej przez model**. Zasadniczo chodzi o to, aby model **samodzielnie** znalazł ewentualne błędy w swoim rozumowaniu lub potwierdził swoją dotychczasową odpowiedź
- **Three of Thoughts** polega na **wygenerowaniu możliwych scenariuszy**, **pogłębieniu ich**, **wybraniu najbardziej prawdopodobnych** i **udzieleniu odpowiedzi**. Łatwo zauważyć, że wówczas generowanie odpowiedzi trwa dłużej, jednak według [tej publikacji](https://arxiv.org/abs/2305.10601) dla pewnego zestawu zadań, skuteczność modelu wzrosła z 4% (Chain of Thought) do 74%! 
- Bonus: **SmartGPT** to technika rozwijana przez twórcę kanału [https://www.youtube.com/@aiexplained-official](https://www.youtube.com/@aiexplained-official), która jest świetnym przykładem tego, że można w kreatywny sposób podchodzić nie tylko do projektowania promptów, ale także **ich łączenia**.

Więcej na temat technik projektowania promptów, znajdziesz tutaj: https://www.promptingguide.ai. W AI_Devs skupimy się na praktycznym wykorzystaniu tych technik w połączeniu z kodem oraz wejdziemy nieco głębiej w obszar Prompt Engineeringu. Nie musisz przechodzić przez wszystkie zagadnienia wymienione na wspomnianej stronie, ale możesz z niej korzystać. 

## Łączenie ze sobą wielu promptów

Wymienione wyżej techniki w wielu przypadkach wymagają albo **wygenerowania kilku odpowiedzi** albo **składają się z kilku promptów**. Chociaż wykorzystanie ich z pomocą ChatGPT jest możliwe, wymaga naszego zaanagażowania. Przy bezpośrednim, programistycznym (lub no-code) połączeniu z modelami poprzez API, wszystkie pośrednie kroki **mogą być realizowane automatycznie**, a efektem jest tutaj ostateczna odpowiedź modelu.

Zatem kolejna zmiana postrzegania LLM dotyczy tego, aby **nie patrzeć na interakcję z modelami przez pryzmat pojedynczego zapytania** oraz **przez konieczność wyświetlania wszystkich informacji użytkownikowi**. Co więcej **użytkownik w ogóle nie musi być zaangażowany w ten proces**. 

Przykład interakcji, obrazujący możliwości o których tutaj mówimy, wygląda następująco: 

1. **Zapytanie użytkownika: "Jak zainstalować LLaMA2 na MacOS?"**
2. [Weryfikacja zapytania pod kątem polityki OpenAI]
3. [Weryfikacja zapytania pod kątem naszych zasad]
4. [Wzbogacenie zapytania kontekstem konwersacji]
5. [Skorzystanie z wyników wyszukiwania w Internecie]
6. [Przeszukanie naszej bazy wiedzy]
7. [Wybór pasujących wyników]
9. [Podsumowanie zawartości wybranego źródła]
10. [Wygenerowanie odpowiedzi przez LLM]
11. [Zweryfikowanie odpowiedzi przez LLM]
12. **[Przesłanie odpowiedzi użytkownikowi]**

Z punktu widzenia użytkownika, widoczne są tylko dwa, pogrubione kroki z powyższej listy. Reszta wykonywana jest w tle. W celu optymalizacji całego procesu, część zadań może być zrealizowana w tle lub korzystać z zapamiętanych wcześniej informacji (np. podsumowania wybranych stron).

W przypadku łączenia ze sobą promptów ogromne znaczenie odgrywa ich **dopracowanie**. Ze względu na wszystkie cechy modelu związane z **niedeterministyczną naturą** czy brakiem **pełnego wpływu** na jego zachowanie, musimy dążyć do **zminimalizowania ryzyka** niepożądanego zachowania.

![](https://cloud.overment.com/perfect-b7ecffbf-8.png)

Tym bardziej, że w przypadku **powiązanych promptów**, gdy jeden z nich zawiedzie, te które występują po nim również nie spełnią swojego zadania. Niebawem przekonasz się o tym w praktyce.

## Projektowanie promptów z pomocą AI i optymalizacja

Wiedza na temat modeli oraz ogólnych zasad projektowania promptów nie jest wystarczająca do tego, aby robić to skutecznie. Oczywiście zakładając, że chcemy projektować coś więcej, niż proste interakcje. Powodem tego jest fakt, że pracujemy tutaj z językiem naturalnym, a to wymaga dodatkowej kreatywności, szerokiej wiedzy, bogatego słownictwa i ogólnej precyzji. **Nawet jeśli swobodnie czujesz się w tych obszarach**, to niezwykle pomocna przy projektowaniu promptów staje się sztuczna inteligencja, a konkretnie GPT-4 dostępny w Playground.

Projektując prompt w ten sposób, pamiętaj o tym, aby: 

- Instrukcja systemowa nadawała odpowiednią rolę, np. Senior Prompt Engineer oraz przedstawiała cel rozmowy
- Zacznij od prostego promptu, aby nadać ogólny ton, który rozbudujesz wspólnie z GPT-4
- W instrukcji musisz uwzględnić także wyraźne podkreślenie tego, aby model **nie realizował instrukcji w podanym przez użytkownika prompcie**
- Warto także zasugerować, aby pierwsza interakcja umożliwiała przekazanie promptu przez użytkownika, a odpowiedź modelu zawierała jedynie jego przegląd i wstępne rekomendacje, które pozwolą Ci zacząć, **bez ich natychmiastowego wprowadzania**
- Oczywiście model nie posiada zdolności do perfekcyjnej analizy Twoich promptów, ale trafnie wskazuje różnego rodzaju błędy logiki czy sugeruje zmiany słów czy wyrażeń
- Przy projektowaniu promptów korzystaj z GPT-4
- Natomiast sterowanie projektowaniem promptu pozostawiaj sobie i podejmuj wszystkie decyzje związane z jego modyfikowaniem

Przykład Playground, który ja wykorzystuję do swojej pracy znajdziesz poniżej. **Nie jest to jednak instrukcja z której korzystam zawsze**, lecz raczej schemat, wokół którego się poruszam. Szczegóły zawsze różnią się w zależności od tego, jaki prompt chcę zaprojektować. 

![](https://cloud.overment.com/design-38c47cc0-2.png)

— 🔗 [zobacz przykład](https://platform.openai.com/playground/p/Cx1IqImlXBnW5LORydujRUKY?model=gpt-4)

Dokładnie na tej samej zasadzie możesz pracować nie tylko nad promptami, ale także innymi zadaniami wymagającymi precyzji oraz możliwości **dużej kontroli nad zachowaniem modelu**. Playground jest świetnym narzędziem, które sprawdza się w takich sytuacjach. Pamiętaj o możliwości zapisywania interakcji przyciskiem "Save" oraz **dbaj o czytelne i zrozumiałe nazwy zapisanych interakcji**. 

Proces projektowania promptów wygląda więc zatem u mnie następująco: 

- **Szkic:** Pierwszy, ogólny szkic, mający na celu rozpoznanie zachowania modelu dla konkretnego zadania. Na tym etapie pomijam kwestię optymalizacji i skupiam się na dojściu do celu.
- **Weryfikacja:** Drugi etap polega na przygotowaniu zestawów danych weryfikujących zarówno najbardziej prawdopodobne zastosowania, jak i te, niemal absurdalne, które przyjdą mi do głowy, mające na celu całkowicie zaburzyć działanie promptu. Uwzględniam tutaj także **zachowanie promptu dla większych zestawów danych**, np. obszernego kontekstu lub dłuższej konwersacji
- **Uruchomienie:** Trzeci etap zależy od przeznaczenia promptu. Zakładając, że mówimy o przetwarzaniu dokumentów, to podłączam kilka **krótszych** plików i sprawdzam, jak wyglądają efekty. Na tym etapie zwykle od razu wprowadzam jakieś poprawki.
- **Brainstorm:** Wspólnie z GPT-4, korzystając z Playground przeprowadzam analizę na podstawie moich obserwacji, sugestii modelu oraz moich przemyśleń. Gdy widzę, że GPT-4 rozumie działanie mojego promptu, przechodzimy do wykrycia nieścisłości czy zastosowania lepszych wyrażeń. Na tym etapie nierzadko dochodzi także do **optymalizacji** pod kątem długości promptu. Podczas tego etapu nierzadko podążam za sugestiami GPT-4, natomiast i tak **ostateczna decyzja pozostaje po mojej stronie**
- **Iteracja:** Wracam do punktu drugiego i kontynuuję proces do osiągnięcia pożądanych rezultatów oraz poczucia, że "moja praca jest tutaj zrobiona". Nierzadko w kolejnych iteracjach przełączam prompt na słabsze ale szybsze modele w wersji 3.5 i jeśli to możliwe, pozostaję przy nich w celu optymalizacji kosztów.

Oczywiście możesz opracować swój własny proces. Sam nie stosuję jeszcze testów automatycznych moich promptów, aczkolwiek zdarza mi się wykonywać proste skrypty przechodzące przez zestaw danych testowych. Jeśli rezultatem działania jest wynik, który mogę zweryfikować programistycznie (np. wygenerowanym przez GPT-4 wyrażeniem regularnym), to oczywiście to robię. 


#aidevs_2