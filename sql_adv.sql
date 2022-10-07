-- Write a SQL query that combines the first name and last name of employees and customers into a single result set.
select contactLastName,contactFirstName
from classicmodels.customers
UNION 
select lastName,firstName
from classicmodels.employees;


/* Combine the result sets of the following two queries using the UNION function. 
The 1st query selects all columns from the orders table where the status = "Disputed".
 Set the alias for the status column to "Issue". The 2nd query selects all columns from the orders table where the status = "On Hold".*/
SELECT 
    orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    status AS 'ISSUE',
    comments,
    customerNumber
FROM
    classicmodels.orders
WHERE
    status = 'Disputed' 
UNION SELECT 
    *
FROM
    classicmodels.orders
WHERE
    status = 'On Hold';

-- List all people that we deal with (employees and customer contacts). Display first name, last name, company name (or employee)
SELECT contactLastName LASTNAME, contactFirstName AS FIRSTNAME,customerName
FROM classicmodels.customers
UNION
SELECT firstName,lastName, 'EMPLOYEE' AS 'COMPANY NAME'
FROM classicmodels.employees;

/* Write a SQL query that returns the minimum, maximum, average and total quantity in stock,
 and the number of product in each product line in products table.*/
 
SELECT 
    productLine,
    COUNT(productCode) as 'number of product',
    MIN(quantityInStock) as 'min',
    MAX(quantityInStock) as 'max',
    AVG(quantityInStock) 'avg',
    SUM(quantityInStock)as 'total'
FROM
    classicmodels.products
GROUP BY (productLine)
order by (productCode) desc;
SELECT 
    productLine,
    COUNT(productline) as 'number of product',
    MIN(quantityInStock) as 'min',
    MAX(quantityInStock) as 'max',
    AVG(quantityInStock) 'avg',
    SUM(quantityInStock)as 'total'
FROM
    classicmodels.products
GROUP BY (productLine)
order by (productCode) desc;

/* Write a SQL query that return the total number of quantity in stock for each product line 
which has total quantity in stock is between 20,000 and 100,000 units*/

select productLine,sum(quantityInStock) as total
from classicmodels.products
group by (productLine)
having total  between 20000 and 100000;
