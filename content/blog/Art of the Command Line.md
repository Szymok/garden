---
title: Art of the Command Line
tags: 
aliases:
---
# Sztuka używania wiersza poleceń

*Uwaga: Poszukuję nowego (i potencjalnie odpłatnego) głównego autora, który pomoże rozszerzyć ten materiał do formy bardziej wszechstronnego Przewodnika. Chociaż jest on bardzo popularny, mógłby być zarówno obszerniejszy jak i bardziej pomocny. Jeśli lubisz pisać, jesteś niemalże ekspertem w tej dziedzinie i chcesz pomóc, daj mi znać na josh (0x40) holloway.com. –[jlevy](https://github.com/jlevy), [Holloway](https://www.holloway.com)*

- [Meta](#meta)
- [Podstawy](#Podstawy)
- [Codzienny użytek](#Codzienny-użytek)
- [Przetwarzanie plików i danych](#Przetwarzanie-plików-i-danych)
- [Debugowanie systemu](#Debugowanie-systemu)
- [Jednolinijkowce](#Jednolinijkowce)
- [Mniej znane, ale użyteczne](#Mniej-znane-ale-użyteczne)
- [Tylko dla macOS](#Tylko-dla-macOS)
- [Tylko dla Windows](#Tylko-dla-Windows)
- [Inne źródła wiedzy](#Inne-źródła-wiedzy)
- [Zastrzeżenie](#Zastrzeżenie)


![curl -s 'https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md' | egrep -o '`\w+`' | tr -d '`' | cowsay -W50](cowsay.png)

Biegła obsługa wiersza poleceń często jest umiejętnością zaniedbywaną lub uważaną za "wiedzę tajemną", ale poprawiającą elastyczność i produktywność inżynierów w sposób oczywisty jak i bardziej subtelny. Oto zbiór informacji i wskazówek na temat użycia wiersza poleceń, które uznaliśmy za przydatne w pracy z systemami Linux. Niektóre wskazówki dotyczą podstaw, inne zaś są całkiem specyficzne dla danego zagadnienia, wyszukane lub niezbyt powszechne. Ta strona nie jest obszerna, lecz znając i pamiętając sposób użycia wszystkiego, co zostało tutaj opisane - wiesz już dużo.

Niniejszy tekst jest efektem pracy zbiorowej [wielu autorów i tłumaczy](AUTHORS.md).
Niektóre z zagadnień
[początkowo](http://www.quora.com/What-are-some-lesser-known-but-useful-Unix-commands)
[pojawiły się](http://www.quora.com/What-are-the-most-useful-Swiss-army-knife-one-liners-on-Unix)
na [Quora](http://www.quora.com/What-are-some-time-saving-tips-that-every-Linux-user-should-know),
ale od tamtego czasu zostały przeniesione na GitHub, gdzie ludzie zdolniejsi od autora oryginalnego posta dokonali licznych poprawek.
[**Zadaj pytanie,**](https://airtable.com/shrzMhx00YiIVAWJg) jeśli jest ono związane z użyciem wiersza poleceń. [**Dodaj coś od siebie,**](/CONTRIBUTING.md) jeśli widzisz błąd lub uważasz, że coś można poprawić!

## Meta

Zakres:

- Ten przewodnik przeznaczony jest zarówno dla początkujących jak i doświadczonych. Jego cele uwzględniają *szerokość zakresu* (wszystko jest ważne), *konkretność* (podawane są konkretne przykłady dla najczęstszych przypadków użycia) oraz *zwięzłość* (unika się rzeczy nieistotnych lub dygresji dostępnych gdzie indziej). Każda wskazówka jest kluczowa dla danej sytuacji lub znacznie skraca czas w stosunku do użycia innego rozwiązania.
- Dokument ten napisany został dla systemów Linux (z wyjątkiem sekcji "[Tylko dla macOS](#Tylko-dla-macOS)" oraz "[Tylko dla Windows](#Tylko-dla-Windows)"). Wiele pozostałych poleceń ma zastosowanie lub może być zainstalowanych w innych systemach Unix lub macOS (lub nawet w Cygwinie).
- Główny nacisk położony jest na interaktywną pracę z Bashem, aczkolwiek wiele wskazówek odnosi się do innych powłok systemowych oraz do pisania skryptów w Bashu ogólnie.
- Zawarte są tutaj zarówno "standardowe" polecenia systemów Unix jak i te wymagające instalacji dodatkowych pakietów oprogramowania -- o ile polecenia te były wystarczająco ważne, by je uwzględnić.

Uwagi:

- Dla zachowania formy pojedynczej strony, treść dołączana jest domyślnie przez odniesienia. Dysponujesz wystarczającą inteligencją, żeby poszukać dodatkowych szczegółów danego polecenia w Google. Używaj `apt`, `yum`, `dnf`, `pacman`, `pip` lub `brew` (odpowiednio), aby zainstalować nowe programy.
- Używaj [Explainshell](http://explainshell.com/) żeby "rozłożyć na czynniki pierwsze" polecenia, opcje, potoki, itp.


## Podstawy

- Naucz się podstaw Basha. Właściwie, wpisz `man bash` i przynajmniej przejrzyj całość - jest całkiem łatwa w zrozumieniu i niezbyt długa. Inne powłoki mogą być fajne, ale Bash jest potężny i obecny praktycznie wszędzie (o ile nauczenie się *wyłącznie* powłoki zsh, fish, itp. na swoim własnym laptopie jest kuszące, będzie Cię ograniczać w wielu sytuacjach, takich jak użycie istniejących serwerów).

- Naucz się dobrze co najmniej jednego edytora tekstowego. Edytor `nano` jest jednym z najłatwiejszych do opanowania w podstawowych operacjach (otwieranie, edycja, zapisywanie, przeszukiwanie). Jednakże zaawansowanym użytkownikom terminala nic nie zastąpi Vima (`vi`) - trudnego do nauczenia, ale zacnego, szybkiego i w pełni wyposażonego edytora. Wielu używa też klasycznego Emacsa, zwłaszcza do większych zadań. (Rzecz jasna żaden współczesny twórca oprogramowania, pracujący nad dużym projektem, raczej nie będzie używał wyłącznie edytora w trybie tekstowym i powinien znać również nowoczesne IDE i narzędzia dla trybu graficznego.)

- Znajdywanie dokumentacji:
  - Dowiedz się jak czytać oficjalną dokumentację za pomocą `man` (dla dociekliwych `man man` podaję numerację sekcji, np. 1 jest dla "zwykłych" poleceń, 5 jest dla plików/składni, a 8 dla administracji systemem). Odszukuj odpowiednie strony podręczników używając `apropos`.
  - Wiedz, że niektóre komendy nie są plikami wykonywalnymi, lecz wbudowanymi poleceniami powłoki Bash. Pomoc dla nich można uzyskać za pomocą `help` i `help -d`. Możesz się zorientować, czy dana komenda jest plikiem wykonywalnym, poleceniem wbudowanym, czy aliasem przy użyciu `type komenda`.
  - `curl cheat.sh/polecenie` pokaże krótką "ściągawkę" z najczęstszymi przykładami użycia polecenia.

- Przyswój wiedzę o przekierowywaniu strumieni wyjścia i wejścia za pomocą operatorów `>` i `<` oraz o potokach tworzonych przy użyciu `|`. Wiedz, że `>` nadpisuje plik wyjściowy, a `>>` dodaje treść. Dowiedz się o strumieniach: standardowego wyjścia (stdout) i standardowego błędu (stderr).

- Naucz się rozwijania nazw plików przy użyciu wzorców globalnych, zawierających `*` (może też `?` i `[`...`]`) oraz zastosowania i różnic między podwójnym `"` i pojedynczym `'` znakiem cudzysłowu. (Zobacz także poniżej - o rozwijaniu nazw zmiennych.)

- Zapoznaj się ze sposobami zarządzania zadaniami Basha: `&`, **ctrl-z**, **ctrl-c**, `jobs`, `fg`, `bg`, `kill`, itp.

- Poznaj `ssh` i podstawy uwierzytelniania bez haseł przy użyciu `ssh-agent`, `ssh-add`, itp.

- Podstawy zarządzania plikami: `ls` i `ls -l` (w szczególności dowiedz się co reprezentuje każda kolumna wyświetlana z `ls -l`), `less`, `head`, `tail` oraz `tail -f` (a nawet lepiej, `less +F`), `ln` i `ln -s` (poznaj różnice i przewagi "dowiązania twardego" nad "dowiązaniem miękkim/symbolicznym"), `chown`, `chmod`, `du` (szybkie podsumowanie użycia przestrzeni dyskowej: `du -hs *`). Do zarządzania systemami plików: `df`, `mount`, `fdisk`, `mkfs`, `lsblk`. Dowiedz się, czym jest "i-węzeł" (`ls -i` lub `df -i`).

- Podstawy zarządzania połączeniami sieciowymi: `ip` lub `ifconfig`, `dig`, `traceroute`, `route`.

- Naucz się i korzystaj z systemu zarządzania kontrolą wersji, takiego jak `git`.

- Dobrze poznaj wyrażenia regularne oraz różne przełączniki dla poleceń `grep`/`egrep`. Warto znać opcje `-i`, `-o`, `-v`, `-A`, `-B`, and `-C`.

- Naucz się używać `apt-get`, `yum`, `dnf` lub `pacman` (w zależności od dystrybucji) do odnajdywania i instalacji pakietów oprogramowania. Upewnij się także, że masz `pip`, aby móc instalować narzędzia wiersza poleceń oparte o język Python (kilka omówionych poniżej najłatwiej jest zainstalować używając `pip`).


## Codzienny użytek

- W Bashu używaj klawisza **Tab** do uzupełniania listy argumentów lub wyświetlania listy dostępnych poleceń, a kombinacji **ctrl-r** do przeszukiwania historii wydanych poleceń (po wciśnięciu tej kombinacji wpisz kolejne litery polecenia do odnalezienia, powtórz **ctrl-r**, aby przełączać się pomiędzy kolejnymi pasującymi wpisami, wciśnij **Enter**, żeby wykonać znalezione polecenie lub strzałkę w prawo, by móc zmodyfikować bieżącą linię z poleceniem).

- W Bashu, używaj kombinacji **ctrl-w** do usunięcia ostatniego wyrazu oraz **ctrl-u** do usunięcia zawartości od bieżącej pozycji kursora do początku linii. Używaj kombinacji **alt-b** i **alt-f**, żeby przeskakiwać "słowo po słowie", **ctrl-a** do umieszczenia kursora na początku linii, **ctrl-e** do umieszczania kursora na końcu linii, **ctrl-k**, żeby wymazać zawartość od bieżącej pozycji kursora do końca linii, **ctrl-l** do wyczyszczenia zawartości całego ekranu. Sprawdź `man readline`, by poznać wszystkie kombinacje w Bashu. Jest ich bardzo dużo. Dla przykładu **alt-.** skacze po wszystkich argumentach poprzednich poleceń, a **alt-*** rozwija wzorzec globalny.


- Alternatywnie, jeśli kochasz skróty klawiaturowe w stylu vi, użyj `set -o vi` (i `set -o emacs`, aby powrócić do poprzednich ustawień).

- Do edycji długich poleceń, po ustawieniu edytora (na przykład `export EDITOR=vim`), **ctrl-x** **ctrl-e** otworzy bieżące polecenie w edytorze z możliwością edycji wieloliniowej. W trybie vi to samo zrobi **escape-v**.

- Żeby zobaczyć ostatnio wydane polecenia, użyj `history`. Następnie `!n` (gdzie `n` jest numerem polecenia), żeby wykonać polecenie ponownie. Możesz także użyć wielu skrótów, z których najbardziej przydatne są prawdopodobnie `!$` dla ostatniego argumentu i `!!` dla ostatniego polecenia (sprawdź "HISTORY EXPANSION" w podręczniku). Jednakże, często skróty te zastępowane są przy użyciu **ctrl-r** i **alt-.**.

- Przejdź do swojego katalogu domowego za pomocą `cd`. Używaj prefiksu `~`, aby dostać się do zawartości plików w ścieżkach podanych względem twojego katalogu domowego (np. `~/.bashrc`). W skryptach powłoki `sh` odwołuj się do katalogu domowego przy użyciu `$HOME`.

- Cofnij się do poprzedniego katalogu roboczego przy użyciu: `cd -`.

- Jeśli zmienisz zdanie będąc już w połowie pisanego polecenia, użyj kombinacji **alt-#**, żeby dodać znak `#` na początku i zamienić tę linię w komentarz (lub użyj **ctrl-a**, **#**, **enter**). Możesz później wrócić do tego polecenia za pośrednictwem historii.

- Używaj `xargs` (lub `parallel`). To potężne narzędzie. Zwróć uwagę, że możesz kontrolować zarówno liczbę elementów obsłużonych w jednej linii (`-L`) jak i stopień zrównoleglenia (`-P`). Jeśli nie masz pewności co do poprawności wyników operacji, najpierw użyj `xargs echo`. Ponadto, `-I{}` jest przydatne. Przykłady:
```bash
      find . -name '*.py' | xargs grep jakas_funkcja
      cat serwery | xargs -I{} ssh root@{} hostname
```

- `pstree -p` to pomocna prezentacja działających procesów - w postaci drzewa.

- Używaj `pgrep` i `pkill` by znaleźć proces lub wysłać do niego sygnał, odwołując się po nazwie (`-f` jest pomocne).

- Poznaj różne sygnały, które można wysyłać do procesów. Przykładowo, aby wstrzymać proces, użyj `kill -STOP [pid]`. Zobacz pełną listę w `man 7 signal`

- Używaj `nohup` lub `disown` jeśli chcesz, żeby proces uruchomiony w tle działał w nieskończoność.

- Sprawdź, które procesy nasłuchują połączeń, przy pomocy `netstat -lntp` lub `ss -plat` (dla TCP; dodaj `-u` dla UDP) lub `lsof -iTCP -sTCP:LISTEN -P -n` (które działa również w macOS).

- Zobacz także `lsof` i `fuser` dla otwartych gniazd i plików.

- Zobacz `uptime` lub `w`, aby dowiedzieć się jak długo system jest uruchomiony.

- Używaj `alias` do tworzenia skrótów dla często używanych poleceń. Na przykład, `alias ll='ls -latr'` utworzy nowy skrót `ll`.

- Zachowuj często używane skróty, ustawienia powłoki oraz funkcje w `~/.bashrc`, a także [upewnij się, że powłoka logowania odczytuje je przy starcie](http://superuser.com/a/183980/7106). To sprawi, że wszystkie Twoje ustawienia będą dostępne we wszystkich Twoich sesjach powłoki.

- Umieść ustawienia zmiennych środowiskowych oraz polecenia, które powinny być uruchomione przy logowaniu w `~/.bash_profile`. Osobna konfiguracja będzie wymagana dla powłok uruchamianych ze środowiska graficznego i zadań polecenia `cron`.

- Synchronizuj swoje pliki konfiguracyjne (np. `.bashrc` i `.bash_profile`) na różnych komputerach - używając Git.

- Wiedz, że zmienne i nazwy plików zwierające "znaki białe" należy traktować z dozą ostrożności. Umieszczaj zmienne Basha w cudzysłowach, np. `"$FOO"`. Kładź nacisk na opcje `-0` lub `-print0` pozwalające oddzielać nazwy plików "znakiem pustym", np. `locate -0 wzorzec | xargs -0 ls -al` lub `find / -print0 -type d | xargs -0 ls -al`. W celu iteracji wewnątrz pętli "for" po nazwach plików zawierających "znaki białe", ustaw zmienną IFS tak, aby zawierała tylko "znak nowej linii" - przy pomocy `IFS=$'\n'`.

- W skryptach Basha używaj `set -x` (lub wariantu `set -v`, który przechwytuje strumień wejścia w formie "surowej", włącznie z nierozwiniętymi nazwami zmiennych i komentarzami) do debugowania strumienia wyjścia. Używaj trybów ścisłych, chyba że masz dobry powód by tego nie robić: użycie `set -e` przerywa wykonanie w przypadku wystąpienia błędów (niezerowych kodów zakończenia). Użycie `set -u` wykrywa próby skorzystania z niezainicjowanych zmiennych. Rozważ także użycie `set -o pipefail`, które przerywa wykonanie w przypadku wystąpienia błędów w potokach (aczkolwiek poczytaj o tym więcej, jako że jest to nieco delikatny temat). W przypadku bardziej zaangażowanych skryptów, używaj także pułapek `trap` na sygnały EXIT lub ERR. Przydatnym nawykiem jest rozpoczynanie skryptów jak poniżej, co pozwala wykryć najczęstsze błędy i przerwać wykonanie wyświetlając komunikat:
```bash
      set -euo pipefail
      trap "echo 'wystąpił błąd: Skrypt przestał działać poprawnie: zobacz polecenie powyżej'" ERR
```

- W skryptach Basha, powłoki potomne (komendy zapisane w nawiasach okrągłych) są wygodnym sposobem grupowania poleceń. Częstym przykładem użycia jest chwilowa zmiana bieżącego katalogu, np.
```bash
      # wykonaj coś w bieżącym katalogu
      (cd /jakis/inny/katalog && inne-polecenie)
      # kontynuuj w oryginalnej lokalizacji
```

- Zwróć uwagę, że w Bashu jest wiele różnych rodzajów rozwijania nazw zmiennych. Sprawdzenie, czy zmienna istnieje: `${nazwa_zmiennej:?komunikat błędu}`. Przykładowo, jeśli skrypt Basha wymaga podania jednego argumentu, po prostu napisz `plik_wejsciowy=${1:?Sposób użycia: $0 plik_wejsciowy}`. Użycie wartości domyślnej, gdy zmienna jest pusta: `${nazwa_zmiennej:-wartosc_domyslna}`. Aby mieć dodatkowy (opcjonalny) parametr do poprzedniego przykładu, możesz użyć czegoś takiego `plik_wyjsciowy=${2:-logfile}`. Jeśli argument `$2` zostanie pominięty i tym samym będzie on pusty, wartość zmiennej `plik_wyjsciowy` zostanie ustawiona na `logfile`. Rozwinięcie arytmetyczne: `i=$(( (i + 1) % 5 ))`. Sekwencje: `{1..10}`. Skracanie łańcuchów znakowych: `${nazwa_zmiennej%przyrostek}` oraz `${nazwa_zmiennej#przedrostek}`. Na przykład, jeśli `plik=foo.pdf`, wtedy `echo ${plik%.pdf}.txt` wyświetli `foo.txt`.

- Rozwijanie nawiasów klamrowych `{`...`}` pozwala ograniczyć konieczność przepisywania powtarzalnego tekstu i zautomatyzować kombinacje elementów. Jest to pomocne w przypadkach, takich jak `mv foo.{txt,pdf} jakis-katalog` (które przeniesie oba pliki), `cp jakisplik{,.bak}` (które zostanie rozwinięte do `cp jakisplik jakisplik.bak`) lub `mkdir -p test-{a,b,c}/subtest-{1,2,3}` (które rozwinie wszystkie możliwe kombinacje i utworzy strukturę katalogów). Rozwinięcie nawiasów klamrowych ma pierwszeństwo przed jakimikolwiek innymi rozwinięciami.

- Kolejność wykonywania rozwinięć jest następująca: rozwijanie nawiasów klamrowych; rozwijanie znaku tylda, rozwijanie parametrów i nazw zmiennych, rozwinięcia arytmetyczne oraz podstawianie poleceń (wykonywane "od lewej do prawej"); dzielenie wyrazów; rozwijanie nazw plików. (Przykładowo: zakresu `{1..20}` nie można wyrazić za pomocą zmiennych `{$a..$b}`. Zamiast tego użyj `seq` lub pętli `for`, np. `seq $a $b` lub `for((i=a; i<=b; i++)); do ... ; done`.)

- Strumień wyjścia z polecenia może zostać potraktowany jak plik przy użyciu `<(jakies polecenie)` (mechanizm znany jako podstawienie procesu). Na przykład, porównanie lokalnego pliku `/etc/hosts` z plikiem na maszynie zdalnej:
```sh
      diff /etc/hosts <(ssh jakisserwer cat /etc/hosts)
```

- Pisząc skrypty, możesz zechcieć umieszczać cały kod pomiędzy nawiasami klamrowymi. Jeśli zabraknie nawiasu zamykającego, Twój skrypt nie zostanie wykonany z powodu błędu składniowego. Ma to sens wtedy, kiedy Twój skrypt ma być pobierany ze strony w sieci, ponieważ zapobiegnie to wykonaniu skryptów pobranych tylko częściowo:
```bash
{
      # Tutaj jest Twój kod
}
```

- "Dokument lokalny" pozwala na [przekierowanie kilku linii strumienia wejścia](https://www.tldp.org/LDP/abs/html/here-docs.html) tak, jakby były wczytywane z pliku:
```
cat <<EOF
wejście
w kilku liniach
EOF
```

- W Bashu, jednoczesne przekierowanie strumieni standardowego wyjścia i standardowego błędu można uzyskać za pomocą: `jakies-polecenie >plik_logu 2>&1` lub `jakies-polecenie &>plik_logu`. Często, aby upewnić się, że polecenie nie zostawi otwartego uchwytu do pliku strumienia standardowego wejścia, wiążącego go z obecnie używanym terminalem, jako dobrą praktykę stosuje się dodanie do polecenia `</dev/null`.

- Używaj `man ascii`, aby uzyskać dobrą tabelę kodów ASCII, zawierającą wartości szesnastkowe i dziesiętne. Do uzyskania ogólnych informacji o kodowaniu znaków, pomocne są polecenia `man unicode`, `man utf-8` i `man latin1`.

- Używaj polecenia `screen` lub [`tmux`](https://tmux.github.io/) do zwielokrotnienia ekranu, szczególnie przydatnego w sesjach ssh do maszyn zdalnych, aby odłączać się i ponownie podłączać do sesji. `byobu` rozszerza możliwości screena lub tmuxa dostarczając więcej informacji i ułatwiając zarządzanie. Minimalistyczną alternatywą jedynie do celów utrzymania ciągłości sesji jest [`dtach`](https://github.com/bogner/dtach).

- W używaniu ssh, wiedza na temat tunelowania portów z użyciem `-L` lub `-D` (i czasami `-R`) jest przydatna, np. do przeglądania stron w sieci z maszyny zdalnej.

- Wprowadzenie kilku usprawnień do konfiguracji Twojego ssh może być przydatne; na przykład, poniższy `~/.ssh/config` zawiera ustawienia pozwalające uniknąć zrywania połączeń w pewnych środowiskach sieciowych, używa kompresji (co może być pomocne w użyciu scp na łączach o niskiej przepustowości), zwielokrotnia kanały dostępowe do tego samego serwera przy użyciu lokalnego pliku kontrolnego:
```
      TCPKeepAlive=yes
      ServerAliveInterval=15
      ServerAliveCountMax=6
      Compression=yes
      ControlMaster auto
      ControlPath /tmp/%r@%h:%p
      ControlPersist yes
```

- Kilka innych opcji, istotnych dla ssh, jest związanych z bezpieczeństwem i powinno być stosowanych z rozwagą, np. w odniesieniu do konkretnej podsieci lub serwera lub w zaufanych sieciach: `StrictHostKeyChecking=no`, `ForwardAgent=yes`

- Uznaj [`mosh`](https://mosh.org/) za alternatywę dla ssh używającą UDP, unikającą przerywania połączeń i zwiększającą wygodę (wymaga konfiguracji po stronie serwera).

- Aby zobaczyć uprawnienia do pliku w postaci ósemkowej, co jest przydatne w konfiguracji systemu, ale niedostępne w `ls` i łatwe do rozwalenia, użyj czegoś takiego
```sh
      stat -c '%A %a %n' /etc/timezone
```

- Aby móc interaktywnie wybierać wartości z wyjścia innego polecenia, używaj [`percol`](https://github.com/mooz/percol) lub [`fzf`](https://github.com/junegunn/fzf).

- Do interaktywnej pracy z plikami, bazującej na wyjściu z innego polecenia (takiego jak `git`), używaj `fpp` ([PathPicker](https://github.com/facebook/PathPicker)).

- Jako prostego serwera stron, serwującego wszystkie pliki z bieżącego katalogu (i podkatalogów), dostępnego dla każdego w Twojej sieci, użyj:
`python -m SimpleHTTPServer 7777` (dla użycia portu 7777 w wersji Python 2) oraz `python -m http.server 7777` (dla użycia portu 7777 w wersji Python 3).

- Żeby wykonać polecenie jako inny użytkownik, używaj `sudo`. Jako domyślne konto docelowe używane jest konto root; użyj `-u`, aby określić konto innego użytkownika. Użyj `-i`, żeby zalogować się jako docelowy użytkownik (zostaniesz poproszony o podanie _Twojego_ hasła).

- Aby w bieżącej powłoce przełączyć się na konto innego użytkownika, używaj `su uzytkownik` lub `su - uzytkownik`. To drugie z "-" zapewnia takie ustawienia środowiska, jak zaraz po zalogowaniu docelowego użytkownika. Pominięcie nazwy użytkownika skutkuje przełączeniem się na konto root. Zostaniesz poproszony o podanie hasła _do konta użytkownika, na którego się przełączasz_.

- Wiedz o ograniczeniu do [128K znaków](https://wiki.debian.org/CommonErrorMessages/ArgumentListTooLong) dla długości pojedynczego polecenia. Błąd mówiący "Argument list too long" występuje często, gdy wzorzec globalny dla nazw pasuje do dużej liczby plików. (Gdy tak się zdarzy, zamienniki takie jak `find` i `xargs` mogą pomóc.)

- Jako podstawowego kalkulatora (i oczywiście, żeby ogólnie móc korzystać z Pythona), używaj interpretera `python`. Przykładowo:
```
>>> 2+3
5
```


## Przetwarzanie plików i danych

- Aby zlokalizować plik po nazwie w bieżącym katalogu, `find . -iname '*jakasnazwa*'` (lub podobnie). Aby zlokalizować znajdujący się gdziekolwiek plik po nazwie, użyj `locate jakasnazwa` (ale miej na uwadze, że `updatedb` mógł jeszcze nie zindeksować plików utworzonych niedawno).

- Do przeszukiwania zawartości plików z kodem źródłowym lub danymi, istnieje kilka opcji bardziej zaawansowanych lub szybszych niż `grep -r`, wliczając w to (z grubsza od najstarszego do najnowszego) [`ack`](https://github.com/beyondgrep/ack2), [`ag`](https://github.com/ggreer/the_silver_searcher) ("srebrny szukacz") oraz [`rg`](https://github.com/BurntSushi/ripgrep) (ripgrep).

- Żeby skonwertować kod HTML do postaci tekstowej: `lynx -dump -stdin`

- Do konwersji Markdown, HTML i różnych innych formatów dokumentów, wypróbuj [`pandoc`](http://pandoc.org/). Na przykład, aby skonwertować dokument Markdown do formatu Word: `pandoc README.md --from markdown --to docx -o tymczasowy.docx`

- Jeśli musisz zająć się danymi w formacie XML, `xmlstarlet` - jest wiekowy, ale przydatny.

- Do danych w formacie JSON używaj [`jq`](http://stedolan.github.io/jq/). Do pracy interaktywnej sprawdź także [`jid`](https://github.com/simeji/jid) oraz [`jiq`](https://github.com/fiatjaf/jiq).

- Do danych w formacie YAML używaj [`shyaml`](https://github.com/0k/shyaml).

- Do pracy z plikami w formacie Excel lub CSV, [csvkit](https://github.com/onyxfish/csvkit) dostarcza `in2csv`, `csvcut`, `csvjoin`, `csvgrep`, itp.

- Do obsługi Amazon S3, [`s3cmd`](https://github.com/s3tools/s3cmd) jest wygodny, a [`s4cmd`](https://github.com/bloomreach/s4cmd) jest szybszy. [`aws`](https://github.com/aws/aws-cli) i ulepszony [`saws`](https://github.com/donnemartin/saws) od Amazona są kluczowe dla innych zadań związanych z usługami AWS.

- Poznaj `sort` i `uniq`, włącznie z opcjami `-u` i `-d` dla uniq -- sprawdź jednolinijkowce poniżej. Sprawdź także `comm`.

- Poznaj `cut`, `paste` i `join` do manipulacji zawartością plików tekstowych. Wiele osób używa `cut`, ale zapominają o `join`.

- Poznaj `wc` do liczenia znaków nowej linii (`-l`), wszystkich znaków (`-m`), słów (`-w`) i bajtów (`-c`).

- Poznaj `tee` do równoczesnego kopiowania zawartości z stdin do pliku i stdout, np. `ls -al | tee file.txt`.

- Do bardziej złożonych operacji obliczeniowych, uwzględniających grupowanie, odwracanie kolejności pól i obliczenia statystyczne, rozważ użycie [`datamash`](https://www.gnu.org/software/datamash/).

- Wiedz, że ustawienia regionalne mają subtelny wpływ na wiele narzędzi wiersza poleceń, wliczając w to kolejność sortowania (porównywanie) i wydajność. Większość systemów Linux przy instalacji ustawia `LANG` lub inne zmienne dla ustawień regionalnych na lokalną wartość, taką jak np. US English. Miej świadomość tego, że kolejność sortowania zmieni się, jeśli zmienisz ustawienia regionalne. I wiedz, że reguły i18n mogą spowodować, że sort lub inne polecenia będą działać *wielokrotnie* wolniej. W niektórych przypadkach (takich, jak ustawianie zmiennych lub stwierdzanie unikatowości opisane poniżej) można bezpiecznie w całości zignorować powolne reguły i18n i używać tradycyjnego, opartego na wartości bajtowej porządku sortowania, przy użyciu `export LC_ALL=C`.

- Możesz zmodyfikować środowisko danego polecenia, poprzedzając jego wywołanie ustawieniem zmiennej środowiskowej, np. `TZ=Pacific/Fiji date`.

- Poznaj podstawy `awk` i `sed` do prostej obróbki danych. Zobacz przykłady w sekcji [Jednolinijkowce](#Jednolinijkowce).

- Aby zastąpić "w miejscu" wszystkie wystąpienia danego łańcucha znaków, w jednym lub wielu plikach na raz:
```sh
      perl -pi.bak -e 's/stary-łańcuch/nowy-łańcuch/g' moje-pliki-*.txt
```

- Do zmiany nazw wielu plików i/lub wyszukania i zastąpienia łańcuchów wewnątrz plików, wypróbuj [`repren`](https://github.com/jlevy/repren). (W niektórych przypadkach, polecenie `rename` również umożliwi zmianę nazw wielu plików, ale ostrożnie, gdyż jego funkcjonalność różni się w zależności od dystrybucji Linuksa.)
```sh
      # Pełna zmiana nazw plików, katalogów i zawartości foo -> bar:
      repren --full --preserve-case --from foo --to bar .
      # Odzyskiwanie plików z kopii bezpieczeństwa cokolwiek.bak -> cokolwiek:
      repren --renames --from '(.*)\.bak' --to '\1' *.bak
      # Tak jak wyżej, przy użyciu rename, jeśli jest dostępne:
      rename 's/\.bak$//' *.bak
```

- Jak głosi strona podręcznika, `rsync` jest naprawdę szybkim i niezwykle wszechstronnym narzędziem do kopiowania plików. Znany jest z synchronizacji zawartości między maszynami, ale jest równie użyteczny lokalnie. Jeśli pozwalają na to ustawienia bezpieczeństwa, użycie `rsync` zamiast `scp` umożliwia wznowienie transferu bez cofania się do początku. Jest on także wśród [najszybszych sposobów](https://web.archive.org/web/20130929001850/http://linuxnote.net/jianingy/en/linux/a-fast-way-to-remove-huge-number-of-files.html) na usuwanie dużych liczb plików:
```sh
mkdir pusty && rsync -r --delete pusty/ jakis-katalog && rmdir jakis-katalog
```

- Do śledzenia postępu przetwarzania plików używaj [`pv`](http://www.ivarch.com/programs/pv.shtml), [`pycp`](https://github.com/dmerejkowsky/pycp), [`pmonitor`](https://github.com/dspinellis/pmonitor), [`progress`](https://github.com/Xfennec/progress), `rsync --progress` lub w kopiowaniu na poziomie blokowym - `dd status=progress`.

- Używaj `shuf` do "przetasowania" lub wyboru losowych linii z pliku.

- Poznaj opcje polecenia `sort`.  Do pracy z liczbami używaj `-n` lub `-h`, żeby obsłużyć liczby w formacie czytelnym dla człowieka (np. wyjście z `du -h`). Dowiedz się, jak działają "klucze" (`-t` i `-k`). Zwróć szczególną uwagę na to, że musisz napisać `-k1,1`, żeby posortować pod względem zawartości tylko pierwszego pola; `-k1` oznacza sortowanie względem zawartości całej linii. Sortowanie stabilne (`sort -s`) może być przydatne. Przykładowo, żeby najpierw posortować po polu numer 2, a następnie po polu numer 1, możesz użyć `sort -k1,1 | sort -s -k2,2`.

- Jeśli kiedykolwiek w wierszu poleceń Basha zajdzie potrzeba umieszczenia znaku tabulacji, dosłownie (np. jako argumentu dla opcji -t do sortowania), wciśnij **ctrl-v** **[Tab]** lub wpisz `$'\t'` (to drugie rozwiązanie jest lepsze, bo możesz je skopiować i wkleić).

- Standardowymi narzędziami do "łatania" plików z kodem źródłowym są `diff` i `patch`. Sprawdź także `diffstat` dla uzyskania podsumowania z diff oraz `sdiff` dla porównywania zawartości obok siebie. Zwróć uwagę, że `diff -r` zadziała dla całych katalogów. Użyj `diff -r drzewo1 drzewo2 | diffstat`, żeby uzyskać podsumowanie różnic. Używaj `vimdiff` do porównywania i edycji plików.

- W pracy z plikami binarnymi używaj `hd`, `hexdump` lub `xxd` do uzyskania prostych zrzutów zawartości w formie liczb szesnastkowych, a `bvi`, `hexedit` lub `biew` do binarnej edycji.

- Także w odniesieniu do plików binarnych, `strings` (oraz `grep`, itp.) pozwoli Ci znaleźć kawałki tekstu.

- Do obsługi plików różnic binarnych (kompresja delta), używaj `xdelta3`.

- Do zmiany kodowania znaków w tekście wypróbuj `iconv`. Możesz także użyć `uconv` do bardziej zaawansowanych operacji; obsługuje on bardziej zaawansowane rzeczy, związane z Unicode. Przykładowo:
```sh
      # Wyświetla szesnastkowe kody lub faktyczne nazwy znaków (przydatne do debugowania):
      uconv -f utf-8 -t utf-8 -x '::Any-Hex;' < dane_wejsciowe.txt
      uconv -f utf-8 -t utf-8 -x '::Any-Name;' < dane_wejsciowe.txt
      # Konwertuje teskt na małe litery i usuwa wszystkie znaki akcentu (rozwijając i pozbywając się ich):
      uconv -f utf-8 -t utf-8 -x '::Any-Lower; ::Any-NFD; [:Nonspacing Mark:] >; ::Any-NFC;' < dane_wejsciowe.txt > dane_przetworzone.txt
```

- Aby podzielić plik na mniejsze kawałki, sprawdź jak użyć `split` (do podziału na podstawie zadanego rozmiaru) i `csplit` (do podziału na podstawie zadanego wzorca).

- Data i czas: aby uzyskać aktualną datę i czas w przydatnym formacie [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601), użyj `date -u +"%Y-%m-%dT%H:%M:%SZ"` (inne opcje [są](https://stackoverflow.com/questions/7216358/date-command-on-os-x-doesnt-have-iso-8601-i-option) [kłopotliwe](https://unix.stackexchange.com/questions/164826/date-command-iso-8601-option)). Do manipulacji wyrażeniami zawierającymi datę i czas, używaj `dateadd`, `datediff`, `strptime` itp. z pakietu [`dateutils`](http://www.fresse.org/dateutils/).

- Używaj `zless`, `zmore`, `zcat` oraz `zgrep` do pracy ze skompresowanymi plikami.

- Atrybuty plików da się ustawiać przy użyciu `chattr` i oferują one niskopoziomową alternatywę dla uprawnień do plików. Na przykład, aby uchronić plik przed przypadkowym usunięciem, ustaw mu flagę niezmienności (immutable):  `sudo chattr +i /wazny/katalog/lub/plik`

- Używaj `getfacl` i `setfacl`, aby zachować i przywrócić uprawnienia do plików (ACL). Przykładowo:
```sh
   getfacl -R /some/path > permissions.txt
   setfacl --restore=permissions.txt
```

- Do szybkiego tworzenia pustych plików, użyj `truncate` (tworzy [plik z rezerwacją miejsca](https://en.wikipedia.org/wiki/Sparse_file)), `fallocate` (dla systemów plikowych ext4, xfs, btrfs oraz ocfs2), `xfs_mkfile` (prawie dla każdego systemu plików, zawarty w pakiecie xfsprogs), `mkfile` (dla systemów uniksowych, takich jak Solaris, Mac OS).

## Debugowanie systemu

- Do debugowania stron w sieci przydane są `curl` i `curl -I` lub ich odpowiedniki z użyciem `wget`, albo bardziej nowoczesny [`httpie`](https://github.com/jkbrzt/httpie).

- Żeby poznać aktualny stan cpu/dysku, klasycznymi narzędziami są `top` (lub lepszy `htop`), `iostat` i `iotop`. Użyj `iostat -mxz 15` dla uzyskania podstawowych informacji o użyciu CPU i szczegółowych statystyk użycia każdej partycji dyskowej oraz wglądu w ich wydajność.

- Aby uzyskać szczegóły połączeń sieciowych, używaj `netstat` i `ss`.

- Dla szybkiego podglądu tego, co dzieje się w systemie, `dstat` jest wybitnie przydatny. Aby uzyskać najszerszy obraz sytuacji wraz ze szczegółami, użyj [`glances`](https://github.com/nicolargo/glances).

- Żeby poznać stan pamięci, uruchom i zrozum dane wyjściowe poleceń `free` i `vmstat`. W szczególności pamiętaj, że pamięć "podręczna (cached)" to zarezerwowana przez jądro Linuksa pamięć podręczna dla plików, więc skutecznie jej wartość zalicza się do wartości pamięci "wolnej (free)".

- Debugowanie podsystemu Java to inna para kaloszy, ale prostą sztuczką w systemach Oracle i niektórych innych JVMach może być uruchomienie `kill -3 <pid>`, aby uzyskać pełny zrzut zawartości stosu i podsumowanie zawartości sterty (włącznie ze szczegółami nt. 'zbierania śmieci', które mogą dać wiele informacji) do strumienia standardowego błędu/logów. Z narzędzi JDK przydatne są `jps`, `jstat`, `jstack`, `jmap`. [Narzędzia SJK](https://github.com/aragozin/jvm-tools) są bardziej zaawansowane.

- Używaj [`mtr`](http://www.bitwizard.nl/mtr/) jako lepszego narzędzia traceroute do identyfikowania problemów z siecią.

- Sprawdzenie przyczyny zapełnienia dysku przy użyciu [`ncdu`](https://dev.yorhel.nl/ncdu) oszczędza czas w porównaniu z użyciem "zwyczajnych" poleceń, takich jak `du -sh *`.

- Żeby odszukać gniazdo lub proces, które zużywają przepustowość połączenia sieciowego, wypróbuj [`iftop`](http://www.ex-parrot.com/~pdw/iftop/) lub [`nethogs`](https://github.com/raboof/nethogs).

- Narzędzie `ab` (dostarczane w pakiecie z Apache) pomaga w szybkim sprawdzeniu wydajności serwera stron. Do bardziej złożonych testów obciążenia, wypróbuj `siege`.

- Do poważniejszego debugowania sieci, [`wireshark`](https://wireshark.org/), [`tshark`](https://www.wireshark.org/docs/wsug_html_chunked/AppToolstshark.html) lub [`ngrep`](http://ngrep.sourceforge.net/).

- Poznaj `strace` oraz `ltrace`. Mogą one pomóc w znalezieniu przyczyny, gdy program nie działa poprawnie, zawiesza się lub całkowicie "rozsypuje" lub gdy chcesz poznać jego ogólną wydajność. Zwróć uwagę na opcję profilowania (`-c`) oraz możliwość wpięcia się w działający proces (`-p`). Używaj opcji śledzenia procesów potomnych (`-f`), żeby nie przeoczyć ważnych wywołań systemowych.

- Poznaj `ldd` do sprawdzania współdzielonych bibliotek, itp. — ale [nigdy nie uruchamiaj go z niezaufanymi plikami](http://www.catonmat.net/blog/ldd-arbitrary-code-execution/).

- Dowiedz się, jak można się wpiąć w działający proces przy pomocy `gdb` i prześledzić jego użycie stosu.

- Używaj `/proc`. Czasami jest niezwykle pomocny w rozwiązywaniu trwających problemów. Przykłady: `/proc/cpuinfo`, `/proc/meminfo`, `/proc/cmdline`, `/proc/xxx/cwd`, `/proc/xxx/exe`, `/proc/xxx/fd/`, `/proc/xxx/smaps` (gdzie `xxx` jest nazwą procesu lub jego numerem pid).

- Kiedy sprawdzasz, dlaczego w przeszłości coś poszło źle, [`sar`](http://sebastien.godard.pagesperso-orange.fr/) może być bardzo pomocny. Pokazuje on historyczne statystyki użycia CPU, pamięci, sieci, itp.

- Do głębszych analiz systemów i wydajności, rzuć okiem na `stap` ([SystemTap](https://sourceware.org/systemtap/wiki)), [`perf`](https://en.wikipedia.org/wiki/Perf_%28Linux%29) oraz [`sysdig`](https://github.com/draios/sysdig).

- Sprawdź w jakim jesteś systemie operacyjnym, używając `uname` lub `uname -a` (ogólne informacje na temat Uniksa/jądra systemu) albo `lsb_release -a` (informacje na temat dystrybucji Linuksa).

- Używaj `dmesg` zawsze, gdy coś się "dziwnie zachowuje" (to może oznaczać problemy ze sprzętem lub sterownikami).

- Jeśli usuwasz plik, ale nie zwalnia to oczekiwanej ilości miejsca jak np. wskazywanej przez `du`, sprawdź czy plik ten nie jest używany przez jakiś proces:
`lsof | grep deleted | grep "nazwa-pliku-zajmujacego-miejsce"`


## Jednolinijkowce

Kilka przykładów składania poleceń:

- Czasem niesłychanie pomocna okazuje się możliwość uzyskania z plików tekstowych tylko części wspólnej, sumy i różnicy zbiorów danych przy użyciu `sort`/`uniq`. Przypuśćmy, że `a` i `b` są plikami tekstowymi, niezawierającymi żadnych powtórzeń. Taka operacja jest szybka i działa na plikach o dowolnym rozmiarze, do kilku gigabajtów. (Sortowanie nie jest ograniczone rozmiarem pamięci, aczkolwiek może wymagać użycia opcji `-T`, jeśli `/tmp` znajduje się na partycji głównej o małym rozmiarze.) Zobacz także uwagi na temat `LC_ALL` powyżej oraz opcję `-u` dla polecenia `sort` (pominiętą poniżej dla zachowania przejrzystości).
```sh
      sort a b | uniq > c   # c jest sumą a i b
      sort a b | uniq -d > c   # c jest częścią wspólną a i b
      sort a b b | uniq -u > c   # c jest różnicą zbiorów a - b
```

-  Wyświetl dwa pliki w formacie JSON, normalizując ich składnię, a następnie kolorując i dzieląc na strony wynik operacji:
```
      diff <(jq --sort-keys . < plik1.json) <(jq --sort-keys . < plik2.json) | colordiff | less -R
```

- Używaj `grep . *`, aby szybko przeanalizować zawartość wszystkich plików w katalogu (tak, by każda linia była powiązana z nazwą pliku) lub `head -100 *` (tak, by każdy plik miał nagłówek). To może być użyteczne dla katalogów zawierających ustawienia konfiguracyjne, jak w `/sys`, `/proc`, `/etc`.


- Sumowanie wszystkich liczb zawartych w trzeciej kolumnie pliku tekstowego (to rozwiązanie jest prawdopodobnie 3X szybsze i zawarte w 3X mniejszej ilości kodu, niż odpowiednik w Pythonie):
```sh
      awk '{ x += $3 } END { print x }' mojplik
```

- Żeby zobaczyć rozmiary/daty w drzewie plików, poniższe rozwiązanie jest podobne do rekurencyjnego `ls -l`, ale czytelniejsze niż `ls -lR`:
```sh
      find . -type f -ls
```

- Powiedzmy, że masz plik tekstowy, np. log z serwera stron, zawierający pewne wartości w niektórych liniach, takie jak wartość parametru `acct_id` obecnego w adresach URL. Jeśli chcesz otrzymać zestawienie liczby zapytań dla każdego `acct_id`:
```sh
      egrep -o 'acct_id=[0-9]+' access.log | cut -d= -f2 | sort | uniq -c | sort -rn
```

- By śledzić zmiany w sposób ciągły, użyj `watch`, np. sprawdzanie zmian plików w katalogu `watch -d -n 2 'ls -rtlh | tail'` lub zmian ustawień sieciowych podczas naprawy ustawień Twojego połączenia wifi `watch -d -n 2 ifconfig`.

- Uruchom tę funkcję, aby otrzymać losowo wybraną wskazówkę z tego dokumentu (przetwarza Markdown i wyodrębnia jeden element):
```sh
      function taocl() {
        curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README-pl.md |
          sed '/cowsay[.]png/d' |
          pandoc -f markdown -t html |
          xmlstarlet fo --html --dropdtd |
          xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
          xmlstarlet unesc | fmt -80 | iconv -t US
      }
```


## Mniej znane, ale użyteczne

- `expr`: wykonaj działania arytmetyczne lub logiczne albo oceniaj wyrażenia regularne

- `m4`: prosty edytor makr

- `yes`: wyświetl łańcuch znaków wiele razy

- `cal`: wygodny kalendarz

- `env`: wykonaj polecenie (przydatny w skryptach)

- `printenv`: wyświetl zmienne środowiskowe (przydatny w debugowaniu i skryptach)

- `look`: znajdź angielskie słowa (lub linie w pliku) zaczynające się od łańcucha znaków

- `cut`, `paste` i `join`: manipulacja zawartością plików

- `fmt`: sformatuj linie tekstu

- `pr`: sformatuj tekst na stronach/w kolumnach

- `fold`: zwiń linie tekstu

- `column`: sformatuj pola tekstowe do postaci wyrównanych kolumn lub tabel o stałej szerokości

- `expand` i `unexpand`: zamień znaki tabulacji na spacje i odwrotnie

- `nl`: dodaj numerację linii

- `seq`: wyświetl ciąg liczb

- `bc`: kalkulator

- `factor`: rozłóż liczby całkowite na czynniki

- [`gpg`](https://gnupg.org/): zaszyfruj i podpisz pliki

- `toe`: tabela wpisów terminfo

- `nc`: debugowanie połączeń sieciowych i przesyłanie danych

- `socat`: przekazywanie połączeń i przekierowanie portów TCP (podobny do `netcat`)

- [`slurm`](https://github.com/mattthias/slurm): obrazowanie ruchu sieciowego

- `dd`: przenoszenie danych między plikami lub urządzeniami

- `file`: zidentyfikuj typ pliku

- `tree`: wyświetl katalogi i podkatalogi w postaci zagnieżdżonego drzewa; jak `ls`, ale rekurencyjny

- `stat`: informacje o pliku

- `time`: wykonaj polecenie i zmierz czas jego działania

- `timeout`: wykonaj polecenie przez określony czas i zatrzymaj jego działanie, gdy ten czas upłynie.

- `lockfile`: utwórz plik semaforowy, który można usunąć tylko przy użyciu `rm -f`

- `logrotate`: wykonaj rotację, skompresuj i wyślij pocztą logi.

- `watch`: powtarzaj wykonanie polecenia, pokazując wyniki i/lub podkreślając zmiany

- [`when-changed`](https://github.com/joh/when-changed): wykonuje dowolne zadane polecenie, gdy tylko zauważy zmianę w pliku. Zobacz też `inotifywait` oraz `entr`.

- `tac`: wyświetl zawartość pliku w odwrotnej kolejności

- `comm`: porównaj posortowane zawartości plików, linia po linii

- `strings`: wyodrębnij tekst z plików binarnych

- `tr`: zamiana lub edycja znaków

- `iconv` lub `uconv`: zmiana kodowania znaków w tekstach

- `split` i `csplit`: dzielenie plików na części

- `sponge`: odczytaj pełną zawartość strumienia danych wejściowych przed ich wypisaniem, przydatne przy odczycie i zapisie do tego samego pliku, np. `grep -v cośtam jakis-plik | sponge jakis-plik`

- `units`: obliczenia i zamiana jednostek miar; zamienia furlongi/dwa-tygodnie na twipy/mrugnięcie (zobacz także `/usr/share/units/definitions.units`)

- `apg`: generuje hasła, dobierając ich znaki losowo

- `xz`: wysokowydajna kompresja plików

- `ldd`: informacje o bibliotekach dołączanych dynamicznie

- `nm`: uzyskaj symbole z plików obiektowych

- `ab` lub [`wrk`](https://github.com/wg/wrk): badanie wydajności serwerów stron

- `strace`: debugowanie wywołań systemowych

- [`mtr`](http://www.bitwizard.nl/mtr/): lepszy traceroute do debugowania połączeń sieciowych

- `cssh`: powłoka równoległa w trybie graficznym

- `rsync`: zsynchronizuj pliki i katalogi przez SSH lub na lokalnym systemie plików

- [`wireshark`](https://wireshark.org/) i [`tshark`](https://www.wireshark.org/docs/wsug_html_chunked/AppToolstshark.html): przechwytywanie pakietów danych i debugowanie sieci

- [`ngrep`](http://ngrep.sourceforge.net/): grep dla warstwy sieciowej

- `host` i `dig`: sprawdzanie DNSów

- `lsof`: informacje o deskryptorach plików i gniazdach używanych przez proces

- `dstat`: przydatne statystyki systemowe

- [`glances`](https://github.com/nicolargo/glances): wysokopoziomowy podgląd użycia wielu podsystemów

- `iostat`: statystyki użycia dysku

- `mpstat`: statystyki użycia CPU

- `vmstat`: statystyki użycia pamięci

- `htop`: ulepszona wersja polecenia top

- `last`: historia logowania użytkowników

- `w`: sprawdzanie, kto jest zalogowany

- `id`: informacje o tożsamości użytkownika/grupy

- [`sar`](http://sebastien.godard.pagesperso-orange.fr/): historyczne statystyki systemowe

- [`iftop`](http://www.ex-parrot.com/~pdw/iftop/) or [`nethogs`](https://github.com/raboof/nethogs): podgląd użycia połączeń sieciowych przez gniazdo lub proces

- `ss`: statystyki użycia gniazda

- `dmesg`: komunikaty błędów systemu i jego uruchomienia

- `sysctl`: podejrzyj i skonfiguruj parametry jądra Linux w trakcie działania

- `hdparm`: zmiana ustawień i badanie wydajności dysków SATA/ATA

- `lsblk`: wyświetl urządzenia blokowe: podgląd listy dysków i partycji w postaci drzewa

- `lshw`, `lscpu`, `lspci`, `lsusb`, `dmidecode`: informacje o sprzęcie, wliczając w to CPU, BIOS, RAID, podsystem grafiki, urządzenia, itd.

- `lsmod` i `modinfo`: wyświetl listę i szczegóły dotyczące modułów jądra.

- `fortune`, `ddate` oraz `sl`: hm, no cóż, wszystko zależy od tego, czy lokomotywy parowe i dymki z komiksów uważasz za "użyteczne"


## Tylko dla macOS

Poniższe wpisy mają znaczenie *tylko* dla systemów macOS.

- Zarządzanie pakietami oprogramowania za pomocą `brew` (Homebrew) i/lub `port` (MacPorts). Można ich użyć do instalacji na macOS wielu z powyższych poleceń.

- Skopiujesz dane wyjściowe dowolnego polecenia do aplikacji pulpitowej za pomocą `pbcopy`, a dane wejściowe do polecenia wkleisz używając `pbpaste`.

- Żeby użyć klawisza Option w Terminalu macOS jako klawisza alt (do użycia np. jak w powyższych kombinacjach **alt-b**, **alt-f**, itp.), otwórz Preferences -> Profiles -> Keyboard i wybierz "Use Option as Meta key".

- Do otwarcia pliku w aplikacji pulpitowej, użyj poleceń `open` lub `open -a /Applications/Whatever.app`.

- Spotlight: szukaj plików używając `mdfind` i wyświetl metadane (takie jak informacje EXIF ze zdjęcia) przy pomocy `mdls`.

- Bądź świadom tego, że macOS oparty jest na systemie BSD Unix i wiele poleceń (np. `ps`, `ls`, `tail`, `awk`, `sed`) trochę się różni od tych samych poleceń w systemach Linux, na które to systemy w główny wpływ miały Uniksy podobne do System V i narzędzia GNU. Różnice można często zauważyć, przyglądając się nagłówkom podręczników, mówiącym "BSD General Commands Manual." W niektórych przypadkach, zainstalowane mogą być również wersje GNU (takie polecenia, jak `gawk` i `gsed` jako awk i sed z pakietu narzędzi GNU). Jeżeli piszesz wieloplatformowe skrypty Bash, unikaj takich poleceń (rozważ na przykład użycie Pythona lub `perl`a) albo przetestuj je dokładnie.

- Aby uzyskać informacje o wersji macOS, użyj `sw_vers`.

## Tylko dla Windows

Poniższe wpisy mają znaczenie *tylko* dla systemów Windows.

### Sposoby pozyskania narzędzi Unix w systemach Windows

- Okiełznaj moc powłoki systemów Unix w systemach Microsoft Windows instalując [Cygwin](https://cygwin.com/). Większość rzeczy opisanych w tym dokumencie będzie działać od razu.

- W Windows 10 możesz użyć [Windows Subsystem for Linux (WSL)](https://msdn.microsoft.com/commandline/wsl/about), który zapewnia znajome środowisko Basha z narzędziami wiersza poleceń Unix.

- Jeśli chcesz używać głównie narzędzi programistycznych GNU (takich jak GCC) w systemach Windows, rozważ użycie [MinGW](http://www.mingw.org/) i jego pakietu [MSYS](http://www.mingw.org/wiki/msys), który zapewnia takie narzędzia, jak bash, gawk, make i grep. MSYS nie spełnia wszystkich funkcji w porównaniu z Cygwinem. MinGW jest szczególnie przydatny do tworzenia odpowiedników narzędzi systemu Unix, działających natywnie w systemach Windows.

- Kolejną opcją zapoznania się z systemami Unix z poziomu systemu Windows jest [Cash](https://github.com/dthree/cash). Miej na uwadze, że tylko nieliczne uniksowe polecenia i ich opcje są dostępne w tym środowisku.

### Przydatne narzędzia wiersza poleceń Windows

- Możesz wykonać i oskryptować większość zadań administracyjnych Windows z poziomu wiersza poleceń, znając i używając `wmic`.

- Natywne narzędzia wiersza poleceń Windows do zarządzania siecią, które mogą się okazać użyteczne, to między innymi `ping`, `ipconfig`, `tracert` i `netstat`.

- Możesz wykonać [wiele przydatnych zadań w Windows](http://www.thewindowsclub.com/rundll32-shortcut-commands-windows), używając polecenia `Rundll32`.

### Porady i wskazówki dotyczące Cygwina

- Instaluj dodatkowe programy Unix, używając zarządcy pakietów oprogramowania Cygwina.

- Używaj `mintty` jako Twojego programu do obsługi wiersza poleceń.

- Uzyskaj dostęp do zawartości schowka Windows przez `/dev/clipboard`.

- Uruchom `cygstart`, aby otworzyć dowolny plik przy użyciu zarejestrowanej aplikacji.

- Uzyskaj dostęp do rejestru systemowego Windows używając `regtool`.

- Zauważ, że Windowsowa ścieżka do dysku `C:\` w Cygwinie staje się ścieżką `/cygdrive/c` oraz, że katalog `/` Cygwina pojawia się w lokalizacji `C:\cygwin` systemu Windows. Zmieniaj sposób zapisu ścieżek między Cygwinem a Windows używając `cygpath`. To najbardziej przydatne w skryptach, które uruchamiają programy systemu Windows.

## Inne źródła wiedzy

- [awesome-shell](https://github.com/alebcay/awesome-shell): Wyselekcjonowana lista narzędzi powłoki i innych zasobów.
- [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line): Bardziej szczegółowy przewodnik po wierszu poleceń systemu macOS.
- [Tryb ścisły](http://redsymbol.net/articles/unofficial-bash-strict-mode/) środkiem do tworzenia lepszych skryptów powłoki.
- [shellcheck](https://github.com/koalaman/shellcheck): Narzędzie do analizy statycznej skryptów powłoki. Zasadniczo, taki "odśmiecacz" dla powłok bash/sh/zsh.
- [Nazwy plików i ścieżki w powłoce](http://www.dwheeler.com/essays/filenames-in-shell.html): Niestety skomplikowany zestaw uwag na temat prawidłowej obsługi nazw plików w skryptach powłoki.
- [Data Science at the Command Line](http://datascienceatthecommandline.com/#tools): Więcej poleceń i narzędzi przydatnych do obróbki danych, zaczerpniętych z książki pod tym samym tytułem.

## Zastrzeżenie

Z wyjątkiem opisów drobnych zadań, kod napisany jest tak, aby był czytelny dla innych. Z mocą przychodzi odpowiedzialność. To, że coś *możesz* zrobić w Bashu, niekoniecznie oznacza, że powinieneś/powinnaś to zrobić! ;)


## Licencja

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

Ta praca została udostępniona na licencji [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).