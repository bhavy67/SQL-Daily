-- =====================================================
-- WEEK 3 - DAY 1 : SQL SUBQUERIES (HANDS-ON PRACTICE)
-- =====================================================

-- Use practice database
USE sql_practice;

-- -----------------------------------------------------
-- 1. Employees earning more than the average salary
-- (Single-value subquery)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- -----------------------------------------------------
-- 2. Employees earning less than the maximum salary
-- (Single-value subquery)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- -----------------------------------------------------
-- 3. Employees working in departments with > 2 employees
-- (Multi-value subquery with IN)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 2
);

-- -----------------------------------------------------
-- 4. Employees working in cities where avg salary > 55000
-- (Subquery with GROUP BY + HAVING)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE city IN (
    SELECT city
    FROM employees
    GROUP BY city
    HAVING AVG(salary) > 55000
);

-- -----------------------------------------------------
-- 5. Employees NOT working in high-paying cities
-- (NOT IN subquery)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE city NOT IN (
    SELECT city
    FROM employees
    GROUP BY city
    HAVING AVG(salary) > 55000
);

-- -----------------------------------------------------
-- 6. Employees earning exactly the minimum salary
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- -----------------------------------------------------
-- 7. Employees whose salary is above their department's average
-- (Nested logic using subquery)
-- -----------------------------------------------------
SELECT e.*
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- -----------------------------------------------------
-- 8. Departments that have at least one employee earning > 70000
-- -----------------------------------------------------
SELECT DISTINCT department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 70000
);

-- -----------------------------------------------------
-- 9. Employees working in departments managed by 'Suresh'
-- (Using second table: departments)
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE department IN (
    SELECT department
    FROM departments
    WHERE manager = 'Suresh'
);

-- -----------------------------------------------------
-- 10. Employees who are NOT in departments with a manager
-- -----------------------------------------------------
SELECT *
FROM employees
WHERE department NOT IN (
    SELECT department
    FROM departments
);

-- =====================================================
-- WEEK 3 - DAY 1 : SUBQUERY THEORY (CRISP REVISION)
-- =====================================================

/*
WHAT IS A SUBQUERY
- A query inside another query
- Inner query runs FIRST
- Outer query uses its result
*/

/*
WHEN TO USE SUBQUERY
- When required data comes from another query result
- When filtering depends on aggregated values
*/

/*
TYPES OF SUBQUERIES
1. Single-value subquery
   - Returns ONE value
   - Use with =, >, <, >=, <=

2. Multi-value subquery
   - Returns MULTIPLE values
   - Use with IN / NOT IN
*/

/*
IMPORTANT RULE
- Single value  -> =, >, <
- Multiple values -> IN, NOT IN
*/

/*
WHERE SUBQUERIES ARE USED
- WHERE clause (most common)
- FROM clause (later, advanced)
- SELECT clause (avoid for now)
*/

/*
EXECUTION ORDER (IMPORTANT)
1. Inner query executes first
2. Result passed to outer query
3. Outer query filters rows
*/

/*
COMMON MISTAKES
- Using = instead of IN
- Forgetting parentheses
- Assuming subquery runs per row (it doesn’t, unless correlated)
*/

/*
ONE-LINER SHORTCUTS (MEMORIZE)
- Subquery = query inside query
- Inner query runs first
- IN = multiple values
- = = single value
- Use subquery when data depends on another result
*/