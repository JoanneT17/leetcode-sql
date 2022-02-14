-- Table: Courses
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key column for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.

-- Write an SQL query to report all the classes that have at least five students.



-- Solution
-- My approach
SELECT class
FROM (SELECT class, COUNT(DISTINCT student) AS num
      FROM Courses
      GROUP BY class
) AS a
WHERE num >= 5;

-- OR:
SELECT class
FROM Course
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
