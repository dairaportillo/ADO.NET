USE [Northwind]
GO

/****** Object:  View [dbo].[Factura]    Script Date: 09/05/2022 20:03:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Factura]
AS
SELECT        TOP (100) PERCENT dbo.Customers.ID AS NCli, dbo.Customers.CompanyName AS Cliente, dbo.Orders.OrderID AS NFact, dbo.Orders.OrderDate AS FFac, dbo.[Order Details].UnitPrice AS Precio, 
                         dbo.Products.ProductName AS Productos, dbo.[Order Details].UnitPrice * 21 / 100 AS IVA, dbo.[Order Details].UnitPrice * 21 / 100 + dbo.[Order Details].UnitPrice AS PconIVA, dbo.[Order Details].Quantity AS Cant, 
                         (dbo.[Order Details].UnitPrice * 21 / 100 + dbo.[Order Details].UnitPrice) * dbo.[Order Details].Quantity AS Subtotal
FROM            dbo.Customers INNER JOIN
                         dbo.Orders ON dbo.Customers.ID = dbo.Orders.ID INNER JOIN
                         dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID INNER JOIN
                         dbo.Products ON dbo.[Order Details].ProductID = dbo.Products.ProductID

GO

select * from factura where nfact=10643
