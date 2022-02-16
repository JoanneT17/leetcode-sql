-- Table: Triangle
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.

-- Write an SQL query to report for every three line segments whether they can form a triangle.


-- Example

-- | x  | y  | z  |
-- |----|----|----|
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- For the sample data above, your query should return the follow result:
-- | x  | y  | z  | triangle |
-- |----|----|----|----------|
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |


-- Solution
SELECT x, y, z,
       CASE 
            WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
            ELSE 'No'
       END AS triangle
FROM triangle;