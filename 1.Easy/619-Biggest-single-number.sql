-- Table: MyNumbers
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- There is no primary key for this table. It may contain duplicates.
-- Each row of this table contains an integer.

-- A single number is a number that appeared only once in the MyNumbers table.
-- Write an SQL query to report the largest single number. If there is no single number, report null.


-- +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 
-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note:
-- If there is no such number, just output null.


-- Solution
-- Using WHERE clause:
SELECT MAX(num) AS num
FROM (SELECT num, COUNT(num) as counts
      FROM MyNumbers
      GROUP BY num) a
WHERE counts = 1;

-- Using HAVING clause:
SELECT MAX(a.num) AS num
FROM (SELECT num, COUNT(num) as counts
      FROM MyNumbers
      GROUP BY num
      HAVING counts = 1
) a;