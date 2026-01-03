-- Use practice database
USE sql_practice;

-- 1. Select all columns from employees
SELECT * FROM employees;

-- 2. Select employee names and salaries
SELECT name, salary FROM employees;

-- 3. Get unique departments
SELECT DISTINCT department FROM employees;

-- 4. Get employees from IT department
SELECT * FROM employees
WHERE department = 'IT';

-- 5. Get employees with salary greater than 60000
SELECT * FROM employees
WHERE salary > 60000;

-- 6. Get IT employees working in Bangalore
SELECT * FROM employees
WHERE department = 'IT' AND city = 'Bangalore';

-- 7. Get employees from Mumbai or Delhi
SELECT * FROM employees
WHERE city IN ('Mumbai', 'Delhi');

-- 8. Get employees with salary between 45000 and 65000
SELECT * FROM employees
WHERE salary BETWEEN 45000 AND 65000;

-- 9. Sort employees by salary in ascending order
SELECT * FROM employees
ORDER BY salary ASC;

-- 10. Sort employees by salary in descending order
SELECT * FROM employees
ORDER BY salary DESC;

-- 11. Sort employees by department and salary
SELECT * FROM employees
ORDER BY department, salary DESC;

-- 12. Get IT employees sorted by salary (highest first)
SELECT name, salary
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC;

-- 13. Get Delhi employees earning more than 50000
SELECT *
FROM employees
WHERE city = 'Delhi' AND salary > 50000;

-- 14. Get top 3 highest paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;