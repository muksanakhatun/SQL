-- Report customers and their payments.  (HINT: join customers and payments tables)
select*
from classicmodels.customers C
inner join classicmodels.payments P
on C.customerNumber=P.customerNumber;

-- List all orders with order number, customer name and order date (HINT: join customers and orders tables)
SELECT orders.orderNumber, orders.orderDate, customers.customerName
from  classicmodels.customers
inner join classicmodels.orders
on customers.customerNumber=orders.customerNumber;

-- List all customers who have or not have any order. 
-- Return customer name, order number, and order date (HINT: join customers and orders tables)
select customers.customerName, orders.orderNumber, orders.orderDate
from classicmodels.customers
left join classicmodels.orders
on customers.customerNumber=orders.customerNumber;

-- List all customers with customer name who have no orders (HINT: join customers and orders tables)
select customers.customerName, orders.orderNumber, orders.orderDate
from classicmodels.customers
left join classicmodels.orders
on customers.customerNumber=orders.customerNumber
where orders.orderNumber is null;

-- Report products with their description. Return product code, name, and description. (HINT: join products and productlines tables)
select products.productDescription, products.productCode,products.productName
from classicmodels.products
inner join classicmodels.productlines
using (productLine);

-- list all orders with order date, order line number, product name, quantity ordered, and price for each product.
-- (HINT: join orders, orderdetails, and products tables)
select orders.orderDate,products.productName,orderdetails.priceEach,orderdetails.quantityOrdered,orderdetails.orderLineNumber
from classicmodels.orders
inner join classicmodels.orderdetails
using (orderNumber)
inner join classicmodels.products
using (productCode);

-- List all employees who have or not have any customers. 
-- Return employee first name, last name, customer name, check number, and amount paid. (HINT: join employees, customers, and payments tables)
select customers.customerName,employees.firstName,employees.lastName,payments.checkNumber,payments.amount
from classicmodels.employees
left join classicmodels.customers
on employees.employeeNumber =customers.salesRepEmployeeNumber
left join classicmodels.payments
on customers.customerNumber=payments.customerNumber;
  
