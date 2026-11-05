#Q51. Find all products and corresponding reviews.
SELECT p.product_id,
       p.product_name,
       r.review_id,
       r.rating,
       r.review_text
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id
ORDER BY p.product_id;

#Q52. Find all customers and their orders.
SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_date,
       o.order_status,
       o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;

#Q53. Find all suppliers and products.
SELECT s.supplier_id,
       s.supplier_name,
       p.product_id,
       p.product_name,
       p.price
FROM suppliers s
LEFT JOIN products p
ON s.supplier_id = p.supplier_id
ORDER BY s.supplier_id;

#Q54. Find all categories and products.
SELECT c.category_id,
       c.category_name,
       p.product_id,
       p.product_name,
       p.price
FROM categories c
LEFT JOIN products p
ON c.category_id = p.category_id
ORDER BY c.category_id;

#Q55. Find all orders and shipments.
SELECT o.order_id,
       o.order_date,
       o.order_status,
       o.total_amount,
       s.shipment_id,
       s.shipment_date,
       s.delivery_date,
       s.shipment_status
FROM orders o
LEFT JOIN shipments s
ON o.order_id = s.order_id
ORDER BY o.order_id;