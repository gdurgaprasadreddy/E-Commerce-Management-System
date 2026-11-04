INSERT INTO wishlist
(customer_id, product_id)
VALUES
(1, 5),
(1, 28),
(2, 1),
(2, 30),
(3, 29),
(4, 17),
(5, 20),
(6, 6),
(7, 22),
(8, 14),
(9, 3),
(10, 18);

INSERT INTO cart (customer_id)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO cart_items
(cart_id, product_id, quantity)
VALUES
(1, 5, 1),
(1, 28, 2),
(2, 1, 1),
(2, 26, 1),
(3, 3, 1),
(3, 27, 1),
(4, 17, 1),
(4, 19, 2),
(5, 6, 1),
(5, 25, 3),
(6, 14, 1),
(7, 21, 2),
(8, 30, 1),
(9, 22, 3),
(10, 29, 1);

INSERT INTO employees
(employee_name, manager_id, salary, designation)
VALUES
('Rajesh Kumar', NULL, 150000, 'CEO');

INSERT INTO employees
(employee_name, manager_id, salary, designation)
VALUES
('Suresh Rao',
 (SELECT employee_id FROM employees WHERE employee_name = 'Rajesh Kumar'),
 100000, 'Engineering Manager'),

('Priya Sharma',
 (SELECT employee_id FROM employees WHERE employee_name = 'Rajesh Kumar'),
 95000, 'Sales Manager'),

('Rahul Verma',
 (SELECT employee_id FROM employees WHERE employee_name = 'Suresh Rao'),
 60000, 'Software Developer'),

('Anil Kumar',
 (SELECT employee_id FROM employees WHERE employee_name = 'Suresh Rao'),
 55000, 'Database Developer'),

('Sneha Reddy',
 (SELECT employee_id FROM employees WHERE employee_name = 'Priya Sharma'),
 58000, 'Sales Executive'),

('Kiran Patel',
 (SELECT employee_id FROM employees WHERE employee_name = 'Priya Sharma'),
 52000, 'Sales Executive'),

('Arjun Rao',
 (SELECT employee_id FROM employees WHERE employee_name = 'Suresh Rao'),
 50000, 'Junior Developer');