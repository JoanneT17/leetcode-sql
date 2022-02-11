-- Table: Person
-- --+-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.

-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
-- Note that you are supposed to write a DELETE statement and not a SELECT one.


-- Solution
DELETE p1.*
FROM Person AS p1, Person AS p2
WHERE p1.email = p2.email AND p1.id > p2.id;

-- OR: (This one is faster)
DELETE FROM Person
WHERE id NOT IN (
     SELECT min_id
     FROM (SELECT MIN(id) AS min_id
           FROM Person
           GROUP BY email) AS min_ids
);


