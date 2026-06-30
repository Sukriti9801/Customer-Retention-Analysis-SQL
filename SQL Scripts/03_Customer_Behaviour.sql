/*
=========================================================
Business Question 1
How many orders has each customer placed?
=========================================================

Business Requirement:
The company wants to identify customers based on their purchase frequency in order to distinguish loyal customers from one-time buyers.
*/

SELECT
    customer_id,
    COUNT(order_id) AS Total_Orders
FROM Orders
GROUP BY customer_id
ORDER BY Total_Orders DESC;
