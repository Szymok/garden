/*
	Tomasz Libera | libera@kursysql.pl

	TRANSAKCJE
	F: Deadlocks - Zakleszczenia

*/
USE AdventureWorks2017
GO
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

SELECT *FROM dbo.Products



SELECT @@TRANCOUNT


BEGIN TRAN

UPDATE dbo.Products SET ProductName = ProductName + ' MOD' 
WHERE ID = 1 

SELECT * FROM Products 