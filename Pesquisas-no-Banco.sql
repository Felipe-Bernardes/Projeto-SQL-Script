use ecommerce;

show tables;

SELECT * FROM clients;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Product WHERE Category = "Eletronico";
SELECT * FROM Product WHERE Category = "Brinaquedo";
SELECT concat(Fname, ' ', Mname, ' ', Lname) as Nome_Completo FROM Clients;
SELECT Price FROM Product;
SELECT SUM(Price) as Total_Price FROM Product;
SELECT * FROM Clients ORDER BY Fname;
SELECT * FROM Product ORDER BY Pname DESC;
SELECT * FROM Product HAVING Price >= 7;
SELECT * FROM Clients as c JOIN Seller as s WHERE c.CPF = s.CPF;



