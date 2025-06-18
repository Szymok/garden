/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	D: Nested Transaction - zagnieżdżone transakcje

*/




USE AdventureWorks2017
GO




-- zwraca liczbę otwartych transakcji
SELECT @@TRANCOUNT

BEGIN TRAN 
SELECT @@TRANCOUNT -- 1
  BEGIN TRAN 
  SELECT @@TRANCOUNT -- 2

  COMMIT
  SELECT @@TRANCOUNT -- 1
  BEGIN TRAN
  SELECT @@TRANCOUNT -- 2
  
 ROLLBACK
 SELECT @@TRANCOUNT -- 0



/*
	zatwierdzenie transakcji, a potem jej wycofanie...
*/

DROP TABLE IF EXISTS dbo.Products

CREATE TABLE dbo.Products (
	ID int IDENTITY,
	ProductSubCategoryID int REFERENCES Production.ProductSubcategory(ProductSubCategoryID),
	ProductName nvarchar(100)
)

SELECT @@TRANCOUNT

BEGIN TRAN
  BEGIN TRAN
    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic Hardtail')
    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')
  COMMIT

  INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'S-Works Prevail')

  ROLLBACK

SELECT * FROM dbo.Products




/*
	problem z ldf
*/

USE AdventureWorks2017
GO
DBCC SHRINKFILE ('AdventureWorks2017_log' , 0, TRUNCATEONLY)
GO



DROP TABLE IF EXISTS dbo.Products

CREATE TABLE dbo.Products (
	ID int IDENTITY,
	ProductSubCategoryID int REFERENCES Production.ProductSubcategory(ProductSubCategoryID),
	ProductName char(8000) --!!!
)


CHECKPOINT

SELECT log_reuse_wait, log_reuse_wait_desc, name FROM sys.databases WHERE database_id = DB_ID()

DBCC SQLPERF ('LOGSPACE');
GO

SELECT @@TRANCOUNT

BEGIN TRAN
GO

  BEGIN TRAN
  GO

    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic')
    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Epic Hardtail')
    INSERT INTO dbo.Products (ProductSubCategoryID, ProductName) VALUES (1, 'Chisel')
	GO 1000

	DBCC SQLPERF ('LOGSPACE');
    GO

COMMIT
GO

CHECKPOINT
GO
  
DBCC SQLPERF ('LOGSPACE');
GO


SELECT log_reuse_wait, log_reuse_wait_desc, name FROM sys.databases WHERE database_id = DB_ID()

  
SELECT @@TRANCOUNT

COMMIT
GO


CHECKPOINT
GO
  
DBCC SQLPERF ('LOGSPACE');
GO
  

SELECT log_reuse_wait, log_reuse_wait_desc, name FROM sys.databases WHERE database_id = DB_ID()

