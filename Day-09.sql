USE RESTAURANT;


SHOW TABLES;

 -- our purpose is not only design database and store data but our purpose is store the data in more efficient way so that
 -- it saves our cost and productive way
 
 -- solution is normalization
 
 -- ACID :- Atomicity, Consistency, Isolation and Durability
 
 -- Normalization means dividing a large table into smaller, related tables
 -- to avoid duplicate data and maintain consistency.
 
 -- Normalization helps to:

-- Remove duplicate data
-- Store data efficiently
-- Improve consistency
-- Reduce storage space
-- Prevent anomalies

-- 1NF :- Each column must contain only one , value (atomic value).
-- No multiple values in a single cell.


-- STEP 1: CREATE DATABASE

CREATE DATABASE normalization_lab;

USE normalization_lab;


-- STEP : 2 Create Unnormalized table

CREATE TABLE orderData
(
	OrderID INT,
    CustomerName varchar(50),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    SupplierName VARCHAR(50),
    SupplierPhone VARCHAR(15),
    Quantity INT,
    Price DECIMAL(10, 2)
);


INSERT INTO orderData
VALUES
(101, 'Amit Sharma', '9876543210', 'Delhi', 'Laptop', 'Electronics', 'TechWorld', '9811111111', 2, 55000.00),

(102, 'Priya Singh', '9876543211', 'Mumbai', 'Smartphone', 'Electronics', 'MobileHub', '9822222222', 1, 25000.00),

(103, 'Rahul Verma', '9876543212', 'Jaipur', 'Office Chair', 'Furniture', 'FurniMart', '9833333333', 4, 3500.00),

(104, 'Neha Gupta', '9876543213', 'Pune', 'Refrigerator', 'Appliances', 'HomeCare', '9844444444', 1, 30000.00),

(105, 'Rohan Mehta', '9876543214', 'Bengaluru', 'Washing Machine', 'Appliances', 'CleanTech', '9855555555', 1, 22000.00),

(106, 'Sneha Patel', '9876543215', 'Ahmedabad', 'Dining Table', 'Furniture', 'WoodCraft', '9866666666', 1, 18000.00),

(107, 'Vikas Kumar', '9876543216', 'Chandigarh', 'Headphones', 'Electronics', 'SoundMax', '9877777777', 3, 2500.00),

(108, 'Anjali Roy', '9876543217', 'Kolkata', 'Air Conditioner', 'Appliances', 'CoolAir', '9888888888', 2, 40000.00),

(109, 'Suresh Nair', '9876543218', 'Hyderabad', 'Study Table', 'Furniture', 'WoodCraft', '9899999999', 2, 6500.00),

(110, 'Kavita Joshi', '9876543219', 'Lucknow', 'Tablet', 'Electronics', 'MobileHub', '9800000000', 5, 18000.00);


SELECT * FROM OrderData;


INSERT INTO orderData
VALUES
(111, 'Amit Sharma', '9876543210', 'Delhi', 'Keyboard', 'Electronics', 'TechWorld', '9811111111', 2, 1200.00),

(112, 'Priya Singh', '9876543211', 'Mumbai', 'Tablet', 'Electronics', 'MobileHub', '9822222222', 1, 18000.00),

(113, 'Rahul Verma', '9876543212', 'Jaipur', 'Dining Table', 'Furniture', 'WoodCraft', '9866666666', 1, 18000.00),

(114, 'Neha Gupta', '9876543213', 'Pune', 'Air Conditioner', 'Appliances', 'CoolAir', '9888888888', 1, 40000.00),

(115, 'Rohan Mehta', '9876543214', 'Bengaluru', 'Laptop', 'Electronics', 'TechWorld', '9811111111', 1, 55000.00),

(116, 'Sneha Patel', '9876543215', 'Ahmedabad', 'Study Table', 'Furniture', 'WoodCraft', '9866666666', 2, 6500.00),

(117, 'Vikas Kumar', '9876543216', 'Chandigarh', 'Smartphone', 'Electronics', 'MobileHub', '9822222222', 2, 25000.00),

(118, 'Anjali Roy', '9876543217', 'Kolkata', 'Refrigerator', 'Appliances', 'HomeCare', '9844444444', 1, 30000.00),

(119, 'Suresh Nair', '9876543218', 'Hyderabad', 'Office Chair', 'Furniture', 'FurniMart', '9833333333', 3, 3500.00),

(120, 'Kavita Joshi', '9876543219', 'Lucknow', 'Headphones', 'Electronics', 'SoundMax', '9877777777', 4, 2500.00);



-- NOW CREATE NORMALIZED TABLES

 CREATE TABLE Customers
 (
	CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);


CREATE TABLE Suppliers(
	 SupplierID INT PRIMARY KEY,
     SupplierName VARCHAR(50),
     SupplierPhone VARCHAR(15)
);


CREATE TABLE Products
(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);



CREATE TABLE Orders
(
	OrderID INT PRIMARY KEY,
    CustomerID INT,
	FOREIGN KEY(CustomerID) REFERENCES CustomerS(CustomerID)
);
 


CREATE TABLE OrderDetails 
(
 OrderID INT, 
 ProductID INT,
 QUANTITY INT,
 PRIMARY KEY(OrderID, ProductID),
 FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
 FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
 );
 
 SHOW TABLES;
 
 -- INSERT 5 RECORDS IN EACH TABLES 
 
 INSERT INTO Customers (CustomerID, CustomerName, Phone, Address)
VALUES
(1, 'Amit Sharma', '9876543210', 'Delhi'),
(2, 'Priya Singh', '9876543211', 'Mumbai'),
(3, 'Rahul Verma', '9876543212', 'Jaipur'),
(4, 'Neha Gupta', '9876543213', 'Pune'),
(5, 'Rohan Mehta', '9876543214', 'Bengaluru');



INSERT INTO Suppliers (SupplierID, SupplierName, SupplierPhone)
VALUES
(201, 'TechWorld', '9811111111'),
(202, 'MobileHub', '9822222222'),
(203, 'FurniMart', '9833333333'),
(204, 'HomeCare', '9844444444'),
(205, 'WoodCraft', '9855555555');


INSERT INTO Products (ProductID, ProductName, Category, Price, SupplierID)
VALUES
(301, 'Laptop', 'Electronics', 55000.00, 201),
(302, 'Smartphone', 'Electronics', 25000.00, 202),
(303, 'Office Chair', 'Furniture', 3500.00, 203),
(304, 'Refrigerator', 'Appliances', 30000.00, 204),
(305, 'Dining Table', 'Furniture', 18000.00, 205);



INSERT INTO Orders (OrderID, CustomerID)
VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);




INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(101, 301, 2),
(102, 302, 1),
(103, 303, 4),
(104, 304, 1),
(105, 305, 2);




-- Update Rahul's phone number, which table is updated

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 3;


-- Add one new customer. Without placing any order. Is it possible ??

INSERT INTO Customers (CustomerID, CustomerName, Phone, Address)
VALUES
(7, 'Nitish Kumar', '9508542782', 'Patna');

-- Delete order 112. Check whether customer infomation still exists




 
 







