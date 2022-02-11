-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID and name of a customer.

-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- id is the primary key column for this table.
-- customerId is a foreign key of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

-- Write an SQL query to report all customers who never order anything.



-- Solution
-- Approach 1-Using subquery and NOT IN clause
SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);

-- Approach 2-LEFT JOIN and IS NULL
SELECT name AS Customers
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.id = o.CustomerId
WHERE o.CustomerId IS NULL;