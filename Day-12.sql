USE normalization_lab;

SHOW TABLES;


SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM products;

SELECT * FROM suppliers;


SELECT * FROM orderdetails;

-- 6

SELECT Od.OrderID, 
P.ProductName, 
Od.QUANTITY, 
P.Price
FROM Products AS P
INNER JOIN Orderdetails AS Od
ON p.ProductID = Od.ProductID;

-- 7
SELECT C.CustomerName,
P.ProductName,
Od.QUANTITY
FROM customers AS C
INNER JOIN Orders as O
ON C.CustomerID = O.CustomerID
INNER JOIN orderdetails AS Od
ON O.OrderID = Od.OrderID
INNER JOIN Products AS P
ON Od.ProductID = P.ProductID;

-- 9

SELECT C.CustomerName,
O.OrderID
FROM customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE CustomerName LIKE "A%";


-- 10

SELECT P.ProductName,
S.SupplierName
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
WHERE SupplierName LIKE "%tech%";


-- 11

SELECT P.ProductName,
S.SupplierName,
P.Price
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
WHERE price between 500 AND 3000
ORDER BY price DESC;


-- 12

SELECT C.CustomerName,
O.OrderID, 
C.Address
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE Address LIKE "%Delhi%";


-- 13

SELECT P.ProductName,
Od.QUANTITY
FROM Products AS P
INNER JOIN Orderdetails AS Od
ON P.ProductID = Od.ProductID
WHERE OD.QUANTITY >= 5;

-- 14
SELECT P.ProductName,
S.SupplierName,
P.Category
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
WHERE P.Category IN ("Electronics", "Furniture");


-- 15

SELECT C.CustomerName,
O.OrderID, 
C.Address
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE Address NOT IN ("Mumbai");


-- Level 5

-- 28

SELECT C.CustomerName,
S.SupplierName, 
Od.QUANTITY,
P.Price
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Orderdetails AS Od
ON O.OrderID = Od.OrderID
INNER JOIN Products AS P
ON Od.ProductID = P.ProductID
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
ORDER BY P.Price DESC LIMIT 5;


-- 29 Find the customer name who has purposed

SELECT C.CustomerName,
SUM(Od.QUANTITY) AS Total_Quantity
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Orderdetails AS Od
ON O.OrderID = Od.OrderID
GROUP BY C.CustomerName
ORDER BY Total_Quantity DESC LIMIT 1;

-- 30

SELECT ProductName, Price
FROM Products AS P
WHERE Price > (SELECT AVG(PRICE) FROM Products);

-- Subquery

-- WHERE WE USE

-- WHERE 
-- FROM
-- SELECT
-- INSERT
-- UPDATE
-- DELETE

-- MULTIROW SUBQUERY
-- IN
-- NOT IN
-- ANY
-- ALL
-- EXISTS
-- NOT EXISTS

 -- JOINS VS SUBQUERY
 
 -- Combine data from multiple tables
 -- Used to display related information
 -- Usually faster for reporting
 
 -- SUBQUERY
 
 -- One query inside another query
 -- Mainy used for filtering or comaprison
 
 -- Products priced above average
 
 
 SELECT ProductName, Price
FROM Products AS P
WHERE Price > (SELECT AVG(PRICE) FROM Products);
 
 -- Most expensive product
 
 SELECT ProductName,
 Price FROM Products
 WHERE price IN (SELECT MAX(Price) FROM Products);
 
 
 -- Customers who placed orders
 
 SELECT CustomerName
 FROM customers
 WHERE CustomerID IN (
 SELECT CustomerID FROM Orders);
 
 
 -- Products never ordered
 
 SELECT ProductName 
 FROM Products
 WHERE ProductID NOT IN 
 (SELECT ProductID FROM Orderdetails);
 
 -- Products supplied by suppliers from Delhi
 
 SELECT ProductName
 FROM Products
 WHERE SupplierID IN (
 SELECT SupplierID FROM Suppliers
 WHERE Address IN ("Delhi")
 );
 -- Suppliers supplying products above average price
 -- Latest order
 -- Customers who ordered expensive products
 -- Suppliers whose products were never ordered
 -- Find second highest priced product
 -- Find products costing more than every stationary product
 
 
 
