
-- What are the products with quantity in stock between 1000 and 2000?. Return product code,  product name, and quantityInStock.
select productcode,  productname, quantityInStock
from classicmodels.products
where quantityInStock between 1000 and 2000;


-- List the products whose code starts with S18. Return product code, product name, and product vendor
select productcode, productname, productvendor
from classicmodels.products
where productCode like ('s18%')


-- How many distinct products do classicmodels sell?
select count(distinct(productName))
from classicmodels.products;

-- Report the name and city of customers who do not have sales representatives ?
select customerName,city
from classicmodels.customers
where salesRepEmployeeNumber is null;

-- What are the names of executives with VP or Manager in their title? Return full name and job title.
 Use the CONCAT function to combine the employees firstname and lastname into a single field for reporting.
 select lastName, firstName,jobTitle, concat(firstName,lastName) as fullname
 from classicmodels.employees
 where jobTitle like '%Manager%'or jobTitle like '%VP%' ;
 
-- What is the maximum, minimum, average and total of payments received?
select max(amount), min(amount),avg(amount),sum(amount)
from classicmodels.payments;

-- How many employees are there in the company?
select count(employeeNumber)
from classicmodels.employees;

-- Report those payments greater than $100,000
select amount
from classicmodels.payments
where amount>100000;

-- Report total payments for October 28,2004 */
select paymentDate,amount, sum(amount)
from classicmodels.payments
where paymentDate='2004-10-28';
select*
from classicmodels.payments
limit 10;

select *
from classicmodels.products
where productName like '%Ford%';

select*
from classicmodels.products
where productName like '% ship';

select customerName,country
from classicmodels.customers
where country in ('Denmark', 'Norway','Sweden');

select concat(lastName, firstName) as fullname
from classicmodels.employees
where firstName in ('Larry'  , 'Barry');



