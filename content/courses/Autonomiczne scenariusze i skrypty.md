---
title: Autonomiczne scenariusze i skrypty
type: course
tags: 
aliases:
---
# C04L03 — Autonomiczne scenariusze i skrypty

Widzimy już, że możemy tworzyć elastyczne skrypty i automatyzacje, wykraczające poza sztywne ścieżki instrukcji warunkowych. Co więcej, wiemy już w jaki sposób z pomocą kodu lub no-code budować dynamiczny kontekst promptu, co umożliwia LLM sięganie po informacje przydatne podczas realizowanego zadania. Wygląda więc na to, że nic nie stoi na przeszkodzie, aby część z zadań była realizowana bez naszego udziału i jedynie  **wymagała naszej weryfikacji**. Wchodzimy więc w obszar (częściowo) autonomicznych scenariuszy i skryptów, które mogą pracować dla nas, gdy śpimy.

## Harmonogram uruchamiania automatyzacji

Scenariusze automatyzacji oraz skrypty mogą być uruchamiane automatycznie według harmonogramu lub w odpowiedzi na zdarzenie (np. nowy e-mail). Programistycznie wykorzystujemy do tego cron, a w przypadku narzędzi no-code (make.com) możemy korzystać z domyślnie dostępnej opcji planowania uruchomień. 

Dobrze zaplanowany (nierzadko też niezwykle prosty) scenariusz lub skrypt uruchamiany regularnie, może pracować dla nas przez lata i oszczędzać czas. Oznacza to, że czas który włożymy w jego opracowanie będzie zwracać się nam wielokrotnie do momentu aż wyłączymy automatyzację. Na poniższym obrazku znajduje się jeden z takich scenariuszy, który odpowiada u mnie za pobieranie listy przeczytanych książek z Goodreads, zapisanie ich w mojej bazie oraz wygenerowanie okładek według zdefiniowanych szablonów. Przez ~2 lata wykorzystywałem go do regularnego publikowania wpisów z moimi notatkami. Dziś z wiedzy na temat tych książek korzysta Alice, przez co mogę prowadzić rozmowy na temat przeczytanych tytułów i łatwiej utrwalać wiedzę poprzez zestawianie jej z tym, co już do tej pory czytałem w innych książkach. 

