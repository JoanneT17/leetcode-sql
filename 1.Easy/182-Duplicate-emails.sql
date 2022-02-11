-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+


-- Solution
-- Approach 1-GROUP BY clause
SELECT Email FROM (
    SELECT Email, COUNT(Email) AS num
    FROM Person
    GROUP BY Email
) AS number
WHERE num > 1;

-- Approach 2-HAVING clause
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1;