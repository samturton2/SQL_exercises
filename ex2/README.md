# SQL ex2

```
USE Northwind;

-- how many employees have home city of london?
SELECT Count(*) FROM Employees WHERE City = 'London';
-- 4

-- Which employee is a Doctor?
SELECT * FROM Employees WHERE TitleOfCourtesy = 'Dr.';
-- Andrew Fuller
```
