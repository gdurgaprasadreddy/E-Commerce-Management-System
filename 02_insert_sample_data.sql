INSERT INTO customers
(customer_name, email, phone, registration_date)
VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', CURRENT_DATE - 100),
('Priya Reddy', 'priya@gmail.com', '9876543211', CURRENT_DATE - 90),
('Arjun Kumar', 'arjun@gmail.com', '9876543212', CURRENT_DATE - 80),
('Sneha Patel', 'sneha@gmail.com', '9876543213', CURRENT_DATE - 70),
('Vijay Rao', 'vijay@gmail.com', '9876543214', CURRENT_DATE - 60),
('Ananya Singh', 'ananya@gmail.com', '9876543215', CURRENT_DATE - 50),
('Kiran Kumar', 'kiran@gmail.com', '9876543216', CURRENT_DATE - 40),
('Divya Sharma', 'divya@gmail.com', '9876543217', CURRENT_DATE - 35),
('Rohit Verma', 'rohit@gmail.com', '9876543218', CURRENT_DATE - 30),
('Pooja Nair', 'pooja@gmail.com', '9876543219', CURRENT_DATE - 25),
('Suresh Reddy', 'suresh@gmail.com', '9876543220', CURRENT_DATE - 20),
('Meena Kumari', 'meena@gmail.com', '9876543221', CURRENT_DATE - 18),
('Akhil Varma', 'akhil@gmail.com', '9876543222', CURRENT_DATE - 15),
('Neha Gupta', 'neha@gmail.com', '9876543223', CURRENT_DATE - 12),
('Ramesh Babu', 'ramesh@gmail.com', '9876543224', CURRENT_DATE - 10),
('Swathi Rao', 'swathi@gmail.com', '9876543225', CURRENT_DATE - 8),
('Manoj Kumar', 'manoj@gmail.com', '9876543226', CURRENT_DATE - 5),
('Lakshmi Devi', 'lakshmi@gmail.com', '9876543227', CURRENT_DATE - 3),
('Naveen Reddy', 'naveen@gmail.com', '9876543228', CURRENT_DATE - 2),
('Harsha Vardhan', 'harsha@gmail.com', '9876543229', CURRENT_DATE - 1);

INSERT INTO addresses
(customer_id, address_type, city, state, pincode)
VALUES
(1, 'Home', 'Hyderabad', 'Telangana', '500001'),
(2, 'Home', 'Vijayawada', 'Andhra Pradesh', '520001'),
(3, 'Office', 'Bangalore', 'Karnataka', '560001'),
(4, 'Home', 'Chennai', 'Tamil Nadu', '600001'),
(5, 'Home', 'Hyderabad', 'Telangana', '500002'),
(6, 'Office', 'Mumbai', 'Maharashtra', '400001'),
(7, 'Home', 'Delhi', 'Delhi', '110001'),
(8, 'Home', 'Pune', 'Maharashtra', '411001'),
(9, 'Office', 'Bangalore', 'Karnataka', '560002'),
(10, 'Home', 'Kochi', 'Kerala', '682001'),
(11, 'Home', 'Hyderabad', 'Telangana', '500003'),
(12, 'Office', 'Chennai', 'Tamil Nadu', '600002'),
(13, 'Home', 'Vijayawada', 'Andhra Pradesh', '520002'),
(14, 'Home', 'Mumbai', 'Maharashtra', '400002'),
(15, 'Office', 'Delhi', 'Delhi', '110002'),
(16, 'Home', 'Pune', 'Maharashtra', '411002'),
(17, 'Home', 'Bangalore', 'Karnataka', '560003'),
(18, 'Office', 'Kochi', 'Kerala', '682002'),
(19, 'Home', 'Hyderabad', 'Telangana', '500004'),
(20, 'Home', 'Chennai', 'Tamil Nadu', '600003');

INSERT INTO categories
(category_name, parent_category_id)
VALUES
('Electronics', NULL),
('Fashion', NULL),
('Home Appliances', NULL),
('Books', NULL);

