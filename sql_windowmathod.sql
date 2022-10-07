/*1.	Use the employees table. Write a SQL query which returns employees first names, 
manager id, department id and minimum, maximum, total and average salary, and  employee headcount for each job.*/
select first_name,manager_id,department_id,job_id,
min(salary) over (partition by job_id order by salary) as min_salary,
max(salary)over (partition by job_id order by salary) as max_salary,
sum(salary)over (partition by job_id order by salary) as total_salary,
avg(salary)over (partition by job_id order by salary) as avg_salary,
count(*) over (partition by job_id ) as num_employee
from hr.employees;

/*2.	Use the employees table. Write a sql query which returns first name, last name, salary, department_id, 
 and the first name of the employee with the lowest salary in their department. (Hint: Use FIRST_VALUE()).*/
select first_name,last_name,salary,department_id,
first_value(first_name) over (partition by department_id order by salary range between unbounded preceding and unbounded ) as min_salary
from hr.employees;

/*3.	Use the employees and departments tables. Write a sql query which returns first name, last name, salary, department_name, 
 and the first name of the employee with the lowest salary in their department.
 (Hint: Use FIRST_VALUE() and inner join with departments table)*/
select e.first_name,e.last_name,e.salary,e.department_id,d.department_name,
first_value(e.first_name) over (partition by e.department_id order by e.salary ) as min_salary
from hr.employees e
inner join hr.departments d
using (department_id) ;

/*4.	Use the employees table. Write a SQL query which returns first name, last name, department id,
 hire date and the hire date of the employee in the same department which was hired just after them.*/
select first_name,last_name,department_id,hire_date,
lead (hire_date,1) over (partition by department_id order by hire_date ) as next_hire_date
from hr.employees;

/*5.	Use the employees table. Write a SQL query which returns first name, last name, department id,
 hire date and the hire date of the employee in the same department which was hired just before them.*/
select first_name,last_name,department_id,hire_date,
lag (hire_date,1) over (partition by department_id order by hire_date ) as previous_hire_date
from hr.employees;

/*6.	Use the employees table. Write a sql query which returns employees first_name, last_name, their salary, 
hire date and their rank them by their salaries per hire date */

select first_name,last_name,salary,hire_date,
rank () over (partition by hire_date order by salary) 
from hr.employees;
/*7.	Use the employees table. Write a sql query which returns employees first_name, last_name, their salary,
 job id and their row number by their salaries per hire date */
 
 
 /* ex 5: Write a sql query which returns first and last names, their department ids,
hire date, the hire date of the employee hired just before in the same department. */


/* ex 4: Write a sql query which returns first and last names, their department ids,
hire date, the hire date of the employee hired just after in the same department. */

/* ex 3: Write a sql query which returns first and last names,
department ids, hire date, the hire date of the employee hired just after in the company. */
select first_name,last_name,department_id,hire_date,
lead (hire_date,1) over (order by hire_date) as next_hire_date
from hr.employees;
/* ex2: Write a sql query which returns first and last names,
department ids, salaries of the employees and the employees who have the highest salary in each department. */
select first_name,last_name,department_id,salary,
first_value(first_name) over(partition by department_id order by salary desc) as highet_salary
from hr.employees;

/* ex1: Write a sql query which returns first and last names,
their department ids, salary and the employees who have the lowest salary in their each department. */

/* ex: Calculate row number, rank, dense rank of employees in the employees table
according to their salary within each department.
Return first name, last name, salary, rank, dense_rank and row number of salaries. */
select first_name,last_name,salary,
row_number() over (partition by department_id order by salary) ,
rank()over (partition by department_id order by salary),
dense_rank()over (partition by department_id order by salary)
from hr.employees;
/* PQ1: Write a SQL query which returns employees first names, last names, department id and
minimum, maximum, total and average salary, and employee headcount for each department.
Note that each department is considered as one partition in this example */

/* ex2: Return employee name, salary
and minimum salary in their department */

/* ex1: Return the minimum salary of all employees
along with the salary of each individual employee */