![](https://cloud.overment.com/goodreads-57e3c4c9-2.png)

Inny przykład scenariusza uwzględnia "obserwowanie" mojego konta Github, a konkretnie dodawanych do niego "gistów" z których również automatycznie generują się grafiki na potrzeby moich publikacji (między innymi także AI_Devs).

![](https://cloud.overment.com/gist-5321b289-b.png)

Co ciekawe, takie integracje mogą wychodzić poza same skrypty czy automatyzacje, ale także uwzględniać obecność aplikacji i urządzeń. Powyższy scenariusz uwzględnia także gisty, które dodaję bezpośrednio z mojego edytora kodu. To znaczy, że **bez opuszczania swojego IDE mogę generować grafiki z pomocą ray.so czy [snappify](https://snappify.com/)**. 

![](https://cloud.overment.com/ide-f0af1c3f-5.png)

Scenariusze mogą uruchamiać się także na podstawie zdarzeń pochodzących z urządzeń, np. iPhone (aplikacja Shortcuts), czy zdarzeń wysyłanych przez platformy takie jak zencal.io lub systemy CRM. Co więcej, różne zdarzenia mogą się ze sobą łączyć i układać w serię, np. zapisany na pulpicie plik może zostać zidentyfikowany jako faktura i z pomocą Hazel (macOS) czy File Juggler (Windows) przenieść do Google Drive czy Dropbox z odpowiednią etykietą. Tak zgromadzone pliki mogą zostać przejrzane na koniec miesiąca i przekazane do księgowości. 

## Autonomiczne porządkowanie informacji z AI

Obecnie automatyzacje wykonywane w tle mogą realizować znacznie bardziej złożone zadania, ponieważ o sposobie ich wykonania może decydować prompt działający na dostarczonych danych. Nawet tak stosunkowo proste mechaniki jak **systemy powiadomień** mogą działać teraz na zupełnie nowym poziomie, co obrazuje przykład **29_notify**, w którym niemal w pełni wykorzystałem kod z przykładu 21_similarity. Zmieniłem jednak treść promptu, która tym razem odpowiada za przyporządkowanie zadania do jednej z trzech osób: mnie, Jakuba i Mateusza lub ogólnej kategorii. 

![](https://cloud.overment.com/notify-58a1b988-9.png)

Wykorzystując Similarity Search możemy dynamicznie wczytywać informację na temat osoby, w której zakresie odpowiedzialności jest wykonanie opisanego zadania i wysłać jej powiadomienie z prośbą o jego wykonanie. Nic nie stoi też na przeszkodzie, aby mechanika poszła krok dalej i nie tylko zlecała wykonanie zadania, ale także dostarczała niezbędne informacje, pobrane z dostępnych źródeł wiedzy. 

Zatem łącząc to wszystko w całość, otrzymujemy szablon następującej mechaniki: 

- zewnętrzne zdarzenie lub harmonogram uruchamiają automatyzację, która otrzymuje lub pobiera dane
- GPT-4 weryfikuje dane, porównując je z informacjami zapisanymi w pamięci długoterminowej i na ich podstawie "decyduje" co dalej
- Logika w kodzie lub automatyzacji realizuje dalsze kroki, które mogą uwzględniać różne działania. Co więcej, wiemy już, że takie działania **mogą być wybierane i podejmowane automatycznie z pomocą Function Calling**
- Informacja o podjętym działaniu może zostać przekazana do właściwych osób, lub zalogowana w historii podjętych akcji. W moim przypadku zwykle jest to kanał Slack typu "heartbeat" w którym moje boty raportują podjęte działania. 

Dokładnie powyższy schemat możemy wykorzystywać do:

- porządkowania bazy wiedzy, zasobów, zadań czy wiadomości
- organizacji plików i folderów
- przetwarzania dokumentów (np. korekty)
- złożonych procesów zbierania zewnętrznych informacji
- wzbogacania lub formatowania danych (zakładając, że nie może być to wykonane programistycznie)
- realizowanie złożonych zadań wymagających sięgania po różne narzędzia lub nawet inne model (np. te dostępne w ramach usługi [Replicate](https://replicate.com/) lub działających na naszych serwerach)
- monitorowania procesów (np. według harmonogramu zapisanego w Notion czy Airtable)
- pilnowania standardów (np. utrzymywania harmonogramu poprzez przypomnienia wysyłane do zespołu czy sprawdzanie zgodności treści pod kątem spójności z tonem komunikacji marki)
- przygotowywania raportów, a nawet analiz, jednak tylko w połączeniu z zewnętrznymi narzędziami, które będą adresować ograniczenia modelu

Zasadniczo mówimy tutaj o sytuacjach w których albo wykonanie zadania jest proste, jednak trzeba je wykonywać regularnie, albo gdy zadanie jest złożone i wymaga więcej czasu i w związku z tym musi być przeprowadzone asynchronicznie.

Przykładowo, proste przypisanie zadań do kategorii jako zdarzenie, może wywoływać poniższy scenariusz. Jego zadaniem jest pobranie treści dodanego zadania, listy dostępnych projektów oraz skojarzenie jednego z drugim. Taki scenariusz jak ten możemy ustawić raz i zakładając, że listy projektów są stałe, przez lata możemy do niego nie zaglądać. 

![](https://cloud.overment.com/categories-04d70707-d.png)

- ⚡ [Pobierz schemat automatyzacji](https://cloud.overment.com/aidevs_tasks-1696628694.json)

Efekt jest taki, że poświęcając raz kilka minut na skonfigurowanie powyższego scenariusza, mogę praktycznie zapomnieć o porządkowaniu moich zadań na liście. Do przykładu celowo wybrałem tutaj Todoist, ponieważ posiada w API webhooki umożliwiające natychmiastowe reagowanie. Gdy w lekcji C03L05 mówiłem o wyborze aplikacji budowanych według podejścia "api-first" lub po prostu posiadających dobre API, między innymi takie możliwości miałem na myśli. 

![](https://cloud.overment.com/classify-1696629016.gif)

Aby budować takie proste, a jednocześnie przydatne automatyzacje (czy skrypty), konieczne jest zaobserwowanie swojego otoczenia i podejmowanych aktywności. Budowanie automatyzacji tylko po to, aby je tworzyć, nie ma tutaj sensu. W niektórych sytuacjach może to być nawet forma prokrastynacji, ponieważ automatyzacja jest jednym z ostatnich etapów budowania procesów i niemal nigdy nie powinno się od niej zaczynać (wyjątek stanowi sytuacja w której znamy już proces i budujemy go od podstaw, uwzględniając automatyzacje).

## (nie)pełna autonomia GPT-4

W tym momencie chciałbym wrócić do moich słów o tym, że "GPT-4 potrafi więcej, niż myślimy, i mniej, niż nam się wydaje". Można przekonać się o tym dość szybko podczas budowania scenariuszy takich jak ten, przyporządkowujący zadania do projektów. Mam tutaj na myśli kilka elementów:

1. Kontrolę wejścia / wyjścia
2. Złożoność realizowanego zadania
3. Skuteczność promptu
4. Produkcyjne zastosowanie

Przede wszystkim, samo zastosowanie **działającej w tle** mechaniki przyporządkowującej zadania do kategorii jest niezwykle wygodne dla użytkownika, ponieważ **nie musi nawet przez chwilę zastanawiać się nad swoim "promptem"**. W zamian, to system dopasowuje się do niego i po prostu wykonuje zlecone zadanie. Wielokrotnie przekonałem się już, że to właśnie takie zastosowania LLM mają największy potencjał adaptacji wśród użytkowników, ponieważ w założeniu nie wymagają posiadania jakiejkolwiek wiedzy na temat interakcji z AI. 

Oczywiście nadal mamy tutaj kwestie dotyczące prywatności czy nawet potencjalnego ataku ze strony użytkownika (nawet przypadkowego). W tym jednak przypadku nie mówimy o "wycieku promptu" czy nadpisania instrukcji. Nawet jeśli treść zadania zawierałaby złośliwy prompt, to przypisanie go w takiej formie do złej kategorii, nie powinno być problemem (o ile nie działają tam kolejne automatyzacje i skrypty podatne na takie działania). Tak czy inaczej, warto mieć to na uwadze.

Po zaimportowaniu scenariusza zobaczysz, że napisany przeze mnie prompt wykorzystujący strukturyzowanie danych, nie jest szczególnie skomplikowany. Pomimo tego, jego odpowiednik działa dla mnie od kilku miesięcy, wprowadzając porządek w moich notatkach i zadaniach. Na tym jednak się nie kończy, ponieważ poza przypisaniem projektu, mam także zarządzanie datą czy ustaleniem priorytetu. Poza tym złożoność mojej listy zadań jest minimalna i nie uwzględnia przypisywania jakichkolwiek osób. 

![](https://cloud.overment.com/categories-f4ebe26e-c.png)

Opisanie (w tym przypadku) zadania może odbywać się zarówno przez pojedynczy prompt, jak i serię małych instrukcji. Jedno i drugie podejście ma swoje zalety oraz wady. Bardziej rozbudowany prompt nadaje szerszy kontekst ale jest trudniejszy w utrzymaniu, a w przypadku rozbicia go na mniejsze, zwykle bywa odwrotnie. W zależności od wybranej strategii będzie zależeć zarówno utrzymanie **skuteczności** realizowanego przez model zadania, jak i **trudność utrzymania i rozwoju**. 

Sytuacja staje się jeszcze bardziej złożona, gdy podejmiemy się zrealizowania automatyzacji czy skryptu, działających w typowym produkcyjnym środowisku. Zwykle aplikacje do zadań (np. Clickup) konfigurowane są w taki sposób, aby rozdzielać zadania na wiele projektów, kategorii czy statusów. Wówczas mechanizm automatycznie klasyfikujący zadania staje się skomplikowany i podatny na błędy. Jednak nawet wtedy nie musimy rezygnować z zastosowania LLM, ponieważ możemy zmienić założenia i zamiast oczekiwać, że model samodzielnie dokona poprawnej klasyfikacji, to ograniczamy go jedynie do **sugerowania użytkownikowi tego, co może zrobić**. Dzięki temu kontrola pozostaje po stronie człowieka, a jednocześnie mamy realną wartość w postaci oszczędności czasu. 

Wnioski z tego przykładu sugerują, że: 

- Stosowanie LLM ma ogromny sens dla zadań "realizowanych w tle"
- Złożoność logiki budowanej na nasze potrzeby lub potrzeby prototypu jest nieporównywalnie mniejsza niż dla zastosowań produkcyjnych uwzględniających różne konfiguracje
- Jeden, większy prompt jest (zwykle) bardziej efektywny, jednak rozbicie zadania na mniejsze części ułatwia kontrolę i dalszy rozwój
- Ograniczanie wejścia / wyjścia zwiększa stabilność systemu, pozwala na obsługę błędów oraz zmniejsza ryzyka związane z bezpieczeństwem
- W przypadku złożonych lub istotnych operacji, dla obecnych modeli **wymagana jest obecność człowieka w celu weryfikacji**
- Automatyzacja (i AI) sprawdza się w przypadku ukształtowanych procesów i nie warto po nią sięgać na początkowym etapie ich projektowania (ale warto już wtedy uwzględniać)

Biorąc pod uwagę stosunek inwestycji czasu do wynikających z niego korzyści, powyższe wątki są prawdopodobnie najbardziej efektywnym działaniem z całego kursu AI_Devs.

## Autonomiczne monitorowanie, raporty, research

Scenariusze i skrypty wykorzystujące AI, które mogą pracować dla Ciebie w odpowiedzi na zdarzenia czy zgodnie z harmonogramem, mogą być złożone i składać się z różnych komponentów. 

W przykładzie **30_youtube** przygotowałem skrypt, który wyraźnie do podkreśla, poprzez **obserwowanie nowych filmów na kanale moim, Mateusza i Kuby**. Nie tylko sprawdza czy na wskazanych kanałach pojawiły się nowe filmy, ale także pobiera ich transkrypcję (o ile jest dostępna). Zebrane w ten sposób informacje mogą zostać zapisane albo bezpośrednio w bazie wiedzy (np. Airtable), ale także być wykorzystane do przygotowania np. podsumowania, raportu czy nawet prywatnego newslettera i podcastu. Źródło danych również może być praktycznie dowolne. 

Ostatecznie chodzi nam (jak zwykle) o zgromadzenie opisanych danych, z którymi możemy wygodnie pracować. W tym przykładzie będą to informacje o nowych filmach. 

![](https://cloud.overment.com/videos-c7d48fc9-3.png)

Informacje o filmach pobierane są **bezpośrednio z pliku XML** powiązanego ze wskazanymi kanałami. Następnie pobieramy także transkrypcję (za chwilę powiem o niej więcej), oraz łączymy ze sobą zgromadzone informacje. Skrypt mógłby być uruchamiany regularnie (np. raz dziennie lub raz w tygodniu), sprawdzać czy pojawiły się nowe filmy od ostatniego uruchomienia i jeżeli tak, to przygotowywałby np. wspomniane podsumowanie. 

![](https://cloud.overment.com/scrapper-68304a12-8.png)

Oczywiście nikt nie mówi, że w takich sytuacjach koniecznie musimy pracować z zewnętrznymi danymi, ponieważ na tej samej zasadzie źródłami danych mogą być nawet aplikacje z których korzystamy. U mnie przykładem był omawiany już serwis Goodreads. 

Załóżmy jednak, że faktycznie buduję aplikację, której zadaniem jest monitorowanie wskazanych przeze mnie źródeł i przetwarzanie ich w sposób umożliwiający mi zdecydowanie, które z nich warto przejrzeć. Wówczas, skoro jest to projekt **wyłącznie na moje potrzeby**, nie chcę wkładać w niego zbyt dużo czasu ani w przygotowanie, ani późniejsze utrzymanie. I tutaj do gry wchodzą narzędzia no-code. 

Poniższy scenariusz umożliwia mi bardzo łatwe pobranie transkrypcji z podanego filmu na YouTube. Analogiczne zadania w założeniu ma realizować także jeden z loaderów dostępnych w LangChain, jednak do tej pory nie udało mi się go uruchomić. Tutaj sytuacja również nie jest oczywista, ponieważ moduł YouTube został kilka lat temu wycofany z make, jednak sam posiadam do niego dostęp (i każdy, kto pobierze poniższy schemat scenariusza). 

![](https://cloud.overment.com/download-80995920-d.png)

- [Pobierz schemat automatyzacji](https://cloud.overment.com/aidevs_transcript-1696693379.json)


Ważne: natywne połączenie z YouTube nie działa już w przypadku tego modułu. Dlatego należy skorzystać z ustawień zaawansowanych  przy tworzeniu połączenia i podać w nich Client ID oraz Client Secret, które możemy wygenerować przechodząc przez proces opisany [tutaj](https://www.integromat.com/en/help/connecting-integromat-to-google-services-using-a-custom-oauth-client).

![](https://cloud.overment.com/oauth-c1cca877-1.png)

Wskazówka: Moduł YouTube widoczny poniżej posiada także trigger "Watch Channel" który także może być wykorzystany do prostego pobierania informacji o nowych filmach z wybranego kanału. Niestety jest w stanie obserwować jednorazowo tylko jedno źródło .

Zatem doszliśmy teraz do miejsca w którym: 

- mamy aplikację "obserwującą" wskazane kanały na YouTube
- jeśli to możliwe, poza opisem i tytułem filmów, pobierana jest także transkrypcja (do gry wchodzi napisanie także skryptu zdolnego do pobrania materiału wideo, i wygenerowanie własnej transkrypcji z pomocą whisper)
- narzędzia no-code znacznie ułatwiły nam zbudowanie aplikacji, zdejmując z nas konieczność nawiązywania połączenia OAuth2.0 z poziomu kodu (aczkolwiek akurat tutaj prawdopodobnie możliwe jest także pobranie transkrypcji w prostszy, nieznany mi sposób)
- aplikacja po włączeniu może pracować dla nas przez długie miesiące czy nawet lata

Oczywiście w tym przypadku pominęliśmy najważniejszy punkt, czyli faktyczne przetwarzanie zgromadzonych danych. Nie widzę jednak potrzeby na tym etapie powtarzania mechanik, przez które już przechodziliśmy, tym bardziej, że w praktyce i tak będzie trzeba dostosować je do swoich potrzeb.

Bardzo istotny jest tutaj także fakt, jak bardzo przygotowany skrypt **odciążył model**, przejmując na siebie w zasadzie wszystkie zadania związane ze zgromadzeniem danych. Otrzymaliśmy w ten sposób aplikację, w której za chwilę może pojawić się LLM, ale jego rola sprowadzi się wyłącznie do zadania, do którego faktycznie został stworzony. Naturalnie mogą się jednak zdarzyć sytuacje, które będą wymagały zastosowania technik przedstawionych w przykładzie **12_web**, jednak tym razem z pewnością to nie był ten moment. 



#aidevs_2