INSERT INTO categories
(category_name, parent_category_id)
VALUES
('Mobiles', 1),
('Laptops', 1),
('Men Clothing', 2),
('Women Clothing', 2);

INSERT INTO suppliers
(supplier_name, email, phone)
VALUES
('Tech Solutions', 'tech@gmail.com', '9000000001'),
('Digital World', 'digital@gmail.com', '9000000002'),
('Smart Electronics', 'smart@gmail.com', '9000000003'),
('Fashion Hub', 'fashion@gmail.com', '9000000004'),
('Style India', 'style@gmail.com', '9000000005'),
('Home Needs', 'home@gmail.com', '9000000006'),
('Book World', 'books@gmail.com', '9000000007'),
('Global Traders', 'global@gmail.com', '9000000008');

INSERT INTO products
(product_name, description, price, stock_quantity, category_id, supplier_id)
VALUES
('iPhone 16', 'Apple smartphone', 75000, 15, 5, 1),
('Samsung Galaxy S25', 'Samsung smartphone', 68000, 20, 5, 2),
('OnePlus 13', 'OnePlus smartphone', 55000, 12, 5, 3),
('Redmi Note 14', 'Budget smartphone', 18000, 30, 5, 2),
('MacBook Air M4', 'Apple laptop', 110000, 8, 6, 1),
('Dell Inspiron', 'Dell laptop', 65000, 10, 6, 2),
('HP Pavilion', 'HP laptop', 72000, 7, 6, 3),
('Lenovo IdeaPad', 'Lenovo laptop', 58000, 14, 6, 1),
('Men T-Shirt', 'Cotton T-shirt', 599, 50, 7, 4),
('Men Jeans', 'Denim jeans', 1499, 35, 7, 4),
('Men Formal Shirt', 'Formal wear', 1299, 25, 7, 5),
('Men Jacket', 'Winter jacket', 2999, 12, 7, 5),
('Women Kurti', 'Traditional kurti', 999, 40, 8, 4),
('Women Saree', 'Designer saree', 2499, 18, 8, 5),
('Women Dress', 'Casual dress', 1799, 22, 8, 5),
('Women Top', 'Fashion top', 799, 45, 8, 4),
('Refrigerator', 'Double door refrigerator', 32000, 9, 3, 6),
('Washing Machine', 'Automatic washing machine', 28000, 11, 3, 6),
('Microwave Oven', 'Convection microwave', 12000, 16, 3, 8),
('Air Conditioner', 'Split AC', 42000, 6, 3, 6),
('Python Programming', 'Learn Python programming', 799, 100, 4, 7),
('SQL Mastery', 'Learn SQL database', 599, 80, 4, 7),
('Clean Code', 'Software development book', 899, 60, 4, 7),
('Atomic Habits', 'Self improvement book', 499, 90, 4, 7),
('Data Structures', 'Computer science book', 999, 40, 4, 8),
('Wireless Mouse', 'Bluetooth mouse', 799, 25, 5, 3),
('Mechanical Keyboard', 'Gaming keyboard', 2499, 18, 5, 1),
('Bluetooth Headphones', 'Wireless headphones', 3999, 13, 5, 2),
('Smart Watch', 'Fitness smartwatch', 5999, 9, 5, 3),
('Gaming Monitor', '27 inch gaming monitor', 18000, 5, 6, 1);

