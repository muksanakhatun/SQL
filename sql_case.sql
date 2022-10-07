/* 1 .Create a new column which categorizes products as LOW (less than $50) and HIGH (>= $50) based on the price of product (priceEach).
 Return product code, price each and price category.*/
 select productCode , priceEach, 
case 
when priceEach <50 then 'LOW'
when priceEach >=50 then 'HIGH'
end as price_category
 from classicmodels.orderdetails;

/*2. We would like to categorize the customers in the customers table to different groups based on their credit limits. 
Write a SQL query to display the number of customers in each credit group. 
Let’s follow the logic below while categorizing the customers.
creditLimit < 10000: 'NO CREDIT'
creditLimit >= 10000 AND  creditLimit < 100000: 'Bronze', 
creditLimit >= 100001 AND  creditLimit < 200000: 'Silver'
creditLimit >= 200000: 'Gold' */
SELECT 
    COUNT(customerNumber),
    CASE
        WHEN creditLimit < 10000 THEN 'NO CREDIT'
        WHEN
            creditLimit >= 10000
                AND creditLimit < 100000
        THEN
            'Bronze'
        WHEN
            creditLimit >= 100001
                AND creditLimit < 200000
        THEN
            'Silver'
        WHEN creditLimit >= 200000 THEN 'Gold'
    END AS 'creditcatagory'
FROM
    classicmodels.customers
GROUP BY (creditcatagory);


/*3. We would like to categorize the orders in the orders table to different groups based on order year. 
Write a SQL query to display the number of orders in each year. 
Let’s follow the logic below while categorizing the orders.
orderDate = 2003: '2003 order'
orderDate = 2004: '2004 order'
orderDate = 2005: '2005 order'
orderDate >=  2006: '2006+ order*/
SELECT  count(orderNumber),
    CASE
        WHEN year(orderDate) = 2003 THEN '2003 order'
        WHEN year(orderDate) = 2004 THEN '2004 order'
        WHEN year(orderDate) = 2005 THEN '2005 order'
        WHEN year(orderDate) >= 2006 THEN '2006+ order'
    END as orderyear
from classicmodels.orders
group by orderyear;

 /* 4. ex: Write a SQL query that reports how many customers per country
have a credit limit of less than 100K or more than 100K */

 /*5. ex3: Categorize time difference between order and ship date
'1 day'   -> shippedDate - orderDate = 1
'2 days'  -> shippedDate - orderDate = 2
'3 days'  -> shippedDate - orderDate = 3
'4 days'  -> shippedDate - orderDate = 4
'5 days'  -> shippedDate - orderDate = 5
'5+ days' -> shippedDate - orderDate = anything else */
select shippedDate - orderDate,orderNumber,
case shippedDate - orderDate
when 1 then '1 day'
when 2 then '2 day'
when 3 then '3 day'
when 4 then ' 4 day'
when 5 then '5 day'
else '5+day'
end as daydiff
from classicmodels.orders;

/*  6.  Categorize the prices in the products table based on their buy price
Categories
Low Price       -> buyPrice < 30
Medium Price    -> buyPrice >= 30 AND buyPrice < 50
High Price      -> buyPrice >= 50 AND buyPrice < 80
Very High Price -> buyPrice >= 80
Unknown         -> all other prices including NULL
*/
select buyPrice,
case
when buyPrice<30 then 'low price'
when buyPrice>= 30 and buyPrice<50 then ' medium price'
when buyPrice >= 50 and buyPrice< 80 then 'high price'
when buyPrice>= 80 then 'very high price'
else 'unknown'
end as 'price catagory'
from classicmodels.products;



