USE Northwind;

-- how many employees have home city of london?
SELECT Count(*) FROM Employees WHERE City = 'London';
-- 4

-- Which employee is a Doctor?
SELECT * FROM Employees WHERE TitleOfCourtesy = 'Dr.';
-- Andrew Fuller

-- How many products are discontinued?
SELECT Count(*) from Products WHERE Discontinued = 1;
-- 8

-- What are the names and product IDs of the products with a unit price below 5.00?
SELECT ProductID, ProductName FROM Products WHERE UnitPrice < 5.00;
-- 24   Guaraná Fantástica
-- 33   Geitost

-- Which categories have a category name with initials beginning with B or S?
SELECT * FROM Categories Where CategoryName LIKE '[BS]%';
-- Beverages
-- Seafood

-- How many orders are there for EmployeeIDs 5 and 7 (The total for both)
SELECT COUNT(*) FROM Orders WHERE EmployeeID = 5 OR EmployeeID = 7;
-- 114

-- Write a SELECT using the Employees table and concatenate First Name and Last Name together. Use a column alias to rename the column Name.
SELECT FirstName + ' ' + LastName As 'Name' FROM Employees;

-- Write a SELECT statement to list the six countries that have Region Codes in the Customers Table. 
SELECT Distinct(Country) FROM Customers Where Region LIKE '%';