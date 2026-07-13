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
 
 
 
  use normalization_lab;


select upper(customerName) as customer_Names from customers;


select lower(customerName) as customer_Names from customers;


select customerName, length(customerName) from customers;


select concat(customerName,"-",address) from customers;


select substring(customerName,1,4) from customers;


select replace(customerName,'a','*') from customers;


select trim(customerName) from customers;


select upper(customerName), lower(address) from customers;


select * from products;


select substring(productName,1,3) from products;


select productName, length(productName) as lenPro from products having lenPro>8;


select concat(customerName,' (',address,')') from customers;


select replace(productName," ","_") as productName from products;


select address, length(address) as len from customers;


select customerName, substring(customerName,1,1) as initial from customers;


Select * from customers;

Select * from products;

Select * from orders;

Select * from supplier;

Select * from orderdetails;


-- find total amount spent by each customer.

SELECT
    c.customerID,
    c.customerName,
    SUM(od.quantity * p.price) AS total_amount_spent
FROM customers c
JOIN orders o
    ON c.customerID = o.customerID
JOIN orderdetails od
    ON o.orderID = od.orderID
JOIN products p
    ON od.productID = p.productID
GROUP BY c.customerID, c.customerName
ORDER BY total_amount_spent DESC;


-- display customers who have placed more than 2 orders


select c.customerName, od.quantity 
from customers c 
join orders o 
on c.customerID=o.customerID 
join orderdetails od 
on o.orderID=od.orderID 
where od.quantity>2;



-- find average price of products supplied by each supplier




-- Display the top five most expensive products
select productName, price from products order by price desc limit 5;



-- Find products that have never been ordered

-- Display supplier names along with number of products they supply.

-- Find customers who purchased products from more than one supplier 

-- Display the product ordered in the highest quantity 

-- Display the first three characters of product names whose price is above the average product price.

select substring(productName,1,3) as productName, price from products 
    where price>(
    select avg(price) from products);


-- Display customer names in uppercase along with their total purchase amount







-- Find customers whose total purchase amount is greater than the average customer pusrchase.

-- Display suppliers whose products have never appeared in any order

-- Find the customer who placed the maximum number of orders.

-- Display the second highest priced product.

-- find products whose prices are greater than the average price of products in their supplier group.
     
-- Display cities having more than three coustomers.

-- Find customers who purchased the most expensive product.






-- Display products ordered by at atleast five different customers.

-- find suppliers contributing the highest revenue.





-- Display products whose names contain exactly six characters.
select productName, length(productName) as len from products having len=6;



 
 