#Q36. Display customer names with order details.
SELECT c.customer_name,
       o.order_id,
       o.order_date,
       o.order_status,
       o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_id;

#Q37. Display order details with products.
SELECT o.order_id,
       o.order_date,
       o.order_status,
       p.product_id,
       p.product_name,
       oi.quantity,
       oi.unit_price
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id
ORDER BY o.order_id;

#Q38. Display product names with category names.
SELECT p.product_name,
       c.category_name
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id
ORDER BY p.product_id;

#Q39. Display product names with supplier names.
SELECT p.product_name,
       s.supplier_name
FROM products p
INNER JOIN suppliers s
ON p.supplier_id = s.supplier_id
ORDER BY p.product_id;

#Q40. Display reviews with customer names.
SELECT r.review_id,
       c.customer_name,
       r.product_id,
       r.rating,
       r.review_text
FROM reviews r
INNER JOIN customers c
ON r.customer_id = c.customer_id
ORDER BY r.review_id;

#Q41. Display payment details with customer names.
SELECT c.customer_name,
       o.order_id,
       p.payment_id,
       p.payment_date,
       p.payment_method,
       p.payment_status,
       p.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN payments p
ON o.order_id = p.order_id
ORDER BY p.payment_id;

#Q42. Display shipment details with order details.
SELECT o.order_id,
       o.order_date,
       o.order_status,
       o.total_amount,
       s.shipment_id,
       s.shipment_date,
       s.delivery_date,
       s.shipment_status
FROM orders o
INNER JOIN shipments s
ON o.order_id = s.order_id
ORDER BY o.order_id;

#Q43. Display cart items with product names.
SELECT ci.cart_item_id,
       ci.cart_id,
       p.product_name,
       ci.quantity
FROM cart_items ci
INNER JOIN products p
ON ci.product_id = p.product_id
ORDER BY ci.cart_item_id;

#Q44. Display wishlist items with product names.
SELECT w.wishlist_id,
       w.customer_id,
       p.product_name
FROM wishlist w
INNER JOIN products p
ON w.product_id = p.product_id
ORDER BY w.wishlist_id;

#Q45. Display customer addresses with customer names.
SELECT c.customer_id,
       c.customer_name,
       a.address_type,
       a.city,
       a.state,
       a.pincode
FROM customers c
INNER JOIN addresses a
ON c.customer_id = a.customer_id
ORDER BY c.customer_id;