-- Use practice database
USE sql_practice;

-- 1. Count employees per department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 2. Count employees per city
SELECT city, COUNT(*) AS city_count
FROM employees
GROUP BY city;

-- 3. Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 4. Total salary paid per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 5. Average salary per department for employees earning more than 50000
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 50000
GROUP BY department;

-- 6. Departments with average salary greater than 60000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 7. Cities with total salary greater than 100000
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
HAVING SUM(salary) > 100000;

-- 8. Departments with more than 2 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 9. Cities having more than 1 employee earning above 50000
SELECT city, COUNT(*) AS high_earners
FROM employees
WHERE salary > 50000
GROUP BY city
HAVING COUNT(*) > 1;

-- 10. Average salary per city sorted from highest to lowest
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
ORDER BY avg_salary DESC;

/* =====================================================
   DAY 2 – SQL THEORY
   ===================================================== */

/* GROUP BY
   - Groups rows with same values
   - One output row per group
   - Used with aggregate functions
*/

/* AGGREGATE FUNCTIONS
   COUNT(*)   -> number of rows
   SUM(col)   -> total
   AVG(col)   -> average (always decimal)
   MIN(col)   -> smallest
   MAX(col)   -> largest
*/

/* NON-AGGREGATE RULE (VERY IMPORTANT)
   If a column is in SELECT and NOT aggregated,
   it MUST be present in GROUP BY.
*/

/* WHERE
   - Filters individual rows
   - Runs BEFORE GROUP BY
   - Cannot use aggregate functions
*/

/* HAVING
   - Filters grouped results
   - Runs AFTER GROUP BY
   - Used with aggregate functions
*/

/* WHERE vs HAVING
   Row condition        -> WHERE
   Aggregate condition  -> HAVING
*/

/* SQL EXECUTION ORDER
   FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/

/* COMMON MISTAKES
   - Using aggregates in WHERE
   - Selecting non-grouped columns
   - Using HAVING instead of WHERE
*/

/* ONE-LINERS (MEMORIZE)
   - WHERE filters rows
   - HAVING filters groups
   - GROUP BY defines grouping
   - AVG returns decimal
*/

/* 
   COUNT(*) = number of rows
   COUNT(column) = number of non-NULL values
*/
