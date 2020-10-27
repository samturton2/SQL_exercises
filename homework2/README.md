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
