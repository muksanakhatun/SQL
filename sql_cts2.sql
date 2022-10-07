/*Q1) Write a SQL query to find those employees who earn more than average salary and who work in any of the ‘IT’ departments.
 Return first name and last name.*/
 select *
 from hr.employees
 where department_id=60;
 select avg(salary)
 from hr.employees;
 select avg(salary)
 from hr.employees
 where department_id='60';
SELECT 
    *
FROM
    departments;
SELECT 
    first_name, last_name
FROM
    hr.employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            hr.employees)
        AND department_id in (SELECT 
            department_id
        FROM
            hr.departments
        WHERE
            department_name like 'IT%');
            
/*Q2) Write a SQL query to find those employees who work in a department where the employee’s first name contains a letter ‘R’. 
Return employee ID, first name and last name.*/
select *
from hr.employees;
select *
from hr.employees
where department_id is null;
select*
from hr.departments;
select employee_id,first_name,last_name
from hr.employees
where (first_name like 'R_%' or first_name like  '%_r' or first_name like '%_r_%') and department_id is not null;
select employee_id,first_name,last_name,department_id
from hr.employees
where first_name like '%r%' and department_id is not null;
