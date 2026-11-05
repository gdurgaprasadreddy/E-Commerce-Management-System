# Q1. Display all customers.
SELECT * FROM customers;

#Q2. Display all products costing above ₹5000.
SELECT * FROM products
WHERE price > 5000;

#Q3. Display products with stock less than 10.
SELECT * FROM products
WHERE stock_quantity < 10;

#Q4. Display all suppliers.
SELECT * FROM suppliers;

#Q5. Display all completed orders.
SELECT * FROM orders
WHERE order_status = 'Completed';

#Q6. Display orders placed this month.
SELECT * FROM orders
WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE)
AND order_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month';

#Q7. Display customers registered in the last 30 days.
SELECT * FROM customers
WHERE registration_date >= CURRENT_DATE - INTERVAL '30 days';

#Q8. Display products sorted by price descending.
SELECT * FROM products
ORDER BY price DESC;

#Q9. Display top 10 expensive products.
SELECT * FROM products
ORDER BY price DESC
LIMIT 10;

#Q10. Display all active shipments.
SELECT * FROM shipments
WHERE shipment_status = 'Active';
