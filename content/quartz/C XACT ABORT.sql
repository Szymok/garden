/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	C: XACT_ABORT

*/


USE AdventureWorks2017
GO


SELECT * FROM Production.ProductSubcategory WHERE ProductCategoryID = 1

DROP TABLE IF EXISTS dbo.Products

CREATE TABLE dbo.Products (
	ID int IDENTITY,
	ProductSubCategoryID int REFERENCES Production.ProductSubcategory(ProductSubCategoryID),
	ProductName nvarchar(100)
)




/*
	Batch
	XACT_ABORT OFF (DEFAULT)
*/

DBCC USEROPTIONS


INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
-- FK Error
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (111, 'Epic Hardtail')
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')
GO

SELECT * FROM dbo.Products


/*
	Batch
	XACT_ABORT ON
*/

TRUNCATE TABLE dbo.Products

SET XACT_ABORT ON
GO

DBCC USEROPTIONS
GO


INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
-- FK Error
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (111, 'Epic Hardtail')
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')
GO

SELECT * FROM dbo.Products



/*
	Transaction
	XACT_ABORT OFF (DEFAULT)
*/


TRUNCATE TABLE dbo.Products

SET XACT_ABORT OFF
GO

DBCC USEROPTIONS
GO


BEGIN TRANSACTION

	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
	-- FK Error
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (111, 'Epic Hardtail')
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')

COMMIT
GO

SELECT * FROM dbo.Products





/*
	Transaction
	XACT_ABORT ON
*/


TRUNCATE TABLE dbo.Products

SET XACT_ABORT ON
GO

DBCC USEROPTIONS
GO


BEGIN TRANSACTION

	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
	-- FK Error
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (111, 'Epic Hardtail')
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')

COMMIT
GO

SELECT * FROM dbo.Products



/*
	TRY-CATCH
	XACT_ABORT OFF (DEFAULT)
*/

TRUNCATE TABLE dbo.Products

SET XACT_ABORT OFF
GO

DBCC USEROPTIONS
GO



BEGIN TRANSACTION
BEGIN TRY
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
	-- FK Error
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (111, 'Epic Hardtail')
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')

COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Błąd i wycofanie transakcji';
	THROW
END CATCH

SELECT * FROM dbo.Products




-- Wykonanie bez błędu
BEGIN TRANSACTION
BEGIN TRY
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic Hardtail')
	INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')

COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	PRINT 'Błąd i wycofanie transakcji';
	THROW
END CATCH

SELECT * FROM dbo.Products