INSERT INTO orders
(customer_id, order_date, order_status, total_amount)
VALUES
(1, CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed', 75799),
(2, CURRENT_TIMESTAMP - INTERVAL '2 days', 'completed', 71999),
(3, CURRENT_TIMESTAMP - INTERVAL '3 days', 'completed', 110599),
(1, CURRENT_TIMESTAMP - INTERVAL '5 days', 'shipped', 57499),
(4, CURRENT_TIMESTAMP - INTERVAL '7 days', 'processing', 44000),
(5, CURRENT_TIMESTAMP - INTERVAL '10 days', 'completed', 65999),
(6, CURRENT_TIMESTAMP - INTERVAL '12 days', 'completed', 3498),
(2, CURRENT_TIMESTAMP - INTERVAL '15 days', 'shipped', 70000),
(7, CURRENT_TIMESTAMP - INTERVAL '20 days', 'completed', 2197),
(8, CURRENT_TIMESTAMP - INTERVAL '25 days', 'completed', 2697),
(9, CURRENT_TIMESTAMP - INTERVAL '35 days', 'completed', 77999),
(10, CURRENT_TIMESTAMP - INTERVAL '40 days', 'cancelled', 1398),
(1, CURRENT_TIMESTAMP - INTERVAL '45 days', 'completed', 18799),
(3, CURRENT_TIMESTAMP - INTERVAL '50 days', 'completed', 60499),
(4, CURRENT_TIMESTAMP - INTERVAL '60 days', 'processing', 2598),
(5, CURRENT_TIMESTAMP - INTERVAL '70 days', 'completed', 21999),
(2, CURRENT_TIMESTAMP - INTERVAL '80 days', 'completed', 110799),
(7, CURRENT_TIMESTAMP - INTERVAL '90 days', 'completed', 4298),
(8, CURRENT_TIMESTAMP - INTERVAL '100 days', 'shipped', 60000),
(9, CURRENT_TIMESTAMP - INTERVAL '120 days', 'completed', 143000);

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 75000),
(1, 26, 1, 799),

(2, 2, 1, 68000),
(2, 28, 1, 3999),

(3, 5, 1, 110000),
(3, 22, 1, 599),

(4, 3, 1, 55000),
(4, 27, 1, 2499),

(5, 17, 1, 32000),
(5, 19, 1, 12000),

(6, 6, 1, 65000),
(6, 25, 1, 999),

(7, 14, 1, 2499),
(7, 13, 1, 999),

(8, 18, 1, 28000),
(8, 20, 1, 42000),

(9, 21, 2, 799),
(9, 22, 1, 599),

(10, 9, 2, 599),
(10, 10, 1, 1499),

(11, 7, 1, 72000),
(11, 29, 1, 5999),

(12, 23, 1, 899),
(12, 24, 1, 499),

(13, 4, 1, 18000),
(13, 26, 1, 799),

(14, 8, 1, 58000),
(14, 27, 1, 2499),

(15, 15, 1, 1799),
(15, 16, 1, 799),

(16, 30, 1, 18000),
(16, 28, 1, 3999),

(17, 5, 1, 110000),
(17, 21, 1, 799),

(18, 11, 1, 1299),
(18, 12, 1, 2999),

(19, 17, 1, 32000),
(19, 18, 1, 28000),

(20, 1, 1, 75000),
(20, 2, 1, 68000);

INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1, CURRENT_TIMESTAMP - INTERVAL '1 day', 'UPI', 'paid', 75799),
(2, CURRENT_TIMESTAMP - INTERVAL '2 days', 'Credit Card', 'paid', 71999),
(3, CURRENT_TIMESTAMP - INTERVAL '3 days', 'Net Banking', 'paid', 110599),
(4, CURRENT_TIMESTAMP - INTERVAL '5 days', 'UPI', 'paid', 57499),
(6, CURRENT_TIMESTAMP - INTERVAL '10 days', 'Debit Card', 'paid', 65999),
(7, CURRENT_TIMESTAMP - INTERVAL '12 days', 'UPI', 'paid', 3498),
(8, CURRENT_TIMESTAMP - INTERVAL '15 days', 'Credit Card', 'paid', 70000),
(9, CURRENT_TIMESTAMP - INTERVAL '20 days', 'UPI', 'paid', 2197),
(10, CURRENT_TIMESTAMP - INTERVAL '25 days', 'Cash on Delivery', 'pending', 2697),
(11, CURRENT_TIMESTAMP - INTERVAL '35 days', 'Credit Card', 'paid', 77999),
(12, CURRENT_TIMESTAMP - INTERVAL '40 days', 'UPI', 'failed', 1398),
(13, CURRENT_TIMESTAMP - INTERVAL '45 days', 'UPI', 'paid', 18799),
(14, CURRENT_TIMESTAMP - INTERVAL '50 days', 'Net Banking', 'paid', 60499),
(15, CURRENT_TIMESTAMP - INTERVAL '60 days', 'UPI', 'pending', 2598),
(16, CURRENT_TIMESTAMP - INTERVAL '70 days', 'Debit Card', 'paid', 21999),
(17, CURRENT_TIMESTAMP - INTERVAL '80 days', 'Credit Card', 'paid', 110799),
(18, CURRENT_TIMESTAMP - INTERVAL '90 days', 'UPI', 'paid', 4298),
(19, CURRENT_TIMESTAMP - INTERVAL '100 days', 'Net Banking', 'paid', 60000),
(20, CURRENT_TIMESTAMP - INTERVAL '120 days', 'Credit Card', 'paid', 143000);

