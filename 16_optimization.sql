#Q96. Create index on product_name.
CREATE INDEX idx_product_name
ON products(product_name);
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'products';

#Q97. Create index on customer_email.
CREATE INDEX idx_customer_email
ON customers(email);
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'customers';

#Q98. Compare query performance before and after index.
DROP INDEX idx_customer_email;
EXPLAIN ANALYZE
SELECT *
FROM customers
WHERE email = 'rahul@gmail.com';
CREATE INDEX idx_customer_email
ON customers(email);
EXPLAIN ANALYZE
SELECT *
FROM customers
WHERE email = 'rahul@gmail.com';

#Q99. Use EXPLAIN ANALYZE on revenue report.
EXPLAIN ANALYZE
SELECT
    SUM(total_amount) AS total_revenue
FROM orders;

#Q100. Optimize highest-selling-product query.
CREATE INDEX idx_order_items_product_id
ON order_items(product_id);

EXPLAIN ANALYZE
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC,
         p.product_id
LIMIT 1;