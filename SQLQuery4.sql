/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE Northwind
--1
	SELECT TOP 1 MAX([UnitPrice]) as [price?], [ProductName], [CategoryID]  from [dbo].[Products] WHERE [CategoryID] = 1  GROUP BY [ProductName], [UnitPrice], [CategoryID] ORDER BY[UnitPrice] DESC 
--2
	SELECT [ShipCity] FROM [Orders] where DATEDIFF(day, [OrderDate], [RequiredDate]) > 10 group by ShipCity
--4
	SELECT count(distinct CustomerID)[count], custORDER.EmployeeID from Orders as custORDER 
	right join (SELECT top 1 [EmployeeId], COUNT(*) cnt FROM Orders GROUP BY EmployeeId ORDER BY COUNT(*) desc) as penis
	on custORDER.EmployeeID = penis.EmployeeId
	group by custORDER.EmployeeID
--5
	select [EmployeeID], [OrderDate], count(ShipCity) cnt, [ShipCity] from Orders WHERE [EmployeeID] = 1 AND [ShipCountry] = 'France' Group by [EmployeeID], [OrderDate], [ShipCity]
--6
	Select distinct Orders.ShipCountry from Orders join
	(SELECT ShipCountry, ShipCity, Count(OrderID) as cnt from Orders Group By ShipCountry, ShipCity Having Count(OrderID) > 2) as cityORDER
	on Orders.ShipCountry = cityORDER.ShipCountry
--7

 select Products.ProductName from Products 
  join 
  (select ProductID, sum(Quantity)[sum] from [Order Details]
  group by ProductID
  having sum(Quantity)<1000) as Qunt
  on Products.ProductID = Qunt.ProductID
--8 

select distinct ContactName as [Name] from Customers 
join 
(select ShipCity, CustomerID from Orders) as orders
on Customers.CustomerID = orders.CustomerID WHERE Customers.[City] != orders.[Shipcity]

select distinct ContactName as [Name] from Customers 
join Orders
on Customers.CustomerID = Orders.CustomerID WHERE Customers.[City] != orders.[Shipcity]
--9
	
SELECT TOP 1 cat.CategoryName FROM Orders o
   JOIN [Order Details] od ON o.OrderID = od.OrderID
		JOIN Products p ON od.ProductID = p.ProductID
			JOIN Customers c ON o.CustomerID = c.CustomerID
				JOIN Categories cat ON p.CategoryID = cat.CategoryID
				WHERE c.Fax IS NOT NULL AND YEAR(o.OrderDate) = 1997
				GROUP BY cat.CategoryName
			ORDER BY COUNT(*) DESC

--10
   SELECT emp.EmployeeID, emp.FirstName, emp.LastName, SUM(Quantity)[продано едениц товара] FROM Orders o
   JOIN [Order Details] od ON o.OrderID = od.OrderID
		join Employees emp on o.EmployeeID = emp.EmployeeID
		WHERE YEAR(o.OrderDate) = 1996 and MONTH(o.OrderDate) in (9,10,11)
		GROUP BY emp.EmployeeID, emp.FirstName,emp.LastName