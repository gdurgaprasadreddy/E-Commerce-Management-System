#Q21. Find number of products category-wise.
SELECT category_id, COUNT(*) AS total_products
FROM products
GROUP BY category_id
ORDER BY category_id;

#Q22. Find total sales category-wise.
SELECT p.category_id,
       SUM(oi.quantity * oi.unit_price) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category_id
ORDER BY p.category_id;

#Q23. Find total revenue supplier-wise.
SELECT s.supplier_id,
       s.supplier_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM suppliers s
JOIN products p
ON s.supplier_id = p.supplier_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY s.supplier_id;

#Q24. Find customer count city-wise.
SELECT city,
       COUNT(DISTINCT customer_id) AS total_customers
FROM addresses
GROUP BY city
ORDER BY city;

#Q25. Find order count status-wise.
SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY order_status;

#Q26. Find average rating product-wise.
SELECT product_id,
       AVG(rating) AS average_rating
FROM reviews
GROUP BY product_id
ORDER BY product_id;

#Q27. Find total products supplier-wise.
SELECT s.supplier_id,
       s.supplier_name,
       COUNT(p.product_id) AS total_products
FROM suppliers s
JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY s.supplier_id;

#Q28. Find shipment count status-wise.
SELECT shipment_status,
       COUNT(*) AS total_shipments
FROM shipments
GROUP BY shipment_status
ORDER BY shipment_status;

#Q29. Find total payments method-wise.
SELECT payment_method,
       SUM(amount) AS total_payments
FROM payments
GROUP BY payment_method
ORDER BY payment_method;

#Q30. Find monthly sales report.
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;