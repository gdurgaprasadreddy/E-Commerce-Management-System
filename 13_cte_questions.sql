#Q81. Find category-wise revenue using CTE.
WITH category_revenue AS (
    SELECT c.category_id,
           c.category_name,
           SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM categories c
    INNER JOIN products p
    ON c.category_id = p.category_id
    INNER JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY c.category_id, c.category_name
)
SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;

#Q82. Find customer spending summary using CTE.
WITH customer_summary AS (
    SELECT c.customer_id,
           c.customer_name,
           COUNT(o.order_id) AS total_orders,
           COALESCE(SUM(o.total_amount), 0) AS total_spending,
           COALESCE(AVG(o.total_amount), 0) AS average_order_value
    FROM customers c
    LEFT JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_summary
ORDER BY total_spending DESC;

#Q83. Find top 10 customers using CTE.
WITH customer_spending AS (
    SELECT c.customer_id,
           c.customer_name,
           SUM(o.total_amount) AS total_spending
    FROM customers c
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id,
       customer_name,
       total_spending
FROM customer_spending
ORDER BY total_spending DESC
LIMIT 10;

#Q84. Find top products using CTE.
WITH product_sales AS (
    SELECT p.product_id,
           p.product_name,
           SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM products p
    INNER JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT product_id,
       product_name,
       total_revenue
FROM product_sales
ORDER BY total_revenue DESC
LIMIT 10;

#Q85. Find supplier performance report using CTE.
WITH supplier_performance AS (
    SELECT s.supplier_id,
           s.supplier_name,
           COUNT(DISTINCT p.product_id) AS total_products,
           COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold,
           COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_revenue
    FROM suppliers s
    LEFT JOIN products p
    ON s.supplier_id = p.supplier_id
    LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY s.supplier_id, s.supplier_name
)
SELECT *
FROM supplier_performance
ORDER BY total_revenue DESC;