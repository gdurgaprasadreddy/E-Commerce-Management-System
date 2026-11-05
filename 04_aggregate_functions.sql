#11. Find total customers.
SELECT COUNT(*) AS total_customers
FROM customers;

#Q12. Find total products.
SELECT COUNT(*) AS total_products
FROM products;

#Q13. Find average product price.
SELECT AVG(price) AS average_product_price
FROM products;

#Q14. Find highest priced product.
SELECT MAX(price) AS highest_product_price
FROM products;

#Q15. Find lowest priced product.
SELECT MIN(price) AS lowest_product_price
FROM products;

#Q16. Find total revenue generated.
SELECT SUM(total_amount) AS total_revenue
FROM orders;

#Q17. Find total orders placed.
SELECT COUNT(*) AS total_orders
FROM orders;

#Q18. Find total stock available.
SELECT SUM(stock_quantity) AS total_stock
FROM products;

#Q19. Find average order value.
SELECT AVG(total_amount) AS average_order_value
FROM orders;

#Q20. Find total payment received.
SELECT SUM(amount) AS total_payment_received
FROM payments
WHERE payment_status = 'Success';