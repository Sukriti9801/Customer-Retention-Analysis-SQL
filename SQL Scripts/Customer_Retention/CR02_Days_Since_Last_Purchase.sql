/*
=========================================================
Analysis 2: Days Since Last Purchase
=========================================================

Business Requirement:
Calculate the number of days since each customer's last
purchase to identify customers who may require
re-engagement.

=========================================================
*/

WITH LastPurchase AS
(
    SELECT
        c.customer_id,
        c.customer_name,
        MAX(o.order_date) AS Last_Purchase_Date
    FROM Customers c
    INNER JOIN Orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
)

SELECT
    customer_id,
    customer_name,
    Last_Purchase_Date,
    DATEDIFF(
        DAY,
        Last_Purchase_Date,
        (SELECT MAX(order_date) FROM Orders)
    ) AS Days_Since_Last_Purchase
FROM LastPurchase
ORDER BY Days_Since_Last_Purchase DESC;

/*
Business Insight:
Customers with a higher number of days since their last
purchase should be prioritized for retention campaigns.
*/
