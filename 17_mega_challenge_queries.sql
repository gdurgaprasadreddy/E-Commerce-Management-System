#Q101. Generate Amazon-style Sales Dashboard
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM products) AS total_products,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT SUM(total_amount) FROM orders) AS total_revenue,
    (SELECT ROUND(AVG(total_amount), 2) FROM orders) AS average_order_value;

#Q102. Generate Top 10 Products Report
SELECT
    p.product_id,
    p.product_name,
    p.price,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.price
ORDER BY total_revenue DESC
LIMIT 10;

#103. Generate Customer Lifetime Value Report.
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS lifetime_value,
    COALESCE(ROUND(AVG(o.total_amount), 2), 0) AS average_order_value
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC;

#104. Generate Product Recommendation Query.
SELECT
    c.customer_id,
    c.customer_name,
    p.product_id,
    p.product_name,
    p.price
FROM customers c
INNER JOIN wishlist w
ON c.customer_id = w.customer_id
INNER JOIN products p
ON w.product_id = p.product_id
ORDER BY c.customer_id;

#Q105. Generate Repeat Customer Analysis
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

#Q106. Generate Inventory Aging Report
ALTER TABLE products
ADD COLUMN stock_added_date DATE;

SELECT
    product_id,
    product_name,
    stock_quantity,
    stock_added_date,
    CURRENT_DATE - stock_added_date AS stock_age_days,
    CASE
        WHEN CURRENT_DATE - stock_added_date <= 30
            THEN 'Fresh Stock'
        WHEN CURRENT_DATE - stock_added_date <= 60
            THEN 'Medium Stock'
        WHEN CURRENT_DATE - stock_added_date <= 90
            THEN 'Old Stock'
        ELSE 'Very Old Stock'
    END AS inventory_age
FROM products
WHERE stock_added_date IS NOT NULL
ORDER BY stock_age_days DESC;

#107. Generate Supplier Performance Dashboard.
SELECT
    s.supplier_id,
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
ORDER BY total_revenue DESC;

#Q108. Generate Monthly Growth Report
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::DATE AS sales_month,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),
growth_report AS (
    SELECT
        sales_month,
        total_sales,
        LAG(total_sales) OVER (ORDER BY sales_month) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    sales_month,
    total_sales,
    previous_month_sales,
    ROUND(
        ((total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0)) * 100, 2
    ) AS growth_percentage
FROM growth_report
ORDER BY sales_month;

#Q109. Generate Revenue Forecast Dataset Query
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', order_date)::DATE AS sales_month,
        SUM(total_amount) AS total_revenue,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    sales_month,
    total_revenue,
    total_orders,
    ROUND(AVG(total_revenue) OVER (
        ORDER BY sales_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_average_revenue
FROM monthly_revenue
ORDER BY sales_month;

#110. Generate Complete Business KPI Dashboard using CTEs + Window Functions + Joins.
WITH customer_kpi AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS total_orders,
        COALESCE(SUM(o.total_amount), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
),

monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date)::DATE AS sales_month,
        SUM(total_amount) AS monthly_revenue,
        COUNT(order_id) AS monthly_orders
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
),

monthly_growth AS (
    SELECT
        sales_month,
        monthly_revenue,
        monthly_orders,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
),

product_kpi AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(oi.quantity), 0) AS quantity_sold,
        COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS product_revenue,
        RANK() OVER (
            ORDER BY COALESCE(SUM(oi.quantity * oi.unit_price), 0) DESC
        ) AS product_rank
    FROM products p
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
),

business_kpi AS (
    SELECT
        (SELECT COUNT(*) FROM customers) AS total_customers,
        (SELECT COUNT(*) FROM products) AS total_products,
        COUNT(order_id) AS total_orders,
        COALESCE(SUM(total_amount), 0) AS total_revenue,
        COALESCE(ROUND(AVG(total_amount), 2), 0) AS average_order_value
    FROM orders
)

SELECT
    b.total_customers,
    b.total_products,
    b.total_orders,
    b.total_revenue,
    b.average_order_value,
    m.sales_month,
    m.monthly_revenue,
    m.previous_month_revenue,
    ROUND(
        ((m.monthly_revenue - m.previous_month_revenue)
        / NULLIF(m.previous_month_revenue, 0)) * 100,
        2
    ) AS growth_percentage,
    p.product_name AS top_product,
    p.quantity_sold,
    p.product_revenue,
    p.product_rank
FROM business_kpi b
CROSS JOIN monthly_growth m
CROSS JOIN product_kpi p
WHERE p.product_rank <= 3
ORDER BY m.sales_month, p.product_rank;