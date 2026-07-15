/*
=========================================================
Analysis 3: Category Performance
=========================================================

Business Requirement:
Analyze sales performance across product categories.

=========================================================
*/

SELECT
    p.category,
    SUM(oi.quantity) AS Total_Quantity_Sold
FROM Order_Items oi
INNER JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    Total_Quantity_Sold DESC;

/*
Business Insight:
High-performing categories contribute significantly to
overall sales and should receive focused marketing efforts.
*/
