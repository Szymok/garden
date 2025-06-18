---
title: SQL - Transakcje
type: course
tags: 
aliases:
---
# Wprowadzenie
Każda instrukcja wykonywana w SQL Server jest transakcją
AUTOCOMMIT MODE (IMPLICIT TRANSACTIONS OFF)
	Domyślny tryb, dzięki któremu nie trzeba zatwierdzać pojedynczych instrukcji
IMPLICIT TRANSACTIONS ON
	Każda z poniższych instrukcji otwiera nową transakcję, którą trzeba zatwierdzić lub wycofać
- ALTER TABLE
- CREATE
- DELETE
- DROP
- INSERT
- OPEN
- REVOKE
- SELECT
- FETCH
- GRANT
- TRUNCATE TABLE
- UPDATE
### Aksjomaty ACID — właściwości transakcji
- Atomic - Kazda transakcje jest atomowa jednostkka
- Consistency - Po wykonaniu transakcji baza danych jest spojna
- Izolation - Dwie rownoczesnie wykonujace sie transakcje
- Durability - Wyniki transakcji sa trwale nawet po awarii zasilania
### Blokowanie
Dzięki blokadom transakcje są izolowane 
- Pesymistyczne blokowanie — zakładamy, że oba procesy mogą operować na tych samych danych i dlatego trzeba je zablokować. Aby zapobiec konfliktom podczas odczytu, inne sesje nie moga ich modyfikowac, a podczas modyfikacji, inne sesje nie moga czytac
- Optymistyczne blokowanie - zakladamy, ze modyfikowane dane nie sa modyfikowane jednoczesnie przez inna sesje.
#### Lock Modes
Shared Locks (S) — domyślnie nakładana jeśli proces czyta dane. Dane zablokowane w ten sposób mogą być czytane przez inne sesje, ale nie mogą być modyfikowane. Wiele procesów może jednocześnie nakładać blokady na odczyt. Zwykle blokada S jest zwalniana jak tylko proces skończy
odczytywać dane. Jeśli jednak został ustawiony bardziej rygorystyczny poziom izolacji — REPEATABLE READ/ SERIALIZABLE — blokada jest nałożona do momentu zakończenia transakcji.
Exclusive lock (X) — na wyłączność, używana na potrzeby INSERT/ UPD DELETE. Tylko jedna transakcja może blokować na wyłączność. Blokada X jest zwalniana dopiero po zakończeniu transakcji.
Update Locks (U) — połączenie S i X. W momencie wykonania instrukcji UPDATE, SQL Server musi najpierw odczytać modyfikowane dane (S), a następnie po zlokalizowaniu wierszy — zmienia blokadę S na X na czas modyfikacji. 
Intent lock (IS/IX/IU) — jeśli transakcja blokuje wiersz w tabeli (S lub X) jednocześnie nakłada blokadę  Intent na zasoby wyższego poziomu od strony i tabeli. Dzięki temu inna transakcja nie może zablokować tabeli.
#### Konwersja blokad
Blokada S może zostać zamieniona na X — jeśli dane najpierw były czytane; a następnie (podczas tej samej transakcji) została wykonana instrukcja UPDATE na tych danych. Nie ma możliwości, żeby ta konwersja miała miejsce w drugą stronę — z X do S
#### Latches
Podobne do blokad (locks), ale „lżejszy” mechanizm stosowany na poziomie fizycznym bazy danych; zwykle latche trwają też znacznie krócej niż lock-i. Zapewniają fizyczną integralność danych — zarówno na dysku jak i w buforach — gdyby dwie sesje jednocześnie modyfikowa
strony na dysku, strony stałyby się niespójne. Lock zapewnia logiczną integralność danych
#### Optimistic Concurrency
SQL Server przechowuje poprzednte wersje modyfikowanych danych version stołe w systemowej bazie tcmpdb. Sesje czytające dane nie blokują modyfikujących, modyfikujące nie blokują
czytających. XSN = transaction sequence number, wartość unikalna w obrębie kazde; bazy danych, przyrastająca wraz z każdą modyfikacją. Każdy modyfikowan zawiera XSN transakcji. Każdy modyfikowany wiersz zawiera wskaźnik do poprzedniej wersji zapisanej w version store,  oprzednia wersja moze zawierać ț.vskażnil• jeszcze wcześniejszej wersji.
# Opcja XACT ABORT
Opcja sesji, która określa zachowanie transakcji w przypadku wystąpienia bedu typu run-time:
- ON - transakcja jest automatycznie wycofywana w przypadku bledu
- OFF (domyślnie) - instrukcja która spowodowala blad jest wycofywana, pozostale instrukcje z transakcji sa wykonywane.
Nie wplywa na bledy skladniowe i kompilacji.
# Zagnieżdżone transakcje
Zagnieżdżone transakcje (nested transactions) — brak wsparcia
Zagnieżdżony BEGIN TRAN zwiększa licznik @@TRANCOUNT
• ROLLBACK cofa „wszystkie” transakcje (zeruje licznik)
• COMMIT zmniejsza wartość @@TRANCOUNT 0 1, a więc zatwierdzenie zewnętrznej transakcji zatwierdza całość
# Poziomy izolacji
| Isolation Level  | Dirty Read | Nonrepeatable Read | Phantom Reads |
| ---------------- | ---------- | ------------------ | ------------- |
| Read uncommitted | Yes        | Yes                | Yes           |
| Read committed   | No         | Yes                | Yes           |
| Repeatable read  | No         | No                 | Yes           |
| Serializable     | No         | No                 | No            |
| Snapshot         | No         | No                 | No            |
#### Brudny odczyt 
Transakcja odczytuje dane, które zostały zmodyfikowane przez inną, niezatwierdzoną transakcję.
Domyślnie SQL Server nie pozwala na brudny odczyt — występuje on jedynie w najniższym poziomie izolacji transakcji READ UNCOMMITED. Warto zwrócić uwagę, że to nie instrukcja modyfikująca dane decyduje o tym czy nie może wystąpić brudny odczyt. To sesja która dane
odczytuje (ta druga) może mieć obniżony poziom izolacji transakcji i wówczas zostaną odczytane dane niezatwierdzone.
#### Nonrepeatable Read
Transakcja odczytuje dane, a w ramach tej samej transakcji odczytuje te same dane i otrzymuje inne wartości. Domyślnie SQL Server pozwala na niepowtarzalny odczyt — jeśli dane są odczytywane w ramach transakcji, w READ COMMITED dane mogą być modyfikowane.
Odczyt niezatwierdzonych nie występuje jedynie w:
- REPEATABLE READ
- SERIALIZABLE
#### Phantom Read
Transakcja odczytuje dane, a w ramach tej samej transakcji odczytuje ponownie te same dane i otrzymuje inne liczbę wierszy — te dodatkowe wiersze/brakujące to „widmo”. Domyślnie SQL Server pozwala na odczyt widma — jeśli dane są odczytywane w ramach transakcji, w READ COMMITED dane moga byc kasowane/ dodawane nowe. Odczyt widma nie występuje jedynie w SERIALIZABLE.
- READ UNCOMMITTED — brak blokad podczas operacji odczytu, nie jest blokowana przez inne sesje 
- READ COMMITTED (domyślny) — odczyt danych — S-LOCK podczas operacji odczytu, modyfikacja danych — X-LOCK do końca transakcji
- REPEATABLE READ - S-LOCls i X-LOCKs do końca transakcji
- SERIALIZABLE — używa specjalnego rodzaju blokad — key-range lock, które blokują cały zakres danych do końca transakcji — tak aby nie pojawiły się odczyty widma
- SNAPSHOT — zapewnia taki sam poziom izolacji jak SERIALIZABLE, a jest on uzyskiwany nie dzięki blokadom — a dzięki wersjom danych w bazach tempdb
# Pliki
![[B Jawne transakcje.sql]]

![[G Snapshot isolation level.sql]]

![[F Deadlocks.sql]]

![[E Isolation levels2.sql]]

![[E Isolation levels.sql]]

![[D Nested transaction.sql]]

![[C XACT ABORT.sql]]

