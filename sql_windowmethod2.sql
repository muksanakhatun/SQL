/*Write a sql query that returns the employees who were hired first in their department. 
Return first name, last name, department id and hire date. */
with cst as 
( select first_name,last_name,department_id,hire_date,
row_number () over (partition by department_id order by hire_date asc) as first_hire_person
from hr.employees )
select first_name,last_name,department_id,hire_date
from cst
where first_hire_person=1;

/*Write a SQL query to find those employees who work in the department 'Marketing'. 
Return first name, last name and department ID. HINT: First find all the Marketing departments
 and then find the employees in this department by inner join employees table and the result from the CTE query.*/
with t1 as ( select *
from hr.departments
where department_name = 'Marketing' )
select e.first_name, e.last_name, e.department_id
from t1
inner join hr.employees e
using (department_id);

/*
select *
from hr.departments
where department_name = 'Marketing';
select *
from hr.employees
where department_id =20;*/

/*Write a SQL query to display the customer numbers, names and total purchase amount for 
the ones who rank top 5 in the purchase amount. HINT: purchase = quantityOrdered * priceEach */
select *
from classicmodels.customers;
select*
from classicmodels.orderdetails;

with t1 as ( select sum(d.quantityOrdered*priceEach) as purchase,o.customerNumber
from classicmodels.orderdetails d
inner join classicmodels.orders o
using (orderNumber)
group by o.customerNumber
order by purchase desc
limit 5 )
select c.customerNumber,c.customerName, t.purchase
from t1 t
inner join classicmodels.customers c
using (customerNumber);

/*Write a SQL query to display the type of customers based on the number of orders that customers ordered.
First write a SQL query to display the customers and their orders. Use this query as a CTE query.
 Next, use a case statement for customer orders from the results of CTE query with respect to the following logic:
orderCount = 1: ‘One-time Customer’
orderCount = 2: ‘Repeated Customer’
orderCount = 3: ‘Frequent Customer’
orderCount > 3: ‘Loyal Customer’*/
select *
from classicmodels.customers;
select *
from classicmodels.orders;
select *
from classicmodels.orderdetails;
select o.
from classicmodels.customers c 
inner join classicmodels.orders o
using (customerNumber)


