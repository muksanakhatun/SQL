-- 1. Write a SQL query to display the number of products in each product line. 
select count(productCode), productLine
from classicmodels.products
group by productLine;

-- 2.Write a SQL query to display the total number of products per product line where the number of products greater than 3. 
select count(productCode) as number_of_product, productLine
from classicmodels.products
group by productLine
having number_of_product>3 ;

/* 3. Write a SQL query to display total, average, minimum, maximum and total number of payments for each customer. 
Return customer number, total, average, minimum, maximum, and the number of payments.*/
SELECT 
    SUM(amount)as total,
    round(avg(amount),2) as average,
    MIN(amount) as min,
    MAX(amount) as max,
    COUNT(amount) as numberofpayments,
    customerNumber
FROM
    classicmodels.payments
GROUP BY customerNumber;

/*4. Write a SQL query to display the total number of payments and total payment amount
 for each customer for payments made before October 28, 2004.*/
SELECT 
    SUM(amount)as total,
    round(avg(amount),2) as average,
    MIN(amount) as min,
    MAX(amount) as max,
    COUNT(amount) as numberofpayments,
    customerNumber
FROM
    classicmodels.payments
    where paymentDate< '2004-10-28'
GROUP BY customerNumber;

/* 5. Write a SQL query to display the number for 10 customers who made the highest total payment in 2004.
 HINT: use YEAR(paymentDate) to extract the year of payments. */
select sum(amount) as total ,customerNumber
from classicmodels.payments
where year(paymentDate)=2004
group by customerNumber
order by total desc
limit 10;

/*6. SQL query to display total, average, minimum, maximum and total number of payments for each customer.
 Return customer name, total, average, minimum, maximum, and the number of payments.*/
SELECT 
    c.customerName,
    SUM(p.amount)as total,
    AVG(p.amount)as average ,
    MIN(p.amount)as minimum,
    MAX(p.amount)as maximum
FROM
    classicmodels.payments p
        LEFT JOIN
    classicmodels.customers c USING (customerNumber);

/*7. Write a SQL query to display the total value for each order. 
Return order numbers and their values. HINT: look at orderdetails table. */
select orderNumber, sum(priceEach*quantityOrdered) as total
from classicmodels.orderdetails
group by orderNumber;

-- 8. Use the results from the previous query and find out which orders have a value greater than $5,000. 
select orderNumber, sum(priceEach*quantityOrdered) as total
from classicmodels.orderdetails
group by orderNumber
having total>5000;

/*10. Write a SQL query to display the total sales for each year. 
HINT: calculate sales = quantityOrdered * priceEach from orderDetails and status = 'Shipped' from orders table*/
select sum(o.priceEach*quantityOrdered) as total,year (p.orderDate) as year
from classicmodels.orderdetails o
inner join classicmodels.orders p
on o.orderNumber=p.orderNumber
where p.status='Shipped'
group by year(orderDate) ;


