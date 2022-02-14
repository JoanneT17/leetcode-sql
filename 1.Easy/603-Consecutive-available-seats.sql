-- Table: Cinema
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | seat_id     | int  |
-- | free        | bool |
-- +-------------+------+
-- seat_id is an auto-increment primary key column for this table.
-- Each row of this table indicates whether the ith seat is free or not. 1 means free while 0 means occupied.

-- Write an SQL query to report all the consecutive available seats in the cinema.
-- Return the result table ordered by seat_id in ascending order.
-- The test cases are generated so that more than two seats are consecutively available.

-- Input: 
-- Cinema table:
-- +---------+------+
-- | seat_id | free |
-- +---------+------+
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
-- +---------+------+
-- Output: 
-- +---------+
-- | seat_id |
-- +---------+
-- | 3       |
-- | 4       |
-- | 5       |
-- +---------+

-- Solution
-- Using LEAG() & LEAD():
SELECT seat_id
FROM (SELECT seat_id, free,
      LAG(free, 1) OVER() AS prev,
      LEAD(free, 1) OVER() AS next
      FROM Cinema
) a
WHERE a.free = 1 AND (prev = 1 OR next = 1)
ORDER BY seat_id ASC;

-- Using JOIN:
SELECT DISTINCT a.seat_id
FROM Cinema AS a
JOIN Cinema AS b
  ON ABS(a.seat_id - b.seat_id) = 1
  AND a.free = TRUE AND b.free = TRUE
ORDER BY a.seat_id;

-- OR:
SELECT seat_id
FROM cinema
WHERE free = 1 AND (
    seat_id - 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
    OR
    seat_id + 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
);