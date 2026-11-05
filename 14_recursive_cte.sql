#Q86. Display category hierarchy.
WITH RECURSIVE category_hierarchy AS (
    SELECT category_id,
           category_name,
           parent_category_id,
           1 AS hierarchy_level
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id,
           ch.hierarchy_level + 1
    FROM categories c
    INNER JOIN category_hierarchy ch
    ON c.parent_category_id = ch.category_id
)
SELECT category_id,
       category_name,
       parent_category_id,
       hierarchy_level
FROM category_hierarchy
ORDER BY category_id;

#Q87. Display sub-category tree.
WITH RECURSIVE category_tree AS (
    SELECT category_id,
           category_name,
           parent_category_id,
           1 AS level,
           category_name::TEXT AS category_path
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id,
           ct.level + 1,
           ct.category_path || ' -> ' || c.category_name
    FROM categories c
    INNER JOIN category_tree ct
    ON c.parent_category_id = ct.category_id
)
SELECT category_id,
       category_name,
       parent_category_id,
       level,
       category_path
FROM category_tree
ORDER BY category_id;

#Q88. Display employee reporting hierarchy.
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           designation,
           1 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
           e.employee_name,
           e.manager_id,
           e.designation,
           eh.hierarchy_level + 1
    FROM employees e
    INNER JOIN employee_hierarchy eh
    ON e.manager_id = eh.employee_id
)
SELECT employee_id,
       employee_name,
       manager_id,
       designation,
       hierarchy_level
FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;

#Q89. Find all managers and employees under them.
SELECT m.employee_id AS manager_id,
       m.employee_name AS manager_name,
       m.designation AS manager_designation,
       e.employee_id,
       e.employee_name AS employee_name,
       e.designation AS employee_designation
FROM employees m
INNER JOIN employees e
ON m.employee_id = e.manager_id
ORDER BY m.employee_id, e.employee_id;

#Q90. Generate category depth levels.
WITH RECURSIVE category_depth AS (
    SELECT category_id,
           category_name,
           parent_category_id,
           1 AS depth_level
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id,
           cd.depth_level + 1
    FROM categories c
    INNER JOIN category_depth cd
    ON c.parent_category_id = cd.category_id
)
SELECT category_id,
       category_name,
       parent_category_id,
       depth_level
FROM category_depth
ORDER BY depth_level, category_id;