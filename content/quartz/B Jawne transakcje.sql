/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	B: Jawne transakcje
	  - autocommit mode VS implicit transactions
	  - NOLOCK, READPAST, ROWLOCK, TABLOCK, LOCK_TIMEOUT
*/

USE AdventureWorks2017
GO


-- liczba otwartych transakcji
SELECT @@TRANCOUNT

/*
	autocommit mode
*/

SELECT * FROM Person.Person

SELECT @@TRANCOUNT

UPDATE Person.Person SET LastName = N'Kowalski' WHERE BusinessEntityID = 1

SELECT @@TRANCOUNT

UPDATE Person.Person SET LastName = N'Sánchez' WHERE BusinessEntityID = 1


/*
	IMPLICIT_TRANSACTIONS
*/

DBCC USEROPTIONS

SET IMPLICIT_TRANSACTIONS ON

DBCC USEROPTIONS

SELECT @@TRANCOUNT

SELECT * FROM Person.Person

SELECT @@TRANCOUNT

COMMIT

SELECT @@TRANCOUNT

UPDATE Person.Person SET LastName = 'Nowak' WHERE BusinessEntityID = 1

SELECT @@TRANCOUNT

ROLLBACK

SET IMPLICIT_TRANSACTIONS OFF

SELECT * FROM Person.Person




/*
	Jawne transakcje - read committed, NOLOCK, READPAST, ROWLOCK, TABLOCK
*/


SELECT @@TRANCOUNT


SELECT *FROM Person.Person

BEGIN TRAN

UPDATE Person.Person SET LastName = 'Nowak' WHERE BusinessEntityID = 3


-- READPAST obniżenie poziomu izolacji transakcji
SELECT * FROM Person.Person WHERE BusinessEntityID < 100
ORDER BY BusinessEntityID
 


--> BEGIN --  Sesja 2, Activity Monitor

-- ! próba blokady strony
SELECT * FROM Person.Person


SELECT * FROM Person.Person WHERE BusinessEntityID = 1

SELECT * FROM Person.Person WHERE BusinessEntityID < 3 

SELECT * FROM Person.Person WHERE BusinessEntityID = 4

-- ! próba blokady wiersza
SELECT * FROM Person.Person WHERE BusinessEntityID < 4

SELECT * FROM Person.Person WHERE BusinessEntityID = 3 

-- ! próba blokady strony
SELECT * FROM Person.Person WHERE BusinessEntityID >4

-- wymuszenie blokady wiersza
SELECT * FROM Person.Person WITH (ROWLOCK) WHERE BusinessEntityID >4

-- NOLOCK obniżenie poziomu izolacji transakcji
SELECT * FROM Person.Person WITH (NOLOCK) 
ORDER BY BusinessEntityID

-- READPAST pominięcie zablokowanych danych
SELECT * FROM Person.Person WITH (READPAST) WHERE BusinessEntityID <= 100
ORDER BY BusinessEntityID
 
--> END --  Sesja 2


ROLLBACK

SELECT @@TRANCOUNT

SELECT * FROM Person.Person


BEGIN TRAN

UPDATE Person.Person WITH (TABLOCK) SET LastName = 'Nowak' WHERE BusinessEntityID = 3


--> BEGIN --  Sesja 2

-- ! cała tabela jest zablokowana, Activity Monitor
SELECT * FROM Person.Person WHERE BusinessEntityID = 1

SELECT * FROM Person.Person WHERE BusinessEntityID = 10

SELECT * FROM Person.Person WHERE BusinessEntityID = 100

SELECT * FROM Person.Person WHERE BusinessEntityID = 999

--> END --  Sesja 2




ROLLBACK

SELECT @@TRANCOUNT

SELECT * FROM Person.Person





/*
	LOCK_TIMEOUT
*/

DBCC USEROPTIONS
-- lock_timeout	-1




BEGIN TRAN

UPDATE Person.Person SET LastName = 'Nowak' WHERE BusinessEntityID = 3





--> BEGIN --  Sesja 2

-- ! cała tabela jest zablokowana, Activity Monitor
SELECT * FROM Person.Person

DBCC USEROPTIONS

-- milisekundy
SET LOCK_TIMEOUT 4000

SELECT * FROM Person.Person

DBCC USEROPTIONS

SET LOCK_TIMEOUT -1

DBCC USEROPTIONS

--> END --  Sesja 2



ROLLBACK

SELECT @@TRANCOUNT

SELECT * FROM Person.Person

