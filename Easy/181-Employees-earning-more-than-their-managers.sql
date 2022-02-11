-- Table: Employee

-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

-- Write a SQL query that finds out employees who earn more than their managers. 


-- Solution
-- Approach 1-WHERE clause
SELECT e1.name as Employee
FROM Employee AS e1, Employee AS e2
WHERE e1.salary > e2.salary AND e1.managerId = e2.id;

-- Approach 2-JOIN
SELECT a.Name AS Employee
FROM Employee AS a
JOIN Employee AS b
     ON a.managerId = b.id
     AND a.salary > b.salary;

-- Approach 3-Subqury
SELECT a.name as Employee 
FROM Employee AS a
WHERE a.managerId IN (
     SELECT b.id 
     FROM Employee AS b
          WHERE a.salary > b.salary);