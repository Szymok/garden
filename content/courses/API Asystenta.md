---
title: API Asystenta
type: course
tags: 
aliases:
---
# C05L02 API Asystenta

W lekcji C04L04 omawialiśmy własne API i teraz rozwiniemy ten wątek o codzienną pracę z asystentem, który sam w sobie uzupełnia nasze prywatne API i obecne w nim narzędzia. Zasadniczo naszym celem jest sprawienie, aby asystent stał się dla nas **stale dostępny** oraz, aby był w stanie działać **częściowo niezależnie**. 

## Tryby działania

Nawet dla stosunkowo prostych zadań wymagających angażowania pamięci długoterminowej asystenta, czas reakcji rośnie do kilku lub nawet kilkudziesięciu sekund. Jednak dobrze zaprojektowany system będzie w stanie realizować nawet złożone zadania szybciej, niż człowiek. Pomimo tego, oczekiwania wobec Sztucznej Inteligencji są zwykle bardzo wysokie i każda sekunda odgrywa tutaj istotną rolę. Jak niebawem się przekonamy, do wielu zadań nie potrzebujemy angażować szczególnie złożonych mechanik, ponieważ z powodzeniem wystarczy nam bazowa wiedza oraz umiejętności modelu. Warto więc projektować swój system tak, aby mógł pomijać zbędne kroki i sięgać po zaawansowane funkcjonalności tylko wtedy, gdy jest to niezbędne. 

Dodatkowo nawet stosunkowo prosty asystent wykorzystujący GPT-4 może generować dość wysokie koszty, co w prywatnym zastosowaniu może być nieuzasadnione. Warto więc dążyć do **odciążenia LLM**, optymalizację systemu pod GPT-3.5-Turbo czy korzystanie z obu wersji modelu w zależności od rodzaju wykonywanego zadania. Z tego powodu **wszystkie ustawienia asystenta** powinny być dynamiczne i łatwo modyfikowane. Ostatecznie nawet przełączenie się na inny model powinno odbywać się możliwie łatwo.

W aplikacji Alice posiadam dwa tryby: 

