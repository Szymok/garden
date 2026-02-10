/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	E: Isolation levels - poziomy izolacji transakcji
	Sesja 2
*/


USE AdventureWorks2017
GO


/*	Read Uncommitted  */


-- Sesja 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
GO

DBCC USEROPTIONS

SELECT * FROM dbo.Products 
GO

--> Sesja 1

SELECT * FROM dbo.Products 
GO


SELECT * FROM dbo.Products WITH (NOLOCK)

















/*	Read Committed  */

DBCC USEROPTIONS

-- Sesja 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT * FROM dbo.Products 
GO

--> Sesja 1










/*	Repeatable Read  */

-- Sesja 2
UPDATE dbo.Products SET ProductName = 'Hotrock' WHERE ID = 2
GO

--> Sesja 1



-- Phantom Read - Odczyt widma
-- Sesja 2
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) 
VALUES (1, 'S-Works Prevail')































/*	Serializable  */

-- Sesja 2
INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) 
VALUES (1, 'S-Works Prevail')


--> Sesja 1

