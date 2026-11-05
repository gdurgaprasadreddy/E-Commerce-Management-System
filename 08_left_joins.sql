#Q46. Find customers who never placed orders.
SELECT c.customer_id,
       c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

#Q47. Find products never ordered.
SELECT p.product_id,
       p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL
ORDER BY p.product_id;

#Q48. Find products with no reviews.
SELECT p.product_id,
       p.product_name
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id
WHERE r.review_id IS NULL
ORDER BY p.product_id;

#Q49. Find customers without addresses.
SELECT c.customer_id,
       c.customer_name
FROM customers c
LEFT JOIN addresses a
ON c.customer_id = a.customer_id
WHERE a.address_id IS NULL
ORDER BY c.customer_id;

#Q50. Find orders without payments.
SELECT o.order_id,
       o.customer_id,
       o.order_date,
       o.order_status,
       o.total_amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL
ORDER BY o.order_id;