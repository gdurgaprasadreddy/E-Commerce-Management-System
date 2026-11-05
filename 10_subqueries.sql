#Q56. Find highest selling product.
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) = (
    SELECT MAX(total_quantity)
    FROM (
        SELECT SUM(quantity) AS total_quantity
        FROM order_items
        GROUP BY product_id
    ) AS sales
);

#Q57. Find second highest selling product.
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
OFFSET 1
LIMIT 1;

#Q58. Find third highest selling product.
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
OFFSET 2
LIMIT 1;

#Q59. Find customer with highest spending.
SELECT c.customer_id,
       c.customer_name,
       SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_spending)
    FROM (
        SELECT SUM(total_amount) AS customer_spending
        FROM orders
        GROUP BY customer_id
    ) AS spending
);

#Q60. Find customers spending above average.
SELECT c.customer_id,
       c.customer_name,
       SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_spending)
    FROM (
        SELECT SUM(total_amount) AS customer_spending
        FROM orders
        GROUP BY customer_id
    ) AS spending
)
ORDER BY total_spending DESC;

#Q61. Find products priced above average.
SELECT product_id,
       product_name,
       price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;

#Q62. Find suppliers supplying highest number of products.
SELECT s.supplier_id,
       s.supplier_name,
       COUNT(p.product_id) AS total_products
FROM suppliers s
INNER JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(p.product_id) = (
    SELECT MAX(product_count)
    FROM (
        SELECT COUNT(*) AS product_count
        FROM products
        GROUP BY supplier_id
    ) AS supplier_data
);

#Q63. Find category generating maximum revenue.
SELECT c.category_id,
       c.category_name,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
HAVING SUM(oi.quantity * oi.unit_price) = (
    SELECT MAX(category_revenue)
    FROM (
        SELECT SUM(oi2.quantity * oi2.unit_price) AS category_revenue
        FROM products p2
        INNER JOIN order_items oi2
        ON p2.product_id = oi2.product_id
        GROUP BY p2.category_id
    ) AS category_sales
);

#Q64. Find customers who ordered every product in a category.
SELECT c.customer_id,
       c.customer_name,
       cat.category_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id
INNER JOIN categories cat
ON p.category_id = cat.category_id
GROUP BY c.customer_id,
         c.customer_name,
         cat.category_id,
         cat.category_name
HAVING COUNT(DISTINCT p.product_id) = (
    SELECT COUNT(*)
    FROM products p2
    WHERE p2.category_id = cat.category_id
)
ORDER BY c.customer_id, cat.category_id;

#Q65. Find products never purchased.
SELECT p.product_id,
       p.product_name
FROM products p
WHERE p.product_id NOT IN (
    SELECT product_id
    FROM order_items
)
ORDER BY p.product_id;