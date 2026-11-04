#Display all customers
SELECT *
FROM customers;

#Display all products costing above ₹5,000
SELECT
    product_id,
    product_name,
    price
FROM products
WHERE price > 5000;

#Display products with stock less than 10
SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 10;

#Display all suppliers
SELECT *
FROM suppliers;

#Display all completed orders
SELECT *
FROM orders
WHERE order_status = 'completed';

#Display orders placed this month
SELECT *
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM CURRENT_DATE);

#Display customers registered in the last 30 days
SELECT *
FROM customers
WHERE registration_date >= CURRENT_DATE - INTERVAL '30 days';

#Display products sorted by price descending
SELECT
    product_id,
    product_name,
    price
FROM products
ORDER BY price DESC;

#Display the top 10 expensive products
SELECT
    product_id,
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 10;

#Display all active shipments
SELECT *
FROM shipments
WHERE shipment_status = 'in_transit';
