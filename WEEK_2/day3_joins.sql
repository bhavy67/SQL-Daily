-- Use practice database
USE sql_practice;

-- INNER JOIN: Employees with managers
SELECT e.name, e.department, d.manager
FROM employees e
INNER JOIN departments d
ON e.department = d.department;

-- LEFT JOIN: All employees with managers if available
SELECT e.name, e.department, d.manager
FROM employees e
LEFT JOIN departments d
ON e.department = d.department;

-- Employees in IT with manager info
SELECT e.name, d.manager
FROM employees e
INNER JOIN departments d
ON e.department = d.department
WHERE e.department = 'IT';

-- Employees without department manager info
SELECT e.name, e.department
FROM employees e
LEFT JOIN departments d
ON e.department = d.department
WHERE d.manager IS NULL;

-- Count employees per department
SELECT d.department, d.manager, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department = e.department
GROUP BY d.department, d.manager;

/* =====================================================
   DAY 3 – SQL JOIN THEORY
   ===================================================== */

/* WHAT IS A JOIN
   JOIN is used to combine rows from multiple tables
   based on a related column between them.
*/

/* WHY JOIN IS NEEDED
   - Data is normalized across tables
   - JOIN brings related data together
*/

/* INNER JOIN
   - Returns ONLY matching rows from both tables
   - Rows without a match are discarded
*/

-- INNER JOIN mental model:
-- "Give me records that exist in BOTH tables"

/* LEFT JOIN
   - Returns ALL rows from the left table
   - Matching rows from right table
   - Non-matching rows return NULLs
*/

-- LEFT JOIN mental model:
-- "Give me EVERYTHING from the left table"

/* INNER vs LEFT JOIN
   INNER JOIN -> only matches
   LEFT JOIN  -> keep all left rows
*/

/* JOIN CONDITION (ON)
   - Defines how rows are matched
   - Usually primary key = foreign key
*/

/* JOIN + WHERE
   - JOIN happens first
   - WHERE filters after join
*/

/* FIND MISSING RELATIONSHIPS
   LEFT JOIN + WHERE right_table.column IS NULL
*/

/* JOIN + GROUP BY
   - Used for reporting and analytics
   - Aggregate after joining tables
*/

/* SQL EXECUTION ORDER (IMPORTANT)
   FROM
   -> JOIN
   -> WHERE
   -> GROUP BY
   -> HAVING
   -> SELECT
   -> ORDER BY
*/

/* COMMON MISTAKES
   - Using WHERE instead of ON for join logic
   - Forgetting LEFT JOIN when NULLs are needed
   - Filtering LEFT JOIN rows incorrectly
*/

/* ONE-LINERS (MEMORIZE)
   - INNER JOIN = only matches
   - LEFT JOIN = keep all left rows
   - ON defines relationship
   - WHERE filters result set
   - NULL means no match
*/