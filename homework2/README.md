# SQL queering homework

Q1
```
SELECT COUNT(*) FROM Orders;
#830
```

Q2
```
SELECT COUNT(*) FROM Orders WHERE ShipCity = 'Rio de Janeiro';
#34
```

Q3
```
SELECT * FROM Orders WHERE ShipCity = 'Rio de Janeiro' OR ShipCity = 'Reims';
#39
```

Q4
```
SELECT * FROM Customers WHERE CompanyName LIKE '%[Zz]%';
#9
```

Q5
```
SELECT CompanyName, ContactName, Phone, City FROM Customers WHERE Fax is NULL;
#22
SELECT CompanyName, ContactName, Phone, City FROM Suppliers WHERE Fax is NULL;
#16
```

Q6
```
SELECT * FROM Customers WHERE City = 'Paris';
#2
```

Q7
```
SELECT TOP 5 COUNT(Orders.OrderID) AS 'Number of Orders', Customers.CompanyName, Customers.CustomerID
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID =  Customers.CustomerID
WHERE Customers.City = 'Paris'
GROUP BY Customers.CustomerID,
        Customers.CompanyName
ORDER BY Count(Orders.OrderID) DESC;
#2
```

Q8
```
SELECT
    Customers.CustomerID,
    Customers.CompanyName,
    Customers.ContactName,
    Customers.Phone,
    Customers.Fax,
    COUNT(Orders.OrderID) AS 'Overdue_Orders'
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ShippedDate - Orders.RequiredDate > 10 AND Customers.City = 'Paris'
GROUP BY
    Customers.CustomerID,
    Customers.CompanyName,
    Customers.ContactName,
    Customers.Phone,
    Customers.Fax
ORDER BY count(Orders.OrderID) DESC;
```
