/*
=========================================================
Analysis 2: Top Selling Products
=========================================================

Business Requirement:
Identify the products with the highest sales volume.

=========================================================
*/

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS Total_Quantity_Sold
FROM Order_Items oi
INNER JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    Total_Quantity_Sold DESC;

/*
Business Insight:
Top-selling products should be prioritized for inventory
management and promotional campaigns.
*/
