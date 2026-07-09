USE normalization_lab;

-- INNER JOIN / JOIN, LEFT/LEFT OUTER, RIGHT/RIGHT/ORDER, FULL/FULL OUTER JOIN, CROSS JOIN, SELF JOIN


-- Inner join :- Matching column

-- Left join :- Matching column + Left table all columns

-- Right join :- Matching column + Right table all columns

-- Full Outer Join = Right join + Left Join - Inner Join

-- Cross Join = Left and right table and remove matching part

-- Self table = Join with the same table , single table is used to join

SHOW TABLES;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE orderdetails;


TRUNCATE TABLE customers;

TRUNCATE TABLE products;

TRUNCATE TABLE suppliers;



TRUNCATE TABLE orders;


SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Customers VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');




INSERT INTO Suppliers VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');





INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);





INSERT INTO Orders VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);




INSERT INTO OrderDetails VALUES

(1001,201,1),
(1001,202,2),

(1002,203,1),
(1002,206,3),

(1003,204,1),
(1003,203,5),

(1004,205,1),
(1004,207,2),

(1005,208,4),
(1005,209,3),

(1006,201,1),
(1006,213,2),

(1007,202,4),
(1007,211,1),

(1008,203,2),

(1009,212,1),
(1009,206,2),

(1010,207,3),
(1010,208,2),

(1011,201,1),
(1011,205,1),

(1012,202,3),
(1012,209,4);

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM products;

SELECT * FROM suppliers;


SELECT * FROM orderdetails;


-- Supplier of every product

SELECT P.ProductName, S.SupplierName 
FROM suppliers as S
INNER JOIN products as P
ON S.SupplierID = P.SupplierID;


-- Complete order report

SELECT C.CustomerID,
C.CustomerName, 
P.ProductName, 
P.Price, 
Od.QUANTITY, 
(P.Price*Od.QUANTITY) AS Total_Amount,
S.SupplierName
FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN Orderdetails AS Od
ON O.OrderID = Od.OrderID
INNER JOIN Products AS P
ON Od.ProductID = P.ProductID
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID;


-- Placed order or not List of customers

SELECT C.CustomerID, 
C.CustomerName, 
O.OrderID
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.CustomerID = O.CustomerID;


-- 1

SELECT C.CustomerName,
O.OrderID
FROM customers AS C
INNER JOIN Orders as O
ON C.CustomerID = O.CustomerID;


-- 2

SELECT P.ProductName,
P.Price, S.SupplierName
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID;

-- 3

SELECT P.ProductName,
P.Category, 
S.SupplierName
FROM Products AS P
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
WHERE P.Category = "Electronics";

-- 4

SELECT C.CustomerName
FROM customers AS C
INNER JOIN Orders as O
ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerName;

-- 5

SELECT
S.SupplierName,
P.ProductName
FROM Suppliers AS S
INNER JOIN Products AS P
ON S.SupplierID = P.SupplierID
ORDER BY S.SupplierName;


