/*Write a sql query which returns all employees whose offices are located in Japan.
 HINT: First find the offices located in Japan.*/
 select employeeNumber
 from classicmodels.employees e
 where e.officeCode in (select officeCode
 from classicmodels.offices
 where country= 'Japan');

select *
from classicmodels.offices
where country='Japan';
select *
from classicmodels.employees
where officeCode= '5';
/*Write a SQL query to display the customer who has the lowest payment. 
Return customer number, check number and amount. HINT: First find the minimum payment from the payments table.*/
select customerNumber,checkNumber , amount
from classicmodels.payments 
where amount= (select min(amount)
from classicmodels.payments);

/*Write a SQL query to find customers whose payments are less than the average payment using a subquery. 
Return customer number, check number and amount. HINT: First find the average payment from the payments table.*/
select distinct(customerNumber),checkNumber , amount
from classicmodels.payments
where amount<(select avg(amount)
from classicmodels.payments);

/*Write a SQL query to find customers whose payments are less than the average payment using a subquery.
 Return customer number, customer name, check number and amount. HINT1: First find the average payment from the payments table. 
 HINT2: Use join (with the customers table) to get customer name*/
select p.customerNumber,p.checkNumber ,p.amount, c.customerName
from classicmodels.payments p
left join classicmodels.customers c
on p.customerNumber = c.customerNumber
where amount<(select avg(amount)
from classicmodels.payments);

/*Write a SQL query to display the product lines and vendors for product lines which are supported by < 5 vendors.
 HINT: First find the number of product vendors for each product line.*/
select p.productLine, p.productVendor
from (select count(productVendor) as number_of_vendor
from classicmodels.products
group by productLine) as p
where number_of_vendor<5;

SELECT productLine, productVendor
FROM classicmodels.products
WHERE productLine IN (SELECT productLine 
FROM classicmodels.products
GROUP BY productLine
HAVING count(productVendor) < 5);

/*Write a SQL query to display all the customers who have left at least one comment for their orders.
 HINT: First find the customers who have left comments in the orders table. */
select distinct count(s.customerNumber)
from  ( select customerNumber
from classicmodels.orders
where comments is not null ) as s ;

SELECT count(*)
FROM classicmodels.customers
WHERE customerNumber IN
( SELECT count(customerNumber)
FROM classicmodels.orders
WHERE comments IS NOT NULL );

select distinct count(customerNumber)
from classicmodels.orders
where comments is not null;
