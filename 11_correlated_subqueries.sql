#Q66. Find products costing above category average.
SELECT p.product_id,
       p.product_name,
       p.category_id,
       p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p.category_id
)
ORDER BY p.category_id, p.price DESC;

#Q67. Find customers spending above city average.
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
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_spending)
    FROM (
        SELECT c2.customer_id,
               SUM(o2.total_amount) AS customer_spending
        FROM customers c2
        INNER JOIN addresses a2
        ON c2.customer_id = a2.customer_id
        INNER JOIN orders o2
        ON c2.customer_id = o2.customer_id
        WHERE a2.city = a.city
        GROUP BY c2.customer_id
    ) AS city_spending
)
ORDER BY a.city, total_spending DESC;

#Q68. Find suppliers with revenue above supplier average.
SELECT s.supplier_id,
       s.supplier_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM suppliers s
INNER JOIN products p
ON s.supplier_id = p.supplier_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY s.supplier_id, s.supplier_name
HAVING SUM(oi.quantity * oi.unit_price) > (
    SELECT AVG(supplier_revenue)
    FROM (
        SELECT SUM(oi2.quantity * oi2.unit_price) AS supplier_revenue
        FROM products p2
        INNER JOIN order_items oi2
        ON p2.product_id = oi2.product_id
        GROUP BY p2.supplier_id
    ) AS supplier_data
)
ORDER BY total_revenue DESC;

#Q69. Find orders larger than customer average.
SELECT o.order_id,
       o.customer_id,
       c.customer_name,
       o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.total_amount > (
    SELECT AVG(o2.total_amount)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)
ORDER BY o.customer_id, o.total_amount DESC;

#Q70. Find products with reviews above product average.
SELECT p.product_id,
       p.product_name,
       r.rating
FROM products p
INNER JOIN reviews r
ON p.product_id = r.product_id
WHERE r.rating > (
    SELECT AVG(r2.rating)
    FROM reviews r2
    WHERE r2.product_id = p.product_id
)
ORDER BY p.product_id;