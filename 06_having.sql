#Q31. Display categories having more than 20 products.
SELECT category_id,
       COUNT(product_id) AS total_products
FROM products
GROUP BY category_id
HAVING COUNT(product_id) > 20;

#Q32. Display suppliers supplying more than 10 products.
SELECT s.supplier_id,
       s.supplier_name,
       COUNT(p.product_id) AS total_products
FROM suppliers s
JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(p.product_id) > 10;

#Q33. Display customers having more than 5 orders.
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 5;

#Q34. Display products having average rating above 4.
SELECT p.product_id,
       p.product_name,
       AVG(r.rating) AS average_rating
FROM products p
JOIN reviews r
ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
HAVING AVG(r.rating) > 4
ORDER BY p.product_id;

#35. Display cities with more than 50 customers.
SELECT city,
       COUNT(DISTINCT customer_id) AS total_customers
FROM addresses
GROUP BY city
HAVING COUNT(DISTINCT customer_id) > 50;