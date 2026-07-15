/*
=========================================================
Analysis 4: Churn Risk Customers
=========================================================

Business Requirement:
Identify customers who are at risk of churn based on the
number of days since their last purchase.

Criteria:
- High Risk   : More than 180 days
- Medium Risk : 91 to 180 days
- Low Risk    : 90 days or less

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
    ) AS Days_Since_Last_Purchase,

    CASE
        WHEN DATEDIFF(DAY, Last_Purchase_Date, (SELECT MAX(order_date) FROM Orders)) > 180
            THEN 'High Risk'

        WHEN DATEDIFF(DAY, Last_Purchase_Date, (SELECT MAX(order_date) FROM Orders)) BETWEEN 91 AND 180
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Churn_Risk

FROM LastPurchase
ORDER BY Days_Since_Last_Purchase DESC;

/*
Business Insight:
High-risk customers should be prioritized for retention
campaigns, while medium-risk customers can be engaged
through personalized offers before they become inactive.
*/