INSERT INTO shipments
(order_id, shipment_date, delivery_date, shipment_status)
VALUES
(1, CURRENT_TIMESTAMP - INTERVAL '1 day', NULL, 'in_transit'),
(2, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '1 day', 'delivered'),
(3, CURRENT_TIMESTAMP - INTERVAL '3 days', NULL, 'in_transit'),
(4, CURRENT_TIMESTAMP - INTERVAL '4 days', NULL, 'shipped'),
(6, CURRENT_TIMESTAMP - INTERVAL '9 days', CURRENT_TIMESTAMP - INTERVAL '7 days', 'delivered'),
(7, CURRENT_TIMESTAMP - INTERVAL '11 days', CURRENT_TIMESTAMP - INTERVAL '10 days', 'delivered'),
(8, CURRENT_TIMESTAMP - INTERVAL '14 days', NULL, 'in_transit'),
(9, CURRENT_TIMESTAMP - INTERVAL '19 days', CURRENT_TIMESTAMP - INTERVAL '17 days', 'delivered'),
(10, CURRENT_TIMESTAMP - INTERVAL '24 days', CURRENT_TIMESTAMP - INTERVAL '22 days', 'delivered'),
(11, CURRENT_TIMESTAMP - INTERVAL '34 days', CURRENT_TIMESTAMP - INTERVAL '32 days', 'delivered'),
(13, CURRENT_TIMESTAMP - INTERVAL '44 days', CURRENT_TIMESTAMP - INTERVAL '42 days', 'delivered'),
(14, CURRENT_TIMESTAMP - INTERVAL '49 days', CURRENT_TIMESTAMP - INTERVAL '47 days', 'delivered'),
(16, CURRENT_TIMESTAMP - INTERVAL '69 days', CURRENT_TIMESTAMP - INTERVAL '67 days', 'delivered'),
(17, CURRENT_TIMESTAMP - INTERVAL '79 days', NULL, 'shipped'),
(18, CURRENT_TIMESTAMP - INTERVAL '89 days', CURRENT_TIMESTAMP - INTERVAL '87 days', 'delivered'),
(19, CURRENT_TIMESTAMP - INTERVAL '99 days', NULL, 'in_transit'),
(20, CURRENT_TIMESTAMP - INTERVAL '119 days', CURRENT_TIMESTAMP - INTERVAL '117 days', 'delivered');

INSERT INTO reviews
(customer_id, product_id, rating, review_text)
VALUES
(1, 1, 5, 'Excellent smartphone'),
(2, 2, 4, 'Very good performance'),
(3, 5, 5, 'Amazing laptop'),
(4, 3, 4, 'Good smartphone'),
(5, 6, 3, 'Average laptop'),
(6, 14, 5, 'Beautiful saree'),
(7, 21, 4, 'Good Python book'),
(8, 9, 3, 'Comfortable T-shirt'),
(9, 7, 5, 'Excellent laptop'),
(10, 23, 4, 'Useful programming book'),
(11, 17, 5, 'Good refrigerator'),
(12, 18, 4, 'Works perfectly'),
(13, 4, 3, 'Decent phone'),
(14, 28, 5, 'Excellent sound quality'),
(15, 30, 5, 'Great gaming monitor'),
(1, 2, 4, 'Good value for money'),
(2, 5, 5, 'Excellent performance'),
(3, 21, 4, 'Helpful book');

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
