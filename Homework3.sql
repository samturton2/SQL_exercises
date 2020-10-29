USE Northwind;

SELECT AVG(P.UnitsOnOrder) AS 'Average units on order',
        S.CompanyName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
GROUP BY S.CompanyName
ORDER BY AVG(P.UnitsOnOrder) DESC;

-- D3V AND FARAH QUESTIONS

-- Query section

--Q1
SELECT ProductID, ProductName, UnitPrice, Discontinued
FROM Products;

--Q2
SELECT CONVERT(DECIMAL(6,2), MAX(UnitPrice)) AS 'Most Expensive Product Price',
        CONVERT(DECIMAL(6,2), MIN(UnitPrice)) AS 'Cheapest Product Price',
        CONVERT(DECIMAL(6,2), AVG(UnitPrice)) AS 'Average Product Price'
FROM Products;

--Q3
SELECT ProductID, ProductName, UnitPrice, Discontinued
FROM Products
WHERE UnitPrice < 25;

--Q4
SELECT SUM(CONVERT(INT,Discontinued)) AS 'No. of discontinued products'
FROM Products;

--Q5
SELECT ProductID, ProductName, UnitPrice,
CASE
    WHEN Discontinued = 0 THEN 'Available'
    ELSE 'Discontinued'
    END
AS 'Discontinued'
FROM Products;

--Q6
SELECT CustomerID, CompanyName, ContactName, Phone, City
FROM Customers
WHERE Country = 'UK';

--Q7
SELECT O.OrderID, O.CustomerID, 
        E.FirstName + ' ' + E.LastName AS 'Employee''s Full Name',
        O.ShipCity
FROM Orders O
LEFT JOIN Employees E ON O.EmployeeID = E.EmployeeID
WHERE O.ShipCountry = 'UK';

--Q8
SELECT P.ProductID, P.ProductName, C.CategoryName, P.UnitPrice
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID;

--Q9
SELECT Orders.OrderID, 
        Products.ProductID,
        Customers.CompanyName,
        Employees.FirstName + ' ' + Employees.LastName AS 'Employee''s Full Name',
        Products.UnitPrice,
        [Order Details].Quantity,
        Orders.ShipCountry
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID;

--Q10
SELECT Orders.OrderID, 
        Products.ProductID,
        Customers.CompanyName,
        Employees.FirstName + ' ' + Employees.LastName AS 'Employee''s Full Name',
        Products.UnitPrice,
        [Order Details].Quantity,
        Orders.ShipCountry,
        Categories.CategoryName,
        DATEDIFF(yyyy,  Employees.BirthDate, GETDATE()) AS 'Employee''s Age',
CASE
    WHEN DATEDIFF(dd, Orders.ShippedDate, Orders.RequiredDate) < 0 THEN 'LATE'
    ELSE 'ON TIME'
    END
AS 'Shipping Time'
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--Q11
SELECT TOP 5 Customers.CustomerID, Customers.CompanyName,
        COUNT([Order Details].Quantity) AS 'Number of Orders',
        CONVERT(DECIMAL(10,2), SUM([Order Details].UnitPrice * [Order Details].Quantity * (1-[Order Details].Discount))) AS 'Total Spent'
FROM Customers
LEFT JOIN Orders On Customers.CustomerID = Orders.CustomerID
LEFT JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Customers.CustomerID, Customers.CompanyName
ORDER BY 'Total Spent' DESC;