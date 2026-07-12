USE normalization_lab;

SHOW TABLES;


SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM products;

SELECT * FROM suppliers;


SELECT * FROM orderdetails;


-- Functions

-- Scalar vs aggregate

-- String function

-- UPPER
-- LOWER
-- LENGTH
-- CONCATE
-- TRIM
-- SUBSTRING
-- REPLACE



-- Numeric function

-- Date and Time function

-- Scalar - Single row and Aggregate - > Multi row

-- Convert text into uppercase

-- SELECT UPPER(column_name) AS upper_name
-- FROM table_name;

 -- Display all customer names in uppercase
 
 SELECT UPPER(CustomerName) AS Upper_name
 FROM Customers;
 
 -- Display all customer name in lowercase
 
 SELECT LOWER(CustomerName) AS Lower_name
 FROM Customers;
 
 -- find the length of every customer name
 
 SELECT customerName, LENGTH(CustomerName) AS concat_string
 FROM Customers;
 
 -- Display customer name along with city in one column
 
 SELECT CONCAT(CustomerName, ' - ', address) AS concat_string
 FROM Customers;
 
 -- Show first four characters of every customer name
 
 SELECT SUBSTRING(CustomerName, 1, 4) AS chr_4
 FROM Customers;
 
 
 -- Replace letter 'a' with "*" in customer name
 
 SELECT REPLACE(CustomerName, "a", "*") AS replace_name
 FROM Customers;
 
 -- Remove spaces from text
 
 SELECT TRIM("    Database  Systems   ");
 
 -- Display customername in uppercase and city in lower case
 
 SELECT UPPER(CustomerName) AS Upper_name, LOWER(address) AS Lower_name
 FROM Customers;
 
 -- Display first three letters of every product
 
 SELECT SUBSTRING(ProductName, 1, 3) AS chr_3
 FROM products;
 
 -- Find products having names longer than 8 characters
 
 SELECT ProductName FROM Products
 WHERE LENGTH(ProductName) > 8;
 
 -- Display:  CustomerName (CITY)
 
 
 
 -- Replaces spaces in product names with "_"
 
 -- Display total number of characters in city names
 
 
 -- Display customer initials using SUBSTRING() 
 
 -- create output : Rahul purchased Laptop
 
 -- Display only first five letters of product names
 
 -- Display product name in uppercase
 
 