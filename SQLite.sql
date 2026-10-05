-- Step 1: Create Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(20)
);

-- Step 2: Insert Sample Data
INSERT INTO customers VALUES
(1, 'Alice', 'Smith'), (2, 'Bob', 'Jones'), 
(3, 'Charlie', 'Brown'), (4, 'Diana', 'Prince');

INSERT INTO orders VALUES
(101, 1, 250.00, 'Completed'), (102, 1, 850.00, 'Completed'),
(103, 2, 120.00, 'Completed'), (104, 2, 450.00, 'Completed'),
(105, 3, 75.00, 'Completed'),  (106, 3, 50.00, 'Cancelled'),
(107, 4, 1200.00, 'Completed');

-- Step 3: Run Top Customers Query
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;