#Q71. Rank products by revenue.
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue,
       RANK() OVER (
           ORDER BY SUM(oi.quantity * oi.unit_price) DESC
       ) AS revenue_rank
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue_rank;

#Q72. Rank customers by spending.
SELECT c.customer_id,
       c.customer_name,
       SUM(o.total_amount) AS total_spending,
       RANK() OVER (
           ORDER BY SUM(o.total_amount) DESC
       ) AS spending_rank
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY spending_rank;

#Q73. Rank suppliers by sales.
SELECT supplier_id,
       supplier_name,
       total_sales,
       RANK() OVER (
           ORDER BY total_sales DESC
       ) AS sales_rank
FROM (
    SELECT s.supplier_id,
           s.supplier_name,
           COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_sales
    FROM suppliers s
    LEFT JOIN products p
    ON s.supplier_id = p.supplier_id
    LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY s.supplier_id, s.supplier_name
) AS supplier_sales
ORDER BY sales_rank;

#Q74. Find top 3 products per category.
SELECT product_id,
       product_name,
       category_id,
       price,
       product_rank
FROM (
    SELECT product_id,
           product_name,
           category_id,
           price,
           RANK() OVER (
               PARTITION BY category_id
               ORDER BY price DESC
           ) AS product_rank
    FROM products
) AS ranked_products
WHERE product_rank <= 3
ORDER BY category_id, product_rank;

#Q75. Find top 5 customers per city.
WITH customer_spending AS (
    SELECT c.customer_id,
           c.customer_name,
           a.city,
           SUM(o.total_amount) AS total_spending
    FROM customers c
    INNER JOIN addresses a
    ON c.customer_id = a.customer_id
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name, a.city
),
ranked_customers AS (
    SELECT customer_id,
           customer_name,
           city,
           total_spending,
           ROW_NUMBER() OVER (
               PARTITION BY city
               ORDER BY total_spending DESC
           ) AS customer_rank
    FROM customer_spending
)
SELECT customer_id,
       customer_name,
       city,
       total_spending,
       customer_rank
FROM ranked_customers
WHERE customer_rank <= 5
ORDER BY city, customer_rank;

#Q76. Find running total revenue.
SELECT order_id,
       order_date,
       total_amount,
       SUM(total_amount) OVER (
           ORDER BY order_date, order_id
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total_revenue
FROM orders
ORDER BY order_date, order_id;

#Q77. Find cumulative monthly sales.
WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', order_date) AS sales_month,
           SUM(total_amount) AS monthly_revenue
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT sales_month,
       monthly_revenue,
       SUM(monthly_revenue) OVER (
           ORDER BY sales_month
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS cumulative_sales
FROM monthly_sales
ORDER BY sales_month;

#Q78. Find highest order per customer.
SELECT customer_id,
       customer_name,
       order_id,
       total_amount
FROM (
    SELECT c.customer_id,
           c.customer_name,
           o.order_id,
           o.total_amount,
           RANK() OVER (
               PARTITION BY c.customer_id
               ORDER BY o.total_amount DESC
           ) AS order_rank
    FROM customers c
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
) AS ranked_orders
WHERE order_rank = 1
ORDER BY customer_id;

#Q79. Find latest order per customer.
SELECT customer_id,
       customer_name,
       order_id,
       order_date,
       order_status,
       total_amount
FROM (
    SELECT c.customer_id,
           c.customer_name,
           o.order_id,
           o.order_date,
           o.order_status,
           o.total_amount,
           ROW_NUMBER() OVER (
               PARTITION BY c.customer_id
               ORDER BY o.order_date DESC, o.order_id DESC
           ) AS order_rank
    FROM customers c
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
) AS latest_orders
WHERE order_rank = 1
ORDER BY customer_id;

#Q80. Find top-rated product in each category.
SELECT category_id,
       category_name,
       product_id,
       product_name,
       average_rating
FROM (
    SELECT c.category_id,
           c.category_name,
           p.product_id,
           p.product_name,
           AVG(r.rating) AS average_rating,
           RANK() OVER (
               PARTITION BY c.category_id
               ORDER BY AVG(r.rating) DESC
           ) AS product_rank
    FROM categories c
    INNER JOIN products p
    ON c.category_id = p.category_id
    INNER JOIN reviews r
    ON p.product_id = r.product_id
    GROUP BY c.category_id,
             c.category_name,
             p.product_id,
             p.product_name
) AS ranked_products
WHERE product_rank = 1
ORDER BY category_id;