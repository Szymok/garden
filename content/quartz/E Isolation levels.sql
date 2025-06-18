/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	E: Isolation levels - poziomy izolacji transakcji

*/


USE AdventureWorks2017
GO

/*	przygotowanie danych  */
DROP TABLE IF EXISTS dbo.Products

CREATE TABLE dbo.Products (
	ID int IDENTITY,
	ProductSubCategoryID int 
	REFERENCES Production.ProductSubcategory(ProductSubCategoryID),
	ProductName nvarchar(100)
)

SELECT @@TRANCOUNT
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) 
VALUES (1, 'Epic'), (1, 'Epic Hardtail'), (1, 'Chisel')

SELECT *FROM dbo.Products


/*	Read Uncommitted  */

BEGIN TRAN
  UPDATE dbo.Products SET ProductName = 'Hotrock' WHERE ID = 2
  SELECT * FROM dbo.Products WHERE ID = 2
GO

--> Sesja 2

ROLLBACK TRAN
GO









/*	Read Committed  */


BEGIN TRAN
  UPDATE dbo.Products SET ProductName = 'Hotrock' WHERE ID = 2
  SELECT * FROM dbo.Products WHERE ID = 2
GO

--> Sesja 2


COMMIT
GO

-- Cleanup
UPDATE dbo.Products SET ProductName = 'Epic Hardtail' WHERE ID = 2
GO



/*	Repeatable Read  */

DBCC USEROPTIONS

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
  SELECT * FROM dbo.Products
GO

--> Sesja 2

SELECT * FROM dbo.Products
COMMIT
GO

-- Cleanup
UPDATE dbo.Products SET ProductName = 'Epic Hardtail' WHERE ID = 2
GO


DBCC USEROPTIONS


-- Phantom Read - Odczyt widma

BEGIN TRAN
  SELECT * FROM dbo.Products
GO

--> Sesja 2

SELECT * FROM dbo.Products
COMMIT
GO

-- Cleanup
UPDATE dbo.Products SET ProductName = 'Epic Hardtail' WHERE ID = 2
GO

DELETE FROM dbo.Products WHERE ProductName = 'S-Works Prevail'





/*	Serializable  */

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRAN
  SELECT * FROM dbo.Products
GO

--> Sesja 2

SELECT * FROM dbo.Products
COMMIT
GO


SELECT * FROM dbo.Products


