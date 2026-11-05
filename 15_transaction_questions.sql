#Q91. Place an order with payment and shipment inside one transaction. 
BEGIN;

-- Step 1: Insert order
INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(21, 9, CURRENT_DATE, 'Pending', 25000);

-- Step 2: Insert payment
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(21, 21, CURRENT_DATE, 'UPI', 'Success', 25000);

-- Step 3: Insert shipment
INSERT INTO shipments
(shipment_id, order_id, shipment_date, delivery_date, shipment_status)
VALUES
(21, 21, CURRENT_DATE, NULL, 'Active');

COMMIT;

#Q92. Rollback failed payment transaction.
BEGIN;

-- Step 1: Create an order
INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(22, 10, CURRENT_DATE, 'Pending', 15000);

-- Step 2: Insert failed payment
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(22, 22, CURRENT_DATE, 'UPI', 'Failed', 15000);

-- Step 3: Cancel the transaction
ROLLBACK;

#Q93. Use SAVEPOINT during checkout process.
BEGIN;

-- Step 1: Create an order
INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(22, 10, CURRENT_DATE, 'Pending', 15000);

-- Step 2: Create a savepoint
SAVEPOINT checkout_point;

-- Step 3: Insert payment
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(22, 22, CURRENT_DATE, 'UPI', 'Success', 15000);

-- Step 4: Insert shipment
INSERT INTO shipments
(shipment_id, order_id, shipment_date, delivery_date, shipment_status)
VALUES
(22, 22, CURRENT_DATE, NULL, 'Active');

-- Step 5: Save all changes
COMMIT;


#Q94. Demonstrate COMMIT after successful order.
BEGIN;

-- Insert a new order
INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(23, 11, CURRENT_DATE, 'Completed', 8000);

-- Save the transaction
COMMIT;

Q95. Handle stock deduction transaction.
BEGIN;

-- Step 1: Check available stock
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 1;

-- Step 2: Deduct 2 items
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1
AND stock_quantity >= 2;

-- Step 3: Save the changes
COMMIT;