- **⌘ Enter**: Wysyła konwersację bezpośrednio do OpenAI. Czas reakcji jest tutaj bardzo niski, jednak nie korzystam tutaj z jakichkolwiek interakcji z bazą danych
- **CapsLock Enter**: Wysyła wiadomość do mojego API, gdzie budowana jest bieżąca konwersacja. Tutaj domyślnie czas reakcji wynosi ~1.5 sekund dla zwykłych zapytań (GPT-4-turbo), które nie wymagają interakcji z zewnętrznymi usługami. (Jeśli zastanawia Cię wykorzystanie przycisku CapsLock, to chodzi tutaj o koncepcję "hyper-key", czyli wykorzystania aplikacji [Karabiner](https://karabiner-elements.pqrs.org) do tego, aby system interpretował wciśnięcie CapsLock jak kombinację wszystkich klawiszy funkcyjnych ⌘⌥⌃⇧).

Analogicznie różne tryby funkcjonują na telefonie, gdzie mam zdefiniowane dwa makra Shortcuts — Alice i Hey Alice. Pierwsze umożliwia wysłanie wiadomości **tekstowej**, a drugie **głosowej**. W przypadku telefonów innych niż iPhone, analogiczne rozróżnienie może mieć miejsce bezpośrednio w komunikatorze Slack czy Telegram. Z punktu widzenia API, nie ma to jednak różnicy, ponieważ zapytanie przekazywane jest jako tekst. Oznacza to, że transkrypcja ma miejsce albo bezpośrednio na telefonie / zegarku, albo w scenariuszu automatyzacji. 

![](https://cloud.overment.com/aidevs_record-d730195a-3.png)

Na telefonie pracuję z asystentem zarówno poprzez komunikator jak i Siri Shortcuts, ponieważ w tym drugim przypadku do gry wchodzą także dodatkowe automatyzacje czy chociażby przesyłanie informacji z urządzenia do API. Na zrzucie ekranu powyżej, makro "Listen" odpowiada za nagranie audio oraz przekazanie go jako plik do scenariusza make, który jest banalnie prosty. Teoretycznie sama transkrypcja mogłaby zostać zrealizowana bezpośrednio na telefonie, jednak z poniższego scenariusza korzystam także w innych sytuacjach i zależy mi na utrzymaniu jego konfiguracji w jednym miejscu. Przez konfigurację, mam na myśli dołączenie słów kluczowych, które często padają w moich konwersacjach z Alice. Są to chociażby nazwy własne, takie jak AI_Devs, overment, techsistence czy eduweb.pl.

![](https://cloud.overment.com/aidevs_listen-1c8d3846-a.png)

## Proaktywne działanie i reagowanie na zdarzenia

Skoro interakcja z asystentem odbywa się poprzez wymianę wiadomości, to nic nie stoi na przeszkodzie, aby to skrypt lub automatyzacja prowadziły konwersację. Przykładowo w trakcie wystąpienia jakiegoś zdarzenia, powiązane z nim informacje mogą zostać przesłane do naszego API. Wówczas wiadomość może być zinterpretowana dokładnie tak samo, jakbyśmy sami ją wysłali. 

Jednym z przykładów, jest zapisywanie informacji na temat mojego samochodu lub zbliżających się podróży. Zapisanie lokalizacji pozwala zestawić ją z wydarzeniami i/lub z adresami często odwiedzanych przeze mnie miejsc (lub zbliżania się do nich). Mówimy więc tutaj o wyposażeniu asystenta w dane na temat naszego otoczenia / środowiska, co może być wykorzystane w dalszych interakcjach. 

![](https://cloud.overment.com/aidevs_car-5b1cb5ac-c.png)

Jak widać, mamy tutaj **polecenie** zapisane naturalnym językiem z dynamiczną informacją o lokalizacji. Dokładnie na takiej samej zasadzie możemy budować scenariusze automatyzacji czy skrypty. Dzięki strukturze API asystenta i koncepcji "jednego punktu wejścia", dodawanie takich integracji jest niezwykle proste. 

Należy tylko zadbać o to, aby **można było je wykonywać równolegle**, to znaczy zapytania **nie mogą być przechowywane w jednej konwersacji**, aby nie przeszkadzały sobie wzajemnie. Przy okazji omawiania prywatnego API pokazywałem jak stosuję **conversation_id** do odróżnienia wątków.

![](https://cloud.overment.com/aidevs_conversation-a7b67912-e.png)

Jak widać, każda odpowiedź zwraca także identyfikator. Jeżeli chcę kontynuować wątek, to po prostu wykorzystuję tą wartość w kolejnym zapytaniu. Nie jest to jednak jedyna rzecz, na którą musimy zwrócić uwagę, ponieważ do gry wchodzą także limity API i (już sporadycznie) zdarzające się braki dostępności. Aby sobie z nimi poradzić można zastosować prostą kolejkę, która ze względu na dostępność w automatyzacjach, funkcjonuje w Airtable i za moment o tym opowiem. 

## Zadania asynchroniczne i harmonogram

Airtable do kolejkowania poleceń jest bardzo proste, ale głównym powodem jest tutaj fakt, że reszta systemu wymaga zaledwie przesłania polecenia. W związku z tym, przechowuję tutaj informację o tym kiedy (ewentualnie w jakich okresach) ma zostać uruchomione i czy miało to miejsce. W chwili gdy warunek dotyczący czasu realizacji zostaje spełniony, rekord pojawia się w tym widoku, a wiadomość zostaje przesłana do Alice, a rekord oznaczony jako "zrealizowany". 

![](https://cloud.overment.com/aidevs_schedule-095864e3-8.png)

Samo dodawanie wpisów do powyższej tabeli również odbywa się poprzez proste polecenie, które może zostać przekazane z pomocą dowolnego interfejsu (w tym także głosowo). Poniżej widzimy, że potwierdzenie zaplanowania włączania Spotify codziennie o 6:30. To dopisuje nowy rekord do Airtable. 

![](https://cloud.overment.com/aidevs_plan-afa22ddb-3.png)

W celu prezentacji na potrzeby tego przykładu przestawiłem godzinę na 16:30. Jak widać rekord faktycznie pojawił się w widoki "Current" i to zdarzenie zostało potraktowane jako "trigger" scenariusza odpowiedzialnego za wydawanie poleceń Alice. 

![](https://cloud.overment.com/aidevs_command-3895a04a-d.png)

Sam scenariusz jest już tylko formalnością, ponieważ jego jedyną rolą jest **pobranie rekordu, przekazanie polecenia do Alice oraz oznaczenie rekordu jako zakończony**. Tutaj tylko trzeba zaznaczyć obecność natywnego modułu Alice, który przygotowałem na swoje potrzeby przez API make.com. Oczywiście nie jest to potrzebne i z powodzeniem można korzystać z modułu HTTP w celu nawiązania połączenia z API swojego asystenta. 

![](https://cloud.overment.com/aidevs_perform-f63d3f41-f.png)

Cały schemat reagowania na zdarzenia oraz działania według ustalonego harmonogramu, który także sterowany jest z pomocą poleceń, bardzo dobrze obrazuje fakt, że mówimy tutaj praktycznie o **jednorazowej konfiguracji**. Powyższe scenariusze i tabele teraz otworzyłem pierwszy raz od momentu ich utworzenia. Bardzo wyraźnie podkreśla to ogromną elastyczność, jaką cechują aplikacje integrujące LLM, o której już mówiłem. Teraz praktycznie nie robi mi różnicy to, czy moduł planowania jest obecny czy nie. Po prostu działa niezależnie i tylko wysyła polecenia do głównego API asystenta, które swobodnie interpretuje i realizuje każde z nich.

## Raportowanie i powiadomienia

Poruszaliśmy temat monitorowania aplikacji integrującej LLM, jednak w przypadku asystenta, sięga to znacznie dalej, ponieważ nierzadko będzie nas interesować informacja o podjętych działaniach. Jest to o tyle istotne, że niektóre z aktywności wprost będą wymagać od nas podjęcia dodatkowych kroków, więc zwyczajnie musimy mieć wiedzę o tym, co jest jeszcze do zrobienia. 

Wiemy już, że z pomocą narzędzi no-code, możemy w prosty sposób przygotować integrację z popularnymi komunikatorami. Nie ma także problemu z wysyłaniem maili. I chociaż przesyłanie automatycznie generowanych przez LLM wiadomości bezpośrednio do klientów **to zły pomysł**, tak już wysyłanie powiadomień do siebie, jest pomocne.

Sam system powiadomień stosowałem już od dawna z moimi dotychczasowymi botami. Wówczas pełniły one jednak funkcję wyłącznie informacyjną, a przesyłane komunikaty były bardzo generyczne, budowane na podstawie prostych szablonów z dynamicznymi fragmentami.

![](https://cloud.overment.com/aidevs_bots-832a0c09-3.png)

Teraz praktycznie każde powiadomienie jest unikatowe ponieważ GPT-3.5-Turbo lub GPT-4 generuje je poprzez wykorzystanie parafrazy i różnych, losowych zmiennych (np. aktualnej daty i godziny). 

Nawet proste powiadomienia generowane przez asystenta, mogą być bardzo spersonalizowane. W związku z tym, że Alice posiada różne informacje na temat otoczenia (np. pogoda) oraz ogólne dane na mój temat pochodzące z publikowanych przeze mnie treści, to nawet wiadomość o zrobieniu przerwy może wyglądać tak jak poniżej.

![](https://cloud.overment.com/aidevs_break-9352a7fc-7.png)

Choć może wydawać się to bez znaczenia, to tak spersonalizowane wiadomości, po prostu zachęcają mnie do faktycznego zrobienia sobie przerwy. Oczywiście mówimy tutaj o czymś więcej, niż nietypowym powiadomieniu, ale o systemie zdolnym do sięgania po dowolne, podłączone usługi i aplikacje. Na podstawie pobranych danych, może poinformować nas nawet o rzeczach, które normalnie mogłyby zostać pominięte. 

To wszystko może jeszcze pójść krok dalej, ponieważ Alice ma możliwość wysyłania zapytań na mój komputer. W związku z tym, że korzystam z systemu OSX, mam do dyspozycji AppleScript, który może wykonywać praktycznie dowolne akcje. W przypadku systemu Windows dostępny jest Autohotkey, który pełni podobne (choć moim zdaniem bardziej ograniczone) funkcje. 

Dla przykładu skrypt poniżej pobiera zmienną zawierającą Spotify URI i przekazuje ją do aplikacji. W rezultacie, dany utwór zostaje odtworzony.

![](https://cloud.overment.com/aidevs_play-66518faf-9.png)

Ponownie jest to przykład prostej akcji, którą zbudowałem na swoje potrzeby. Celowo pokazuję go tutaj, aby podkreślić sugestię Andreja Karpathy, która padła podczas rozmowy z Lexem Fridmanem

> Beginners often focus on "what to do," but I think the emphasis should be more on "how much you do." ~ Andrej Karpathy (źródło: [Lex Fridman Podcast](https://www.youtube.com/watch?v=cdiD-9MMpb0))

Choć powiadomienia o przerwach czy odtwarzanie muzyki brzmią wprost bezużytecznie, to (nie tylko w moim przypadku) dostarczają mnóstwo pozytywnej energii oraz **pozwalają na testowanie różnych koncepcji w środowisku, w którym wszystko może pójść nie tak, i nie będzie stanowiło to problemu**. To właśnie w ten sposób eksploruję możliwości AI i dzięki temu potrafię budować teraz zaawansowane systemy, posługując się prostymi mechanikami. 

## Aplikacja desktopowa

Aplikacja dostępna na komputerze stała się dla mnie na tyle istotna, że postanowiłem stworzyć ją od podstaw. W porównaniu do pozostałych interfejsów wyróżnia się tym, że daje mi możliwość przypisania **globalnych skrótów klawiszowych** oraz pozwala korzystać z GPT-4 **bez zmiany kontekstu** (co sprzyja skupieniu).

Pomimo tego, przez kilka pierwszych tygodni, bardzo trudno było mi wyrobić nawyk korzystania z tych skrótów i wydawało się, że wygodnie jest otwierać okno przeglądarki i ChatGPT wewnątrz niego. Nie ma więc wątpliwości, że wymaga to czasu oraz aktywnej uwagi na początkowym etapie. 

Aktualnie korzystam z następujących skrótów: 

- CapsLock T: Tłumaczenie w luźnym tonie
- CapsLock R: Poprawienie literówek
- CapsLock W: Szybka notatka
- CapsLock Q: Szybkie zadanie
- CapsLock C: Szybkie wydarzenie
- CapsLock A: Szybka odpowiedź asystenta
- CapsLock S: Polecenie głosowe
- Control Shift S: Włączenie muzyki
- Control Shift W: Złożone obliczenia

Jak widać, nie ma tego dużo, ponieważ są to wyłącznie te akcje z których korzystam najczęściej. Niemal wszystkie pokazywałem już we wcześniejszych lekcjach. Zwykle przypisane są do nich stosunkowo proste prompty, które wyraźnie opisują to, co chcę osiągnąć. Poniżej znajduje się przykład promptu odpowiedzialnego za tłumaczenia, który przez ostatnie miesiące sprawdza mi się bardzo dobrze. 

![](https://cloud.overment.com/aidevs_write-157d52e3-c.png)

Nie ma więc tutaj niezwykłych technik, czy tajemnic, które zachowałem wyłącznie dla siebie. Jest to po prostu wdrożone i połączone z moimi nawykami. Dodam tylko, że ogólnych akcji z których korzystam, jest więcej. Część z nich jest jednak na etapie "eksperymentalnym" i zwyczajnie po jakimś czasie określam, czy rzeczywiście są mi pomocne, czy w ogóle z nich nie korzystam. 

W związku z tym, że wygenerowanie odpowiedzi ze strony modelu, szczególnie GPT-4 zajmuje czas, tutaj także korzystam z powiadomień informujących mnie o zakończeniu pracy modelu. Poza tym, w związku z tym, że korzystam z aplikacji Paste, jako managera schowka, automatyczne skopiowanie odpowiedzi uruchamia krótki dźwięk. 

![](https://cloud.overment.com/aidevs_notify-1697131965.gif)

Dla akcji przypisanych do skrótów klawiszowych, niemal zawsze interesuje mnie niski czas reakcji, dlatego są one podłączone do trybu przesyłającego dane bezpośrednio do OpenAI. Jednak są wśród nich również takie, w przypadku których bardziej interesuje mnie przesłanie informacji, niż otrzymanie odpowiedzi. Wówczas zapytanie kierowane jest do API asystenta. Odróżnianie tych dwóch scenariuszy jest istotne z punktu widzenia ogólnej użyteczności całej aplikacji. 

Ostatecznie możesz uznać, że aplikacja desktopowa nie będzie Ci potrzebna, tym bardziej, że na rynku pojawia się coraz więcej aplikacji oferujących minimalne połączenie z OpenAI (np. Raycast AI). Poza tym interakcja z asystentem poprzez ulubiony komunikator, również może być w pełni wystarczająca. 

## Asystent posługujący się własnym API

W lekcji C04L04 nawiązywałem do tego, że do narzędzi z których korzysta asystent, należą także endpointy jego własnego API. Dzięki mechanikom **dialogu wewnętrznego** czy też **autorefleksji**, otwiera się przestrzeń do organizowania wspomnień, planowania czy nawet do ulepszania samego siebie (!). Po prostu asystent mówiąc do siebie, może zmieniać swój wewnętrzny stan i tym samym jego późniejsze zachowanie. 

W związku z tym, że jako użytkownicy korzystamy z API Asystenta (niemal zawsze) za pośrednictwem głównego endpointu, to pozostałe akcje, uruchamiane są przez asystenta. Jednym z poleceń może być wcześniejsze **planowanie działań**. Poniżej widać, że użytkownik mówi "Włączaj muzykę codziennie o 6:30 rano", natomiast asystent sięga po swoje własne API i zapamiętuje to polecenie jako "Mam włączać muzykę codziennie o 6:30 rano". Dochodzi więc tutaj do zamiany polecenia w taki sposób, aby asystent "wiedział", że podjęcie działania należy do niego.

![](https://cloud.overment.com/aidevs_self-d9ba6aa6-7.png)

Podobne mechaniki są raczej niespotykane w przypadku aplikacji, w których nie ma AI. Ostatecznie mówimy tutaj o prostym prompcie, który musi zawierać precyzyjne wyjaśnienie o sposobie transformacji takich poleceń. Należy jednak zwracać uwagę na tzw. [Reversal Curse](https://owainevans.github.io/reversal_curse.pdf), czyli problem w rozumowaniu Dużych Modeli Językowych, związany z rozumieniem relacji. Np. informacja o tym, że Alice jest moim asystentem, nie jest wystarczająca do tego, aby model zauważył, że moim asystentem jest Alice (odwrócona relacja). Problem ten występuje zdecydowanie rzadziej w przypadku GPT-4 (ale nadal jest obecny). 

![](https://cloud.overment.com/aidevs_reversal-69efd927-7.png)

Nie trzeba także podkreślać, że projektowanie takich procesów jak wewnętrzny dialog, nie należy do najprostszych. Chcę jednak mieć pewność, że ogólne zasady są tutaj zrozumiałe, zatem na przykładzie Alice, wygląda to następująco: 

- Alice posiada własne API, uwzględniające swobodny dostęp do dowolnego obszaru pamięci oraz narzędzi.
- Najważniejszym elementem API jest główny endpoint, w którym dochodzi do rozpoznania intencji wynikającej zarówno z polecenia, jak i kontekstu bieżącej konwersacji
- Alice nie zapisuje żadnych informacji w swojej pamięci, bez wcześniejszej transformacji oraz wzbogacenia. Mówimy tutaj o wygenerowaniu wspomnienia na podstawie zarówno aktualnej wiadomości, jak i swoich wcześniejszych doświadczeń — czyli dokładnie tak, jak sami to robimy, jako ludzie. Chodzi tutaj wyłącznie o to, aby zapisać dane tak, aby mogły trafić bezpośrednio do promptu późniejszych interakcji i być poprawnie zinterpretowane przez model oraz aby możliwie nie było w nich sprzeczności. 
- Alice może "mówić do siebie" poprzez zwykłe przesyłanie wiadomości. Obowiązują więc tutaj dokładnie te same zasady z wyjątkiem faktu, że taka wiadomość podkreśla, że jest to **dialog wewnętrzny**. Nie dochodzi więc tutaj do wspomnianych transformacji uwzględniających chociażby zamianę "ja" na "overment", ponieważ tutaj "ja" to "Alice".
- Dzięki wykorzystaniu tego samego interfejsu oraz dostępności własnego API, Alice może samodzielnie zaktualizować wybrane wspomnienia i połączyć je z nowymi faktami, pochodzącymi np. z otoczenia lub zewnętrznych aplikacji.

I teraz obrazując to na przykładzie: 

- overment: Alice, czy możesz zapamiętać, że mój nowy komputer to od teraz (...)
- [Alice]: *rozpoznaje prośbę o zapamiętanie*
- [Alice]: *pobiera wspomnienia na temat sprzętu z którego korzystam*
- [Alice]: *aktualizuje treść swojego wspomnienia, zamieniając "mój nowy komputer" na "nowy komputer Adama"*
- [Alice]: *odbiera potwierdzenie ze swojego API o pomyślnym wykonaniu zadania*"*
- Alice: Jasne, że tak! Zaktualizowałam listę sprzętu na którym pracujesz. Mam nadzieję, że Twój nowy komputer będzie Ci dobrze służył. 

Dokładnie na tej samej zasadzie odbywa się wewnętrzny dialog. Gdy spojrzymy na to z programistycznego punktu widzenia oraz naszej wiedzy na temat LLM i projektowania promptów, to łatwo zobaczymy, że sam mechanizm nie jest szczególnie skomplikowany. To detale z których się składa, stanowią tutaj wyzwanie. Tym bardziej, że mówimy tutaj o logice, która przez większość czasu wykonuje się bez naszego aktywnego zaangażowania. 

**WAŻNE!** Cały czas posługuję się tutaj przykładem Alice. Jednak gdy przez chwilę się nad tym zastanowisz, to jasne stanie się, że **wiele elementów opisywanej tutaj mechaniki, może być wykorzystana na potrzeby innych systemów**. Mam na myśli nie tylko czatboty, ale także przeróżne, wyspecjalizowane narzędzia, zajmujące się przetwarzaniem danych czy wykonywaniem określonych zadań z pomocą dostępnych narzędzi. 

Zmierzam do tego, że w przypadku budowania asystenta lub zaawansowanego systemu w którym pojawia się LLM, nasze "programistyczne myślenie" musi się nieco zmienić i skierować w stronę naturalnego języka oraz związanych z tym transformacji. Większość takich sytuacji wychodzi dość naturalnie i równie naturalnie przychodzi ich adresowanie. Trzeba tylko pamiętać o tym, aby **sprawdzać nasz system w różnych scenariuszach** i mając na uwadze obecne ograniczenia modeli (np. wspomniany reversal curse) kształtować aplikację w oczekiwany sposób. Do powyższego wątku będziemy jeszcze wracać w nadchodzących, ostatnich lekcjach AI_Devs.


#aidevs_2 