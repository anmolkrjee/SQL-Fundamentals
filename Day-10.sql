USE normalization_lab;


SHOW TABLES;


SELECT * FROM orders;

SELECT * FROM Suppliers;

SELECT * FROM customers;

-- INNER JOIN

SELECT O.OrderID, C.*
FROM ORDERS AS O 
INNER JOIN CUSTOMERS AS C
ON O.CustomerID = C.CustomerID;


SELECT O.OrderID, C.* FROM ORDERS AS O
INNER JOIN CUSTOMERS AS C
ON O.CustomerID = C.CustomerID;


SELECT * FROM Products;
SELECT * FROM Customers;


SELECT * FROM Orderdetails;

-- Show Product purchased in every order


SELECT OD.OrderID, P.*, OD.QUANTITY
FROM Orderdetails AS OD
INNER JOIN Products AS P
ON OD.ProductID = P.ProductID;


-- SHOW CUSTOMER NAME AND PRODUCTS PURCHASED

SELECT C.CustomerName, P.ProductName, Od.Quantity
 FROM Customers as C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Orderdetails as Od
ON O.OrderID = Od.orderID
INNER JOIN Products as P
ON Od.ProductID = P.ProductID;


-- SHOW CUSTOMER NAME, PRODUCT NAME AND PRICE


SELECT C.CustomerName, P.ProductName, P.Price
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Orderdetails as Od
ON O.OrderID = Od.OrderID
INNER JOIN Products as P
ON Od.ProductID = P.ProductID;

-- Total Bill For each Product Purchased

SELECT 
P.ProductName, P.Price, Od.QUANTITY,
(P.Price) * (Od.QUANTITY) AS Total_Bill
FROM Products AS P
INNER JOIN Orderdetails AS Od
ON P.ProductID = Od.ProductID;






