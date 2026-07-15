/*
=========================================================
Analysis 5: Loyal Customers
=========================================================

Business Requirement:
Identify customers with the highest purchase frequency.

=========================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    Total_Orders DESC;

/*
Business Insight:
Customers with a high purchase frequency are loyal
customers and should be rewarded through loyalty
programs and exclusive offers.
*/
