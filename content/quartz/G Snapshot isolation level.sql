/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	G: Snapshot - migawkowy poziom izolacji transakcji

*/



USE AdventureWorks2017
GO

IF(SELECT @@TRANCOUNT)>0
ROLLBACK

/*	przygotowanie danych  */
DROP TABLE IF EXISTS dbo.Products

CREATE TABLE dbo.Products (
	ID int IDENTITY PRIMARY KEY,
	ProductSubCategoryID int 
	REFERENCES Production.ProductSubcategory(ProductSubCategoryID),
	ProductName nvarchar(100)
)


INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) 
VALUES (1, 'Epic'), (1, 'Epic Hardtail'), (1, 'Chisel')
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) 
VALUES (2, 'Tarmac'), (2, 'Roubaix'), (2, 'Venge')


SELECT * FROM dbo.Products





/* 
	Snapshot Isolation Level 
	- wersje wierszy
*/


DBCC USEROPTIONS

SELECT snapshot_isolation_state, snapshot_isolation_state_desc, is_read_committed_snapshot_on, * 
FROM sys.databases WHERE database_id = DB_ID()


ALTER DATABASE AdventureWorks2017 SET ALLOW_SNAPSHOT_ISOLATION ON

SELECT snapshot_isolation_state, snapshot_isolation_state_desc, is_read_committed_snapshot_on, * 
FROM sys.databases WHERE database_id = DB_ID()



SET TRANSACTION ISOLATION LEVEL SNAPSHOT 

DBCC USEROPTIONS

SELECT snapshot_isolation_state, snapshot_isolation_state_desc, is_read_committed_snapshot_on, * 
FROM sys.databases WHERE database_id = DB_ID()

SELECT COUNT(*) FROM sys.dm_tran_version_store



SELECT * FROM dbo.Products


SELECT @@TRANCOUNT


BEGIN TRAN
  UPDATE dbo.Products SET ProductName = 'Hotrock' -- Epic Hardtail
  WHERE ID = 2
  SELECT * FROM dbo.Products


--> BEGIN --  Sesja 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT 

DBCC USEROPTIONS

BEGIN TRAN

SELECT * FROM dbo.Products

--> END --  Sesja 2

SELECT @@TRANCOUNT AS trancount, COUNT(*) AS cnt 
FROM sys.dm_tran_version_store

SELECT * FROM sys.dm_tran_version_store



UPDATE dbo.Products SET ProductName = 'Road: ' + ProductName 
WHERE ProductSubCategoryID = 2

SELECT * FROM dbo.Products



SELECT @@TRANCOUNT AS trancount, COUNT(*) AS cnt FROM sys.dm_tran_version_store

SELECT * FROM sys.dm_tran_version_store



--> BEGIN --  Sesja 2


SELECT * FROM dbo.Products

UPDATE dbo.Products SET ProductName = 'Stumpjumper' WHERE ID = 1


--> END --  Sesja 2


-- druga transakcja - transaction_sequence_num
SELECT @@TRANCOUNT AS trancount, COUNT(*) AS cnt FROM sys.dm_tran_version_store

SELECT * FROM sys.dm_tran_version_store



SELECT * FROM dbo.Products

COMMIT 

SELECT * FROM dbo.Products



--> BEGIN --  Sesja 2

SELECT * FROM dbo.Products

COMMIT

SELECT * FROM dbo.Products

--> END --  Sesja 2

-- Stumpjumper 
SELECT * FROM dbo.Products



/* 
	Snapshot Isolation Level 
	- modyfikacja tego samego wiersza i wycofanie pierwszej
*/


--> Reset


SET TRANSACTION ISOLATION LEVEL SNAPSHOT 


DBCC USEROPTIONS

SELECT * FROM dbo.Products


BEGIN TRAN
  UPDATE dbo.Products SET ProductName = 'Hotrock' WHERE ID = 2
  SELECT * FROM dbo.Products


--> BEGIN --  Sesja 2

BEGIN TRAN

SELECT * FROM dbo.Products

UPDATE dbo.Products SET ProductName = 'Hotwalk' WHERE ID = 2


--> END --  Sesja 2


ROLLBACK








/* 
	Snapshot Isolation Level 
	- modyfikacja tego samego wiersza i zatwierdzenie pierwszej
	KONFLIKT
*/


--> Reset


SET TRANSACTION ISOLATION LEVEL SNAPSHOT 


DBCC USEROPTIONS

SELECT * FROM dbo.Products


BEGIN TRAN
  UPDATE dbo.Products SET ProductName = 'Hotrock' WHERE ID = 2
  SELECT * FROM dbo.Products


--> BEGIN --  Sesja 2

BEGIN TRAN

SELECT * FROM dbo.Products

UPDATE dbo.Products SET ProductName = 'Hotwalk' WHERE ID = 2


--> END --  Sesja 2


COMMIT







/* 
	Snapshot Isolation Level 
	- Niepowtarzalny odczyt (nie występuje)

*/

--> Reset


SET TRANSACTION ISOLATION LEVEL SNAPSHOT 


DBCC USEROPTIONS 


SELECT @@TRANCOUNT


--> BEGIN --  Sesja 2

BEGIN TRAN

SELECT * FROM dbo.Products

--> END --  Sesja 2


BEGIN TRAN
UPDATE dbo.Products SET ProductName = 'Hotwalk' WHERE ID = 2
SELECT * FROM dbo.Products

--> BEGIN --  Sesja 2

SELECT * FROM dbo.Products

--> END --  Sesja 2


SELECT * FROM dbo.Products

COMMIT








