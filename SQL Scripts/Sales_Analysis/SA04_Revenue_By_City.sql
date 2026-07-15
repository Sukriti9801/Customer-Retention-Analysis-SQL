/*
=========================================================
Analysis 4: Revenue by City
=========================================================

Business Requirement:
Calculate total revenue generated from each city.

=========================================================
*/

SELECT
    c.city,
    SUM(o.total_amount) AS Total_Revenue
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id
GROUP BY
    c.city
ORDER BY
    Total_Revenue DESC;

/*
Business Insight:
Cities generating higher revenue can be prioritized for
expansion and targeted marketing initiatives.
*/
